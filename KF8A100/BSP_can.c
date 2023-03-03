#include "includes.h"


/****************************************************************************************
 * 函数名     ：CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID)
 * 函数功能：CAN接收过滤器验收配置
 * 入口参数：帧结构选择：					 0：标准帧 1：扩展帧
 * 			 数据对齐格式：    CANID_MODE  （0：真实ID右对齐,1：寄存器格式左对齐）
 * 			 过滤器ID：    	   CAN_FilterID（标准帧,11位有效,且前七位不能为隐性）
 * 			 					                  （扩展帧,29位有效,且前七位不能为隐性）
 * 			 掩没位ID：   	   CAN_MASKID  （对应位为1则掩没，0为比较）
 * 返回          ：1-匹配ID设置成功	 0-匹配ID配置错误
****************************************************************************************/
FilterConfig_STATE CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID)
{
	if(CAN_IDE == 0) //标准模式
	{
// ID参数检查
		if(CANID_MODE == 0) //11位ID右对齐
		{
			if(CAN_FilterID>0x7FFF)
				return False;
			else
			{
				CAN_FilterID <<=5;
				CAN_MASKID <<=5;
			}
		}
		else//11位ID左对齐
		{
			if(CAN_FilterID>0xFFE0) //11位ID左对齐，其值超过11位，则判断输入ID错误
				return False;
		}
		if(CAN_FilterID&0xFE00 == 0xFE00) //11位ID左对齐，CAN协议要求，高7位不能全部是隐性位，即高7位全部为1是错误的ID。
			return False;
// ID参数检查
		CANMOD |= CAN_reset; //CAN模块进入复位模式，开始配置其寄存器
		CANACR0 = CAN_FilterID>>8;  //设置接收识别ID
		CANACR1 = CAN_FilterID&0xE0;
		CANACR2 = 0;
		CANACR3 = 0;
		CANMSK0 = CAN_MASKID>>8;  //设置识别ID掩码  CAN_MASKID>>8
		CANMSK1 = CAN_MASKID&0xE0;//CAN_MASKID&0xE0
		CANMSK2 = 0xFF;
		CANMSK3 = 0xFF;
		CANMOD &= ~CAN_reset; //CAN模块退出复位模式，进入工作模式
		return OK;
	}
	else
	{
		if(CANID_MODE == 0)
		{
			if(CAN_FilterID>0x1FFFFFFF)
				return False;
			else
			{
				CAN_FilterID <<=3;
				CAN_MASKID   <<=3;
			}
		}
		else
		{
			if(CAN_FilterID>0xFFFFFFF8)
				return False;
		}
		if(CAN_FilterID&0xFE000000 == 0xFE000000)
			return False;
		CANMOD |= CAN_reset;
		CANACR0 = CAN_FilterID>>24;
		CANACR1 = CAN_FilterID>>16;
		CANACR2 = CAN_FilterID>>8;
		CANACR3 = CAN_FilterID&0xF8;
		CANMSK0 = CAN_MASKID>>24;
		CANMSK1 = CAN_MASKID>>16;
		CANMSK2 = CAN_MASKID>>8;
		CANMSK3 = CAN_MASKID&0xF8;
		CANMOD &= ~CAN_reset;
		return OK;
	}
}

