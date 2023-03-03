;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../BSP_can.c"
	.radix dec
	.include "KF8A100GQP.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	.extern	_delay_ms
	.extern	_PORT_Init
	.extern	_SYS_Clock_Init
	.extern	_Timer1_Init
	.extern	_UART2_Init
	.extern	_UART2_SendOneByte
	.extern	_UART2_SendBuf
	.extern	_Adc_fun
	.extern	_Adc_read
	.extern	_Init_ADC
	.extern	_Init_ADC2
	.extern	_delay_5us
	.extern	_currentkey
	.extern	_currentkeyleft
	.extern	_keyl_detection
	.extern	_keyr_detection
	.extern	_KeyToCanvalue
	.extern	_KeyToCanvalue1
	.extern	_Main_CleanTimeSet
	.extern	_Main_DataClean
	.extern	_STKR0
	.extern	_STK00
	.extern	_STK01
	.extern	_STK02
	.extern	_STK03
	.extern	_STK04
	.extern	_STK05
	.extern	_STK06
	.extern	_STK07
	.extern	_STK08
	.extern	_STK09
	.extern	_STK10
	.extern	_STK11
	.extern	_PSW_bits
	.extern	_P0_bits
	.extern	_P2_bits
	.extern	_P1_bits
	.extern	_P3_bits
	.extern	_P4_bits
	.extern	_INTCTL_bits
	.extern	_EIF1_bits
	.extern	_EIF2_bits
	.extern	_T1CTL_bits
	.extern	_T2CTL0_bits
	.extern	_PWMCTL_bits
	.extern	_BANK_bits
	.extern	_CMCTL0_bits
	.extern	_C1CTL_bits
	.extern	_COUT_bits
	.extern	_ADCCTL0_bits
	.extern	_OPTR_bits
	.extern	_IP0_bits
	.extern	_IP1_bits
	.extern	_IP2_bits
	.extern	_TR0_bits
	.extern	_TR2_bits
	.extern	_TR1_bits
	.extern	_TR3_bits
	.extern	_TR4_bits
	.extern	_VRECTL_bits
	.extern	_EIE1_bits
	.extern	_EIE2_bits
	.extern	_PCTL_bits
	.extern	_C2CTL_bits
	.extern	_PUR0_bits
	.extern	_IOCL0_bits
	.extern	_ADCCTL1_bits
	.extern	_WDTPS_bits
	.extern	_P0LR_bits
	.extern	_P2LR_bits
	.extern	_P1LR_bits
	.extern	_P3LR_bits
	.extern	_P4LR_bits
	.extern	_ANS0_bits
	.extern	_ANS1_bits
	.extern	_ANS2_bits
	.extern	_ANS3_bits
	.extern	_ANS4_bits
	.extern	_T0CTL_bits
	.extern	_ADCCTL2_bits
	.extern	_T2CTL1_bits
	.extern	_BKPCTL_bits
	.extern	_SCLKSTU_bits
	.extern	_PWM6CTL0_bits
	.extern	_P6ATRCTL_bits
	.extern	_PWM6CTL2_bits
	.extern	_PWM6PC_bits
	.extern	_CCTCTL_bits
	.extern	_SCLKCTL_bits
	.extern	_HFCKCTL_bits
	.extern	_LFCKCTL_bits
	.extern	_P5_bits
	.extern	_P6_bits
	.extern	_P7_bits
	.extern	_P9_bits
	.extern	_IP5_bits
	.extern	_EIF4_bits
	.extern	_EIE4_bits
	.extern	_EIF5_bits
	.extern	_EIE5_bits
	.extern	_T4CTL0_bits
	.extern	_WCFR_bits
	.extern	_WCNT_bits
	.extern	_WCTL_bits
	.extern	_T1CTL2_bits
	.extern	_T3CTL_bits
	.extern	_UPINSET2_bits
	.extern	_IP4_bits
	.extern	_TR5_bits
	.extern	_TR6_bits
	.extern	_TR7_bits
	.extern	_TR9_bits
	.extern	_T7CTL_bits
	.extern	_VRES0_bits
	.extern	_SSCI1CTL1_bits
	.extern	_SSCI1STA_bits
	.extern	_SSCI1CTL0_bits
	.extern	_SSCI1ADD_bits
	.extern	_SSCI1MSK_bits
	.extern	_SSCI1CTL2_bits
	.extern	_DIVCTL_bits
	.extern	_P5LR_bits
	.extern	_P6LR_bits
	.extern	_P7LR_bits
	.extern	_P9LR_bits
	.extern	_ANS5_bits
	.extern	_ANS6_bits
	.extern	_ANS7_bits
	.extern	_ANS8_bits
	.extern	_ANS9_bits
	.extern	_VRES1_bits
	.extern	_T4CTL1_bits
	.extern	_UADMATCH2_bits
	.extern	_U7816TXCTL2_bits
	.extern	_EGTCTL2_bits
	.extern	_CLKDIV2_bits
	.extern	_U7816CTL2_bits
	.extern	_U7816RXCTL2_bits
	.extern	_RSCTL2_bits
	.extern	_BRCTL2_bits
	.extern	_TSCTL2_bits
	.extern	_SSCI2STA_bits
	.extern	_SSCI2CTL0_bits
	.extern	_SSCI2ADD_bits
	.extern	_SSCI2MSK_bits
	.extern	_SSCI2CTL2_bits
	.extern	_RSCTL3_bits
	.extern	_BRCTL3_bits
	.extern	_CCP3CTL_bits
	.extern	_CCP7CTL_bits
	.extern	_TSCTL3_bits
	.extern	_EIF3_bits
	.extern	_EIE3_bits
	.extern	_UADMATCH3_bits
	.extern	_SLEPEN3_bits
	.extern	_UPINSET3_bits
	.extern	_SSCI2CTL1_bits
	.extern	_IP3_bits
	.extern	_FILT1CTL_bits
	.extern	_FILT1PER_bits
	.extern	_FILT2CTL_bits
	.extern	_FILT2PER_bits
	.extern	_FILT3CTL_bits
	.extern	_FILT3PER_bits
	.extern	_FILT4CTL_bits
	.extern	_FILT4PER_bits
	.extern	_C3CTL_bits
	.extern	_C4CTL_bits
	.extern	_PUR9_bits
	.extern	_PUR1_bits
	.extern	_PUR2_bits
	.extern	_PUR3_bits
	.extern	_PUR4_bits
	.extern	_PUR5_bits
	.extern	_PUR6_bits
	.extern	_PUR7_bits
	.extern	_MULCTL_bits
	.extern	_UPINSET1_bits
	.extern	_USLPEN1_bits
	.extern	_ADCINTCTL_bits
	.extern	_ADSCANCTL_bits
	.extern	_EIE7_bits
	.extern	_EIF7_bits
	.extern	_IP7_bits
	.extern	_HLVDCTL_bits
	.extern	_RTCSRT_bits
	.extern	_RTCSTU_bits
	.extern	_RTCALRS_bits
	.extern	_RTCALRM_bits
	.extern	_RTCALRH_bits
	.extern	_RTCALRW_bits
	.extern	_RTCTTR_bits
	.extern	_RTCFCR_bits
	.extern	_RTCSEC_bits
	.extern	_RTCMIN_bits
	.extern	_RTCHOUR_bits
	.extern	_RTCWEK_bits
	.extern	_RTCDAY_bits
	.extern	_RTCMTH_bits
	.extern	_RTCYEAR_bits
	.extern	_RTCTMRCTL_bits
	.extern	_RTCTMREN_bits
	.extern	_POWCTL_bits
	.extern	_PCAL_bits
	.extern	_BWDTCTL_bits
	.extern	_PHCLR_bits
	.extern	_LPRCCTL_bits
	.extern	_BBODCTL_bits
	.extern	_IOCAF_bits
	.extern	_IOCBF_bits
	.extern	_IOCCF_bits
	.extern	_IOCAPOS_bits
	.extern	_IOCBPOS_bits
	.extern	_IOCCPOS_bits
	.extern	_IOCANEG_bits
	.extern	_IOCBNEG_bits
	.extern	_IOCCNEG_bits
	.extern	_IOCMOD_bits
	.extern	_SRCTL0_bits
	.extern	_SRCTL1_bits
	.extern	_T8CTL1_bits
	.extern	_T9CTL1_bits
	.extern	_PA_bits
	.extern	_PALR_bits
	.extern	_TRA_bits
	.extern	_PURA_bits
	.extern	_ANSA_bits
	.extern	_PB_bits
	.extern	_PBLR_bits
	.extern	_TRB_bits
	.extern	_PURB_bits
	.extern	_ANSB_bits
	.extern	_RSCTL4_bits
	.extern	_BRCTL4_bits
	.extern	_TSCTL4_bits
	.extern	_UADMATCH4_bits
	.extern	_SLPEN4_bits
	.extern	_UPINSET4_bits
	.extern	_P3ASCTL_bits
	.extern	_P3ATRCTL_bits
	.extern	_PWM3CTL0_bits
	.extern	_PWM3CTL1_bits
	.extern	_T8CTL_bits
	.extern	_P4ASCTL_bits
	.extern	_P4ATRCTL_bits
	.extern	_PWM4CTL0_bits
	.extern	_PWM4CTL1_bits
	.extern	_T9CTL_bits
	.extern	_APFCTL2_bits
	.extern	_APFCTL3_bits
	.extern	_APFCTL4_bits
	.extern	_APFCTL5_bits
	.extern	_APFCTL6_bits
	.extern	_APFCTL7_bits
	.extern	_APFCTL8_bits
	.extern	_APFCTL9_bits
	.extern	_APFCTL10_bits
	.extern	_APFCTL11_bits
	.extern	_APFCTL12_bits
	.extern	_ADCOFFSET_bits
	.extern	_P7ATRCTL_bits
	.extern	_PWM7CTL0_bits
	.extern	_PWM7CTL2_bits
	.extern	_T5CTL1_bits
	.extern	_PLLCTL_bits
	.extern	_CANIE_bits
	.extern	_CANIF_bits
	.extern	_CANP_bits
	.extern	_EIE6_bits
	.extern	_EIF6_bits
	.extern	_IP6_bits
	.extern	_CANTXINF_bits
	.extern	_CANTXID0_bits
	.extern	_CANTXID1_bits
	.extern	_CANTXID2_bits
	.extern	_CANTXID3_bits
	.extern	_CANMOD_bits
	.extern	_CANCMR_bits
	.extern	_CANSTA_bits
	.extern	_CANBTR_bits
	.extern	_CANSEG_bits
	.extern	_CANALC_bits
	.extern	_CANECC_bits
	.extern	_CANEWL_bits
	.extern	_CANRXE_bits
	.extern	_CANTXE_bits
	.extern	_CANRMC_bits
	.extern	_CANACR0_bits
	.extern	_CANACR1_bits
	.extern	_CANACR2_bits
	.extern	_CANACR3_bits
	.extern	_CANMSK0_bits
	.extern	_CANMSK1_bits
	.extern	_CANMSK2_bits
	.extern	_CANMSK3_bits
	.extern	_T5CTL0_bits
	.extern	_T6CTL1_bits
	.extern	_T6CTL0_bits
	.extern	_PWM7PC_bits
	.extern	_PWM5OC_bits
	.extern	_PWM5PC_bits
	.extern	_T10CTL1_bits
	.extern	_T10CTL0_bits
	.extern	_EIF8_bits
	.extern	_EIE8_bits
	.extern	_IP8_bits
	.extern	_ADCCTL3_bits
	.extern	_P5ASCTL0_bits
	.extern	_P5ASCTL1_bits
	.extern	_P5STRCTL0_bits
	.extern	_P5STRCTL1_bits
	.extern	_PWM5CTL0_bits
	.extern	_PWM5CTL1_bits
	.extern	_PWM5CTL2_bits
	.extern	_PWM5FC_bits
	.extern	_UART2_BUF
	.extern	_CAN_Rev_DATA
	.extern	_can_data_hand
	.extern	_CAN_Rev_BUF
	.extern	_IDLR
	.extern	_T0
	.extern	_PCL
	.extern	_PSW
	.extern	_IR
	.extern	_P0
	.extern	_P2
	.extern	_P1
	.extern	_P3
	.extern	_P4
	.extern	_PCH
	.extern	_INTCTL
	.extern	_EIF1
	.extern	_EIF2
	.extern	_T1L
	.extern	_T1H
	.extern	_T1CTL
	.extern	_T2L
	.extern	_T2CTL0
	.extern	_PWM1L
	.extern	_PWMCTL
	.extern	_PP1
	.extern	_BANK
	.extern	_CMCTL0
	.extern	_C1CTL
	.extern	_COUT
	.extern	_ADCDATA0H
	.extern	_ADCCTL0
	.extern	_OPTR
	.extern	_IP0
	.extern	_IP1
	.extern	_IP2
	.extern	_TR0
	.extern	_TR2
	.extern	_TR1
	.extern	_TR3
	.extern	_TR4
	.extern	_VRECTL
	.extern	_EIE1
	.extern	_EIE2
	.extern	_PCTL
	.extern	_OSCCAL2
	.extern	_C2CTL
	.extern	_PP2
	.extern	_PWM2L
	.extern	_PUR0
	.extern	_IOCL0
	.extern	_OSCCAL1
	.extern	_NVMDATAH
	.extern	_NVMDATAL
	.extern	_NVMADDRH
	.extern	_NVMADDRL
	.extern	_NVMCTL0
	.extern	_NVMCTL1
	.extern	_ADCDATA0L
	.extern	_ADCCTL1
	.extern	_WDTPS
	.extern	_T2H
	.extern	_PP60H
	.extern	_PWM6L0
	.extern	_PWM6H0
	.extern	_P0LR
	.extern	_P2LR
	.extern	_P1LR
	.extern	_P3LR
	.extern	_P4LR
	.extern	_ANS0
	.extern	_ANS1
	.extern	_ANS2
	.extern	_ANS3
	.extern	_ANS4
	.extern	_T0CTL
	.extern	_ADCCTL2
	.extern	_T2CTL1
	.extern	_PP60L
	.extern	_BKPCTL
	.extern	_SCLKSTU
	.extern	_PWM6H1
	.extern	_PWM6L1
	.extern	_PWM6CTL0
	.extern	_P6ATRCTL
	.extern	_PWM6CTL2
	.extern	_PWM6PC
	.extern	_PWM6H2
	.extern	_PWM6L2
	.extern	_PWM6H3
	.extern	_PWM6L3
	.extern	_CCTCTL
	.extern	_SCLKCTL
	.extern	_HFCKCTL
	.extern	_LFCKCTL
	.extern	_P5
	.extern	_P6
	.extern	_P7
	.extern	_P9
	.extern	_IP5
	.extern	_EIF4
	.extern	_EIE4
	.extern	_EIF5
	.extern	_EIE5
	.extern	_T4L
	.extern	_T4CTL0
	.extern	_WCFR
	.extern	_WCNT
	.extern	_WCTL
	.extern	_T3REH
	.extern	_T1CTL2
	.extern	_T3CTL
	.extern	_T3H
	.extern	_T3REL
	.extern	_T3L
	.extern	_UPINSET2
	.extern	_IP4
	.extern	_TR5
	.extern	_TR6
	.extern	_TR7
	.extern	_TR9
	.extern	_T7CTL
	.extern	_T7L
	.extern	_T7H
	.extern	_T7REL
	.extern	_T7REH
	.extern	_VRES0
	.extern	_DIVRH
	.extern	_OSCCAL0
	.extern	_OSCCAL3
	.extern	_SSCI1CTL1
	.extern	_SSCI1STA
	.extern	_SSCI1CTL0
	.extern	_SSCI1BUFR
	.extern	_SSCI1ADD
	.extern	_SSCI1MSK
	.extern	_SSCI1CTL2
	.extern	_DIVBH
	.extern	_DIVCTL
	.extern	_DIVAH
	.extern	_DIVAL
	.extern	_DIVBL
	.extern	_DIVQH
	.extern	_DIVQL
	.extern	_DIVRL
	.extern	_T4H
	.extern	_PP61H
	.extern	_P5LR
	.extern	_P6LR
	.extern	_P7LR
	.extern	_P9LR
	.extern	_ANS5
	.extern	_ANS6
	.extern	_ANS7
	.extern	_ANS8
	.extern	_ANS9
	.extern	_VRES1
	.extern	_T4CTL1
	.extern	_PP61L
	.extern	_T2CCR0L
	.extern	_T2CCR0H
	.extern	_T2CCR1L
	.extern	_T2CCR1H
	.extern	_T4CCR0L
	.extern	_EUBRGH2
	.extern	_T4CCR0H
	.extern	_UADMATCH2
	.extern	_U7816TXCTL2
	.extern	_EGTCTL2
	.extern	_CLKDIV2
	.extern	_U7816CTL2
	.extern	_U7816RXCTL2
	.extern	_RSCTL2
	.extern	_TXSDR2
	.extern	_RXSDR2
	.extern	_BRCTL2
	.extern	_TSCTL2
	.extern	_EUBRGL2
	.extern	_SSCI2STA
	.extern	_SSCI2CTL0
	.extern	_SSCI2BUFR
	.extern	_SSCI2ADD
	.extern	_SSCI2MSK
	.extern	_SSCI2CTL2
	.extern	_RSCTL3
	.extern	_TXSDR3
	.extern	_RXSDR3
	.extern	_BRCTL3
	.extern	_CCP3CTL
	.extern	_CCP3H
	.extern	_CCP3L
	.extern	_CCP7CTL
	.extern	_CCP7H
	.extern	_CCP7L
	.extern	_TSCTL3
	.extern	_EUBRGL3
	.extern	_EUBRGH3
	.extern	_EIF3
	.extern	_EIE3
	.extern	_UADMATCH3
	.extern	_SLEPEN3
	.extern	_UPINSET3
	.extern	_SSCI2CTL1
	.extern	_IP3
	.extern	_FILT1CTL
	.extern	_FILT1PER
	.extern	_FILT2CTL
	.extern	_FILT2PER
	.extern	_FILT3CTL
	.extern	_FILT3PER
	.extern	_FILT4CTL
	.extern	_FILT4PER
	.extern	_C3CTL
	.extern	_C4CTL
	.extern	_VRECAL2
	.extern	_VRECAL3
	.extern	_PUR9
	.extern	_PUR1
	.extern	_PUR2
	.extern	_PUR3
	.extern	_PUR4
	.extern	_PUR5
	.extern	_PUR6
	.extern	_PUR7
	.extern	_MULAL
	.extern	_MULBH
	.extern	_MULRES3
	.extern	_MULRES2
	.extern	_MULRES1
	.extern	_MULRES0
	.extern	_MULBL
	.extern	_MULCTL
	.extern	_MULAH
	.extern	_ADCDATA1L
	.extern	_ADCDATA1H
	.extern	_ADCDATA2L
	.extern	_ADCDATA2H
	.extern	_ADCDATA3L
	.extern	_ADCDATA3H
	.extern	_UPINSET1
	.extern	_USLPEN1
	.extern	_EUBRGH1
	.extern	_ADCINTCTL
	.extern	_ADSCANCTL
	.extern	_EIE7
	.extern	_EIF7
	.extern	_IP7
	.extern	_HLVDCTL
	.extern	_RTCSRT
	.extern	_RTCSTU
	.extern	_RTCALRS
	.extern	_RTCALRM
	.extern	_RTCALRH
	.extern	_RTCALRW
	.extern	_RTCTTR
	.extern	_RTCFCR
	.extern	_RTCSEC
	.extern	_RTCMIN
	.extern	_RTCHOUR
	.extern	_RTCWEK
	.extern	_RTCDAY
	.extern	_RTCMTH
	.extern	_RTCYEAR
	.extern	_RTCTMRCTL
	.extern	_RTCTMREN
	.extern	_RTCTMR1
	.extern	_RTCTMR0
	.extern	_POWCTL
	.extern	_PCAL
	.extern	_XTALCAL
	.extern	_BWDTCTL
	.extern	_PHCLR
	.extern	_LPRCCAL
	.extern	_LPRCCTL
	.extern	_BBODCTL
	.extern	_IOCAF
	.extern	_IOCBF
	.extern	_IOCCF
	.extern	_IOCAPOS
	.extern	_IOCBPOS
	.extern	_IOCCPOS
	.extern	_IOCANEG
	.extern	_IOCBNEG
	.extern	_IOCCNEG
	.extern	_IOCMOD
	.extern	_SRCTL0
	.extern	_SRCTL1
	.extern	_T8CTL1
	.extern	_T9CTL1
	.extern	_PA
	.extern	_PALR
	.extern	_TRA
	.extern	_PURA
	.extern	_ANSA
	.extern	_PB
	.extern	_PBLR
	.extern	_TRB
	.extern	_PURB
	.extern	_ANSB
	.extern	_RSCTL4
	.extern	_TXSDR4
	.extern	_RXSDR4
	.extern	_BRCTL4
	.extern	_TSCTL4
	.extern	_EUBRGL4
	.extern	_EUBRGH4
	.extern	_UADMATCH4
	.extern	_SLPEN4
	.extern	_UPINSET4
	.extern	_P3ASCTL
	.extern	_P3ATRCTL
	.extern	_PP3H
	.extern	_PP3L
	.extern	_PWM3CTL0
	.extern	_PWM3CTL1
	.extern	_PWM3H0
	.extern	_PWM3H1
	.extern	_PWM3L0
	.extern	_PWM3L1
	.extern	_T8CCRH
	.extern	_T8CCRL
	.extern	_T8CTL
	.extern	_T8H
	.extern	_T8L
	.extern	_P4ASCTL
	.extern	_P4ATRCTL
	.extern	_PP4H
	.extern	_PP4L
	.extern	_PWM4CTL0
	.extern	_PWM4CTL1
	.extern	_PWM4H0
	.extern	_PWM4H1
	.extern	_PWM4L0
	.extern	_PWM4L1
	.extern	_T9CCRH
	.extern	_T9CCRL
	.extern	_T9CTL
	.extern	_T9H
	.extern	_T9L
	.extern	_APFCTL2
	.extern	_APFCTL3
	.extern	_APFCTL4
	.extern	_APFCTL5
	.extern	_APFCTL6
	.extern	_APFCTL7
	.extern	_APFCTL8
	.extern	_APFCTL9
	.extern	_APFCTL10
	.extern	_APFCTL11
	.extern	_APFCTL12
	.extern	_ADCOFFSET
	.extern	_P7ATRCTL
	.extern	_PP70H
	.extern	_PP70L
	.extern	_PP71H
	.extern	_PP71L
	.extern	_PWM7CTL0
	.extern	_PWM7CTL2
	.extern	_T5CTL1
	.extern	_PLLCTL
	.extern	_CANIE
	.extern	_CANIF
	.extern	_CANP
	.extern	_EIE6
	.extern	_EIF6
	.extern	_IP6
	.extern	_CANTXINF
	.extern	_CANTXID0
	.extern	_CANTXID1
	.extern	_CANTXID2
	.extern	_CANTXID3
	.extern	_CANTXDT0
	.extern	_CANTXDT1
	.extern	_CANTXDT2
	.extern	_CANTXDT3
	.extern	_CANTXDT4
	.extern	_CANTXDT5
	.extern	_CANTXDT6
	.extern	_CANTXDT7
	.extern	_CANMOD
	.extern	_CANCMR
	.extern	_CANSTA
	.extern	_CANBTR
	.extern	_CANSEG
	.extern	_CANALC
	.extern	_CANECC
	.extern	_CANEWL
	.extern	_CANRXE
	.extern	_CANTXE
	.extern	_CANRMC
	.extern	_CANACR0
	.extern	_CANACR1
	.extern	_CANACR2
	.extern	_CANACR3
	.extern	_CANMSK0
	.extern	_CANMSK1
	.extern	_CANMSK2
	.extern	_CANMSK3
	.extern	_T5CTL0
	.extern	_T5H
	.extern	_T5L
	.extern	_T6CTL1
	.extern	_T6CTL0
	.extern	_T6H
	.extern	_T6L
	.extern	_PWM7L0
	.extern	_PWM7H0
	.extern	_PWM7L1
	.extern	_PWM7H1
	.extern	_PWM7L2
	.extern	_PWM7H2
	.extern	_T5CCR0H
	.extern	_T5CCR0L
	.extern	_T5CCR1H
	.extern	_T5CCR1L
	.extern	_T6CCR0H
	.extern	_T6CCR0L
	.extern	_PWM7L3
	.extern	_PWM7H3
	.extern	_PWM7PC
	.extern	_PWM5H2
	.extern	_PWM5H3
	.extern	_PWM5L0
	.extern	_PWM5L1
	.extern	_PWM5L2
	.extern	_PWM5L3
	.extern	_PWM5OC
	.extern	_PWM5PC
	.extern	_T10CTL1
	.extern	_T10CCR0H
	.extern	_T10CCR0L
	.extern	_T10CCR1H
	.extern	_T10CCR1L
	.extern	_T10CTL0
	.extern	_T10H
	.extern	_T10L
	.extern	_EIF8
	.extern	_EIE8
	.extern	_IP8
	.extern	_ADCCTL3
	.extern	_P5ASCTL0
	.extern	_P5ASCTL1
	.extern	_P5STRCTL0
	.extern	_P5STRCTL1
	.extern	_PP5H
	.extern	_PP5L
	.extern	_PWM5CTL0
	.extern	_PWM5CTL1
	.extern	_PWM5CTL2
	.extern	_PWM5FC
	.extern	_PWM5H0
	.extern	_PWM5H1
	.extern	__gptrget1
	.extern	__hmulint

	.extern I0R1
	.extern I0R7
	.extern I0PSW
	.extern I0PCH
	.extern I1R1
	.extern I1R7
	.extern I1PSW
	.extern I1PCH
	.extern TRAPRx73
	.extern TRAPRx74
	.extern TRAPRx75
	.extern TRAPRx76
	.extern STK11
	.extern STK10
	.extern STK09
	.extern STK08
	.extern STK07
	.extern STK06
	.extern STK05
	.extern STK04
	.extern STK03
	.extern STK02
	.extern STK01
	.extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	.global	_CAN_UnsetITStatus
	.global	_CAN_SetITStatus
	.global	_CAN_ClearITStatus
	.global	_CAN_GetITStatus
	.global	_CAN_Receive_Message_Configuration
	.global	_CAN_Transmit_Message
	.global	_CAN_Init
	.global	_CAN_IDFilterConfig
	.define _STK11	STK11
	.define _STK10	STK10
	.define _STK09	STK09
	.define _STK08	STK08
	.define _STK07	STK07
	.define _STK06	STK06
	.define _STK05	STK05
	.define _STK04	STK04
	.define _STK03	STK03
	.define _STK02	STK02
	.define _STK01	STK01
	.define _STK00	STK00

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_BSP_can_0	.udata
r0x103C	.res	1
UDL_BSP_can_1	.udata
r0x103D	.res	1
UDL_BSP_can_2	.udata
r0x1041	.res	1
UDL_BSP_can_3	.udata
r0x1040	.res	1
UDL_BSP_can_4	.udata
r0x103F	.res	1
UDL_BSP_can_5	.udata
r0x103E	.res	1
UDL_BSP_can_6	.udata
r0x1045	.res	1
UDL_BSP_can_7	.udata
r0x1044	.res	1
UDL_BSP_can_8	.udata
r0x1043	.res	1
UDL_BSP_can_9	.udata
r0x1042	.res	1
UDL_BSP_can_10	.udata
r0x1046	.res	1
UDL_BSP_can_11	.udata
r0x1047	.res	1
UDL_BSP_can_12	.udata
r0x1048	.res	1
UDL_BSP_can_13	.udata
r0x1037	.res	1
UDL_BSP_can_14	.udata
r0x1038	.res	1
UDL_BSP_can_15	.udata
r0x1039	.res	1
UDL_BSP_can_16	.udata
r0x103A	.res	1
UDL_BSP_can_17	.udata
r0x103B	.res	1
UDL_BSP_can_18	.udata
r0x102E	.res	1
UDL_BSP_can_19	.udata
r0x102D	.res	1
UDL_BSP_can_20	.udata
r0x102C	.res	1
UDL_BSP_can_21	.udata
r0x102F	.res	1
UDL_BSP_can_22	.udata
r0x1030	.res	1
UDL_BSP_can_23	.udata
r0x1031	.res	1
UDL_BSP_can_24	.udata
r0x1032	.res	1
UDL_BSP_can_25	.udata
r0x1033	.res	1
UDL_BSP_can_26	.udata
r0x1034	.res	1
UDL_BSP_can_27	.udata
r0x1035	.res	1
UDL_BSP_can_28	.udata
r0x1036	.res	1
UDL_BSP_can_29	.udata
r0x1023	.res	1
UDL_BSP_can_30	.udata
r0x1022	.res	1
UDL_BSP_can_31	.udata
r0x1024	.res	1
UDL_BSP_can_32	.udata
r0x1025	.res	1
UDL_BSP_can_33	.udata
r0x1026	.res	1
UDL_BSP_can_34	.udata
r0x1027	.res	1
UDL_BSP_can_35	.udata
r0x1028	.res	1
UDL_BSP_can_36	.udata
r0x1021	.res	1
UDL_BSP_can_37	.udata
r0x1020	.res	1
UDL_BSP_can_38	.udata
r0x101E	.res	1
UDL_BSP_can_39	.udata
r0x101F	.res	1
UDL_BSP_can_40	.udata
r0x101D	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._CAN_UnsetITStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_UnsetITStatus	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x101D
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_UnsetITStatus	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	334; "../BSP_can.c"	void CAN_UnsetITStatus(unsigned char CAN_IT_bit)
	BANKSEL	r0x101D
	MOV	r0x101D, R0
