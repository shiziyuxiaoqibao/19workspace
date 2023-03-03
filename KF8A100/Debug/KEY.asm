;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
	.file	"../KEY.c"
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
	.extern	_TX_Data
	.extern	_key_count
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
	.global	_keyr_detection
	.global	_keyl_detection
	.global	_KeyToCanvalue1
	.global	_KeyToCanvalue
	.global	_currentkeyleft
	.global	_currentkey
	.global	_Upper_dif
	.global	_Low_Dif
	.global	_Key_Number
	.global	_Left_Keyboader_value
	.global	_Right_Keyboader_value
	.global	_Left_Keyboader_value_o
	.global	_Right_Keyboader_value_o
	.global	_Left_key_count
	.global	_Right_key_count
	.global	_Left_key_count_o
	.global	_Right_key_count_o
	.global	_Stuck_Flag
	.global	_DC_DATA
	.global	_dif
	.global	_KeyAD
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
UD_KEY_0	.udata
_Upper_dif	.res	2

UD_KEY_1	.udata
_Low_Dif	.res	2

UD_KEY_2	.udata
_Key_Number	.res	1

UD_KEY_3	.udata
_Left_Keyboader_value	.res	1

UD_KEY_4	.udata
_Right_Keyboader_value	.res	1

UD_KEY_5	.udata
_Left_Keyboader_value_o	.res	1

UD_KEY_6	.udata
_Right_Keyboader_value_o	.res	1

UD_KEY_7	.udata
_Left_key_count	.res	2

UD_KEY_8	.udata
_Right_key_count	.res	2

UD_KEY_9	.udata
_Left_key_count_o	.res	2

UD_KEY_10	.udata
_Right_key_count_o	.res	2

UD_KEY_11	.udata
_Stuck_Flag	.res	1

UD_KEY_12	.udata
_DC_DATA	.res	2

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_KEY_0	.udata
r0x1020	.res	1
UDL_KEY_1	.udata
r0x101F	.res	1
UDL_KEY_2	.udata
r0x1021	.res	1
UDL_KEY_3	.udata
r0x1015	.res	1
UDL_KEY_4	.udata
r0x1014	.res	1
UDL_KEY_5	.udata
r0x1016	.res	1
UDL_KEY_6	.udata
r0x1022	.res	1
UDL_KEY_7	.udata
r0x1023	.res	1
UDL_KEY_8	.udata
r0x1024	.res	1
UDL_KEY_9	.udata
r0x1025	.res	1
UDL_KEY_10	.udata
r0x1017	.res	1
UDL_KEY_11	.udata
r0x1018	.res	1
UDL_KEY_12	.udata
r0x1019	.res	1
UDL_KEY_13	.udata
r0x101A	.res	1
UDL_KEY_14	.udata
r0x1027	.res	1
UDL_KEY_15	.udata
r0x1026	.res	1
UDL_KEY_16	.udata
r0x1028	.res	1
UDL_KEY_17	.udata
r0x101C	.res	1
UDL_KEY_18	.udata
r0x101B	.res	1
UDL_KEY_19	.udata
r0x101D	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_KEY_0	.code
_dif
	RRET R0, #0x01


ID_KEY_1	.code
_KeyAD
	RRET R0, #0x39
	RRET R0, #0x00
	RRET R0, #0x83
	RRET R0, #0x00
	RRET R0, #0xea
	RRET R0, #0x00
	RRET R0, #0xe5
	RRET R0, #0x00
	RRET R0, #0x13
	RRET R0, #0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._keyr_detection	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _keyr_detection	;Function start
; 2 exit points
;has an exit
;functions called:
;   _currentkeyleft
;   _KeyToCanvalue1
;   _currentkeyleft
;   _KeyToCanvalue1
;6 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;   r0x101D
;   r0x101E
;   STK01
;; Starting PostCode block
	.def _keyr_detection_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_keyr_detection	;Function start
; 2 exit points
;	::->op : CALL
	.line	263; "../KEY.c"	Right_Keyboader_value =currentkeyleft();
	TRAPPC1	_currentkeyleft
	TRAPPC2	_currentkeyleft
	PAGESEL	_currentkeyleft
	CALL	_currentkeyleft
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x101B
	MOV	r0x101B, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x101C
	MOV	r0x101C, R0
	BANKSEL	_Right_Keyboader_value
	MOV	_Right_Keyboader_value, R0
;	::->op : CAST
;;104	MOVZ	R0, r0x101C
;	::->op : EQ_OP
	.line	264; "../KEY.c"	if(Right_Keyboader_value != Right_Keyboader_value_o)
	BANKSEL	_Right_Keyboader_value_o
	MOVZ	R0, _Right_Keyboader_value_o
	.line	265; "../KEY.c"	Right_key_count =0;
	BANKSEL	_Right_Keyboader_value
	XOR	R0, _Right_Keyboader_value
	JNB	PSW, 2
	JMP	_00219_DS_
	BANKSEL	_Right_key_count
	CLR	_Right_key_count
	BANKSEL	_Right_key_count
	CLR	(_Right_key_count + 1)
;	::->op : GOTO
	JMP	_00227_DS_
;	::->op : LABEL
;	::->op : CAST
_00219_DS_
	.line	268; "../KEY.c"	if(Right_key_count <65530) //键值长期不变的情况下，阻止计数值溢出
	BANKSEL	_Right_key_count
	MOVZ	R0, _Right_key_count
	BANKSEL	r0x101C
	MOV	r0x101C, R0
	BANKSEL	_Right_key_count
	MOVZ	R0, (_Right_key_count + 1)
	BANKSEL	r0x101B
	MOV	r0x101B, R0
	BANKSEL	r0x101D
	CLR	r0x101D
;;1	CLR	r0x101E
;	::->op : <
;signed compare: left < lit(0xFFFA=65530), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00226_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x101D
	SUB	R0, r0x101D
	JB	PSW, 2
	JMP	_00226_DS_
	MOV	R0,# 0xff
	BANKSEL	r0x101B
	SUB	R0, r0x101B
	JB	PSW, 2
	JMP	_00226_DS_
	MOV	R0,# 0xfa
	BANKSEL	r0x101C
	SUB	R0, r0x101C
