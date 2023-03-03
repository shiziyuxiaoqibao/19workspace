/*************************************************************************************
* 项目名：   Mid_Light V2.0
* 开发环境：ChipON IDE
* SW:V1.0.1.230104
* HW:V1.0.0.221228
* 使用芯片：KF8A100GQP
* 作者： shizi
* 修改记录:
*
* 1)更改报文输出方式：位取值更改为直接赋值
* 2)修改为外部晶振
* 3)增加卡滞功能
* 4)功能基本正常 待测试 221230
*
* note:硬件电阻R26需要由100K更改为10K
*************************************************************************************/

#include "includes.h"

//全局变量，用于指向将要读取CAN数据帧的第几个,初始为0
volatile unsigned char can_data_hand=0;
volatile unsigned char CAN_Rev_BUF[13];
volatile CAN_DATA_INF CAN_Rev_DATA;
volatile unsigned int	Time_count;
volatile unsigned int	key_count;
unsigned char length =0;
//unsigned char ADC_data;

unsigned char Data_fram , Status_fram=0 ,Fram_lenth;
unsigned int ID_fram =0;
unsigned char Data[8]={0};
unsigned char   TX_Data[8];
unsigned char RX_Data[8];


//主函数
void main()
{
	unsigned int  can_point=0;
	unsigned int  Delay_Count ;
	unsigned char i;

	PLLCTL =0xb3;     //2倍频
	HFCKCTL =0xcf;//使能高频外设时钟，INTHF,16M
	SCLKCTL =0X7c;//禁止输出时钟，选择内部高频作为时钟源，分频器1:1分频

//	SCLKCTL =0x7c;
//	HFCKCTL =0xef;


//	PLLCTL =0xb3;

	PORT_Init();
	Timer1_Init();
	UART2_Init();
	Init_ADC(0x01);


	if(CAN_IDFilterConfig(0,1,0x24C0,0x0600) == OK) //配置CAN的识别的数据帧是，标准帧ID 为0x116 ，0x126 ，0x136//0x24c0 0x0f00
	CAN_Init(2,5,2,0,2);		//500K
//	CAN_Init(2,6,1,0,8);		//125K
//	CAN_Init(2,7,2,0,8);		//100K

	PUIE = 1;
	AIE = 1;
	delay_ms(300);
	while(1)
	{
			keyl_detection();
			_NOP();
			_NOP();
			_NOP();
			_NOP();
			keyr_detection();


//定时发送Can信息
		if(Time_count>=100)			//500ms
		{
			Time_count=0;

//写入待发送的数据
			Status_fram =0;
			Data_fram =0;
			Fram_lenth =8;
			ID_fram =0x243;
//填充待发送的数据
			Delay_Count=0;
			while(!TXBSTA)//等待CPU可以访问发送缓冲器
			{
				P3LR0 =!P3LR0;
				if(++Delay_Count>0xFE0)
					break;
			}
//将数据写入
			CANTXINF = (Status_fram<<7)|(Data_fram<<6)|Fram_lenth;
			if(!Status_fram)//标准帧
			{
				ID_fram <<=5;
				CANTXID0=ID_fram >> 8;
				CANTXID1=(unsigned char)ID_fram;
				if(!Data_fram)//数据帧
				{
					CANTXID2=TX_Data[0];
					CANTXID3=TX_Data[1];
					CANTXDT0=TX_Data[2];
					CANTXDT1=TX_Data[3];
					CANTXDT2=TX_Data[4];
					CANTXDT3=TX_Data[5];
					CANTXDT4=TX_Data[6];
					CANTXDT5=TX_Data[7];
				}
			}

		//单次发送
			CANCMR = 0x03;
		//等待发送完成
			Delay_Count=0;
			while(!TCSTA)
			{
				if(++Delay_Count>0xFE0)
					break;
			}

	//		UART2_SendBuf(0,13,CAN_Rev_BUF);
	//		UART2_SendOneByte(0xAA);
		}
//判断经过过滤器的接收信息，中断里使用指针会报错，所以在外面处理接收
		if(CANRXIF)
		{
//配置数据指针
			if(can_data_hand<8)
			{
				can_point =0x1C80 + can_data_hand * 0x10;
			}
			else
			{
				can_point =0x1D80+(can_data_hand-8)*0x10;
			}
			can_data_hand++;//指针+1
			if(can_data_hand==16)//若指针指向15以上，返回0
			{
				can_data_hand=0;
			}
//取出can缓冲区的数据
			for(i=0;i<13;i++)
			{
				CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
			}
//按照标准帧解析数据包
			Status_fram =(CAN_Rev_BUF[0]&0x80) >>7; //0是标准帧
			Data_fram =(CAN_Rev_BUF[0]&0x40) >>6; //0是数据帧
			Fram_lenth =CAN_Rev_BUF[0]&0x0F; //数据长度

			ID_fram =CAN_Rev_BUF[1];
			ID_fram <<=8;
			ID_fram += CAN_Rev_BUF[2];
			ID_fram >>=5; //数据长度
			for (i =0;i<8;i++)
			{
				Data[i]=CAN_Rev_BUF[i+3];
//				CAN_RX_DATA[i]=CAN_Rev_BUF[i+5];    // 扩展帧
			}
//处理善后事宜
			CANCMR = 0x04;//促使信息计数器减1
			CANRXIF =0;


		}

	}	//end of while
}	//end of main

static unsigned int cleantime = 0U;
void Main_DataClean(void)
{
	static old_data0 = 0U ,old_data1 = 0U;
	if (TX_Data[0]!= 0U || TX_Data[1]!= 0U)
	{
		if (cleantime >= 100)
		{
			cleantime = 0;
			TX_Data[0] = 0U;
			TX_Data[1] = 0U;
		}
	}
}


void Main_CleanTimeSet(void)
{
	cleantime = 0U;
}
//中断函数0:0X04入口地址
void int_fun0() __interrupt (0)
{
	if(T1IE && T1IF)			//T1定时中断		500us gptrget1
	{
		T1IF=0;
		_CWDT();
		Time_count++;
		key_count++;
		cleantime ++;
	}
}


//中断函数1:0x14入口地址
void int_fun1() __interrupt (1)
{

}