;	::->op : ~
;	.line	336; "../BSP_can.c"	CANIE &= (~CAN_IT_bit);
	BANKSEL	r0x101D
	CPL	r0x101D
	BANKSEL	r0x101D
	MOVZ	R0, r0x101D
	BANKSEL	_CANIE
	AND	_CANIE, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _CAN_UnsetITStatus



func._CAN_SetITStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_SetITStatus	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x101E
;   r0x101F
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_SetITStatus	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	322; "../BSP_can.c"	void CAN_SetITStatus(unsigned char CAN_IT_bit)
	BANKSEL	r0x101E
	MOV	r0x101E, R0
;	::->op : ~
;	.line	324; "../BSP_can.c"	CANIF &= (~CAN_IT_bit);
	BANKSEL	r0x101E
	CPLR	r0x101E
	BANKSEL	r0x101F
	MOV	r0x101F, R0
;	::->op : BITWISEAND
	BANKSEL	r0x101F
	MOVZ	R0, r0x101F
	BANKSEL	_CANIF
	AND	_CANIF, R0
;	::->op : =
;	.line	325; "../BSP_can.c"	CANIE = CAN_IT_bit;
	BANKSEL	r0x101E
	MOVZ	R0, r0x101E
	BANKSEL	_CANIE
	MOV	_CANIE, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _CAN_SetITStatus



