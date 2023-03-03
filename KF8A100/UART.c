#include "includes.h"

unsigned char UART2_BUF[USART_REC_LEN];

/****************************************************************************************
 * 函数名     ：UART_Init
 * 函数功能：UART初始化函数
 * 入口参数：无
 * 返回          ：无
****************************************************************************************/
void UART2_Init(void)
{
	/***Usart相关寄存器初始化****/		//m=4		baud=SCLK/m/(EUBRGH:EUBRGL);
	BRCTL2=0x40|USART_SourceClk_SCLK|USART_BRG16;	// 	接收空闲  使用8位计数器，不考虑唤醒是使能和自动波特率检测

	#ifdef	UART2_Baud_9600
	EUBRGH2=0x03;
	EUBRGL2=0x40;
	TSCTL2=0x26;
	RSCTL2=0x90;
	#else
	EUBRGH2=0x00;
	EUBRGL2=68;
	TSCTL2=0x26;
	RSCTL2=0x90;
	#endif

//	RSCTL2 =0x90;//使能串口模块、使能接收器
//	BRCTL2 =0x40;//接收器空闲
//	TSCTL2 =0x22;//使能发送功能、移位寄存器空
//	EUBRGL2= 0x19;//波特率寄存器设置为25，当前波特率是9600，波特率为SCLK/【m*（EUBRGH：EUBRGL+1）】，m的设置方法参考手册
//	EUBRGH2 =0;

	TX2IF=0;
	TX2IE=0;
	RC2IF=0;
	RC2IE=0;
}

/****************************************************************************************
 * 函数名     ：UART2_SendOneByte
 * 函数功能：串口发送函数，等待发送标志位清空
 * 入口参数：待发数据
 * 返回          ：无
****************************************************************************************/
void UART2_SendOneByte(unsigned char SendTemp)
{
	TXSDR3=SendTemp;
	while(TXSRS3==0);
}

/****************************************************************************************
 * 函数名     ：UART_SendBuf
 * 函数功能：串口发送函数，等待发送标志位清空
 * 入口参数：待发数据首位号,待发长度,待发数据
 * 返回          ：无
****************************************************************************************/
void UART2_SendBuf(uint8 head, uint8 lenth, uint8 *SendTemp)
{
	uint8 temp;
	temp = head+lenth;
	for(;head<temp;head++)
	{
		UART2_SendOneByte(*(SendTemp+head));
	}
}
