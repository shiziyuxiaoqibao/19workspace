#include "includes.h"

void delay_ms(uint16 num)
{
	uint16 i,j;
	for(i=0;i<num;i++)
	{
		_CWDT();
		j=1000;
		while(j--);
	}
}

void PORT_Init(void)
{
	P0LR = 0;	P1LR = 0;	P2LR = 0;	P3LR = 0;
	P4LR = 0;	P5LR = 0;	P6LR = 0;	P7LR = 0;
	P9LR = 0;	PALR = 0;	PBLR = 0;
	ANS0 =0;
	ANS06=1;
	ANS07=1;
	ANS1 =0;
	ANS2 =0;
	ANS3 =0;
	ANS4 =0;
	ANS5 =0;
	ANS6 =0;
	ANS7 =0;
	ANS9 =0;
	ANSA =0;
	ANSB =0;
	TR0 = 0xFF;	TR1	= 0;	TR2	= 0;	TR3 = 0;
	TR4 = 0;	TR5 = 0;	TR6 = 0;	TR7 = 0;
	TR9 = 0;	TRA = 0;	TRB = 0;
}