/****************************************************************************************
 * 函数名     ：CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS1, uint8 CAN_MODE, uint8 CAN_pre)
 * 函数功能：CAN初始化
 * 入口参数：重同步时钟宽度：    CAN_SJW（1~4）
 * 			 相位缓冲段1：	 CAN_BS1（1~16）
 * 			 相位缓冲段2：	 CAN_BS2（1~8）
 * 			 回环模式	： 		 1-使能,0-禁能
 * 			 CAN分频: 		 CAN_pre(1~64)	(Tscl =  2*Tclk*CAN_pre) Tclk为时钟最小Tq=0.0625us
 * 返回          ：无
 *
****************************************************************************************/
void CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS2, uint8 CAN_MODE, uint8 CAN_pre)
{
	//引脚初始化,设置 CANRX 为数字输入，CANTX 为数字输出口 2,6,1,0,8
	ANS15 = 0;
	ANS14 = 0;
	TR15 = 0;
	TR14 = 1;
	//使能进入复位模式
	CANMOD |= CAN_reset;
	//默认选择高速外设时钟16M,若更改需要设置不同的分频的最小分频周期
	if(CAN_MODE)
	{
		CANMOD |= CAN_enable|CANCLK_SEL_HFCLK|CAN_LBACK_disable;
	}
	else
	{
		CANMOD |= CAN_enable|CANCLK_SEL_HFCLK;
	}

	//配置波特率，位速率
	CANBTR = (CAN_SJW-1)<<6|(CAN_pre-1);
	CANSEG = CAN_Sample_1|(CAN_BS1-1)|(CAN_BS2-1)<<4;
	//报警限制寄存器,默认96
	//TX错误计数,复位时为0,超过255总线关闭
	//RX错误计数,复位时为0
	//验收代码寄存器,匹配ID
	CANMOD &= ~CAN_reset;
}

/****************************************************************************************
 * 函数名     ：CAN_Transmit_Message(unsigned char* CAN_send_data)
 * 函数功能：CAN数据发送
 * 入口参数：待发送数组
 * 返回          ：CAN_SendData_STATE,发送成功&失败
 *
****************************************************************************************/
CAN_SendData_STATE CAN_Transmit_Message(CAN_DATA_INF* CAN_Send_DATA)
{
	unsigned char temp;
	unsigned int Delay_Count ;

	Delay_Count=0;
	while(!TXBSTA)//等待CPU可以访问发送缓冲器
	{
		if(++Delay_Count>0xFE0)
			return False;
	}
//将数据写入
	temp = (CAN_Send_DATA->data_ide<<7)|(CAN_Send_DATA->data_rtr<<6|CAN_Send_DATA->data_length);
	CANTXINF = temp;
	if(CAN_Send_DATA->data_ide==0)//标准帧
	{
		if(CAN_Send_DATA->data_rtr==0)//数据帧
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->raw_data[0];
			CANTXID3=CAN_Send_DATA->raw_data[1];
			CANTXDT0=CAN_Send_DATA->raw_data[2];
			CANTXDT1=CAN_Send_DATA->raw_data[3];
			CANTXDT2=CAN_Send_DATA->raw_data[4];
			CANTXDT3=CAN_Send_DATA->raw_data[5];
			CANTXDT4=CAN_Send_DATA->raw_data[6];
			CANTXDT5=CAN_Send_DATA->raw_data[7];
		}
		else//标准远程帧
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
		}
	}
	else//扩展帧
	{
		if(CAN_Send_DATA->data_rtr==0) //为数据帧
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->data_id[2];
			CANTXID3=CAN_Send_DATA->data_id[3];
			CANTXDT0=CAN_Send_DATA->raw_data[0];
			CANTXDT1=CAN_Send_DATA->raw_data[1];
			CANTXDT2=CAN_Send_DATA->raw_data[2];
			CANTXDT3=CAN_Send_DATA->raw_data[3];
			CANTXDT4=CAN_Send_DATA->raw_data[4];
			CANTXDT5=CAN_Send_DATA->raw_data[5];
			CANTXDT6=CAN_Send_DATA->raw_data[6];
			CANTXDT7=CAN_Send_DATA->raw_data[7];
		}
		else//远程帧
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->data_id[2];
			CANTXID3=CAN_Send_DATA->data_id[3];
		}
	}

//单次发送
	CANCMR = 0x03;
//等待发送完成
	Delay_Count=0;
	while(!TCSTA)
	{
		if(++Delay_Count>0xFE0)
			return False;
	}

	return OK;
}

