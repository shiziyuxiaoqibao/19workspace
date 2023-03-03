/*
 * ADC.c
 *
 *  Created on: 2019-8-28
 *      Author: charles_cai
 */
#include "includes.h"

#ifndef ADC_C_
#define ADC_C_

void delay_5us(unsigned int time)
{
	while( time--)
	{
		_NOP();
		_NOP();
		_NOP();
		_NOP();
	}
}

/************************
 * ������     ��Adc_fun
 * �������ܣ�ADC������ģ��ת��
 * ��ڲ�������
 * ����          ������ADC����ֵ
 ************************/
unsigned int Adc_fun(void)
{
	unsigned int Adc_num = 0 ;			  //ADCת���������
	START = 1;					  //����ADC
	while(START);                 //�ȴ�ת������
	Adc_num = ADCDATA0H;	  	  //����λ�ӽ�ȥ
	Adc_num <<=8;
	Adc_num += ADCDATA0L;		  //����λ�ӽ�ȥ
	return Adc_num;			      //����ת��ֵ
}
/************************
 * ������     ��Adc_read
 * �������ܣ�ADC���ֵ������adc��ȡ����
 * ��ڲ�������
 * ����          ������ADC����8�ξ�ֵ
 ************************/
unsigned int Adc_read(void)
{
	unsigned int Adc_sum = 0 ; 		          //adc�����ۼӱ���
	unsigned char i = 0;
	for(i = 0; i < 8; i++)
	{
		Adc_sum += Adc_fun();		  //�ۼӰ˴β���ֵ
	}
	Adc_sum >>= 3;		              //���ƶ�3λ  ��8���ֵ
	return Adc_sum;
}

/************************
 * ������     ��Init_ADC
 * �������ܣ���ʼ��ADC����
 * ��ڲ�������ʼ����ģʽ
 * ����          ����
 ************************/
void Init_ADC(unsigned mode)
{
	TR04 =1;
//	TR66 =1;
	ANS37 =1;//ADC����������Ҫ����Ϊģ������
//	ANS12 =1;//ADC����������Ҫ����Ϊģ������

	switch(mode)
	{
	case 1://��VDDΪ�ο���ѹ����AD5�ĵ�ѹ
		ADCCTL0 =0x81;//��������Ҷ��룬��ʹ��ADC
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
//		ADCCTL2 =0x05;
		break;
	case 2://��VDDΪ�ο���ѹ�����ڲ��ο���ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
		ADCCTL2 =0x26;//����FVR
		break;
	case 3://��VDDΪ�ο���ѹ�����¶ȴ������ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
		ADCCTL2 =0x27;//���������¶ȴ�����
		break;
	case 4://��FVRΪ�ο���ѹ����AD5�ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//�ο���ѹ����ΪFVR
		ADCCTL2 =0x05;//����AD5ͨ��
		break;
	case 5://��VDDΪ�ο���ѹ,����OPOUT�ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//�ο���ѹ����ΪFVR
		ADCCTL2 =0x24;//����OPOUT
		break;
	}
}



/************************
 * ������     ��Init_ADC
 * �������ܣ���ʼ��ADC����
 * ��ڲ�������ʼ����ģʽ
 * ����          ����
 ************************/
void Init_ADC2(unsigned mode)
{
//	TR04 =1;
	TR66 =1;
//	ANS37 =1;//ADC����������Ҫ����Ϊģ������
	ANS12 =1;//ADC����������Ҫ����Ϊģ������

	switch(mode)
	{
	case 1://��VDDΪ�ο���ѹ����AD5�ĵ�ѹ
		ADCCTL0 =0x81;//��������Ҷ��룬��ʹ��ADC
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
//		ADCCTL2 =0x05;
		break;
	case 2://��VDDΪ�ο���ѹ�����ڲ��ο���ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
		ADCCTL2 =0x26;//����FVR
		break;
	case 3://��VDDΪ�ο���ѹ�����¶ȴ������ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//�ο���ѹ����ΪVDD
		ADCCTL2 =0x27;//���������¶ȴ�����
		break;
	case 4://��FVRΪ�ο���ѹ����AD5�ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//�ο���ѹ����ΪFVR
		ADCCTL2 =0x05;//����AD5ͨ��
		break;
	case 5://��VDDΪ�ο���ѹ,����OPOUT�ĵ�ѹ
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//�ο���ѹ����ΪFVR
		ADCCTL2 =0x24;//����OPOUT
		break;
	}
}
/************************
 * ������     ��BAT_StateGet
 * �������ܣ���Դ��ѹ�ɼ�
 * ��ڲ�������
 * ����          ����
 ************************/
//void BAT_StateGet(void)
//{
//	unsigned char value;
//	unsigned char power;
//	ADCCTL2=0x26;
//	value = Adc_read();
//	if(value >= 1 && value <= 5)
//	{
//		power=1;
//	}
//	else
//		power=0;
//
//	return power;
//}


#endif /* ADC_C_ */
