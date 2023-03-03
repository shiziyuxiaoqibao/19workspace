#ifndef TIMER_H_
#define TIMER_H_

//OPTR预分频器作用选择位							-------OPTR
#define		OPTR_Prescale_SEL_T0			0x00
#define		OPTR_Prescale_SEL_WDT			0x08
//OPTR时钟预分频比选择
#define		OPTR_Prescale_DIV_2				0x00
#define		OPTR_Prescale_DIV_4				0x01
#define		OPTR_Prescale_DIV_8				0x02
#define		OPTR_Prescale_DIV_16			0x03
#define		OPTR_Prescale_DIV_32			0x04
#define		OPTR_Prescale_DIV_64			0x05
#define		OPTR_Prescale_DIV_128			0x06
#define		OPTR_Prescale_DIV_256			0x07
//T0时钟源选择									-------T0CTL
#define		T0CLK_SEL_SCLK					0x00
#define		T0CLK_SEL_HFCLK					0x01
#define		T0CLK_SEL_LFCLK					0x10



//T1时钟源选择									-------T1CTL2
#define		T1CLK_SEL_SCLK					0x00
#define		T1CLK_SEL_HFCLK					0x01
#define		T1CLK_SEL_LFCLK					0x10
//T1时钟预分频比选择
#define		T1CLK_Prescale_DIV_1			0x00
#define		T1CLK_Prescale_DIV_2			0x04
#define		T1CLK_Prescale_DIV_4			0x08
#define		T1CLK_Prescale_DIV_8			0x0C



//T2时钟分频器1比选择							-------T2CTL0
#define		T2CLK_Prescale1_DIV_1			0x00
#define		T2CLK_Prescale1_DIV_4			0x01
#define		T2CLK_Prescale1_DIV_16			0x02
//T2时钟分频器2比选择
#define		T2CLK_Prescale2_DIV_1			0x00
#define		T2CLK_Prescale2_DIV_2			0x08
#define		T2CLK_Prescale2_DIV_3			0x10
#define		T2CLK_Prescale2_DIV_4			0x18
#define		T2CLK_Prescale2_DIV_5			0x20
#define		T2CLK_Prescale2_DIV_6			0x28
#define		T2CLK_Prescale2_DIV_7			0x30
#define		T2CLK_Prescale2_DIV_8			0x38
#define		T2CLK_Prescale2_DIV_9			0x40
#define		T2CLK_Prescale2_DIV_10			0x48
#define		T2CLK_Prescale2_DIV_11			0x50
#define		T2CLK_Prescale2_DIV_12			0x58
#define		T2CLK_Prescale2_DIV_13			0x60
#define		T2CLK_Prescale2_DIV_14			0x68
#define		T2CLK_Prescale2_DIV_15			0x70
#define		T2CLK_Prescale2_DIV_16			0x78
//T2计数溢出方向									-------T2CTL1
#define		TIMER2_UP_UPOverflow			0x00
#define		TIMER2_UPDOWN_UPOverflow		0x40
#define		TIMER2_UPDOWN_DOWNOverflow		0x80
#define		TIMER2_UPDOWN_UPDOWNOverflow	0xC0
//T2时钟源选择
#define		T2CLK_SEL_EXTCLK				0x00
#define		T2CLK_SEL_SCLK					0x02
#define		T2CLK_SEL_HFCLK					0x04
#define		T2CLK_SEL_LFCLK					0x06



//T3重载使能										-------T3CTL
#define		TIMER3_Reload_enable			0x80
#define		TIMER3_Reload_disable			0x00
//T3时钟源选择
#define		T3CLK_SEL_SCLK					0x00
#define		T3CLK_SEL_HFCLK					0x02
#define		T3CLK_SEL_LFCLK					0x04
//T3时钟预分频比选择
#define		T3CLK_Prescale_DIV_1			0x00
#define		T3CLK_Prescale_DIV_2			0x10
#define		T3CLK_Prescale_DIV_4			0x20
#define		T3CLK_Prescale_DIV_8			0x30



