#ifndef INCLUDE_H_
#define INCLUDE_H_
#include<KF8A100GQP.h>
#include "KF8_Type_Define.h"
#include "Clock.h"
#include "Timer.h"
#include "UART.h"
#include "BSP_can.h"
#include "ADC.h"
#include "KEY.h"

#define CAN_TEST	1

extern volatile unsigned char can_data_hand;
extern volatile unsigned char CAN_Rev_BUF[13];

#define		LIN_SLP_PIN		P7LR1
#define		LIN_TXD_PIN		P1LR3
#define		LIN_RXD_PIN		P1LR2

#define		LED_B			P6LR1
#define		LED_G			P6LR3
#define		LED_R			P6LR5

typedef unsigned char         uint8_t;

typedef enum
{
	LED_OFF=0,
	LED_ON,
}LED_state;

void Main_CleanTimeSet(void);
void Main_DataClean(void);
#endif /* INCLUDE_H_ */