_00226_DS_
	JNB	PSW, 0
	JMP	_00227_DS_
;	::->op : +
	.line	270; "../KEY.c"	Right_key_count ++;
	BANKSEL	_Right_key_count
	INC	_Right_key_count
	JB	PSW, 2
	JMP	_00227_DS_
	BANKSEL	_Right_key_count
	INC	(_Right_key_count + 1)
;	::->op : LABEL
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
_00227_DS_
	.line	272; "../KEY.c"	KeyToCanvalue1(Right_Keyboader_value,Right_key_count);
	BANKSEL	_Right_key_count
	MOVZ	R0, _Right_key_count
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	_Right_key_count
	MOVZ	R0, (_Right_key_count + 1)
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	_Right_Keyboader_value
	MOVZ	R0, _Right_Keyboader_value
	TRAPPC1	_KeyToCanvalue1
	TRAPPC2	_KeyToCanvalue1
	PAGESEL	_KeyToCanvalue1
	CALL	_KeyToCanvalue1
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : =
	.line	273; "../KEY.c"	Right_key_count_o =Right_key_count;
	BANKSEL	_Right_key_count
	MOVZ	R0, _Right_key_count
	BANKSEL	_Right_key_count_o
	MOV	_Right_key_count_o, R0
	BANKSEL	_Right_key_count
	MOVZ	R0, (_Right_key_count + 1)
	BANKSEL	_Right_key_count_o
	MOV	(_Right_key_count_o + 1), R0
;	::->op : =
	.line	274; "../KEY.c"	Right_Keyboader_value_o =Right_Keyboader_value;;
	BANKSEL	_Right_Keyboader_value
	MOVZ	R0, _Right_Keyboader_value
	BANKSEL	_Right_Keyboader_value_o
	MOV	_Right_Keyboader_value_o, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _keyr_detection_function_end, debug, value=$

; exit point of _keyr_detection



func._keyl_detection	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _keyl_detection	;Function start
; 2 exit points
;has an exit
;functions called:
;   _currentkey
;   _KeyToCanvalue
;   _currentkey
;   _KeyToCanvalue
;6 compiler assigned registers:
;   r0x1026
;   STK00
;   r0x1027
;   r0x1028
;   r0x1029
;   STK01
;; Starting PostCode block
	.def _keyl_detection_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_keyl_detection	;Function start
; 2 exit points
;	::->op : CALL
	.line	247; "../KEY.c"	Left_Keyboader_value =currentkey();
	TRAPPC1	_currentkey
	TRAPPC2	_currentkey
	PAGESEL	_currentkey
	CALL	_currentkey
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1026
	MOV	r0x1026, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1027
	MOV	r0x1027, R0
	BANKSEL	_Left_Keyboader_value
	MOV	_Left_Keyboader_value, R0
;	::->op : CAST
;;103	MOVZ	R0, r0x1027
;	::->op : EQ_OP
	.line	248; "../KEY.c"	if(Left_Keyboader_value != Left_Keyboader_value_o)
	BANKSEL	_Left_Keyboader_value_o
	MOVZ	R0, _Left_Keyboader_value_o
	.line	249; "../KEY.c"	Left_key_count =0;
	BANKSEL	_Left_Keyboader_value
	XOR	R0, _Left_Keyboader_value
	JNB	PSW, 2
	JMP	_00208_DS_
	BANKSEL	_Left_key_count
	CLR	_Left_key_count
	BANKSEL	_Left_key_count
	CLR	(_Left_key_count + 1)
;	::->op : GOTO
	JMP	_00228_DS_
;	::->op : LABEL
;	::->op : CAST
_00208_DS_
	.line	252; "../KEY.c"	if(Left_key_count <65530) //键值长期不变的情况下，阻止计数值溢出
	BANKSEL	_Left_key_count
	MOVZ	R0, _Left_key_count
	BANKSEL	r0x1027
	MOV	r0x1027, R0
	BANKSEL	_Left_key_count
	MOVZ	R0, (_Left_key_count + 1)
	BANKSEL	r0x1026
	MOV	r0x1026, R0
	BANKSEL	r0x1028
	CLR	r0x1028
;;1	CLR	r0x1029
;	::->op : <
;signed compare: left < lit(0xFFFA=65530), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00215_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1028
	SUB	R0, r0x1028
	JB	PSW, 2
	JMP	_00215_DS_
	MOV	R0,# 0xff
	BANKSEL	r0x1026
	SUB	R0, r0x1026
	JB	PSW, 2
	JMP	_00215_DS_
	MOV	R0,# 0xfa
	BANKSEL	r0x1027
	SUB	R0, r0x1027
_00215_DS_
	JNB	PSW, 0
	JMP	_00228_DS_
;	::->op : +
	.line	253; "../KEY.c"	Left_key_count ++;
	BANKSEL	_Left_key_count
	INC	_Left_key_count
	JB	PSW, 2
	JMP	_00228_DS_
	BANKSEL	_Left_key_count
	INC	(_Left_key_count + 1)
;	::->op : LABEL
;	::->op : SEND
;	::->op : SEND
;	::->op : CALL
_00228_DS_
	.line	255; "../KEY.c"	KeyToCanvalue(Left_Keyboader_value,Left_key_count);
	BANKSEL	_Left_key_count
	MOVZ	R0, _Left_key_count
	BANKSEL	STK01
	MOV	STK01, R0
	BANKSEL	_Left_key_count
	MOVZ	R0, (_Left_key_count + 1)
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	_Left_Keyboader_value
	MOVZ	R0, _Left_Keyboader_value
	TRAPPC1	_KeyToCanvalue
	TRAPPC2	_KeyToCanvalue
	PAGESEL	_KeyToCanvalue
	CALL	_KeyToCanvalue
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : =
	.line	256; "../KEY.c"	Left_key_count_o = Left_key_count;
	BANKSEL	_Left_key_count
	MOVZ	R0, _Left_key_count
	BANKSEL	_Left_key_count_o
	MOV	_Left_key_count_o, R0
	BANKSEL	_Left_key_count
	MOVZ	R0, (_Left_key_count + 1)
	BANKSEL	_Left_key_count_o
	MOV	(_Left_key_count_o + 1), R0
