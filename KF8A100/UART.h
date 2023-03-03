#ifndef UART_H_
#define UART_H_

#define UART2_Baud_115200

#ifndef	UART2_Baud_115200
#define	UART2_Baud_9600

#endif

#define USART_REC_LEN 50		//50个接收缓存字节

extern unsigned char UART2_BUF[USART_REC_LEN];

//波特率控制寄存器															-------BRCTLx
#define		USART_BRG16					0x10 /*!< 0B0000 0000 SCLK*/
#define		USART_BRG8					0x00 /*!< 0B0000 0000 SCLK*/
#define		USART_SourceClk_SCLK		((uchar)0x00) /*!< 0B0000 0000 SCLK*/
#define		USART_SourceClk_HFCLK		((uchar)0x04) /*!< 0B0000 0100 HFCLK*/
#define		USART_SourceClk_LFCLK1		((uchar)0x08) /*!< 0B0000 1000 LFCLK*/
#define		USART_SourceClk_LFCLK2		((uchar)0x0C) /*!< 0B0000 1100 LFCLK*/


void UART2_Init(void);
void UART2_SendOneByte(unsigned char SendTemp);
void UART2_SendBuf(uint8 head, uint8 lenth, uint8 *SendTemp);

#endif /* UART_H_ */
