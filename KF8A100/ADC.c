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
 * 函数名     ：Adc_fun
 * 函数功能：ADC函数，模数转换
 * 入口参数：无
 * 返回          ：返回ADC采样值
 ************************/
unsigned int Adc_fun(void)
{
	unsigned int Adc_num = 0 ;			  //ADC转换缓冲变量
	START = 1;					  //启动ADC
	while(START);                 //等待转换结束
	Adc_num = ADCDATA0H;	  	  //将高位加进去
	Adc_num <<=8;
	Adc_num += ADCDATA0L;		  //将低位加进去
	return Adc_num;			      //返回转换值
}
/************************
 * 函数名     ：Adc_read
 * 函数功能：ADC求均值函数，adc读取函数
 * 入口参数：无
 * 返回          ：返回ADC采样8次均值
 ************************/
unsigned int Adc_read(void)
{
	unsigned int Adc_sum = 0 ; 		          //adc采样累加变量
	unsigned char i = 0;
	for(i = 0; i < 8; i++)
	{
		Adc_sum += Adc_fun();		  //累加八次采样值
	}
	Adc_sum >>= 3;		              //右移动3位  除8求均值
	return Adc_sum;
}

/************************
 * 函数名     ：Init_ADC
 * 函数功能：初始化ADC外设
 * 入口参数：初始化的模式
 * 返回          ：无
 ************************/
void Init_ADC(unsigned mode)
{
	TR04 =1;
//	TR66 =1;
	ANS37 =1;//ADC采样引脚需要配置为模拟输入
//	ANS12 =1;//ADC采样引脚需要配置为模拟输入

	switch(mode)
	{
	case 1://以VDD为参考电压测量AD5的电压
		ADCCTL0 =0x81;//采样结果右对齐，且使能ADC
		ADCCTL1 =0x54;//参考电压设置为VDD
//		ADCCTL2 =0x05;
		break;
	case 2://以VDD为参考电压测量内部参考电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//参考电压设置为VDD
		ADCCTL2 =0x26;//采样FVR
		break;
	case 3://以VDD为参考电压测量温度传感器的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//参考电压设置为VDD
		ADCCTL2 =0x27;//采样内置温度传感器
		break;
	case 4://以FVR为参考电压测量AD5的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//参考电压设置为FVR
		ADCCTL2 =0x05;//采样AD5通道
		break;
	case 5://以VDD为参考电压,测量OPOUT的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//参考电压设置为FVR
		ADCCTL2 =0x24;//采样OPOUT
		break;
	}
}



/************************
 * 函数名     ：Init_ADC
 * 函数功能：初始化ADC外设
 * 入口参数：初始化的模式
 * 返回          ：无
 ************************/
void Init_ADC2(unsigned mode)
{
//	TR04 =1;
	TR66 =1;
//	ANS37 =1;//ADC采样引脚需要配置为模拟输入
	ANS12 =1;//ADC采样引脚需要配置为模拟输入

	switch(mode)
	{
	case 1://以VDD为参考电压测量AD5的电压
		ADCCTL0 =0x81;//采样结果右对齐，且使能ADC
		ADCCTL1 =0x54;//参考电压设置为VDD
//		ADCCTL2 =0x05;
		break;
	case 2://以VDD为参考电压测量内部参考电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//参考电压设置为VDD
		ADCCTL2 =0x26;//采样FVR
		break;
	case 3://以VDD为参考电压测量温度传感器的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x54;//参考电压设置为VDD
		ADCCTL2 =0x27;//采样内置温度传感器
		break;
	case 4://以FVR为参考电压测量AD5的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//参考电压设置为FVR
		ADCCTL2 =0x05;//采样AD5通道
		break;
	case 5://以VDD为参考电压,测量OPOUT的电压
		ADCCTL0 =0x81;
		ADCCTL1 =0x5C;//参考电压设置为FVR
		ADCCTL2 =0x24;//采样OPOUT
		break;
	}
}
/************************
 * 函数名     ：BAT_StateGet
 * 函数功能：电源电压采集
 * 入口参数：无
 * 返回          ：无
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