;	::->op : =
	.line	257; "../KEY.c"	Left_Keyboader_value_o =Left_Keyboader_value;
	BANKSEL	_Left_Keyboader_value
	MOVZ	R0, _Left_Keyboader_value
	BANKSEL	_Left_Keyboader_value_o
	MOV	_Left_Keyboader_value_o, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _keyl_detection_function_end, debug, value=$

; exit point of _keyl_detection



func._KeyToCanvalue1	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _KeyToCanvalue1	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Main_DataClean
;   _Main_CleanTimeSet
;   _Main_DataClean
;   _Main_CleanTimeSet
;9 compiler assigned registers:
;   r0x1014
;   STK00
;   r0x1015
;   STK01
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting PostCode block
	.def _KeyToCanvalue1_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_KeyToCanvalue1	;Function start
; 2 exit points
;	::->op : RECEIVE
	.line	179; "../KEY.c"	void KeyToCanvalue1(unsigned char keyvalue1, unsigned int keycnt1)
	BANKSEL	r0x1014
	MOV	r0x1014, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1015
	MOV	r0x1015, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : <
;unsigned compare: left < lit(0x1=1), size=1
	.line	181; "../KEY.c"	switch(keyvalue1)
	MOV	R0,# 0x01
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=1
	MOV	R0,# 0x06
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00173_DS_
;	::->op : -
	BANKSEL	r0x1014
	DECR	r0x1014
	BANKSEL	r0x1017
	MOV	r0x1017, R0
;	::->op : JUMPTABLE
	MOV	R1,#high _00194_DS_
	MOV	R0,#_00194_DS_
	BANKSEL	r0x1017
	ADD	R0, r0x1017
	JNB	PSW, 0
	INC	R1
	TRAPPC3	$
	MOV	PCH, R1
	MOV	PCL, R0
_00194_DS_
	JMP	_00143_DS_
	JMP	_00149_DS_
	JMP	_00155_DS_
	JMP	_00161_DS_
	JMP	_00167_DS_
;	::->op : LABEL
;	::->op : CAST
_00143_DS_
	.line	184; "../KEY.c"	if(keycnt1>50000)//连续5次检测结果保持同一键值，确认按键为短按
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	MOV	r0x1017, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1019
	CLR	r0x1019
	BANKSEL	r0x101A
	CLR	r0x101A
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00195_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1019
	SUB	R0, r0x1019
	JB	PSW, 2
	JMP	_00195_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1018
	SUB	R0, r0x1018
	JB	PSW, 2
	JMP	_00195_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1017
	SUB	R0, r0x1017
_00195_DS_
	JB	PSW, 0
	JMP	_00147_DS_
