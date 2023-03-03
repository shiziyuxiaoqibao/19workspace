;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
;	.file	"../main.c"
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
	.extern	_CAN_Init
	.extern	_CAN_IDFilterConfig
	.extern	_CAN_Transmit_Message
	.extern	_CAN_Receive_Message_Configuration
	.extern	_CAN_SetITStatus
	.extern	_CAN_UnsetITStatus
	.extern	_CAN_GetITStatus
	.extern	_CAN_ClearITStatus
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
	.extern	__hmulint
	.extern	__gptrget1
	.extern	_startup
	.extern	__gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	.global	_Main_CleanTimeSet
	.global	_Main_DataClean
	.global	_main
	.global	_int_fun0
	.global	_int_fun1
	.global	_can_data_hand
	.global	_CAN_Rev_BUF
	.global	_CAN_Rev_DATA
	.global	_Time_count
	.global	_key_count
	.global	_length
	.global	_Data_fram
	.global	_Status_fram
	.global	_Fram_lenth
	.global	_ID_fram
	.global	_Data
	.global	_TX_Data
	.global	_RX_Data

	.global I0R1
	.global I0R7
	.global I0PSW
	.global I0PCH
	.global I1R1
	.global I1R7
	.global I1PSW
	.global I1PCH
	.define _STK11	STK11
	.global STK11
	.define _STK10	STK10
	.global STK10
	.define _STK09	STK09
	.global STK09
	.define _STK08	STK08
	.global STK08
	.define _STK07	STK07
	.global STK07
	.define _STK06	STK06
	.global STK06
	.define _STK05	STK05
	.global STK05
	.define _STK04	STK04
	.global STK04
	.define _STK03	STK03
	.global STK03
	.define _STK02	STK02
	.global STK02
	.define _STK01	STK01
	.global STK01
	.define _STK00	STK00
	.global STK00

sharebank .udata
I0R1		.res 1
I0R7		.res 1
I0PSW		.res 1
I0PCH		.res 1
I1R1		.res 1
I1R7		.res 1
I1PSW		.res 1
I1PCH		.res 1
sharebankSTKP1 .udata 
STK11	.res 1
	.type STK11, 108
STK10	.res 1
	.type STK10, 108
STK09	.res 1
	.type STK09, 108
STK08	.res 1
	.type STK08, 108
STK07	.res 1
	.type STK07, 108
sharebankSTKP2 .udata 0x78
STK06	.res 1
	.type STK06, 108
STK05	.res 1
	.type STK05, 108
STK04	.res 1
	.type STK04, 108
STK03	.res 1
	.type STK03, 108
STK02	.res 1
	.type STK02, 108
STK01	.res 1
	.type STK01, 108
STK00	.res 1
	.type STK00, 108

	.global TRAPRx73
	.global TRAPRx74
	.global TRAPRx75
	.global TRAPRx76
	.global TRAPRx77

sharebankTRAP .idata 0x73
TRAPRx73
  .db 0x00
TRAPRx74
  .db 0x00
TRAPRx75
  .db 0x00
TRAPRx76
  .db 0x00
TRAPRx77
  .db 0x00

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_main_0	.udata
_CAN_Rev_BUF	.res	13

UD_main_1	.udata
_CAN_Rev_DATA	.res	15

UD_main_2	.udata
_Time_count	.res	2

UD_main_3	.udata
_key_count	.res	2

UD_main_4	.udata
_Data_fram	.res	1

UD_main_5	.udata
_Fram_lenth	.res	1

UD_main_6	.udata
_TX_Data	.res	8

UD_main_7	.udata
_RX_Data	.res	8

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	.udata
r0x102E	.res	1
UDL_main_1	.udata
r0x102F	.res	1
UDL_main_2	.udata
r0x1030	.res	1
UDL_main_3	.udata
r0x1031	.res	1
UDL_main_4	.udata
r0x1032	.res	1
UDL_main_5	.udata
r0x1033	.res	1
UDL_main_6	.udata
r0x1034	.res	1
UDL_main_7	.udata
r0x102D	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	.idata
_can_data_hand
	.db	0x00


ID_main_1	.idata
_length
	.db	0x00


ID_main_2	.idata
_Status_fram
	.db	0x00


ID_main_3	.idata
_ID_fram
	.db	0x00, 0x00


