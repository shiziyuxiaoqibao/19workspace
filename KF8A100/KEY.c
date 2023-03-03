/*
 * OSC.c
 *
 *  Created on: 2020-10-31
 *      Author: Administrator
 */
#include "includes.h"

#ifndef KEY_C_
#define KEY_C_

const unsigned char  dif=0x01;  //按键AD值的误差范围
//const unsigned int   KeyAD[]={0x39,0x83,0xEA,0xE5,0x13};   //每个按键的AD值 KeyAD[]={100,3381,3721,1000,1000,1000,1000,1000,1000,1000};   //每个按键的AD值
unsigned int  Upper_dif,Low_Dif;
extern unsigned char   TX_Data[8];
extern unsigned char key_count;
unsigned char Key_Number;
unsigned char	Left_Keyboader_value;
unsigned char	Right_Keyboader_value;
unsigned char	Left_Keyboader_value_o;
unsigned char	Right_Keyboader_value_o;
unsigned long int	Left_key_count;
unsigned long int	Right_key_count;
unsigned int	Left_key_count_o;
unsigned int	Right_key_count_o;
unsigned char	Stuck_Flag;// left 1 2 3 4 5
						   // right 6 7 8 9 10
unsigned int DC_DATA;

unsigned int currentkey()
{

	unsigned int  ADC_data;
	unsigned char Key_Number;
	Key_Number=0;
	Init_ADC2(0x01);
	ADCCTL2 = 0x0c;                 //右路AD按键数据采集
	ADC_data = Adc_read();
	if(ADC_data<100)//返回
	  {
		  Key_Number=1;
	  }

	else if(ADC_data>600&&ADC_data<700)//选择上
	  {
		  Key_Number=2;
	  }

	else if(ADC_data>=1200&&ADC_data<=1650)//ok
	  {
		  Key_Number=3;
	  }

	else if(ADC_data>=1900&&ADC_data<=2000)//选择下
	  {
		  Key_Number=4;
	  }

	else if(ADC_data>=2400&&ADC_data<=2600)//语音按键
	  {
		  Key_Number=5;
	  }

	else
		  Key_Number=0;

	return Key_Number;

}

unsigned int currentkeyleft()
{
	unsigned int  ADC_data1;
	unsigned char Key_Number1;

	Key_Number1=0;
	Init_ADC(0x01);
	ADCCTL2 = 0x25;                 //左路AD按键数据采集
	ADC_data1 = Adc_read();
	if(ADC_data1<=100)//电话接听
	  {
		  Key_Number1=1;
	  }

	else if(ADC_data1>=800&&ADC_data1<=1000)//vol+
	  {
		  Key_Number1=2;
	  }

	else if(ADC_data1>=1450&&ADC_data1<=1600)//vol x
	  {
		  Key_Number1=3;
	  }

	else if(ADC_data1>1750&&ADC_data1<=1850)//vol-
	  {
		  Key_Number1=4;
	  }

	else if(ADC_data1>=1950&&ADC_data1<=2100)//电话挂断
	  {
		  Key_Number1=5;
	  }

	else
		  Key_Number1=0;

	return Key_Number1;

}


void KeyToCanvalue(unsigned char keyvalue, unsigned long int keycnt)
{
	switch(keyvalue)
	{
		case 1: //
			if(keycnt>100000)//连续5次检测结果保持同一键值，确认按键为短按
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt>5)
			{
				TX_Data[0]=0x20;	//返回
			}
			break;
		case 2:
			if(keycnt >100000)
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt>5)
			{
				TX_Data[0]=0x40;	//上翻
			}
			break;
		case 3:
			if(keycnt >100000)
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt>5)
			{
				TX_Data[0]=0x80;	//确认
			}
			break;
		case 4:
			if(keycnt >100000)
			{
				TX_Data[1]=0x00;
			}
			else if(keycnt>5)
			{
				TX_Data[1]=0x01;   //下翻
			}
			break;
		case 5:
			if(keycnt >100000)
			{
				TX_Data[1]=0x00;
			}
			else if(keycnt>5)
			{
				TX_Data[1]=0x02;   //语音
			}
			break;
	}
	if (keyvalue == 0U)
	{
		Main_DataClean();
	}
	else
	{
		Main_CleanTimeSet();
	}

}

void KeyToCanvalue1(unsigned char keyvalue1, unsigned long int keycnt1)
{
	switch(keyvalue1)
	{
		case 1: //
			if(keycnt1>100000)//连续5次检测结果保持同一键值，确认按键为短按
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt1>5)
			{
				TX_Data[0]=0x02;//挂断
			}
			break;
		case 2:
			if(keycnt1>100000)
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt1>5)
			{
				TX_Data[0]=0x10;//音量-
			}
			break;
		case 3:
			if(keycnt1>100000)
			{
				TX_Data[1]=0x00;
			}
			else if(keycnt1>5)
			{
				TX_Data[0]=0x08;//静音
			}
			break;
		case 4:
			if(keycnt1>100000)
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt1>5)
			{
				TX_Data[0]=0x04;   //音量+
			}
			break;
		case 5:
			if(keycnt1>100000)
			{
				TX_Data[0]=0x00;
			}
			else if(keycnt1>5)
			{
				TX_Data[0]=0x01;   //接听
			}
			break;
	}
	if (keyvalue1 == 0U)
	{
		Main_DataClean();
	}
	else
	{
		Main_CleanTimeSet();
	}

}

void keyl_detection()
{
	Left_Keyboader_value =currentkey();
	if(Left_Keyboader_value != Left_Keyboader_value_o)
		Left_key_count =0;
		else
		{
		if(Left_key_count <120000) //键值长期不变的情况下，阻止计数值溢出
			Left_key_count ++;
		}
		KeyToCanvalue(Left_Keyboader_value,Left_key_count);
		Left_key_count_o = Left_key_count;
		Left_Keyboader_value_o =Left_Keyboader_value;

}

void keyr_detection()
{
	Right_Keyboader_value =currentkeyleft();
	if(Right_Keyboader_value != Right_Keyboader_value_o)
		Right_key_count =0;
		else
		{
		if(Right_key_count <120000) //键值长期不变的情况下，阻止计数值溢出

			Right_key_count ++;
		}
		KeyToCanvalue1(Right_Keyboader_value,Right_key_count);
		Right_key_count_o =Right_key_count;
		Right_Keyboader_value_o =Right_Keyboader_value;;
}



#endif /* KEY_C_ */