;	::->op :*  =
	.line	186; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00147_DS_
	.line	188; "../KEY.c"	else if(keycnt1>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1015
	SUB	R0, r0x1015
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00196_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1016
	SUB	R0, r0x1016
_00196_DS_
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op :*  =
	.line	190; "../KEY.c"	TX_Data[0]=0x01;//接听
	MOV	R0,# 0x01
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	192; "../KEY.c"	break;
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : CAST
_00149_DS_
	.line	194; "../KEY.c"	if(keycnt1>50000)
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	MOV	r0x1017, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1019
	CLR	r0x1019
	BANKSEL	r0x101A
	CLR	r0x101A
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00197_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1019
	SUB	R0, r0x1019
	JB	PSW, 2
	JMP	_00197_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1018
	SUB	R0, r0x1018
	JB	PSW, 2
	JMP	_00197_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1017
	SUB	R0, r0x1017
_00197_DS_
	JB	PSW, 0
	JMP	_00153_DS_
;	::->op :*  =
	.line	196; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00153_DS_
	.line	198; "../KEY.c"	else if(keycnt1>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1015
	SUB	R0, r0x1015
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00198_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1016
	SUB	R0, r0x1016
_00198_DS_
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op :*  =
	.line	200; "../KEY.c"	TX_Data[0]=0x04;//音量+
	MOV	R0,# 0x04
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	202; "../KEY.c"	break;
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : CAST
_00155_DS_
	.line	204; "../KEY.c"	if(keycnt1>50000)
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	MOV	r0x1017, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1019
	CLR	r0x1019
	BANKSEL	r0x101A
	CLR	r0x101A
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00199_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1019
	SUB	R0, r0x1019
	JB	PSW, 2
	JMP	_00199_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1018
	SUB	R0, r0x1018
	JB	PSW, 2
	JMP	_00199_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1017
	SUB	R0, r0x1017
_00199_DS_
	JB	PSW, 0
	JMP	_00159_DS_
;	::->op :*  =
	.line	206; "../KEY.c"	TX_Data[1]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 1)
;	::->op : GOTO
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00159_DS_
	.line	208; "../KEY.c"	else if(keycnt1>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1015
	SUB	R0, r0x1015
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00200_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1016
	SUB	R0, r0x1016
_00200_DS_
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op :*  =
	.line	210; "../KEY.c"	TX_Data[0]=0x08;//静音
	MOV	R0,# 0x08
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	212; "../KEY.c"	break;
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : CAST
_00161_DS_
	.line	214; "../KEY.c"	if(keycnt1>50000)
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	MOV	r0x1017, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1019
	CLR	r0x1019
	BANKSEL	r0x101A
	CLR	r0x101A
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00201_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1019
	SUB	R0, r0x1019
	JB	PSW, 2
	JMP	_00201_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1018
	SUB	R0, r0x1018
	JB	PSW, 2
	JMP	_00201_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1017
	SUB	R0, r0x1017
_00201_DS_
	JB	PSW, 0
	JMP	_00165_DS_
;	::->op :*  =
	.line	216; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00165_DS_
	.line	218; "../KEY.c"	else if(keycnt1>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1015
	SUB	R0, r0x1015
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00202_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1016
	SUB	R0, r0x1016
_00202_DS_
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op :*  =
	.line	220; "../KEY.c"	TX_Data[0]=0x10;   //音量-
	MOV	R0,# 0x10
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	222; "../KEY.c"	break;
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : CAST
_00167_DS_
	.line	224; "../KEY.c"	if(keycnt1>50000)
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1017
	MOV	r0x1017, R0
	BANKSEL	r0x1015
	MOVZ	R0, r0x1015
	BANKSEL	r0x1018
	MOV	r0x1018, R0
	BANKSEL	r0x1019
	CLR	r0x1019
	BANKSEL	r0x101A
	CLR	r0x101A
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00203_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1019
	SUB	R0, r0x1019
	JB	PSW, 2
	JMP	_00203_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1018
	SUB	R0, r0x1018
	JB	PSW, 2
	JMP	_00203_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1017
	SUB	R0, r0x1017
_00203_DS_
	JB	PSW, 0
	JMP	_00171_DS_
;	::->op :*  =
	.line	226; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00173_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00171_DS_
	.line	228; "../KEY.c"	else if(keycnt1>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1015
	SUB	R0, r0x1015
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00204_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1016
	SUB	R0, r0x1016
_00204_DS_
	JB	PSW, 0
	JMP	_00173_DS_
;	::->op :*  =
	.line	230; "../KEY.c"	TX_Data[0]=0x02;   //挂断
	MOV	R0,# 0x02
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : LABEL
;	::->op : IFX
_00173_DS_
	.line	234; "../KEY.c"	if (keyvalue1 == 0U)
	MOV	R0,# 0x00
	BANKSEL	r0x1014
	ORL	R0, r0x1014
	JB	PSW, 2
	JMP	_00175_DS_
;	::->op : CALL
	.line	236; "../KEY.c"	Main_DataClean();
	TRAPPC1	_Main_DataClean
	TRAPPC2	_Main_DataClean
	PAGESEL	_Main_DataClean
	CALL	_Main_DataClean
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : GOTO
	JMP	_00177_DS_
;	::->op : LABEL
;	::->op : CALL
_00175_DS_
	.line	240; "../KEY.c"	Main_CleanTimeSet();
	TRAPPC1	_Main_CleanTimeSet
	TRAPPC2	_Main_CleanTimeSet
	PAGESEL	_Main_CleanTimeSet
	CALL	_Main_CleanTimeSet
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00177_DS_
	CRET	
	.def _KeyToCanvalue1_function_end, debug, value=$

; exit point of _KeyToCanvalue1



func._KeyToCanvalue	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _KeyToCanvalue	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Main_DataClean
;   _Main_CleanTimeSet
;   _Main_DataClean
;   _Main_CleanTimeSet
;9 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   STK01
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;; Starting PostCode block
	.def _KeyToCanvalue_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_KeyToCanvalue	;Function start
; 2 exit points
;	::->op : RECEIVE
	.line	113; "../KEY.c"	void KeyToCanvalue(unsigned char keyvalue, unsigned int keycnt)
	BANKSEL	r0x101F
	MOV	r0x101F, R0
;	::->op : RECEIVE
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1020
	MOV	r0x1020, R0
	BANKSEL	STK01
	MOVZ	R0, STK01
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : <
;unsigned compare: left < lit(0x1=1), size=1
	.line	115; "../KEY.c"	switch(keyvalue)
	MOV	R0,# 0x01
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 0
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=1
	MOV	R0,# 0x06
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 0
	JNB	PSW, 0
	JMP	_00111_DS_
;	::->op : -
	BANKSEL	r0x101F
	DECR	r0x101F
	BANKSEL	r0x1022
	MOV	r0x1022, R0
;	::->op : JUMPTABLE
	MOV	R1,#high _00132_DS_
	MOV	R0,#_00132_DS_
	BANKSEL	r0x1022
	ADD	R0, r0x1022
	JNB	PSW, 0
	INC	R1
	TRAPPC3	$
	MOV	PCH, R1
	MOV	PCL, R0
_00132_DS_
	JMP	_00081_DS_
	JMP	_00087_DS_
	JMP	_00093_DS_
	JMP	_00099_DS_
	JMP	_00105_DS_
;	::->op : LABEL
;	::->op : CAST
_00081_DS_
	.line	118; "../KEY.c"	if(keycnt>50000)//连续5次检测结果保持同一键值，确认按键为短按
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1024
	CLR	r0x1024
	BANKSEL	r0x1025
	CLR	r0x1025
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00133_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1024
	SUB	R0, r0x1024
	JB	PSW, 2
	JMP	_00133_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1023
	SUB	R0, r0x1023
	JB	PSW, 2
	JMP	_00133_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1022
	SUB	R0, r0x1022
_00133_DS_
	JB	PSW, 0
	JMP	_00085_DS_
;	::->op :*  =
	.line	120; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00085_DS_
	.line	122; "../KEY.c"	else if(keycnt>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00134_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1021
	SUB	R0, r0x1021
_00134_DS_
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op :*  =
	.line	124; "../KEY.c"	TX_Data[0]=0x20;	//返回
	MOV	R0,# 0x20
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	126; "../KEY.c"	break;
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : CAST
_00087_DS_
	.line	128; "../KEY.c"	if(keycnt >50000)
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1024
	CLR	r0x1024
	BANKSEL	r0x1025
	CLR	r0x1025
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00135_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1024
	SUB	R0, r0x1024
	JB	PSW, 2
	JMP	_00135_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1023
	SUB	R0, r0x1023
	JB	PSW, 2
	JMP	_00135_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1022
	SUB	R0, r0x1022
_00135_DS_
	JB	PSW, 0
	JMP	_00091_DS_
;	::->op :*  =
	.line	130; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00091_DS_
	.line	132; "../KEY.c"	else if(keycnt>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00136_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1021
	SUB	R0, r0x1021
_00136_DS_
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op :*  =
	.line	134; "../KEY.c"	TX_Data[0]=0x40;	//上翻
	MOV	R0,# 0x40
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	136; "../KEY.c"	break;
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : CAST
_00093_DS_
	.line	138; "../KEY.c"	if(keycnt >50000)
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1024
	CLR	r0x1024
	BANKSEL	r0x1025
	CLR	r0x1025
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00137_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1024
	SUB	R0, r0x1024
	JB	PSW, 2
	JMP	_00137_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1023
	SUB	R0, r0x1023
	JB	PSW, 2
	JMP	_00137_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1022
	SUB	R0, r0x1022
_00137_DS_
	JB	PSW, 0
	JMP	_00097_DS_
;	::->op :*  =
	.line	140; "../KEY.c"	TX_Data[0]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 0)
;	::->op : GOTO
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00097_DS_
	.line	142; "../KEY.c"	else if(keycnt>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00138_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1021
	SUB	R0, r0x1021
_00138_DS_
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op :*  =
	.line	144; "../KEY.c"	TX_Data[0]=0x80;	//确认
	MOV	R0,# 0x80
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 0), R0
;	::->op : GOTO
	.line	146; "../KEY.c"	break;
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : CAST
_00099_DS_
	.line	148; "../KEY.c"	if(keycnt >50000)
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1024
	CLR	r0x1024
	BANKSEL	r0x1025
	CLR	r0x1025
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00139_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1024
	SUB	R0, r0x1024
	JB	PSW, 2
	JMP	_00139_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1023
	SUB	R0, r0x1023
	JB	PSW, 2
	JMP	_00139_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1022
	SUB	R0, r0x1022
_00139_DS_
	JB	PSW, 0
	JMP	_00103_DS_
;	::->op :*  =
	.line	150; "../KEY.c"	TX_Data[1]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 1)
;	::->op : GOTO
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00103_DS_
	.line	152; "../KEY.c"	else if(keycnt>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00140_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1021
	SUB	R0, r0x1021
_00140_DS_
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op :*  =
	.line	154; "../KEY.c"	TX_Data[1]=0x01;   //下翻
	MOV	R0,# 0x01
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 1), R0
;	::->op : GOTO
	.line	156; "../KEY.c"	break;
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : CAST
_00105_DS_
	.line	158; "../KEY.c"	if(keycnt >50000)
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1022
	MOV	r0x1022, R0
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x1023
	MOV	r0x1023, R0
	BANKSEL	r0x1024
	CLR	r0x1024
	BANKSEL	r0x1025
	CLR	r0x1025
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;signed compare: left >= lit(0xC351=50001), size=4, mask=ffffffff
	MOV	R0,# 0x00
	ADD	R0,# 0x80
	ADD	R0,# 0x80
;comparing bytes at offset 3
	JB	PSW, 2
	JMP	_00141_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1024
	SUB	R0, r0x1024
	JB	PSW, 2
	JMP	_00141_DS_
	MOV	R0,# 0xc3
	BANKSEL	r0x1023
	SUB	R0, r0x1023
	JB	PSW, 2
	JMP	_00141_DS_
	MOV	R0,# 0x51
	BANKSEL	r0x1022
	SUB	R0, r0x1022
_00141_DS_
	JB	PSW, 0
	JMP	_00109_DS_
;	::->op :*  =
	.line	160; "../KEY.c"	TX_Data[1]=0x00;
	BANKSEL	_TX_Data
	CLR	 (_TX_Data + 1)
;	::->op : GOTO
	JMP	_00111_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
_00109_DS_
	.line	162; "../KEY.c"	else if(keycnt>5)
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00142_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1021
	SUB	R0, r0x1021
_00142_DS_
	JB	PSW, 0
	JMP	_00111_DS_
;	::->op :*  =
	.line	164; "../KEY.c"	TX_Data[1]=0x02;   //语音
	MOV	R0,# 0x02
	BANKSEL	_TX_Data
	MOV	 (_TX_Data + 1), R0
;	::->op : LABEL
;	::->op : IFX
_00111_DS_
	.line	168; "../KEY.c"	if (keyvalue == 0U)
	MOV	R0,# 0x00
	BANKSEL	r0x101F
	ORL	R0, r0x101F
	JB	PSW, 2
	JMP	_00113_DS_
;	::->op : CALL
	.line	170; "../KEY.c"	Main_DataClean();
	TRAPPC1	_Main_DataClean
	TRAPPC2	_Main_DataClean
	PAGESEL	_Main_DataClean
	CALL	_Main_DataClean
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : GOTO
	JMP	_00115_DS_
;	::->op : LABEL
;	::->op : CALL
_00113_DS_
	.line	174; "../KEY.c"	Main_CleanTimeSet();
	TRAPPC1	_Main_CleanTimeSet
	TRAPPC2	_Main_CleanTimeSet
	PAGESEL	_Main_CleanTimeSet
	CALL	_Main_CleanTimeSet
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00115_DS_
	CRET	
	.def _KeyToCanvalue_function_end, debug, value=$

; exit point of _KeyToCanvalue



func._currentkeyleft	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _currentkeyleft	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Init_ADC
;   _Adc_read
;   _Init_ADC
;   _Adc_read
;4 compiler assigned registers:
;   STK00
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting PostCode block
	.def _currentkeyleft_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_currentkeyleft	;Function start
; 2 exit points
;	::->op : SEND
;	::->op : CALL
	.line	77; "../KEY.c"	Init_ADC(0x01);
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
;	::->op : =
	.line	78; "../KEY.c"	ADCCTL2 = 0x25;                 //左路AD按键数据采集
	MOV	R0,# 0x25
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : CALL
	.line	79; "../KEY.c"	ADC_data1 = Adc_read();
	TRAPPC1	_Adc_read
	TRAPPC2	_Adc_read
	PAGESEL	_Adc_read
	CALL	_Adc_read
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x1014
	MOV	r0x1014, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1015
	MOV	r0x1015, R0
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x65=101), size=2
	.line	80; "../KEY.c"	if(ADC_data1<=100)//电话接听
	MOV	R0,# 0x00
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00072_DS_
	MOV	R0,# 0x65
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00072_DS_
	JNB	PSW, 0
	JMP	_00059_DS_
;	::->op : =
	.line	82; "../KEY.c"	Key_Number1=1;
	MOV	R0,# 0x01
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : GOTO
	JMP	_00060_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x320=800), size=2
_00059_DS_
	.line	85; "../KEY.c"	else if(ADC_data1>=800&&ADC_data1<=1000)//vol+
	MOV	R0,# 0x03
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00073_DS_
	MOV	R0,# 0x20
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00073_DS_
	JB	PSW, 0
	JMP	_00055_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x3E9=1001), size=2
	MOV	R0,# 0x03
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00074_DS_
	MOV	R0,# 0xe9
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00074_DS_
	JNB	PSW, 0
	JMP	_00055_DS_
;	::->op : =
	.line	87; "../KEY.c"	Key_Number1=2;
	MOV	R0,# 0x02
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : GOTO
	JMP	_00060_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x5AA=1450), size=2