ID_main_4	.idata
_Data
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x00
	.db	0x00


ID_main_5	.idata
_cleantime
	.db	0x00, 0x00

LDS_00000	.idata
_Main_DataClean_old_data0_1_1
	.db 0, 0

LDS_00001	.idata
_Main_DataClean_old_data1_1_1
	.db 0, 0

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	.code 0x0000
	CLR 0x76
	CLR 0x73
	PAGESEL	init_imp
	JMP		init_imp

	.global	init_imp
INIT_IMP	.code
init_imp
	PAGESEL	_startup
	CALL	_startup
	PAGESEL	__gsinit_startup
	CALL	__gsinit_startup
	TRAPPC1	_main
	TRAPPC2	_main
	PAGESEL	_main
	JMP		_main
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
interrupt_0x04	.code	0x4
	MOV		R2,R0
	MOV		R3,BANK
	MOV		R0,PSW
	BANKSEL	I0PSW
	MOV		I0PSW,R0
	MOV		I0R1,R1
	MOV		I0R7,R7
	SET		TRAPRx76,2
	TRAPPC1	interrupt_service_routine_0x04
	TRAPPC2	interrupt_service_routine_0x04
	PAGESEL	interrupt_service_routine_0x04
	JMP		interrupt_service_routine_0x04



func._int_fun0	.code
;***
;  PostBlock Stats: dbName = I
;***
;entry:  _int_fun0	;Function start
; 0 exit points
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_int_fun0	;Function start
; 0 exit points
;	::->op : GET_VALUE_AT_ADDRESS
; R3 resprent for wsave,R4 resprent for ssave, R5 resprent for psave
interrupt_service_routine_0x04
;	.line	197; "../main.c"	if(T1IE && T1IF)			//T1定时中断		500us gptrget1
	BANKSEL	_EIE1_bits
	JB	_EIE1_bits, 0
	JMP	_00104_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_EIF1_bits
	JB	_EIF1_bits, 0
	JMP	_00104_DS_
;	::->op :*  =
;	.line	199; "../main.c"	T1IF=0;
	BANKSEL	_EIF1_bits
	CLR	_EIF1_bits, 0
;	::->op : INLINEASM
	CWDT 
;	::->op : +
;	.line	201; "../main.c"	Time_count++;
	BANKSEL	_Time_count
	INC	_Time_count
	JB	PSW, 2
	JMP	_00102_DS_
	BANKSEL	_Time_count
	INC	(_Time_count + 1)
;	::->op : +
_00102_DS_
;	.line	202; "../main.c"	key_count++;
	BANKSEL	_key_count
	INC	_key_count
	JB	PSW, 2
	JMP	_00103_DS_
	BANKSEL	_key_count
	INC	(_key_count + 1)
;	::->op : +
_00103_DS_
;	.line	203; "../main.c"	cleantime ++;
	BANKSEL	_cleantime
	INC	_cleantime
	JB	PSW, 2
	JMP	_00104_DS_
	BANKSEL	_cleantime
	INC	(_cleantime + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00104_DS_
	BANKSEL	I0R1
	MOV	R1, I0R1
	BANKSEL	I0R7
	MOV	R7, I0R7
	BANKSEL	I0PSW
	MOV	R0, I0PSW
	MOV	PSW, R0
	MOV	R0, TRAPRx73
	JNB	TRAPRx76, 1
	MOV	R0, TRAPRx74
	CLR	TRAPRx76, 2
	MOV	PCH, R0
	MOV	BANK, R3
	MOV	R0, R2
	IRET	



func._int_fun1	.code
;***
;  PostBlock Stats: dbName = I
;***
;entry:  _int_fun1	;Function start
; 0 exit points
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_int_fun1	;Function start
; 0 exit points
;	::->op : LABEL
;	::->op : ENDFUNCTION
; R3 resprent for wsave,R4 resprent for ssave, R5 resprent for psave
interrupt_service_routine_0x14
_00093_DS_
;	.line	212; "../main.c"	}
	IRET	