func._CAN_ClearITStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_ClearITStatus	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1020
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_ClearITStatus	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	311; "../BSP_can.c"	void CAN_ClearITStatus(unsigned char CAN_IT_bit)
	BANKSEL	r0x1020
	MOV	r0x1020, R0
;	::->op : ~
;	.line	313; "../BSP_can.c"	CANIF &= (~CAN_IT_bit);
	BANKSEL	r0x1020
	CPL	r0x1020
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	_CANIF
	AND	_CANIF, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _CAN_ClearITStatus



func._CAN_GetITStatus	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_GetITStatus	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1021
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_GetITStatus	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	297; "../BSP_can.c"	ITStatus CAN_GetITStatus(unsigned char CAN_IT_bit)
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : BITWISEAND
;	.line	299; "../BSP_can.c"	if(CANIF&CAN_IT_bit)
	BANKSEL	_CANIF
	MOVZ	R0, _CANIF
	BANKSEL	r0x1021
	AND	r0x1021, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1021
	ORL	R0, r0x1021
	JNB	PSW, 2
	JMP	_00146_DS_
;	::->op : RETURN
;	.line	300; "../BSP_can.c"	return SET_STATE;
	MOV	R0,# 0x01
	JMP	_00148_DS_
;	::->op : LABEL
;	::->op : RETURN
_00146_DS_
;	.line	302; "../BSP_can.c"	return RESET_STATE;
	MOV	R0,# 0x00
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00148_DS_
	CRET	