_00055_DS_
	.line	90; "../KEY.c"	else if(ADC_data1>=1450&&ADC_data1<=1600)//vol x
	MOV	R0,# 0x05
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00075_DS_
	MOV	R0,# 0xaa
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00075_DS_
	JB	PSW, 0
	JMP	_00051_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x641=1601), size=2
	MOV	R0,# 0x06
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00076_DS_
	MOV	R0,# 0x41
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00076_DS_
	JNB	PSW, 0
	JMP	_00051_DS_
;	::->op : =
	.line	92; "../KEY.c"	Key_Number1=3;
	MOV	R0,# 0x03
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : GOTO
	JMP	_00060_DS_
;	::->op : LABEL
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6D7=1751), size=2
_00051_DS_
	.line	95; "../KEY.c"	else if(ADC_data1>1750&&ADC_data1<=1850)//vol-
	MOV	R0,# 0x06
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00077_DS_
	MOV	R0,# 0xd7
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00077_DS_
	JB	PSW, 0
	JMP	_00047_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x73B=1851), size=2
	MOV	R0,# 0x07
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00078_DS_
	MOV	R0,# 0x3b
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00078_DS_
	JNB	PSW, 0
	JMP	_00047_DS_
;	::->op : =
	.line	97; "../KEY.c"	Key_Number1=4;
	MOV	R0,# 0x04
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : GOTO
	JMP	_00060_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x79E=1950), size=2