/****************************************************************************************
 * 函数名     ：CAN_Receive_Message_Configuration
 * 函数功能：CAN数据接收
 * 入口参数：全局变量,CAN_Rev_DATA,接收到的数据放入此结构体
 * 返回          ：无
 *
****************************************************************************************/
void CAN_Receive_Message_Configuration(void)
{
	unsigned int  can_point=0;
	unsigned char i;

	//配置指针
	if(can_data_hand<8)
	{
		can_point =(0x1C80 + can_data_hand * 0x10);
	}
	else
	{
		can_point =(0x1D80+(can_data_hand-8)*0x10);
	}
	//取出数据
	for(i=0;i<13;i++)
	{
		CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
	}
	//提取帧信息与帧长度
	CAN_Rev_DATA.data_ide = CAN_Rev_BUF[0]>>7;
	CAN_Rev_DATA.data_rtr = (CAN_Rev_BUF[0]&0x40)>>6;
	CAN_Rev_DATA.data_length = CAN_Rev_BUF[0]&0x0F;
	if(CAN_Rev_DATA.data_ide)	  //扩展帧
	{
		//保存ID
		CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
		CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2];
		CAN_Rev_DATA.data_id[2]=CAN_Rev_BUF[3];
		CAN_Rev_DATA.data_id[3]=CAN_Rev_BUF[4]&0xF8;

		if(CAN_Rev_DATA.data_rtr)//远程帧
		{
			;
		}
		else						//数据帧
		{
			if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//判断数据长度
			{
				//保存数据
				for(i=0;i<CAN_Rev_DATA.data_length;i++)
				{
					CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[5+i];
				}
			}
		}
	}
	else//标准帧
	{
		//保存ID
		CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
		CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2]&0xE0;

		if(CAN_Rev_DATA.data_rtr)//远程帧
		{
			;
		}
		else//数据帧
		{
			if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//判断数据长度
			{
				//保存数据
				for(i=0;i<CAN_Rev_DATA.data_length;i++)
				{
					CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[3+i];
				}
			}
		}
	}

	//数据处理完毕，更新变量
	CANCMR = 0x04;//释放缓冲器

	can_data_hand++;//指针+1
	if(can_data_hand==16)//若指针指向15以上，返回0
	{
		can_data_hand=0;
	}
}

/****************************************************************************************
 * 函数名     ：unsigned char CAN_GetITStatus
 * 函数功能：获取CAN中断标志位
 * 入口参数：中断类型
 * 返回          ：状态，RESET 0  SET 1
 * 如果要在中断中使用，需要打开对应中断使能
****************************************************************************************/
ITStatus CAN_GetITStatus(unsigned char CAN_IT_bit)
{
	if(CANIF&CAN_IT_bit)
		return SET_STATE;
	else
		return RESET_STATE;
}

/****************************************************************************************
 * 函数名     ：CAN_CLRITStatus
 * 函数功能：清除对应CAN中断标志位
 * 入口参数：中断类型
 * 返回          ：无
****************************************************************************************/
void CAN_ClearITStatus(unsigned char CAN_IT_bit)
{
	CANIF &= (~CAN_IT_bit);
}

/****************************************************************************************
 * 函数名     ：CAN_SetITStatus
 * 函数功能：设置对应CAN中断
 * 入口参数：中断类型
 * 返回          ：无
****************************************************************************************/
void CAN_SetITStatus(unsigned char CAN_IT_bit)
{
	CANIF &= (~CAN_IT_bit);
	CANIE = CAN_IT_bit;
}

/****************************************************************************************
 * 函数名     ：CAN_UnsetITStatus
 * 函数功能：取消对应CAN中断
 * 入口参数：中断类型
 * 返回          ：无
****************************************************************************************/
void CAN_UnsetITStatus(unsigned char CAN_IT_bit)
{
	CANIE &= (~CAN_IT_bit);
}
