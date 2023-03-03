#ifndef BSP_CAN_H_
#define BSP_CAN_H_

typedef enum
{
	False = 0,
	OK
}FilterConfig_STATE,CAN_SendData_STATE,LIN_Config_STATE,LIN_Receive_STATE;

typedef enum
{
	RESET_STATE = 0,
	SET_STATE = !RESET_STATE
}ITStatus;

typedef union
{
	struct
	{
		unsigned char data_ide;		//置0为标准帧，置1为扩展帧
		unsigned char data_rtr;		//置0为数据帧，置1为远程帧
		unsigned char data_length;	//数据长度，小于等于8
		unsigned char data_id[4];	//数据识别码，当为标准帧时为2个数据，扩展帧为4个数据
		unsigned char raw_data[8];		//发送的数据，远程帧不可用，使用长度等于数据长度
	};
	unsigned char CAN_DATA_Format[15];
}CAN_DATA_INF;

/*
 * 发送一次中断
 */
#define 	CAN_TX_Int_enable()				(CANTXIF= 0,CANTXIE= 1)
#define 	CAN_TX_Int_disable()			(CANTXIF= 0,CANTXIE= 0)
/*
 * 接收一次中断
 */
#define 	CAN_RX_Int_enable()				(CANRXIF= 0,CANRXIE= 1)
#define 	CAN_RX_Int_disable()			(CANRXIF= 0,CANRXIE= 0)
/*
 * 接收缓冲区满中断,15区全满溢出中断
 */
#define		CAN_RX_BuffOver_Int_enable()	(RXINF=0,RXINE=1)
#define		CAN_RX_BuffOver_Intt_disable()	(RXINF=0,RXINE=1)
/*
 * 总线错误中断
 */
#define		CAN_BUS_ERROR_Int_enable()		(BEIF=0,BEIE=1)
#define		CAN_BUS_ERROR_Int_disable()		(BEIF=0,BEIE=1)




//CAN模式寄存器									-------CANMOD
//CAN使能选择
#define		CAN_enable						0x80
#define		CAN_disable						0x00
//CAN时钟选择
#define		CANCLK_SEL_SCLK					0x00
#define		CANCLK_SEL_HFCLK				0x20
#define		CANCLK_SEL_LFCLK				0x40
//CAN睡眠模式控制位,复位模式下不可写
#define		CAN_SLEEP_enable				0x08
#define		CAN_SLEEP_disable				0x00
//CAN回环模式控制位
#define		CAN_LBACK_enable				0x04
#define		CAN_LBACK_disable				0x00
//CAN静默模式控制位
#define		CAN_SILENT_enable				0x02
#define		CAN_SILENT_disable				0x00
//CAN复位模式控制位
#define		CAN_reset						0x01

//CAN命令寄存器									-------CANCMR

//CAN波特率寄存器								-------CANBTR
//CAN同步跳转宽度
#define		CAN_SJW_4tq						0xC0
#define		CAN_SJW_3tq						0x80
#define		CAN_SJW_2tq						0x40
#define		CAN_SJW_1tq						0x00
//CAN波特率预设值,HCLK=16M时候
#define		CAN_baud_800K					0x00
#define		CAN_baud_400K					0X01
#define		CAN_baud_200K					0X03
#define		CAN_baud_100K					0X07

//CAN位速率寄存器								-------CANSEG
//CAN总线采样次数
#define		CAN_Sample_3					0x80
#define		CAN_Sample_1					0x00

/* In case interrupt is generated if the AIE bit is set */
/* In case interrupt is generated if the PUIE bit is set */
//CAN中断标志寄存器								-------CANIF
#define		CAN_IT_BE						0x80			//总线错误中断
#define		CAN_IT_AL						0x40			//仲裁丢失中断标志位
#define		CAN_IT_EN						0x20			//错误消极中断标志位
#define		CAN_IT_WU						0x10			//唤醒中断标志位
#define		CAN_IT_DOVF						0x08			//数据溢出中断标志位
#define		CAN_IT_EA						0x04			//错误报警中断标志位
#define		CAN_IT_CANTX					0x02			//发送中断标志位
#define		CAN_IT_CANRX					0x01			//接收中断标志位

extern volatile CAN_DATA_INF CAN_Rev_DATA;


//函数
void CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS2, uint8 CAN_MODE, uint8 CAN_pre);
FilterConfig_STATE CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID);
CAN_SendData_STATE CAN_Transmit_Message(CAN_DATA_INF* CAN_Send_DATA);
void CAN_Receive_Message_Configuration(void);
//中断配置
void CAN_SetITStatus(unsigned char CAN_IT_bit);
void CAN_UnsetITStatus(unsigned char CAN_IT_bit);
ITStatus CAN_GetITStatus(unsigned char CAN_IT_bit);
void CAN_ClearITStatus(unsigned char CAN_IT_bit);
#endif /* BSP_CAN_H_ */