_00047_DS_
	.line	100; "../KEY.c"	else if(ADC_data1>=1950&&ADC_data1<=2100)//电话挂断
	MOV	R0,# 0x07
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00079_DS_
	MOV	R0,# 0x9e
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00079_DS_
	JB	PSW, 0
	JMP	_00043_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x835=2101), size=2
	MOV	R0,# 0x08
	BANKSEL	r0x1014
	SUB	R0, r0x1014
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00080_DS_
	MOV	R0,# 0x35
	BANKSEL	r0x1015
	SUB	R0, r0x1015
_00080_DS_
	JNB	PSW, 0
	JMP	_00043_DS_
;	::->op : =
	.line	102; "../KEY.c"	Key_Number1=5;
	MOV	R0,# 0x05
	BANKSEL	r0x1016
	MOV	r0x1016, R0
;	::->op : GOTO
	JMP	_00060_DS_
;	::->op : LABEL
;	::->op : =
_00043_DS_
	.line	106; "../KEY.c"	Key_Number1=0;
	BANKSEL	r0x1016
	CLR	r0x1016
;	::->op : LABEL
;	::->op : CAST
;;102	MOVZ	R0, r0x1016
_00060_DS_
	.line	108; "../KEY.c"	return Key_Number1;
	BANKSEL	r0x1014
	CLR	r0x1014
;	::->op : RETURN
;;101	MOVZ	R0, r0x1015
	BANKSEL	r0x1016
	MOVZ	R0, r0x1016
	BANKSEL	r0x1015
	MOV	r0x1015, R0
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _currentkeyleft_function_end, debug, value=$

; exit point of _currentkeyleft



func._currentkey	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _currentkey	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Init_ADC2
;   _Adc_read
;   _Init_ADC2
;   _Adc_read
;4 compiler assigned registers:
;   STK00
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting PostCode block
	.def _currentkey_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_currentkey	;Function start
; 2 exit points
;	::->op : SEND
;	::->op : CALL
	.line	36; "../KEY.c"	Init_ADC2(0x01);
	MOV	R0,# 0x01
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
	TRAPPC1	_Init_ADC2
	TRAPPC2	_Init_ADC2
	PAGESEL	_Init_ADC2
	CALL	_Init_ADC2
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
;	::->op : =
	.line	37; "../KEY.c"	ADCCTL2 = 0x0c;                 //右路AD按键数据采集
	MOV	R0,# 0x0c
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : CALL
	.line	38; "../KEY.c"	ADC_data = Adc_read();
	TRAPPC1	_Adc_read
	TRAPPC2	_Adc_read
	PAGESEL	_Adc_read
	CALL	_Adc_read
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x101F
	MOV	r0x101F, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1020
	MOV	r0x1020, R0
;	::->op : IFX
	.line	39; "../KEY.c"	if(ADC_data>0&&ADC_data<=65)//返回
	BANKSEL	r0x1020
	MOVZ	R0, r0x1020
	BANKSEL	r0x101F
	ORL	R0, r0x101F
	JNB	PSW, 2
	JMP	_00018_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x42=66), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00033_DS_
	MOV	R0,# 0x42
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00033_DS_
	JNB	PSW, 0
	JMP	_00018_DS_
;	::->op : =
	.line	41; "../KEY.c"	Key_Number=1;
	MOV	R0,# 0x01
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : GOTO
	JMP	_00019_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x258=600), size=2
_00018_DS_
	.line	44; "../KEY.c"	else if(ADC_data>=600&&ADC_data<0x700)//选择上
	MOV	R0,# 0x02
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00034_DS_
	MOV	R0,# 0x58
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00034_DS_
	JB	PSW, 0
	JMP	_00014_DS_
;	::->op : <
;unsigned compare: left < lit(0x700=1792), size=2
	MOV	R0,# 0x07
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00035_DS_
	MOV	R0,# 0x00
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00035_DS_
	JNB	PSW, 0
	JMP	_00014_DS_
;	::->op : =
	.line	46; "../KEY.c"	Key_Number=2;
	MOV	R0,# 0x02
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : GOTO
	JMP	_00019_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x4B0=1200), size=2