func._main	.code
;***
;  PostBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PORT_Init
;   _Timer1_Init
;   _UART2_Init
;   _Init_ADC
;   _CAN_IDFilterConfig
;   _CAN_Init
;   _delay_ms
;   _keyl_detection
;   _keyr_detection
;   __hmulint
;   __gptrget1
;   _PORT_Init
;   _Timer1_Init
;   _UART2_Init
;   _Init_ADC
;   _CAN_IDFilterConfig
;   _CAN_Init
;   _delay_ms
;   _keyl_detection
;   _keyr_detection
;   __hmulint
;   __gptrget1
;19 compiler assigned registers:
;   STK00
;   STK08
;   STK07
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
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
;   r0x1037
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_main	;Function start
; 2 exit points
;	::->op : =
;	.line	43; "../main.c"	PLLCTL =0xb3;     //2倍频
	MOV	R0,# 0xb3
	BANKSEL	_PLLCTL
	MOV	_PLLCTL, R0
;	::->op : =
;	.line	44; "../main.c"	HFCKCTL =0xcf;//使能高频外设时钟，INTHF,16M
	MOV	R0,# 0xcf
	BANKSEL	_HFCKCTL
	MOV	_HFCKCTL, R0
;	::->op : =
;	.line	45; "../main.c"	SCLKCTL =0X7c;//禁止输出时钟，选择内部高频作为时钟源，分频器1:1分频
	MOV	R0,# 0x7c
	BANKSEL	_SCLKCTL
	MOV	_SCLKCTL, R0
;	::->op : CALL
;	.line	53; "../main.c"	PORT_Init();
	TRAPPC1	_PORT_Init
	TRAPPC2	_PORT_Init
	PAGESEL	_PORT_Init
	CALL	_PORT_Init
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : CALL
;	.line	54; "../main.c"	Timer1_Init();
	TRAPPC1	_Timer1_Init
	TRAPPC2	_Timer1_Init
	PAGESEL	_Timer1_Init
	CALL	_Timer1_Init
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : CALL
;	.line	55; "../main.c"	UART2_Init();
	TRAPPC1	_UART2_Init
	TRAPPC2	_UART2_Init
	PAGESEL	_UART2_Init
	CALL	_UART2_Init
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : SEND
;	::->op : CALL
;	.line	56; "../main.c"	Init_ADC(0x01);
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	TRAPPC1	_Init_ADC
	TRAPPC2	_Init_ADC
	PAGESEL	_Init_ADC
	CALL	_Init_ADC
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	59; "../main.c"	if(CAN_IDFilterConfig(0,1,0x24C0,0x0600) == OK) //配置CAN的识别的数据帧是，标准帧ID 为0x116 ，0x126 ，0x136//0x24c0 0x0f00
	MOV	R0,# 0x00
	BANKSEL	STK08
	MOV	STK08, R0
	MOV	R0,# 0x06
	BANKSEL	STK07
	MOV	STK07, R0
	MOV	R0,# 0x00
	BANKSEL	STK06
	MOV	STK06, R0
	MOV	R0,# 0x00
	BANKSEL	STK05
	MOV	STK05, R0
	MOV	R0,# 0xc0
	BANKSEL	STK04
	MOV	STK04, R0
	MOV	R0,# 0x24
	BANKSEL	STK03
	MOV	STK03, R0
	MOV	R0,# 0x00
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x00
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	TRAPPC1	_CAN_IDFilterConfig
	TRAPPC2	_CAN_IDFilterConfig
	PAGESEL	_CAN_IDFilterConfig
	CALL	_CAN_IDFilterConfig
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : EQ_OP
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	XOR	R0,# 0x01
	JB	PSW, 2
	JMP	_00002_DS_
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
;	.line	60; "../main.c"	CAN_Init(2,5,2,0,2);		//500K
	MOV	R0,# 0x02
	BANKSEL	STK03
	MOV	STK03, R0
	MOV	R0,# 0x00
	BANKSEL	STK02
	MOV	STK02, R0
	MOV	R0,# 0x02
	BANKSEL	STK01
	MOV	STK01, R0
	MOV	R0,# 0x05
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x02
	TRAPPC1	_CAN_Init
	TRAPPC2	_CAN_Init
	PAGESEL	_CAN_Init
	CALL	_CAN_Init
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : LABEL
;	::->op :*  =
_00002_DS_
;	.line	64; "../main.c"	PUIE = 1;
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 6
;	::->op :*  =
;	.line	65; "../main.c"	AIE = 1;
	BANKSEL	_INTCTL_bits
	SET	_INTCTL_bits, 7