; exit point of _CAN_GetITStatus



func._CAN_Receive_Message_Configuration	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_Receive_Message_Configuration	;Function start
; 0 exit points
;functions called:
;   __hmulint
;   __gptrget1
;   __hmulint
;   __gptrget1
;13 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_Receive_Message_Configuration	;Function start
; 0 exit points
;	::->op : <
;unsigned compare: left < lit(0x8=8), size=1
;	.line	216; "../BSP_can.c"	if(can_data_hand<8)
	MOV	R0,# 0x08
	BANKSEL	_can_data_hand
	SUB	R0, _can_data_hand
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00086_DS_
;	::->op : *
;	.line	218; "../BSP_can.c"	can_point =(0x1C80 + can_data_hand * 0x10);
	MOV	R0,# 0x10
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	_can_data_hand
	MOVZ	R0, _can_data_hand
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	TRAPPC1	__hmulint
	TRAPPC2	__hmulint
	PAGESEL	__hmulint
	CALL	__hmulint
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	STK00
	MOV	R0, STK00
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : +
	MOV	R0,# 0x80
	BANKSEL	r0x1023
	ADD	r0x1023, R0
	MOV	R0,# 0x1c
	JNB	PSW, 0
	MOV	R0,# 0x1d
	BANKSEL	r0x1022
	ADD	r0x1022, R0
;	::->op : CAST
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	r0x1024
	MOV	r0x1024, R0
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	r0x1025
	MOV	r0x1025, R0
;	::->op : GOTO
	JMP	_00121_DS_
;	::->op : LABEL
;	::->op : CAST
_00086_DS_
;	.line	222; "../BSP_can.c"	can_point =(0x1D80+(can_data_hand-8)*0x10);
	BANKSEL	_can_data_hand
	MOVZ	R0, _can_data_hand
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1022
	CLR	r0x1022
;	::->op : -
	MOV	R0,# 0xf8
	BANKSEL	r0x1023
	ADD	r0x1023, R0
	JNB	PSW, 0
	JMP	_00157_DS_
	BANKSEL	r0x1022
	DEC	r0x1022
;	::->op : LEFT_OP
_00157_DS_
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	r0x1026
	MOV	r0x1026, R0
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	r0x1027
	MOV	r0x1027, R0
	MOV	R0,# 0x04
	INC	R0
	JMP	_00139_DS_
_00138_DS_
	CLR	PSW, 0
	BANKSEL	r0x1026
	RLC	r0x1026
	BANKSEL	r0x1027
	RLC	r0x1027
_00139_DS_
	DECJZ	R0
	JMP	_00138_DS_
;	::->op : +
	MOV	R0,# 0x80
	BANKSEL	r0x1026
	ADD	R0, r0x1026
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	MOV	R0,# 0x1d
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1027
	MOVZ	R0, r0x1027
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00158_DS_
	BANKSEL	r0x1022
	ADD	r0x1022, R0
;	::->op : CAST
_00158_DS_
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	r0x1024
	MOV	r0x1024, R0
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	r0x1025
	MOV	r0x1025, R0
;	::->op : LABEL
;	::->op : =
_00121_DS_
;	.line	225; "../BSP_can.c"	for(i=0;i<13;i++)
	BANKSEL	r0x1023
	CLR	r0x1023
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0xD=13), size=1
_00105_DS_
	MOV	R0,# 0x0d
	BANKSEL	r0x1023
	SUB	R0, r0x1023
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00108_DS_
;	::->op : +
;	.line	227; "../BSP_can.c"	CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
	BANKSEL	r0x1023
	MOV	R0, r0x1023
	ADD	R0,# (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : CAST
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	r0x1027
	MOV	r0x1027, R0
	BANKSEL	r0x1028
	CLR	r0x1028
;	::->op : +
	BANKSEL	r0x1024
	MOV	R0, r0x1024
	BANKSEL	r0x1027
	ADD	r0x1027, R0
	BANKSEL	r0x1025
	MOVZ	R0, r0x1025
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00159_DS_
	BANKSEL	r0x1028
	ADD	r0x1028, R0
;	::->op : CAST
;;104	MOVZ	R0, r0x1028
;;102	MOV	r0x1029, R0
;;101	MOVZ	R0, r0x1027
;;99	MOV	r0x102A, R0
;;1	CLR	r0x102B
;	::->op : GET_VALUE_AT_ADDRESS
;;100	MOVZ	R0, r0x102A
_00159_DS_
	BANKSEL	r0x1027
	MOVZ	R0, r0x1027
	BANKSEL	STK01
	MOV	STK01, R0
;;103	MOVZ	R0, r0x1029
	BANKSEL	r0x1028
	MOVZ	R0, r0x1028
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1027
	MOV	r0x1027, R0
;	::->op :*  =
	BANKSEL	r0x1027
	MOVZ	R0, r0x1027
	BANKSEL	r0x1022
	MOV	R1, r0x1022
	BANKSEL	_CAN_Rev_BUF
	ST	[R1], R0
;	::->op : +
;	.line	225; "../BSP_can.c"	for(i=0;i<13;i++)
	BANKSEL	r0x1023
	INC	r0x1023
;	::->op : GOTO
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00108_DS_
;	.line	230; "../BSP_can.c"	CAN_Rev_DATA.data_ide = CAN_Rev_BUF[0]>>7;
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : RIGHT_OP
	BANKSEL	r0x1023
	RLCR	r0x1023
	BANKSEL	r0x1022
	CLR	r0x1022
	BANKSEL	r0x1022
	RLC	r0x1022
;	::->op :*  =
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 0), R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	231; "../BSP_can.c"	CAN_Rev_DATA.data_rtr = (CAN_Rev_BUF[0]&0x40)>>6;
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x40
	BANKSEL	r0x1023
	AND	r0x1023, R0
;	::->op : RIGHT_OP
	BANKSEL	r0x1023
	SWAPR	R0, r0x1023
	AND	R0,# 0x0f
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	CLR	PSW, 0
	BANKSEL	r0x1022
	RRC	r0x1022
	CLR	PSW, 0
	BANKSEL	r0x1022
	RRC	r0x1022
;	::->op :*  =
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 1), R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	232; "../BSP_can.c"	CAN_Rev_DATA.data_length = CAN_Rev_BUF[0]&0x0F;
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x0f
	BANKSEL	r0x1023
	AND	r0x1023, R0
;	::->op :*  =
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 2), R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	233; "../BSP_can.c"	if(CAN_Rev_DATA.data_ide)	  //扩展帧
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 0)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1023
	ORL	R0, r0x1023
	JNB	PSW, 2
	JMP	_00101_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	236; "../BSP_can.c"	CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 1)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 3), R0
;	::->op :*  =
;;122	MOVZ	R0, r0x1023
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	237; "../BSP_can.c"	CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 4), R0
;	::->op :*  =
;;119	MOVZ	R0, r0x1023
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	238; "../BSP_can.c"	CAN_Rev_DATA.data_id[2]=CAN_Rev_BUF[3];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 3)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 5), R0
;	::->op :*  =
;;114	MOVZ	R0, r0x1023
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	239; "../BSP_can.c"	CAN_Rev_DATA.data_id[3]=CAN_Rev_BUF[4]&0xF8;
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 4)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : BITWISEAND
	MOV	R0,# 0xf8
	BANKSEL	r0x1023
	AND	r0x1023, R0
;	::->op :*  =
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 6), R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	241; "../BSP_can.c"	if(CAN_Rev_DATA.data_rtr)//远程帧
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 1)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1023
	ORL	R0, r0x1023
	JB	PSW, 2
	JMP	_00102_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	247; "../BSP_can.c"	if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//判断数据长度
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1023
	ORL	R0, r0x1023
	JNB	PSW, 2
	JMP	_00102_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x9=9), size=1
	MOV	R0,# 0x09
	BANKSEL	r0x1023
	SUB	R0, r0x1023
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00102_DS_
;	::->op : =
;	.line	250; "../BSP_can.c"	for(i=0;i<CAN_Rev_DATA.data_length;i++)
	BANKSEL	r0x1023
	CLR	r0x1023
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00109_DS_
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : <
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	r0x1023
	SUB	R0, r0x1023
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00102_DS_
;	::->op : +
;	.line	252; "../BSP_can.c"	CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[5+i];
	BANKSEL	r0x1023
	MOV	R0, r0x1023
	ADD	R0,# (_CAN_Rev_DATA + 7)
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : +
	MOV	R0,# 0x05
	BANKSEL	r0x1023
	ADD	R0, r0x1023
	BANKSEL	r0x1025
	MOV	r0x1025, R0
;	::->op : +
	MOV	R0,# (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1025
	ADD	r0x1025, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x1025
	MOV	R1, r0x1025
	BANKSEL	_CAN_Rev_BUF
	LD	R0, [R1]
	BANKSEL	r0x1027
	MOV	r0x1027, R0
;	::->op :*  =
	BANKSEL	r0x1027
	MOVZ	R0, r0x1027
	BANKSEL	r0x1022
	MOV	R1, r0x1022
	BANKSEL	_CAN_Rev_DATA
	ST	[R1], R0
;	::->op : +
;	.line	250; "../BSP_can.c"	for(i=0;i<CAN_Rev_DATA.data_length;i++)
	BANKSEL	r0x1023
	INC	r0x1023