_00014_DS_
	.line	49; "../KEY.c"	else if(ADC_data>=1200&&ADC_data<=1450)//ok
	MOV	R0,# 0x04
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00036_DS_
	MOV	R0,# 0xb0
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00036_DS_
	JB	PSW, 0
	JMP	_00010_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x5AB=1451), size=2
	MOV	R0,# 0x05
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00037_DS_
	MOV	R0,# 0xab
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00037_DS_
	JNB	PSW, 0
	JMP	_00010_DS_
;	::->op : =
	.line	51; "../KEY.c"	Key_Number=3;
	MOV	R0,# 0x03
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : GOTO
	JMP	_00019_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x76C=1900), size=2
_00010_DS_
	.line	54; "../KEY.c"	else if(ADC_data>=1900&&ADC_data<=2000)//选择下
	MOV	R0,# 0x07
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00038_DS_
	MOV	R0,# 0x6c
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00038_DS_
	JB	PSW, 0
	JMP	_00006_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x7D1=2001), size=2
	MOV	R0,# 0x07
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00039_DS_
	MOV	R0,# 0xd1
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00039_DS_
	JNB	PSW, 0
	JMP	_00006_DS_
;	::->op : =
	.line	56; "../KEY.c"	Key_Number=4;
	MOV	R0,# 0x04
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : GOTO
	JMP	_00019_DS_
;	::->op : LABEL
;	::->op : <
;unsigned compare: left < lit(0x960=2400), size=2
_00006_DS_
	.line	59; "../KEY.c"	else if(ADC_data>=2400&&ADC_data<=2600)//语音按键
	MOV	R0,# 0x09
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00040_DS_
	MOV	R0,# 0x60
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00040_DS_
	JB	PSW, 0
	JMP	_00002_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0xA29=2601), size=2
	MOV	R0,# 0x0a
	BANKSEL	r0x101F
	SUB	R0, r0x101F
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00041_DS_
	MOV	R0,# 0x29
	BANKSEL	r0x1020
	SUB	R0, r0x1020
_00041_DS_
	JNB	PSW, 0
	JMP	_00002_DS_
;	::->op : =
	.line	61; "../KEY.c"	Key_Number=5;
	MOV	R0,# 0x05
	BANKSEL	r0x1021
	MOV	r0x1021, R0
;	::->op : GOTO
	JMP	_00019_DS_
;	::->op : LABEL
;	::->op : =
_00002_DS_
	.line	65; "../KEY.c"	Key_Number=0;
	BANKSEL	r0x1021
	CLR	r0x1021
;	::->op : LABEL
;	::->op : CAST
;;100	MOVZ	R0, r0x1021
_00019_DS_
	.line	67; "../KEY.c"	return Key_Number;
	BANKSEL	r0x101F
	CLR	r0x101F
;	::->op : RETURN
;;99	MOVZ	R0, r0x1020
	BANKSEL	r0x1021
	MOVZ	R0, r0x1021
	BANKSEL	r0x1020
	MOV	r0x1020, R0
	BANKSEL	STK00
	MOV	STK00, R0
	MOV	R0,# 0x00
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _currentkey_function_end, debug, value=$

; exit point of _currentkey