;	::->op : SEND
;	::->op : CALL
;	.line	66; "../main.c"	delay_ms(300);
	MOV	R0,# 0x2c
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x01
	TRAPPC1	_delay_ms
	TRAPPC2	_delay_ms
	PAGESEL	_delay_ms
	CALL	_delay_ms
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : LABEL
;	::->op : CALL
_00027_DS_
;	.line	69; "../main.c"	keyl_detection();
	TRAPPC1	_keyl_detection
	TRAPPC2	_keyl_detection
	PAGESEL	_keyl_detection
	CALL	_keyl_detection
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : CALL
;	.line	74; "../main.c"	keyr_detection();
	TRAPPC1	_keyr_detection
	TRAPPC2	_keyr_detection
	PAGESEL	_keyr_detection
	CALL	_keyr_detection
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : <
;unsigned compare: left < lit(0x64=100), size=2
;	.line	78; "../main.c"	if(Time_count>=100)			//500ms
	MOV	R0,# 0x00
	BANKSEL	_Time_count
	SUB	R0, (_Time_count + 1)
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00059_DS_
	MOV	R0,# 0x64
	BANKSEL	_Time_count
	SUB	R0, _Time_count
_00059_DS_
	JB	PSW, 0
	JMP	_00018_DS_
;	::->op : =
;	.line	80; "../main.c"	Time_count=0;
	BANKSEL	_Time_count
	CLR	_Time_count
	BANKSEL	_Time_count
	CLR	(_Time_count + 1)
;	::->op : =
;	.line	83; "../main.c"	Status_fram =0;
	BANKSEL	_Status_fram
	CLR	_Status_fram
;	::->op : =
;	.line	84; "../main.c"	Data_fram =0;
	BANKSEL	_Data_fram
	CLR	_Data_fram
;	::->op : =
;	.line	85; "../main.c"	Fram_lenth =8;
	MOV	R0,# 0x08
	BANKSEL	_Fram_lenth
	MOV	_Fram_lenth, R0
;	::->op : =
;	.line	86; "../main.c"	ID_fram =0x243;
	MOV	R0,# 0x43
	BANKSEL	_ID_fram
	MOV	_ID_fram, R0
	MOV	R0,# 0x02
	BANKSEL	_ID_fram
	MOV	(_ID_fram + 1), R0
;	::->op : =
;	.line	89; "../main.c"	while(!TXBSTA)//等待CPU可以访问发送缓冲器
	BANKSEL	r0x102E
	CLR	r0x102E
	BANKSEL	r0x102F
	CLR	r0x102F
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00005_DS_
	BANKSEL	_CANSTA_bits
	JNB	_CANSTA_bits, 2
	JMP	_00007_DS_
;	::->op : GET_VALUE_AT_ADDRESS
;	::->op : !
;	::->op :*  =
;	.line	91; "../main.c"	P3LR0 =!P3LR0;
	BANKSEL	_P3LR_bits
	JB	_P3LR_bits, 0
	JMP	_00060_DS_
	BANKSEL	_P3LR_bits
	CLR	_P3LR_bits, 0
	JMP	_00061_DS_
_00060_DS_
	BANKSEL	_P3LR_bits
	SET	_P3LR_bits, 0
;	::->op : +
_00061_DS_
;	.line	92; "../main.c"	if(++Delay_Count>0xFE0)
	BANKSEL	r0x102E
	INC	r0x102E
	JB	PSW, 2
	JMP	_00095_DS_
	BANKSEL	r0x102F
	INC	r0x102F
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFE1=4065), size=2
_00095_DS_
	MOV	R0,# 0x0f
	BANKSEL	r0x102F
	SUB	R0, r0x102F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00062_DS_
	MOV	R0,# 0xe1
	BANKSEL	r0x102E
	SUB	R0, r0x102E
_00062_DS_
	JB	PSW, 0
	JMP	_00005_DS_
;	::->op : LABEL
;	::->op : =
_00007_DS_
;	.line	96; "../main.c"	CANTXINF = (Status_fram<<7)|(Data_fram<<6)|Fram_lenth;
	MOV	R0,# 0x08
	BANKSEL	_CANTXINF
	MOV	_CANTXINF, R0