;	::->op : GOTO
	JMP	_00109_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00101_DS_
;	.line	260; "../BSP_can.c"	CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 1)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 3), R0
;	::->op :*  =
;;109	MOVZ	R0, r0x1023
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	261; "../BSP_can.c"	CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2]&0xE0;
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : BITWISEAND
	MOV	R0,# 0xe0
	BANKSEL	r0x1023
	AND	r0x1023, R0
;	::->op :*  =
	BANKSEL	r0x1023
	MOVZ	R0, r0x1023
	BANKSEL	_CAN_Rev_DATA
	MOV	 (_CAN_Rev_DATA + 4), R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	263; "../BSP_can.c"	if(CAN_Rev_DATA.data_rtr)//远程帧
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 1)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1023
	ORL	R0, r0x1023
	JB	PSW, 2
	JMP	_00102_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	269; "../BSP_can.c"	if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//判断数据长度
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1023
	ORL	R0, r0x1023
	JNB	PSW, 2
	JMP	_00102_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1023
	MOV	r0x1023, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x9=9), size=1
	MOV	R0,# 0x09
	BANKSEL	r0x1023
	SUB	R0, r0x1023
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00102_DS_
;	::->op : =
;	.line	272; "../BSP_can.c"	for(i=0;i<CAN_Rev_DATA.data_length;i++)
	BANKSEL	r0x1023
	CLR	r0x1023
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00113_DS_
	BANKSEL	_CAN_Rev_DATA
	MOVZ	R0,  (_CAN_Rev_DATA + 2)
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : <
	BANKSEL	r0x1022
	MOVZ	R0, r0x1022
	BANKSEL	r0x1023
	SUB	R0, r0x1023
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00102_DS_
;	::->op : +
;	.line	274; "../BSP_can.c"	CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[3+i];
	BANKSEL	r0x1023
	MOV	R0, r0x1023
	ADD	R0,# (_CAN_Rev_DATA + 7)
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : +
	MOV	R0,# 0x03
	BANKSEL	r0x1023
	ADD	R0, r0x1023
	BANKSEL	r0x1025
	MOV	r0x1025, R0
;	::->op : +
	MOV	R0,# (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1025
	ADD	r0x1025, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x1025
	MOV	R1, r0x1025
	BANKSEL	_CAN_Rev_BUF
	LD	R0, [R1]
	BANKSEL	r0x1027
	MOV	r0x1027, R0
;	::->op :*  =
	BANKSEL	r0x1027
	MOVZ	R0, r0x1027
	BANKSEL	r0x1022
	MOV	R1, r0x1022
	BANKSEL	_CAN_Rev_DATA
	ST	[R1], R0
;	::->op : +
;	.line	272; "../BSP_can.c"	for(i=0;i<CAN_Rev_DATA.data_length;i++)
	BANKSEL	r0x1023
	INC	r0x1023
;	::->op : GOTO
	JMP	_00113_DS_
;	::->op : LABEL
;	::->op : =
_00102_DS_
;	.line	281; "../BSP_can.c"	CANCMR = 0x04;//释放缓冲器
	MOV	R0,# 0x04
	BANKSEL	_CANCMR
	MOV	_CANCMR, R0
;	::->op : +
;	.line	283; "../BSP_can.c"	can_data_hand++;//指针+1
	BANKSEL	_can_data_hand
	INC	_can_data_hand
;	::->op : EQ_OP
;	.line	284; "../BSP_can.c"	if(can_data_hand==16)//若指针指向15以上，返回0
	BANKSEL	_can_data_hand
	MOVZ	R0, _can_data_hand
;	.line	286; "../BSP_can.c"	can_data_hand=0;
	XOR	R0,# 0x10
	JB	PSW, 2
	JMP	_00160_DS_
	BANKSEL	_can_data_hand
	CLR	_can_data_hand
_00160_DS_
	CRET	



func._CAN_Transmit_Message	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_Transmit_Message	;Function start
; 2 exit points
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;13 compiler assigned registers:
;   r0x102C
;   STK00
;   r0x102D
;   STK01
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_Transmit_Message	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	129; "../BSP_can.c"	CAN_SendData_STATE CAN_Transmit_Message(CAN_DATA_INF* CAN_Send_DATA)
	BANKSEL	r0x102C
	MOV	r0x102C, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x102D
	MOV	r0x102D, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : =
;	.line	135; "../BSP_can.c"	while(!TXBSTA)//等待CPU可以访问发送缓冲器
	BANKSEL	r0x102F
	CLR	r0x102F
	BANKSEL	r0x1030
	CLR	r0x1030
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00055_DS_
	BANKSEL	_CANSTA_bits
	JNB	_CANSTA_bits, 2
	JMP	_00057_DS_
;	::->op : +
;	.line	137; "../BSP_can.c"	if(++Delay_Count>0xFE0)
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00161_DS_
	BANKSEL	r0x1030
	INC	r0x1030
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFE1=4065), size=2
_00161_DS_
	MOV	R0,# 0x0f
	BANKSEL	r0x1030
	SUB	R0, r0x1030
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00083_DS_
	MOV	R0,# 0xe1
	BANKSEL	r0x102F
	SUB	R0, r0x102F
_00083_DS_
	JB	PSW, 0
	JMP	_00055_DS_
;	::->op : RETURN
;	.line	138; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00072_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00057_DS_
;	.line	141; "../BSP_can.c"	temp = (CAN_Send_DATA->data_ide<<7)|(CAN_Send_DATA->data_rtr<<6|CAN_Send_DATA->data_length);
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x102F
	MOV	r0x102F, R0
;	::->op : LEFT_OP
	BANKSEL	r0x102F
	RRCR	r0x102F
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RRC	r0x1030
;	::->op : +
	MOV	R0,# 0x01
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1031
	CLR	r0x1031
	BANKSEL	r0x1031
	RLC	r0x1031
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1031
	ADD	r0x1031, R0
	BANKSEL	r0x1032
	CLR	r0x1032
	BANKSEL	r0x1032
	RLC	r0x1032
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1032
	ADD	r0x1032, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1031
	MOVZ	R0, r0x1031
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1032
	MOVZ	R0, r0x1032
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1033
	MOV	r0x1033, R0
;	::->op : LEFT_OP
	BANKSEL	r0x1033
	SWAPR	R0, r0x1033
	AND	R0,# 0xf0
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	CLR	PSW, 0
	BANKSEL	r0x102F
	RLC	r0x102F
	CLR	PSW, 0
	BANKSEL	r0x102F
	RLC	r0x102F
;	::->op : +
	MOV	R0,# 0x02
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x1033
	MOV	r0x1033, R0
	BANKSEL	r0x1034
	CLR	r0x1034
	BANKSEL	r0x1034
	RLC	r0x1034
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1034
	ADD	r0x1034, R0
	BANKSEL	r0x1035
	CLR	r0x1035
	BANKSEL	r0x1035
	RLC	r0x1035
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1035
	ADD	r0x1035, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1034
	MOVZ	R0, r0x1034
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1035
	MOVZ	R0, r0x1035
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1036
	MOV	r0x1036, R0
;	::->op : |
	BANKSEL	r0x1036
	MOVZ	R0, r0x1036
	BANKSEL	r0x102F
	ORL	r0x102F, R0
;	::->op : |
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	r0x1030
	ORL	R0, r0x1030
	BANKSEL	_CANTXINF
	MOV	_CANTXINF, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	143; "../BSP_can.c"	if(CAN_Send_DATA->data_ide==0)//标准帧
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x102F
	MOV	r0x102F, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x102F
	ORL	R0, r0x102F
	JB	PSW, 2
	JMP	_00065_DS_
;	::->op : +
;	.line	145; "../BSP_can.c"	if(CAN_Send_DATA->data_rtr==0)//数据帧
	MOV	R0,# 0x01
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1034
	MOV	r0x1034, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1034
	ORL	R0, r0x1034
	JB	PSW, 2
	JMP	_00059_DS_
;	::->op : +
;	.line	147; "../BSP_can.c"	CANTXID0=CAN_Send_DATA->data_id[0];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID0
	MOV	_CANTXID0, R0
;	::->op : +
;	.line	148; "../BSP_can.c"	CANTXID1=CAN_Send_DATA->data_id[1];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00162_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00162_DS_
	JB	PSW, 2
	JMP	_00163_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00163_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID1
	MOV	_CANTXID1, R0
;	::->op : +
;	.line	149; "../BSP_can.c"	CANTXID2=CAN_Send_DATA->raw_data[0];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID2
	MOV	_CANTXID2, R0
;	::->op : +
;	.line	150; "../BSP_can.c"	CANTXID3=CAN_Send_DATA->raw_data[1];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00164_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00164_DS_
	JB	PSW, 2
	JMP	_00165_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00165_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID3
	MOV	_CANTXID3, R0
;	::->op : +
;	.line	151; "../BSP_can.c"	CANTXDT0=CAN_Send_DATA->raw_data[2];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x02
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00166_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00166_DS_
	JB	PSW, 2
	JMP	_00167_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00167_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT0
	MOV	_CANTXDT0, R0
;	::->op : +
;	.line	152; "../BSP_can.c"	CANTXDT1=CAN_Send_DATA->raw_data[3];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x03
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00168_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00168_DS_
	JB	PSW, 2
	JMP	_00169_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00169_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT1
	MOV	_CANTXDT1, R0
;	::->op : +
;	.line	153; "../BSP_can.c"	CANTXDT2=CAN_Send_DATA->raw_data[4];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x04
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00170_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00170_DS_
	JB	PSW, 2
	JMP	_00171_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00171_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT2
	MOV	_CANTXDT2, R0
;	::->op : +
;	.line	154; "../BSP_can.c"	CANTXDT3=CAN_Send_DATA->raw_data[5];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x05
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00172_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00172_DS_
	JB	PSW, 2
	JMP	_00173_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00173_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT3
	MOV	_CANTXDT3, R0
;	::->op : +
;	.line	155; "../BSP_can.c"	CANTXDT4=CAN_Send_DATA->raw_data[6];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x06
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00174_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00174_DS_
	JB	PSW, 2
	JMP	_00175_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00175_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT4
	MOV	_CANTXDT4, R0
;	::->op : +
;	.line	156; "../BSP_can.c"	CANTXDT5=CAN_Send_DATA->raw_data[7];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x07
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00176_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00176_DS_
	JB	PSW, 2
	JMP	_00177_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00177_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT5
	MOV	_CANTXDT5, R0
;	::->op : GOTO
	JMP	_00066_DS_