;	code size estimation:
;	  816+  278 =  1094 instructions ( 2744 byte)

	.type _currentkey,  32
	.dim _currentkey, 1, (_currentkey_function_end&0xFF00)>>8, _currentkey_function_end&0xFF,0,30,0,69 , 1, 1
	.type _currentkeyleft,  32
	.dim _currentkeyleft, 1, (_currentkeyleft_function_end&0xFF00)>>8, _currentkeyleft_function_end&0xFF,0,71,0,110 , 1, 1
	.type _KeyToCanvalue,  32
	.dim _KeyToCanvalue, 1, (_KeyToCanvalue_function_end&0xFF00)>>8, _KeyToCanvalue_function_end&0xFF,0,113,0,177 , 1, 1
	.type _KeyToCanvalue1,  32
	.dim _KeyToCanvalue1, 1, (_KeyToCanvalue1_function_end&0xFF00)>>8, _KeyToCanvalue1_function_end&0xFF,0,179,0,243 , 1, 1
	.type _keyl_detection,  32
	.dim _keyl_detection, 1, (_keyl_detection_function_end&0xFF00)>>8, _keyl_detection_function_end&0xFF,0,245,1,3 , 1, 1
	.type _keyr_detection,  32
	.dim _keyr_detection, 1, (_keyr_detection_function_end&0xFF00)>>8, _keyr_detection_function_end&0xFF,1,5,1,19 , 1, 1
	.def __00010000, debug, type = 8, class = 10, value = 1
	.def _0, debug, value = 1, type = 26, class = 8
	.def _1, debug, value = 1, type = 26, class = 8
	.def _2, debug, value = 1, type = 26, class = 8
	.def _3, debug, value = 1, type = 26, class = 8
	.def _4, debug, value = 1, type = 26, class = 8
	.def _5, debug, value = 1, type = 26, class = 8
	.def _6, debug, value = 1, type = 26, class = 8
	.def _7, debug, value = 1, type = 26, class = 8
	.def __00010010, debug, type = 9, class = 12, value = 2
	.def bytes, debug, value = 2, type = 12, class = 11
	.def id, debug, value = 2, type = 12, class = 11
	.def type, debug, value = 2, type = 12, class = 11
	.def product, debug, value = 2, type = 12, class = 11
	.def index, debug, value = 2, type = 12, class = 11
	.def reservation, debug, value = 2, type = 12, class = 11
	.def __00010001, debug, type = 9, class = 12, value = 3
	.def byte0, debug, value = 3, type = 12, class = 11
	.def byte1, debug, value = 3, type = 12, class = 11
	.def byte2, debug, value = 3, type = 12, class = 11
	.def byte3, debug, value = 3, type = 12, class = 11
	.def bytes, debug, value = 3, type = 12, class = 11
	.def value, debug, value = 3, type = 15, class = 11
	.def __00010012, debug, type = 9, class = 12, value = 4
	.def bytes, debug, value = 4, type = 12, class = 11
	.def i2cDevAddrL, debug, value = 4, type = 12, class = 11
	.def i2cDevAddrH, debug, value = 4, type = 12, class = 11
	.def flag, debug, value = 4, type = 8, class = 11
	.def length, debug, value = 4, type = 12, class = 11
	.def Command, debug, value = 4, type = 12, class = 11
	.def buffer, debug, value = 4, type = 12, class = 11
	.def __00020011, debug, type = 8, class = 10, value = 5
	.def id, debug, value = 5, type = 12, class = 8
	.def type, debug, value = 5, type = 12, class = 8
	.def product, debug, value = 5, type = 12, class = 8
	.def index, debug, value = 5, type = 12, class = 8
	.def reservation, debug, value = 5, type = 12, class = 8
	.def __00010003, debug, type = 9, class = 12, value = 6
	.def byte0, debug, value = 6, type = 12, class = 11
	.def byte1, debug, value = 6, type = 12, class = 11
	.def byte, debug, value = 6, type = 12, class = 11
	.def value, debug, value = 6, type = 14, class = 11
	.def __00020002, debug, type = 8, class = 10, value = 7
	.def byte0, debug, value = 7, type = 12, class = 8
	.def byte1, debug, value = 7, type = 12, class = 8
	.def byte2, debug, value = 7, type = 12, class = 8
	.def byte3, debug, value = 7, type = 12, class = 8
	.def __00010014, debug, type = 9, class = 12, value = 8
	.def bytes, debug, value = 8, type = 12, class = 11
	.def head, debug, value = 8, type = 12, class = 11
	.def Command, debug, value = 8, type = 12, class = 11
	.def flag, debug, value = 8, type = 8, class = 11
	.def length, debug, value = 8, type = 12, class = 11
	.def buffer, debug, value = 8, type = 12, class = 11
	.def checkvalue, debug, value = 8, type = 12, class = 11
	.def assistant, debug, value = 8, type = 12, class = 11
	.def __00020013, debug, type = 8, class = 10, value = 9
	.def i2cDevAddrL, debug, value = 9, type = 12, class = 8
	.def i2cDevAddrH, debug, value = 9, type = 12, class = 8
	.def flag, debug, value = 9, type = 8, class = 8
	.def length, debug, value = 9, type = 12, class = 8
	.def Command, debug, value = 9, type = 12, class = 8
	.def buffer, debug, value = 9, type = 12, class = 8
	.def __00010005, debug, type = 9, class = 12, value = 10
	.def value, debug, value = 10, type = 12, class = 11
	.def bit0, debug, value = 10, type = 26, class = 11
	.def bit1, debug, value = 10, type = 26, class = 11
	.def bit2, debug, value = 10, type = 26, class = 11
	.def bit3, debug, value = 10, type = 26, class = 11
	.def bit4, debug, value = 10, type = 26, class = 11
	.def bit5, debug, value = 10, type = 26, class = 11
	.def bit6, debug, value = 10, type = 26, class = 11
	.def bit7, debug, value = 10, type = 26, class = 11
	.def __00020004, debug, type = 8, class = 10, value = 11
	.def byte0, debug, value = 11, type = 12, class = 8
	.def byte1, debug, value = 11, type = 12, class = 8
	.def __00010016, debug, type = 9, class = 12, value = 12
	.def data_ide, debug, value = 12, type = 12, class = 11
	.def data_rtr, debug, value = 12, type = 12, class = 11
	.def data_length, debug, value = 12, type = 12, class = 11
	.def data_id, debug, value = 12, type = 12, class = 11
	.def raw_data, debug, value = 12, type = 12, class = 11
	.def CAN_DATA_Format, debug, value = 12, type = 12, class = 11
	.def __00020015, debug, type = 8, class = 10, value = 13
	.def head, debug, value = 13, type = 12, class = 8
	.def Command, debug, value = 13, type = 12, class = 8
	.def flag, debug, value = 13, type = 8, class = 8
	.def length, debug, value = 13, type = 12, class = 8
	.def buffer, debug, value = 13, type = 12, class = 8
	.def checkvalue, debug, value = 13, type = 12, class = 8
	.def assistant, debug, value = 13, type = 12, class = 8
	.def __00010007, debug, type = 9, class = 12, value = 14
	.def byte0, debug, value = 14, type = 12, class = 11
	.def byte1, debug, value = 14, type = 12, class = 11
	.def byte2, debug, value = 14, type = 12, class = 11
	.def byte3, debug, value = 14, type = 12, class = 11
	.def bytes, debug, value = 14, type = 12, class = 11
	.def __00020006, debug, type = 8, class = 10, value = 15
	.def bit0, debug, value = 15, type = 26, class = 8
	.def bit1, debug, value = 15, type = 26, class = 8
	.def bit2, debug, value = 15, type = 26, class = 8
	.def bit3, debug, value = 15, type = 26, class = 8
	.def bit4, debug, value = 15, type = 26, class = 8
	.def bit5, debug, value = 15, type = 26, class = 8
	.def bit6, debug, value = 15, type = 26, class = 8
	.def bit7, debug, value = 15, type = 26, class = 8
	.def __00020017, debug, type = 8, class = 10, value = 16
	.def data_ide, debug, value = 16, type = 12, class = 8
	.def data_rtr, debug, value = 16, type = 12, class = 8
	.def data_length, debug, value = 16, type = 12, class = 8
	.def data_id, debug, value = 16, type = 12, class = 8
	.def raw_data, debug, value = 16, type = 12, class = 8
	.def __00010009, debug, type = 8, class = 10, value = 17
	.def id, debug, value = 17, type = 12, class = 8
	.def type, debug, value = 17, type = 12, class = 8
	.def product, debug, value = 17, type = 12, class = 8
	.def index, debug, value = 17, type = 12, class = 8
	.def reservation, debug, value = 17, type = 12, class = 8
	.def __00020008, debug, type = 8, class = 10, value = 18
	.def byte0, debug, value = 18, type = 12, class = 8
	.def byte1, debug, value = 18, type = 12, class = 8
	.def byte2, debug, value = 18, type = 12, class = 8
	.def byte3, debug, value = 18, type = 12, class = 8

	.end