;	::->op : LEFT_OP
;	.line	99; "../main.c"	ID_fram <<=5;
	MOV	R0,# 0x05
	INC	R0
	JMP	_00064_DS_
_00063_DS_
	CLR	PSW, 0
	BANKSEL	_ID_fram
	RLC	_ID_fram
	BANKSEL	_ID_fram
	RLC	(_ID_fram + 1)
_00064_DS_
	DECJZ	R0
	JMP	_00063_DS_
;	::->op : RIGHT_OP
;	.line	100; "../main.c"	CANTXID0=ID_fram >> 8;
	BANKSEL	_ID_fram
	MOVZ	R0, (_ID_fram + 1)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
	BANKSEL	r0x102F
	CLR	r0x102F
;	::->op : CAST
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	_CANTXID0
	MOV	_CANTXID0, R0
;	::->op : CAST
;	.line	101; "../main.c"	CANTXID1=(unsigned char)ID_fram;
	BANKSEL	_ID_fram
	MOVZ	R0, _ID_fram
	BANKSEL	_CANTXID1
	MOV	_CANTXID1, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	104; "../main.c"	CANTXID2=TX_Data[0];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 0)
	BANKSEL	_CANTXID2
	MOV	_CANTXID2, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	105; "../main.c"	CANTXID3=TX_Data[1];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 1)
	BANKSEL	_CANTXID3
	MOV	_CANTXID3, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	106; "../main.c"	CANTXDT0=TX_Data[2];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 2)
	BANKSEL	_CANTXDT0
	MOV	_CANTXDT0, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	107; "../main.c"	CANTXDT1=TX_Data[3];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 3)
	BANKSEL	_CANTXDT1
	MOV	_CANTXDT1, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	108; "../main.c"	CANTXDT2=TX_Data[4];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 4)
	BANKSEL	_CANTXDT2
	MOV	_CANTXDT2, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	109; "../main.c"	CANTXDT3=TX_Data[5];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 5)
	BANKSEL	_CANTXDT3
	MOV	_CANTXDT3, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	110; "../main.c"	CANTXDT4=TX_Data[6];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 6)
	BANKSEL	_CANTXDT4
	MOV	_CANTXDT4, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	111; "../main.c"	CANTXDT5=TX_Data[7];
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 7)
	BANKSEL	_CANTXDT5
	MOV	_CANTXDT5, R0
;	::->op : =
;	.line	116; "../main.c"	CANCMR = 0x03;
	MOV	R0,# 0x03
	BANKSEL	_CANCMR
	MOV	_CANCMR, R0
;	::->op : =
;	.line	119; "../main.c"	while(!TCSTA)
	BANKSEL	r0x102E
	CLR	r0x102E
	BANKSEL	r0x102F
	CLR	r0x102F
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00014_DS_
	BANKSEL	_CANSTA_bits
	JNB	_CANSTA_bits, 3
	JMP	_00018_DS_
;	::->op : +
;	.line	121; "../main.c"	if(++Delay_Count>0xFE0)
	BANKSEL	r0x102E
	INC	r0x102E
	JB	PSW, 2
	JMP	_00096_DS_
	BANKSEL	r0x102F
	INC	r0x102F
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xFE1=4065), size=2
_00096_DS_
	MOV	R0,# 0x0f
	BANKSEL	r0x102F
	SUB	R0, r0x102F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00065_DS_
	MOV	R0,# 0xe1
	BANKSEL	r0x102E
	SUB	R0, r0x102E
_00065_DS_
	JB	PSW, 0
	JMP	_00014_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00018_DS_
;	.line	129; "../main.c"	if(CANRXIF)
	BANKSEL	_CANIF_bits
	JB	_CANIF_bits, 0
	JMP	_00027_DS_
;	::->op : <
;unsigned compare: left < lit(0x8=8), size=1
;	.line	132; "../main.c"	if(can_data_hand<8)
	MOV	R0,# 0x08
	BANKSEL	_can_data_hand
	SUB	R0, _can_data_hand
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00020_DS_
;	::->op : *
;	.line	134; "../main.c"	can_point =0x1C80 + can_data_hand * 0x10;
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
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	STK00
	MOV	R0, STK00
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : +
	MOV	R0,# 0x80
	BANKSEL	r0x102E
	ADD	r0x102E, R0
	MOV	R0,# 0x1c
	JNB	PSW, 0
	MOV	R0,# 0x1d
	BANKSEL	r0x102F
	ADD	r0x102F, R0