;	::->op : LABEL
;	::->op : +
_00059_DS_
;	.line	160; "../BSP_can.c"	CANTXID0=CAN_Send_DATA->data_id[0];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID0
	MOV	_CANTXID0, R0
;	::->op : +
;	.line	161; "../BSP_can.c"	CANTXID1=CAN_Send_DATA->data_id[1];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00178_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00178_DS_
	JB	PSW, 2
	JMP	_00179_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00179_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID1
	MOV	_CANTXID1, R0
;	::->op : GOTO
	JMP	_00066_DS_
;	::->op : LABEL
;	::->op : +
_00065_DS_
;	.line	166; "../BSP_can.c"	if(CAN_Send_DATA->data_rtr==0) //为数据帧
	MOV	R0,# 0x01
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1034
	MOV	r0x1034, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x1034
	ORL	R0, r0x1034
	JB	PSW, 2
	JMP	_00062_DS_
;	::->op : +
;	.line	168; "../BSP_can.c"	CANTXID0=CAN_Send_DATA->data_id[0];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID0
	MOV	_CANTXID0, R0
;	::->op : +
;	.line	169; "../BSP_can.c"	CANTXID1=CAN_Send_DATA->data_id[1];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00180_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00180_DS_
	JB	PSW, 2
	JMP	_00181_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00181_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID1
	MOV	_CANTXID1, R0
;	::->op : +
;	.line	170; "../BSP_can.c"	CANTXID2=CAN_Send_DATA->data_id[2];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x02
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00182_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00182_DS_
	JB	PSW, 2
	JMP	_00183_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00183_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID2
	MOV	_CANTXID2, R0
;	::->op : +
;	.line	171; "../BSP_can.c"	CANTXID3=CAN_Send_DATA->data_id[3];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x03
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00184_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00184_DS_
	JB	PSW, 2
	JMP	_00185_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00185_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID3
	MOV	_CANTXID3, R0
;	::->op : +
;	.line	172; "../BSP_can.c"	CANTXDT0=CAN_Send_DATA->raw_data[0];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT0
	MOV	_CANTXDT0, R0
;	::->op : +
;	.line	173; "../BSP_can.c"	CANTXDT1=CAN_Send_DATA->raw_data[1];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00186_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00186_DS_
	JB	PSW, 2
	JMP	_00187_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00187_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT1
	MOV	_CANTXDT1, R0
;	::->op : +
;	.line	174; "../BSP_can.c"	CANTXDT2=CAN_Send_DATA->raw_data[2];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x02
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00188_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00188_DS_
	JB	PSW, 2
	JMP	_00189_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00189_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT2
	MOV	_CANTXDT2, R0
;	::->op : +
;	.line	175; "../BSP_can.c"	CANTXDT3=CAN_Send_DATA->raw_data[3];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x03
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00190_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00190_DS_
	JB	PSW, 2
	JMP	_00191_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00191_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT3
	MOV	_CANTXDT3, R0
;	::->op : +
;	.line	176; "../BSP_can.c"	CANTXDT4=CAN_Send_DATA->raw_data[4];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x04
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00192_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00192_DS_
	JB	PSW, 2
	JMP	_00193_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00193_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT4
	MOV	_CANTXDT4, R0
;	::->op : +
;	.line	177; "../BSP_can.c"	CANTXDT5=CAN_Send_DATA->raw_data[5];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x05
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00194_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00194_DS_
	JB	PSW, 2
	JMP	_00195_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00195_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT5
	MOV	_CANTXDT5, R0
;	::->op : +
;	.line	178; "../BSP_can.c"	CANTXDT6=CAN_Send_DATA->raw_data[6];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x06
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00196_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00196_DS_
	JB	PSW, 2
	JMP	_00197_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00197_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT6
	MOV	_CANTXDT6, R0
;	::->op : +
;	.line	179; "../BSP_can.c"	CANTXDT7=CAN_Send_DATA->raw_data[7];
	MOV	R0,# 0x07
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x07
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00198_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00198_DS_
	JB	PSW, 2
	JMP	_00199_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00199_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXDT7
	MOV	_CANTXDT7, R0
;	::->op : GOTO
	JMP	_00066_DS_
;	::->op : LABEL
;	::->op : +
_00062_DS_
;	.line	183; "../BSP_can.c"	CANTXID0=CAN_Send_DATA->data_id[0];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID0
	MOV	_CANTXID0, R0
;	::->op : +
;	.line	184; "../BSP_can.c"	CANTXID1=CAN_Send_DATA->data_id[1];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	BANKSEL	r0x102F
	INC	r0x102F
	JB	PSW, 2
	JMP	_00200_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00200_DS_
	JB	PSW, 2
	JMP	_00201_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00201_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID1
	MOV	_CANTXID1, R0
;	::->op : +
;	.line	185; "../BSP_can.c"	CANTXID2=CAN_Send_DATA->data_id[2];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
	BANKSEL	r0x1030
	RLC	r0x1030
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	r0x1030
	ADD	r0x1030, R0
	BANKSEL	r0x1033
	CLR	r0x1033
	BANKSEL	r0x1033
	RLC	r0x1033
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	BANKSEL	r0x1033
	ADD	r0x1033, R0
;	::->op : +
	MOV	R0,# 0x02
	BANKSEL	r0x102F
	ADD	r0x102F, R0
	JB	PSW, 0
	JMP	_00202_DS_
	BANKSEL	r0x1030
	INC	r0x1030
_00202_DS_
	JB	PSW, 2
	JMP	_00203_DS_
	BANKSEL	r0x1033
	INC	r0x1033
;	::->op : GET_VALUE_AT_ADDRESS
_00203_DS_
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x1030
	MOVZ	R0, r0x1030
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID2
	MOV	_CANTXID2, R0
;	::->op : +
;	.line	186; "../BSP_can.c"	CANTXID3=CAN_Send_DATA->data_id[3];
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	r0x102E, R0
	JB	PSW, 0
	JMP	_00204_DS_
	BANKSEL	r0x102D
	INC	r0x102D
_00204_DS_
	JB	PSW, 2
	JMP	_00205_DS_
	BANKSEL	r0x102C
	INC	r0x102C
;	::->op : +
_00205_DS_
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	r0x102E, R0
	JB	PSW, 0
	JMP	_00206_DS_
	BANKSEL	r0x102D
	INC	r0x102D
_00206_DS_
	JB	PSW, 2
	JMP	_00207_DS_
	BANKSEL	r0x102C
	INC	r0x102C
;	::->op : GET_VALUE_AT_ADDRESS
_00207_DS_
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	r0x102D
	MOVZ	R0, r0x102D
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x102C
	MOVZ	R0, r0x102C
	TRAPPC1	__gptrget1
	TRAPPC2	__gptrget1
	PAGESEL	__gptrget1
	CALL	__gptrget1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	_CANTXID3
	MOV	_CANTXID3, R0
;	::->op : LABEL
;	::->op : =
_00066_DS_
;	.line	191; "../BSP_can.c"	CANCMR = 0x03;
	MOV	R0,# 0x03
	BANKSEL	_CANCMR
	MOV	_CANCMR, R0
;	::->op : =
;	.line	194; "../BSP_can.c"	while(!TCSTA)
	BANKSEL	r0x102E
	CLR	r0x102E
	BANKSEL	r0x102D
	CLR	r0x102D
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00069_DS_
	BANKSEL	_CANSTA_bits
	JNB	_CANSTA_bits, 3
	JMP	_00071_DS_
;	::->op : +
;	.line	196; "../BSP_can.c"	if(++Delay_Count>0xFE0)
	BANKSEL	r0x102E
	INC	r0x102E
	JB	PSW, 2
	JMP	_00208_DS_
	BANKSEL	r0x102D
	INC	r0x102D
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFE1=4065), size=2
_00208_DS_
	MOV	R0,# 0x0f
	BANKSEL	r0x102D
	SUB	R0, r0x102D
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00084_DS_
	MOV	R0,# 0xe1
	BANKSEL	r0x102E
	SUB	R0, r0x102E
_00084_DS_
	JB	PSW, 0
	JMP	_00069_DS_
;	::->op : RETURN
;	.line	197; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00072_DS_
;	::->op : LABEL
;	::->op : RETURN
_00071_DS_
;	.line	200; "../BSP_can.c"	return OK;
	MOV	R0,# 0x01
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00072_DS_
	CRET	
; exit point of _CAN_Transmit_Message



func._CAN_Init	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_Init	;Function start
; 2 exit points
;has an exit
;9 compiler assigned registers:
;   r0x1037
;   STK00
;   r0x1038
;   STK01
;   r0x1039
;   STK02
;   r0x103A
;   STK03
;   r0x103B
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_Init	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	93; "../BSP_can.c"	void CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS2, uint8 CAN_MODE, uint8 CAN_pre)
	BANKSEL	r0x1037
	MOV	r0x1037, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1038
	MOV	r0x1038, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1039
	MOV	r0x1039, R0
;	::->op : RECEIVE
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x103A
	MOV	r0x103A, R0
;	::->op : RECEIVE
	BANKSEL	STK03
	MOVZ	R0, STK03
	BANKSEL	r0x103B
	MOV	r0x103B, R0
;	::->op :*  =
;	.line	96; "../BSP_can.c"	ANS15 = 0;
	BANKSEL	_ANS1_bits
	CLR	_ANS1_bits, 5
;	::->op :*  =
;	.line	97; "../BSP_can.c"	ANS14 = 0;
	BANKSEL	_ANS1_bits
	CLR	_ANS1_bits, 4
;	::->op :*  =
;	.line	98; "../BSP_can.c"	TR15 = 0;
	BANKSEL	_TR1_bits
	CLR	_TR1_bits, 5
;	::->op :*  =
;	.line	99; "../BSP_can.c"	TR14 = 1;
	BANKSEL	_TR1_bits
	SET	_TR1_bits, 4
;	::->op : |
;	.line	101; "../BSP_can.c"	CANMOD |= CAN_reset;
	BANKSEL	_CANMOD
	SET	_CANMOD, 0
;	::->op : IFX
;	.line	103; "../BSP_can.c"	if(CAN_MODE)
	MOV	R0,# 0x00
	BANKSEL	r0x103A
	ORL	R0, r0x103A
	JNB	PSW, 2
	JMP	_00048_DS_
;	::->op : |
;	.line	105; "../BSP_can.c"	CANMOD |= CAN_enable|CANCLK_SEL_HFCLK|CAN_LBACK_disable;
	MOV	R0,# 0xa0
	BANKSEL	_CANMOD
	ORL	_CANMOD, R0
