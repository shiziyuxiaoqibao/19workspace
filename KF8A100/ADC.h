/*
 * ADC.h
 *
 *  Created on: 2019-8-28
 *      Author: charles_cai
 */

#ifndef ADC_H_
#define ADC_H_

unsigned int Adc_fun(void);
unsigned int Adc_read(void);
void Init_ADC(unsigned  mode);
void Init_ADC2(unsigned mode);
//void BAT_StateGet(void);
void delay_5us(unsigned int time);


#endif /* ADC_H_ */