;	::->op : CAST
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	r0x1030
	MOV	r0x1030, R0
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	r0x1031
	MOV	r0x1031, R0
;	::->op : GOTO
	JMP	_00021_DS_
;	::->op : LABEL
;	::->op : CAST
_00020_DS_
;	.line	138; "../main.c"	can_point =0x1D80+(can_data_hand-8)*0x10;
	BANKSEL	_can_data_hand
	MOVZ	R0, _can_data_hand
	BANKSEL	r0x102E
	MOV	r0x102E, R0
	BANKSEL	r0x102F
	CLR	r0x102F
;	::->op : -
	MOV	R0,# 0xf8
	BANKSEL	r0x102E
	ADD	r0x102E, R0
	JNB	PSW, 0
	JMP	_00097_DS_
	BANKSEL	r0x102F
	DEC	r0x102F
;	::->op : LEFT_OP
_00097_DS_
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	r0x1032
	MOV	r0x1032, R0
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	r0x1033
	MOV	r0x1033, R0
	MOV	R0,# 0x04
	INC	R0
	JMP	_00068_DS_
_00067_DS_
	CLR	PSW, 0
	BANKSEL	r0x1032
	RLC	r0x1032
	BANKSEL	r0x1033
	RLC	r0x1033
_00068_DS_
	DECJZ	R0
	JMP	_00067_DS_
;	::->op : +
	MOV	R0,# 0x80
	BANKSEL	r0x1032
	ADD	R0, r0x1032
	BANKSEL	r0x102E
	MOV	r0x102E, R0
	MOV	R0,# 0x1d
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00098_DS_
	BANKSEL	r0x102F
	ADD	r0x102F, R0
;	::->op : CAST
_00098_DS_
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	r0x1030
	MOV	r0x1030, R0
	BANKSEL	r0x102F
	MOVZ	R0, r0x102F
	BANKSEL	r0x1031
	MOV	r0x1031, R0
;	::->op : LABEL
;	::->op : +
_00021_DS_
;	.line	140; "../main.c"	can_data_hand++;//指针+1
	BANKSEL	_can_data_hand
	INC	_can_data_hand
;	::->op : EQ_OP
;	.line	141; "../main.c"	if(can_data_hand==16)//若指针指向15以上，返回0
	BANKSEL	_can_data_hand
	MOVZ	R0, _can_data_hand
;	.line	143; "../main.c"	can_data_hand=0;
	XOR	R0,# 0x10
;	.line	146; "../main.c"	for(i=0;i<13;i++)
	JB	PSW, 2
	JMP	_00099_DS_
	BANKSEL	_can_data_hand
	CLR	_can_data_hand
_00099_DS_
	BANKSEL	r0x102E
	CLR	r0x102E
_00029_DS_
	MOV	R0,# 0x0d
	BANKSEL	r0x102E
	SUB	R0, r0x102E
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00032_DS_
;	::->op : +
;	.line	148; "../main.c"	CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
	BANKSEL	r0x102E
	MOV	R0, r0x102E
	ADD	R0,# (_CAN_Rev_BUF + 0)
	BANKSEL	r0x102F
	MOV	r0x102F, R0
;	::->op : CAST
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	r0x1033
	MOV	r0x1033, R0
	BANKSEL	r0x1034
	CLR	r0x1034
;	::->op : +
	BANKSEL	r0x1030
	MOV	R0, r0x1030
	BANKSEL	r0x1033
	ADD	r0x1033, R0
	BANKSEL	r0x1031
	MOVZ	R0, r0x1031
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00100_DS_
	BANKSEL	r0x1034
	ADD	r0x1034, R0
;	::->op : CAST
;;104	MOVZ	R0, r0x1034
;;102	MOV	r0x1035, R0
;;101	MOVZ	R0, r0x1033
;;99	MOV	r0x1036, R0
;;1	CLR	r0x1037
;	::->op : GET_VALUE_AT_ADDRESS
;;100	MOVZ	R0, r0x1036
_00100_DS_
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	STK01
	MOV	STK01, R0