;	::->op : GOTO
	JMP	_00049_DS_
;	::->op : LABEL
;	::->op : |
_00048_DS_
;	.line	109; "../BSP_can.c"	CANMOD |= CAN_enable|CANCLK_SEL_HFCLK;
	MOV	R0,# 0xa0
	BANKSEL	_CANMOD
	ORL	_CANMOD, R0
;	::->op : LABEL
;	::->op : -
_00049_DS_
;	.line	113; "../BSP_can.c"	CANBTR = (CAN_SJW-1)<<6|(CAN_pre-1);
	BANKSEL	r0x1037
	DEC	r0x1037
;	::->op : LEFT_OP
	BANKSEL	r0x1037
	SWAPR	R0, r0x1037
	AND	R0,# 0xf0
	BANKSEL	r0x103A
	MOV	r0x103A, R0
	CLR	PSW, 0
	BANKSEL	r0x103A
	RLC	r0x103A
	CLR	PSW, 0
	BANKSEL	r0x103A
	RLC	r0x103A
;	::->op : -
	BANKSEL	r0x103B
	DEC	r0x103B
;	::->op : |
	BANKSEL	r0x103B
	MOVZ	R0, r0x103B
	BANKSEL	r0x103A
	ORL	R0, r0x103A
	BANKSEL	_CANBTR
	MOV	_CANBTR, R0
;	::->op : -
;	.line	114; "../BSP_can.c"	CANSEG = CAN_Sample_1|(CAN_BS1-1)|(CAN_BS2-1)<<4;
	BANKSEL	r0x1038
	DEC	r0x1038
;	::->op : -
	BANKSEL	r0x1039
	DEC	r0x1039
;	::->op : LEFT_OP
	BANKSEL	r0x1039
	SWAPR	R0, r0x1039
	AND	R0,# 0xf0
	BANKSEL	r0x1037
	MOV	r0x1037, R0
;	::->op : |
	BANKSEL	r0x1037
	MOVZ	R0, r0x1037
	BANKSEL	r0x1038
	ORL	R0, r0x1038
	BANKSEL	_CANSEG
	MOV	_CANSEG, R0
;	::->op : CAST
;	.line	119; "../BSP_can.c"	CANMOD &= ~CAN_reset;
	BANKSEL	_CANMOD
	MOVZ	R0, _CANMOD
	BANKSEL	r0x1037
	MOV	r0x1037, R0
;	::->op : BITWISEAND
	BANKSEL	r0x1037
	CLR	r0x1037, 0
;	::->op : CAST
	BANKSEL	r0x1037
	MOVZ	R0, r0x1037
	BANKSEL	_CANMOD
	MOV	_CANMOD, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _CAN_Init



func._CAN_IDFilterConfig	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _CAN_IDFilterConfig	;Function start
; 2 exit points
;has an exit
;22 compiler assigned registers:
;   r0x103C
;   STK00
;   r0x103D
;   STK01
;   r0x103E
;   STK02
;   r0x103F
;   STK03
;   r0x1040
;   STK04
;   r0x1041
;   STK05
;   r0x1042
;   STK06
;   r0x1043
;   STK07
;   r0x1044
;   STK08
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_CAN_IDFilterConfig	;Function start
; 2 exit points
;	::->op : RECEIVE
;	.line	14; "../BSP_can.c"	FilterConfig_STATE CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID)
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x103D
	MOV	r0x103D, R0
;	::->op : RECEIVE
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x103E
	MOV	r0x103E, R0
	BANKSEL	STK02
	MOVZ	R0, STK02
	BANKSEL	r0x103F
	MOV	r0x103F, R0
	BANKSEL	STK03
	MOVZ	R0, STK03
	BANKSEL	r0x1040
	MOV	r0x1040, R0
	BANKSEL	STK04
	MOVZ	R0, STK04
	BANKSEL	r0x1041
	MOV	r0x1041, R0
;	::->op : RECEIVE
	BANKSEL	STK05
	MOVZ	R0, STK05
	BANKSEL	r0x1042
	MOV	r0x1042, R0
	BANKSEL	STK06
	MOVZ	R0, STK06
	BANKSEL	r0x1043
	MOV	r0x1043, R0
	BANKSEL	STK07
	MOVZ	R0, STK07
	BANKSEL	r0x1044
	MOV	r0x1044, R0
	BANKSEL	STK08
	MOVZ	R0, STK08
	BANKSEL	r0x1045
	MOV	r0x1045, R0
;	::->op : IFX
;	.line	16; "../BSP_can.c"	if(CAN_IDE == 0) //标准模式
	MOV	R0,# 0x00
	BANKSEL	r0x103C
	ORL	R0, r0x103C
	JB	PSW, 2
	JMP	_00022_DS_
;	::->op : IFX
;	.line	19; "../BSP_can.c"	if(CANID_MODE == 0) //11位ID右对齐
	MOV	R0,# 0x00
	BANKSEL	r0x103D
	ORL	R0, r0x103D
	JB	PSW, 2
	JMP	_00007_DS_
;	::->op : BITWISEAND
;	.line	21; "../BSP_can.c"	if(CAN_FilterID>0x7FFF)
	BANKSEL	r0x1040
	MOVZ	R0, r0x1040
	BANKSEL	r0x1040
	JB	r0x1040, 7
	JMP	_00002_DS_
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	AND	R0,# 0xff
	JNB	PSW, 2
	JMP	_00002_DS_
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	AND	R0,# 0xff
	JNB	PSW, 2
	JMP	_00002_DS_
;	::->op : RETURN
;	.line	22; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : LEFT_OP
_00002_DS_
;	.line	25; "../BSP_can.c"	CAN_FilterID <<=5;
	MOV	R0,# 0x05
	INC	R0
	JMP	_00037_DS_
_00036_DS_
	CLR	PSW, 0
	BANKSEL	r0x1041
	RLC	r0x1041
	BANKSEL	r0x1040
	RLC	r0x1040
	BANKSEL	r0x103F
	RLC	r0x103F
	BANKSEL	r0x103E
	RLC	r0x103E
_00037_DS_
	DECJZ	R0
	JMP	_00036_DS_
;	::->op : LEFT_OP
;	.line	26; "../BSP_can.c"	CAN_MASKID <<=5;
	MOV	R0,# 0x05
	INC	R0
	JMP	_00039_DS_
_00038_DS_
	CLR	PSW, 0
	BANKSEL	r0x1045
	RLC	r0x1045
	BANKSEL	r0x1044
	RLC	r0x1044
	BANKSEL	r0x1043
	RLC	r0x1043
	BANKSEL	r0x1042
	RLC	r0x1042
_00039_DS_
	DECJZ	R0
	JMP	_00038_DS_
;	::->op : GOTO
	JMP	_00008_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFFE1=65505), size=4
_00007_DS_
;	.line	31; "../BSP_can.c"	if(CAN_FilterID>0xFFE0) //11位ID左对齐，其值超过11位，则判断输入ID错误
	MOV	R0,# 0x00
	BANKSEL	r0x103E
	SUB	R0, r0x103E
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00040_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x103F
	SUB	R0, r0x103F
	JB	PSW, 2
	JMP	_00040_DS_
	MOV	R0,# 0xff
	BANKSEL	r0x1040
	SUB	R0, r0x1040
	JB	PSW, 2
	JMP	_00040_DS_
	MOV	R0,# 0xe1
	BANKSEL	r0x1041
	SUB	R0, r0x1041
_00040_DS_
	JB	PSW, 0
	JMP	_00008_DS_
;	::->op : RETURN
;	.line	32; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : BITWISEAND
_00008_DS_
;	.line	34; "../BSP_can.c"	if(CAN_FilterID&0xFE00 == 0xFE00) //11位ID左对齐，CAN协议要求，高7位不能全部是隐性位，即高7位全部为1是错误的ID。
	BANKSEL	r0x1041
	JB	r0x1041, 0
	JMP	_00010_DS_
;	::->op : RETURN
;	.line	35; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : |
_00010_DS_
;	.line	37; "../BSP_can.c"	CANMOD |= CAN_reset; //CAN模块进入复位模式，开始配置其寄存器
	BANKSEL	_CANMOD
	SET	_CANMOD, 0
;	::->op : RIGHT_OP
;	.line	38; "../BSP_can.c"	CANACR0 = CAN_FilterID>>8;  //设置接收识别ID
	BANKSEL	r0x1040
	MOVZ	R0, r0x1040
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	BANKSEL	r0x1046
	MOV	r0x1046, R0
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	BANKSEL	r0x1047
	MOV	r0x1047, R0
	BANKSEL	r0x1048
	CLR	r0x1048
;	::->op : CAST
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	BANKSEL	_CANACR0
	MOV	_CANACR0, R0
;	::->op : BITWISEAND
;	.line	39; "../BSP_can.c"	CANACR1 = CAN_FilterID&0xE0;
	MOV	R0,# 0xe0
	BANKSEL	r0x1041
	AND	R0, r0x1041
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	r0x1046
	CLR	r0x1046
	BANKSEL	r0x1047
	CLR	r0x1047
	BANKSEL	r0x1048
	CLR	r0x1048
;	::->op : CAST
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	BANKSEL	_CANACR1
	MOV	_CANACR1, R0
;	::->op : =
;	.line	40; "../BSP_can.c"	CANACR2 = 0;
	BANKSEL	_CANACR2
	CLR	_CANACR2
;	::->op : =
;	.line	41; "../BSP_can.c"	CANACR3 = 0;
	BANKSEL	_CANACR3
	CLR	_CANACR3
;	::->op : RIGHT_OP
;;121	MOVZ	R0, r0x1044
;	.line	42; "../BSP_can.c"	CANMSK0 = CAN_MASKID>>8;  //设置识别ID掩码  CAN_MASKID>>8
	BANKSEL	r0x1043
	MOVZ	R0, r0x1043
	BANKSEL	r0x1046
	MOV	r0x1046, R0
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	r0x1047
	MOV	r0x1047, R0
	BANKSEL	r0x1048
	CLR	r0x1048
;	::->op : CAST
;;120	MOVZ	R0, r0x103C
	BANKSEL	r0x1044
	MOVZ	R0, r0x1044
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	_CANMSK0
	MOV	_CANMSK0, R0
;	::->op : BITWISEAND
;	.line	43; "../BSP_can.c"	CANMSK1 = CAN_MASKID&0xE0;//CAN_MASKID&0xE0
	MOV	R0,# 0xe0
	BANKSEL	r0x1045
	AND	R0, r0x1045
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	r0x1046
	CLR	r0x1046
	BANKSEL	r0x1047
	CLR	r0x1047
	BANKSEL	r0x1048
	CLR	r0x1048