//T5时钟分频器1比选择							-------T5CTL0
#define		T5CLK_Prescale1_DIV_1			0x00
#define		T5CLK_Prescale1_DIV_4			0x01
#define		T5CLK_Prescale1_DIV_16			0x02
//T5时钟分频器2比选择
#define		T5CLK_Prescale2_DIV_1			0x00
#define		T5CLK_Prescale2_DIV_2			0x08
#define		T5CLK_Prescale2_DIV_3			0x10
#define		T5CLK_Prescale2_DIV_4			0x18
#define		T5CLK_Prescale2_DIV_5			0x20
#define		T5CLK_Prescale2_DIV_6			0x28
#define		T5CLK_Prescale2_DIV_7			0x30
#define		T5CLK_Prescale2_DIV_8			0x38
#define		T5CLK_Prescale2_DIV_9			0x40
#define		T5CLK_Prescale2_DIV_10			0x48
#define		T5CLK_Prescale2_DIV_11			0x50
#define		T5CLK_Prescale2_DIV_12			0x58
#define		T5CLK_Prescale2_DIV_13			0x60
#define		T5CLK_Prescale2_DIV_14			0x68
#define		T5CLK_Prescale2_DIV_15			0x70
#define		T5CLK_Prescale2_DIV_16			0x78
//T5计数溢出方向									-------T5CTL1
#define		TIMER5_UP_UPOverflow			0x00
#define		TIMER5_UPDOWN_UPOverflow		0x40
#define		TIMER5_UPDOWN_DOWNOverflow		0x80
#define		TIMER5_UPDOWN_UPDOWNOverflow	0xC0
//T5时钟源选择
#define		T5CLK_SEL_EXTCLK				0x00
#define		T5CLK_SEL_SCLK					0x02
#define		T5CLK_SEL_HFCLK					0x04
#define		T5CLK_SEL_LFCLK					0x06



//T8时钟分频器1比选择							-------T8CTL
#define		T8CLK_Prescale1_DIV_1			0x00
#define		T8CLK_Prescale1_DIV_4			0x01
#define		T8CLK_Prescale1_DIV_16			0x02
//T8时钟分频器2比选择
#define		T8CLK_Prescale2_DIV_1			0x00
#define		T8CLK_Prescale2_DIV_2			0x08
#define		T8CLK_Prescale2_DIV_3			0x10
#define		T8CLK_Prescale2_DIV_4			0x18
#define		T8CLK_Prescale2_DIV_5			0x20
#define		T8CLK_Prescale2_DIV_6			0x28
#define		T8CLK_Prescale2_DIV_7			0x30
#define		T8CLK_Prescale2_DIV_8			0x38
#define		T8CLK_Prescale2_DIV_9			0x40
#define		T8CLK_Prescale2_DIV_10			0x48
#define		T8CLK_Prescale2_DIV_11			0x50
#define		T8CLK_Prescale2_DIV_12			0x58
#define		T8CLK_Prescale2_DIV_13			0x60
#define		T8CLK_Prescale2_DIV_14			0x68
#define		T8CLK_Prescale2_DIV_15			0x70
#define		T8CLK_Prescale2_DIV_16			0x78
//T8时钟源选择								-------T8CTL1
#define		T8CLK_CLOSE						0x00
#define		T8CLK_SEL_SCLK					0x01
#define		T8CLK_SEL_HFCLK					0x02
#define		T8CLK_SEL_LFCLK					0x03



//T10时钟分频器1比选择							-------T10CTL0
#define		T10CLK_Prescale1_DIV_1			0x00
#define		T10CLK_Prescale1_DIV_4			0x01
#define		T10CLK_Prescale1_DIV_16			0x02
//T10时钟分频器2比选择
#define		T10CLK_Prescale2_DIV_1			0x00
#define		T10CLK_Prescale2_DIV_2			0x10
#define		T10CLK_Prescale2_DIV_3			0x20
#define		T10CLK_Prescale2_DIV_4			0x30
#define		T10CLK_Prescale2_DIV_5			0x40
#define		T10CLK_Prescale2_DIV_6			0x50
#define		T10CLK_Prescale2_DIV_7			0x60
#define		T10CLK_Prescale2_DIV_8			0x70
#define		T10CLK_Prescale2_DIV_9			0x80
#define		T10CLK_Prescale2_DIV_10			0x90
#define		T10CLK_Prescale2_DIV_11			0xA0
#define		T10CLK_Prescale2_DIV_12			0xB0
#define		T10CLK_Prescale2_DIV_13			0xC0
#define		T10CLK_Prescale2_DIV_14			0xD0
#define		T10CLK_Prescale2_DIV_15			0xE0
#define		T10CLK_Prescale2_DIV_16			0xF0
//T10时钟源选择
#define		T10CLK_CLOSE					0x00
#define		T10CLK_SEL_SCLK					0x04
#define		T10CLK_SEL_HFCLK				0x08
#define		T10CLK_SEL_LFCLK				0x0C
//T10计数溢出方向									-------T10CTL1
#define		TIMER10_UP_UPOverflow			0x00
#define		TIMER10_UPDOWN_UPOverflow		0x40
#define		TIMER10_UPDOWN_DOWNOverflow		0x80
#define		TIMER10_UPDOWN_UPDOWNOverflow	0xC0



void Timer1_Init(void);
#endif /* TIMER_H_ */