;;103	MOVZ	R0, r0x1035
	BANKSEL	r0x1034
	MOVZ	R0, r0x1034
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
	BANKSEL	r0x1033
	MOV	r0x1033, R0
;	::->op :*  =
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	r0x102F
	MOV	R1, r0x102F
	BANKSEL	_CAN_Rev_BUF
	ST	[R1], R0
;	::->op : +
;	.line	146; "../main.c"	for(i=0;i<13;i++)
	BANKSEL	r0x102E
	INC	r0x102E
;	::->op : GOTO
	JMP	_00029_DS_
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00032_DS_
;	.line	151; "../main.c"	Status_fram =(CAN_Rev_BUF[0]&0x80) >>7; //0是标准帧
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x80
	BANKSEL	r0x102E
	AND	r0x102E, R0
;	::->op : RIGHT_OP
	BANKSEL	r0x102E
	RLCR	r0x102E
	BANKSEL	_Status_fram
	CLR	_Status_fram
	BANKSEL	_Status_fram
	RLC	_Status_fram
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	152; "../main.c"	Data_fram =(CAN_Rev_BUF[0]&0x40) >>6; //0是数据帧
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x40
	BANKSEL	r0x102E
	AND	r0x102E, R0
;	::->op : RIGHT_OP
	BANKSEL	r0x102E
	SWAPR	R0, r0x102E
	AND	R0,# 0x0f
	BANKSEL	_Data_fram
	MOV	_Data_fram, R0
	CLR	PSW, 0
	BANKSEL	_Data_fram
	RRC	_Data_fram
	CLR	PSW, 0
	BANKSEL	_Data_fram
	RRC	_Data_fram
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	153; "../main.c"	Fram_lenth =CAN_Rev_BUF[0]&0x0F; //数据长度
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 0)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : BITWISEAND
	MOV	R0,# 0x0f
	BANKSEL	r0x102E
	AND	R0, r0x102E
	BANKSEL	_Fram_lenth
	MOV	_Fram_lenth, R0
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	155; "../main.c"	ID_fram =CAN_Rev_BUF[1];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 1)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
	BANKSEL	_ID_fram
	MOV	_ID_fram, R0
;	::->op : CAST
;;105	MOVZ	R0, r0x102E
	BANKSEL	_ID_fram
	CLR	(_ID_fram + 1)
;	::->op : LEFT_OP
;	.line	156; "../main.c"	ID_fram <<=8;
	BANKSEL	_ID_fram
	MOVZ	R0, _ID_fram
	BANKSEL	_ID_fram
	MOV	(_ID_fram + 1), R0
	BANKSEL	_ID_fram
	CLR	_ID_fram
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	157; "../main.c"	ID_fram += CAN_Rev_BUF[2];
	BANKSEL	_CAN_Rev_BUF
	MOVZ	R0,  (_CAN_Rev_BUF + 2)
	BANKSEL	r0x102E
	MOV	r0x102E, R0
;	::->op : CAST
	BANKSEL	r0x102E
	MOVZ	R0, r0x102E
	BANKSEL	r0x102F
	MOV	r0x102F, R0
	BANKSEL	r0x1030
	CLR	r0x1030
;	::->op : +
	BANKSEL	r0x102F
	MOV	R0, r0x102F
	BANKSEL	_ID_fram
	ADD	_ID_fram, R0
	MOV	R0,# 0x00
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00101_DS_
	BANKSEL	_ID_fram
	ADD	(_ID_fram + 1), R0
;	::->op : RIGHT_OP
_00101_DS_
;	.line	158; "../main.c"	ID_fram >>=5; //数据长度
	MOV	R0,# 0x05
	INC	R0
	JMP	_00071_DS_
_00070_DS_
	CLR	PSW, 0
	BANKSEL	_ID_fram
	RRC	(_ID_fram + 1)
	BANKSEL	_ID_fram
	RRC	_ID_fram
_00071_DS_
	DECJZ	R0
	JMP	_00070_DS_