;	::->op : CAST
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	BANKSEL	_CANMSK1
	MOV	_CANMSK1, R0
;	::->op : =
;	.line	44; "../BSP_can.c"	CANMSK2 = 0xFF;
	MOV	R0,# 0xff
	BANKSEL	_CANMSK2
	MOV	_CANMSK2, R0
;	::->op : =
;	.line	45; "../BSP_can.c"	CANMSK3 = 0xFF;
	MOV	R0,# 0xff
	BANKSEL	_CANMSK3
	MOV	_CANMSK3, R0
;	::->op : CAST
;	.line	46; "../BSP_can.c"	CANMOD &= ~CAN_reset; //CAN模块退出复位模式，进入工作模式
	BANKSEL	_CANMOD
	MOVZ	R0, _CANMOD
	BANKSEL	r0x103C
	MOV	r0x103C, R0
;	::->op : BITWISEAND
	BANKSEL	r0x103C
	CLR	r0x103C, 0
;	::->op : CAST
	BANKSEL	r0x103C
	MOVZ	R0, r0x103C
	BANKSEL	_CANMOD
	MOV	_CANMOD, R0
;	::->op : RETURN
;	.line	47; "../BSP_can.c"	return OK;
	MOV	R0,# 0x01
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : IFX
_00022_DS_
;	.line	51; "../BSP_can.c"	if(CANID_MODE == 0)
	MOV	R0,# 0x00
	BANKSEL	r0x103D
	ORL	R0, r0x103D
	JB	PSW, 2
	JMP	_00017_DS_
;	::->op : BITWISEAND
;	.line	53; "../BSP_can.c"	if(CAN_FilterID>0x1FFFFFFF)
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	AND	R0,# 0xe0
	JNB	PSW, 2
	JMP	_00012_DS_
;	::->op : RETURN
;	.line	54; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : LEFT_OP
_00012_DS_
;	.line	57; "../BSP_can.c"	CAN_FilterID <<=3;
	MOV	R0,# 0x03
	INC	R0
	JMP	_00043_DS_
_00042_DS_
	CLR	PSW, 0
	BANKSEL	r0x1041
	RLC	r0x1041
	BANKSEL	r0x1040
	RLC	r0x1040
	BANKSEL	r0x103F
	RLC	r0x103F
	BANKSEL	r0x103E
	RLC	r0x103E
_00043_DS_
	DECJZ	R0
	JMP	_00042_DS_
;	::->op : LEFT_OP
;	.line	58; "../BSP_can.c"	CAN_MASKID   <<=3;
	MOV	R0,# 0x03
	INC	R0
	JMP	_00045_DS_
_00044_DS_
	CLR	PSW, 0
	BANKSEL	r0x1045
	RLC	r0x1045
	BANKSEL	r0x1044
	RLC	r0x1044
	BANKSEL	r0x1043
	RLC	r0x1043
	BANKSEL	r0x1042
	RLC	r0x1042
_00045_DS_
	DECJZ	R0
	JMP	_00044_DS_
;	::->op : GOTO
	JMP	_00018_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFFFFFFF9=4294967289), size=4
_00017_DS_
;	.line	63; "../BSP_can.c"	if(CAN_FilterID>0xFFFFFFF8)
	MOV	R0,# 0xff
	BANKSEL	r0x103E
	SUB	R0, r0x103E
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00046_DS_
	MOV	R0,# 0xff
	BANKSEL	r0x103F
	SUB	R0, r0x103F
	JB	PSW, 2
	JMP	_00046_DS_
	MOV	R0,# 0xff
	BANKSEL	r0x1040
	SUB	R0, r0x1040
	JB	PSW, 2
	JMP	_00046_DS_
	MOV	R0,# 0xf9
	BANKSEL	r0x1041
	SUB	R0, r0x1041
_00046_DS_
	JB	PSW, 0
	JMP	_00018_DS_
;	::->op : RETURN
;	.line	64; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : BITWISEAND
_00018_DS_
;	.line	66; "../BSP_can.c"	if(CAN_FilterID&0xFE000000 == 0xFE000000)
	BANKSEL	r0x1041
	JB	r0x1041, 0
	JMP	_00020_DS_
;	::->op : RETURN
;	.line	67; "../BSP_can.c"	return False;
	MOV	R0,# 0x00
	JMP	_00024_DS_
;	::->op : LABEL
;	::->op : |
_00020_DS_
;	.line	68; "../BSP_can.c"	CANMOD |= CAN_reset;
	BANKSEL	_CANMOD
	SET	_CANMOD, 0
;	::->op : RIGHT_OP
;;116	MOVZ	R0, r0x103E
;	.line	69; "../BSP_can.c"	CANACR0 = CAN_FilterID>>24;
	BANKSEL	r0x103D
	CLR	r0x103D
	BANKSEL	r0x1046
	CLR	r0x1046
	BANKSEL	r0x1047
	CLR	r0x1047
;	::->op : CAST
;;115	MOVZ	R0, r0x103C
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	_CANACR0
	MOV	_CANACR0, R0
;	::->op : RIGHT_OP
;;111	MOVZ	R0, r0x103F
;	.line	70; "../BSP_can.c"	CANACR1 = CAN_FilterID>>16;
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	BANKSEL	r0x103D
	MOV	r0x103D, R0
	BANKSEL	r0x1046
	CLR	r0x1046
	BANKSEL	r0x1047
	CLR	r0x1047
;	::->op : CAST
;;110	MOVZ	R0, r0x103C
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	_CANACR1
	MOV	_CANACR1, R0
;	::->op : RIGHT_OP
;;106	MOVZ	R0, r0x1040
;	.line	71; "../BSP_can.c"	CANACR2 = CAN_FilterID>>8;
	BANKSEL	r0x103F
	MOVZ	R0, r0x103F
	BANKSEL	r0x103D
	MOV	r0x103D, R0
	BANKSEL	r0x103E
	MOVZ	R0, r0x103E
	BANKSEL	r0x1046
	MOV	r0x1046, R0
	BANKSEL	r0x1047
	CLR	r0x1047
;	::->op : CAST
;;105	MOVZ	R0, r0x103C
	BANKSEL	r0x1040
	MOVZ	R0, r0x1040
	BANKSEL	r0x103C
	MOV	r0x103C, R0
	BANKSEL	_CANACR2
	MOV	_CANACR2, R0
;	::->op : BITWISEAND
;	.line	72; "../BSP_can.c"	CANACR3 = CAN_FilterID&0xF8;
	MOV	R0,# 0xf8
	BANKSEL	r0x1041
	AND	r0x1041, R0
	BANKSEL	r0x1040
	CLR	r0x1040
	BANKSEL	r0x103F
	CLR	r0x103F
	BANKSEL	r0x103E
	CLR	r0x103E
;	::->op : CAST
	BANKSEL	r0x1041
	MOVZ	R0, r0x1041
	BANKSEL	_CANACR3
	MOV	_CANACR3, R0
;	::->op : RIGHT_OP
;;118	MOVZ	R0, r0x1042
;	.line	73; "../BSP_can.c"	CANMSK0 = CAN_MASKID>>24;
	BANKSEL	r0x1040
	CLR	r0x1040
	BANKSEL	r0x103F
	CLR	r0x103F
	BANKSEL	r0x103E
	CLR	r0x103E
;	::->op : CAST
;;117	MOVZ	R0, r0x1041
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	r0x1041
	MOV	r0x1041, R0
	BANKSEL	_CANMSK0
	MOV	_CANMSK0, R0
;	::->op : RIGHT_OP
;;113	MOVZ	R0, r0x1043
;	.line	74; "../BSP_can.c"	CANMSK1 = CAN_MASKID>>16;
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	r0x1040
	MOV	r0x1040, R0
	BANKSEL	r0x103F
	CLR	r0x103F
	BANKSEL	r0x103E
	CLR	r0x103E
;	::->op : CAST
;;112	MOVZ	R0, r0x1041
	BANKSEL	r0x1043
	MOVZ	R0, r0x1043
	BANKSEL	r0x1041
	MOV	r0x1041, R0
	BANKSEL	_CANMSK1
	MOV	_CANMSK1, R0
;	::->op : RIGHT_OP
;;108	MOVZ	R0, r0x1044
;	.line	75; "../BSP_can.c"	CANMSK2 = CAN_MASKID>>8;
	BANKSEL	r0x1043
	MOVZ	R0, r0x1043
	BANKSEL	r0x1040
	MOV	r0x1040, R0
	BANKSEL	r0x1042
	MOVZ	R0, r0x1042
	BANKSEL	r0x103F
	MOV	r0x103F, R0
	BANKSEL	r0x103E
	CLR	r0x103E
;	::->op : CAST
;;107	MOVZ	R0, r0x1041
	BANKSEL	r0x1044
	MOVZ	R0, r0x1044
	BANKSEL	r0x1041
	MOV	r0x1041, R0
	BANKSEL	_CANMSK2
	MOV	_CANMSK2, R0
;	::->op : BITWISEAND
;	.line	76; "../BSP_can.c"	CANMSK3 = CAN_MASKID&0xF8;
	MOV	R0,# 0xf8
	BANKSEL	r0x1045
	AND	r0x1045, R0
	BANKSEL	r0x1044
	CLR	r0x1044
	BANKSEL	r0x1043
	CLR	r0x1043
	BANKSEL	r0x1042
	CLR	r0x1042
;	::->op : CAST
	BANKSEL	r0x1045
	MOVZ	R0, r0x1045
	BANKSEL	_CANMSK3
	MOV	_CANMSK3, R0
;	::->op : CAST
;	.line	77; "../BSP_can.c"	CANMOD &= ~CAN_reset;
	BANKSEL	_CANMOD
	MOVZ	R0, _CANMOD
	BANKSEL	r0x1045
	MOV	r0x1045, R0
;	::->op : BITWISEAND
	BANKSEL	r0x1045
	CLR	r0x1045, 0
;	::->op : CAST
	BANKSEL	r0x1045
	MOVZ	R0, r0x1045
	BANKSEL	_CANMOD
	MOV	_CANMOD, R0
;	::->op : RETURN
;	.line	78; "../BSP_can.c"	return OK;
	MOV	R0,# 0x01
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00024_DS_
	CRET	
; exit point of _CAN_IDFilterConfig


;	code size estimation:
;	 1612+  985 =  2597 instructions ( 7164 byte)


	.end