;	::->op : =
;	.line	159; "../main.c"	for (i =0;i<8;i++)
	BANKSEL	r0x102E
	CLR	r0x102E
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x8=8), size=1
_00033_DS_
	MOV	R0,# 0x08
	BANKSEL	r0x102E
	SUB	R0, r0x102E
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00036_DS_
;	::->op : +
;	.line	161; "../main.c"	Data[i]=CAN_Rev_BUF[i+3];
	BANKSEL	r0x102E
	MOV	R0, r0x102E
	ADD	R0,# (_Data + 0)
	BANKSEL	r0x102F
	MOV	r0x102F, R0
;	::->op : +
	MOV	R0,# 0x03
	BANKSEL	r0x102E
	ADD	R0, r0x102E
	BANKSEL	r0x1031
	MOV	r0x1031, R0
;	::->op : +
	MOV	R0,# (_CAN_Rev_BUF + 0)
	BANKSEL	r0x1031
	ADD	r0x1031, R0
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	r0x1031
	MOV	R1, r0x1031
	BANKSEL	_CAN_Rev_BUF
	LD	R0, [R1]
	BANKSEL	r0x1033
	MOV	r0x1033, R0
;	::->op :*  =
	BANKSEL	r0x1033
	MOVZ	R0, r0x1033
	BANKSEL	r0x102F
	MOV	R1, r0x102F
	BANKSEL	_Data
	ST	[R1], R0
;	::->op : +
;	.line	159; "../main.c"	for (i =0;i<8;i++)
	BANKSEL	r0x102E
	INC	r0x102E
;	::->op : GOTO
	JMP	_00033_DS_
;	::->op : LABEL
;	::->op : =
_00036_DS_
;	.line	165; "../main.c"	CANCMR = 0x04;//促使信息计数器减1
	MOV	R0,# 0x04
	BANKSEL	_CANCMR
	MOV	_CANCMR, R0
;	::->op :*  =
;	.line	166; "../main.c"	CANRXIF =0;
	BANKSEL	_CANIF_bits
	CLR	_CANIF_bits, 0
;	::->op : GOTO
	JMP	_00027_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _main



func._Main_CleanTimeSet	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Main_CleanTimeSet	;Function start
; 2 exit points
;has an exit
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_Main_CleanTimeSet	;Function start
; 2 exit points
;	::->op : =
;	.line	192; "../main.c"	cleantime = 0U;
	BANKSEL	_cleantime
	CLR	_cleantime
	BANKSEL	_cleantime
	CLR	(_cleantime + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
; exit point of _Main_CleanTimeSet



func._Main_DataClean	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Main_DataClean	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x102D
;; Starting PostCode block
;	::->op : LABEL
;	::->op : FUNCTION
_Main_DataClean	;Function start
; 2 exit points
;	::->op : GET_VALUE_AT_ADDRESS
;	.line	178; "../main.c"	if (TX_Data[0]!= 0U || TX_Data[1]!= 0U)
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 0)
	BANKSEL	r0x102D
	MOV	r0x102D, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x102D
	ORL	R0, r0x102D
	JB	PSW, 2
	JMP	_00075_DS_
;	::->op : GET_VALUE_AT_ADDRESS
	BANKSEL	_TX_Data
	MOVZ	R0,  (_TX_Data + 1)
	BANKSEL	r0x102D
	MOV	r0x102D, R0
;	::->op : IFX
	MOV	R0,# 0x00
	BANKSEL	r0x102D
	ORL	R0, r0x102D
	JNB	PSW, 2
	JMP	_00078_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x64=100), size=2
_00075_DS_
;	.line	180; "../main.c"	if (cleantime >= 100)
	MOV	R0,# 0x00
	BANKSEL	_cleantime
	SUB	R0, (_cleantime + 1)
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00082_DS_
	MOV	R0,# 0x64
	BANKSEL	_cleantime
	SUB	R0, _cleantime
_00082_DS_
	JB	PSW, 0
	JMP	_00078_DS_
;	::->op : =
;	.line	182; "../main.c"	cleantime = 0;
	BANKSEL	_cleantime
	CLR	_cleantime
	BANKSEL	_cleantime
	CLR	(_cleantime + 1)
;	::->op :*  =
;	.line	183; "../main.c"	TX_Data[0] = 0U;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op :*  =
;	.line	184; "../main.c"	TX_Data[1] = 0U;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 1)
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00078_DS_
	CRET	
; exit point of _Main_DataClean


;	code size estimation:
;	  447+  209 =   656 instructions ( 1730 byte)


	.end
