;--------------------------------------------------------
; File Created by ChiponCC : ChipON  inc.
;--------------------------------------------------------
; chipon port for the 16-bit core
;--------------------------------------------------------
	.file	"../ADC.c"
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
	.global	_Init_ADC2
	.global	_Init_ADC
	.global	_Adc_read
	.global	_Adc_fun
	.global	_delay_5us
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
UDL_ADC_0	.udata
r0x100F	.res	1
UDL_ADC_1	.udata
r0x100E	.res	1
UDL_ADC_2	.udata
r0x1010	.res	1
UDL_ADC_3	.udata
r0x1011	.res	1
UDL_ADC_4	.udata
r0x1004	.res	1
UDL_ADC_5	.udata
r0x1005	.res	1
UDL_ADC_6	.udata
r0x1006	.res	1
UDL_ADC_7	.udata
r0x1007	.res	1
UDL_ADC_8	.udata
r0x1009	.res	1
UDL_ADC_9	.udata
r0x100A	.res	1
UDL_ADC_10	.udata
r0x100B	.res	1
UDL_ADC_11	.udata
r0x100D	.res	1
UDL_ADC_12	.udata
r0x100C	.res	1
UDL_ADC_13	.udata
r0x1003	.res	1
UDL_ADC_14	.udata
r0x1002	.res	1
UDL_ADC_15	.udata
r0x1001	.res	1
UDL_ADC_16	.udata
r0x1000	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	.udata_ovr


func._Init_ADC2	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_ADC2	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;; Starting PostCode block
	.def _Init_ADC2_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_ADC2	;Function start
; 2 exit points
;	::->op : RECEIVE
	.line	108; "../ADC.c"	void Init_ADC2(unsigned mode)
	BANKSEL	r0x1000
	MOV	r0x1000, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1001
	MOV	r0x1001, R0
;	::->op :*  =
	.line	111; "../ADC.c"	TR66 =1;
	BANKSEL	_TR6_bits
	SET	_TR6_bits, 6
;	::->op :*  =
	.line	113; "../ADC.c"	ANS12 =1;//ADC采样引脚需要配置为模拟输入
	BANKSEL	_ANS1_bits
	SET	_ANS1_bits, 2
;	::->op : <
;unsigned compare: left < lit(0x1=1), size=2
	.line	115; "../ADC.c"	switch(mode)
	MOV	R0,# 0x00
	BANKSEL	r0x1000
	SUB	R0, r0x1000
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00046_DS_
	MOV	R0,# 0x01
	BANKSEL	r0x1001
	SUB	R0, r0x1001
_00046_DS_
	JB	PSW, 0
	JMP	_00042_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1000
	SUB	R0, r0x1000
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00047_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1001
	SUB	R0, r0x1001
_00047_DS_
	JNB	PSW, 0
	JMP	_00042_DS_
;	::->op : -
	BANKSEL	r0x1001
	DECR	r0x1001
	BANKSEL	r0x1001
	MOV	r0x1001, R0
;	::->op : JUMPTABLE
	MOV	R1,#high _00048_DS_
	MOV	R0,#_00048_DS_
	BANKSEL	r0x1001
	ADD	R0, r0x1001
	JNB	PSW, 0
	INC	R1
	TRAPPC3	$
	MOV	PCH, R1
	MOV	PCL, R0
_00048_DS_
	JMP	_00036_DS_
	JMP	_00037_DS_
	JMP	_00038_DS_
	JMP	_00039_DS_
	JMP	_00040_DS_
;	::->op : LABEL
;	::->op : =
_00036_DS_
	.line	118; "../ADC.c"	ADCCTL0 =0x81;//采样结果右对齐，且使能ADC
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	119; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : GOTO
	.line	121; "../ADC.c"	break;
	JMP	_00042_DS_
;	::->op : LABEL
;	::->op : =
_00037_DS_
	.line	123; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	124; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	125; "../ADC.c"	ADCCTL2 =0x26;//采样FVR
	MOV	R0,# 0x26
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	126; "../ADC.c"	break;
	JMP	_00042_DS_
;	::->op : LABEL
;	::->op : =
_00038_DS_
	.line	128; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	129; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	130; "../ADC.c"	ADCCTL2 =0x27;//采样内置温度传感器
	MOV	R0,# 0x27
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	131; "../ADC.c"	break;
	JMP	_00042_DS_
;	::->op : LABEL
;	::->op : =
_00039_DS_
	.line	133; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	134; "../ADC.c"	ADCCTL1 =0x5C;//参考电压设置为FVR
	MOV	R0,# 0x5c
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	135; "../ADC.c"	ADCCTL2 =0x05;//采样AD5通道
	MOV	R0,# 0x05
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	136; "../ADC.c"	break;
	JMP	_00042_DS_
;	::->op : LABEL
;	::->op : =
_00040_DS_
	.line	138; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	139; "../ADC.c"	ADCCTL1 =0x5C;//参考电压设置为FVR
	MOV	R0,# 0x5c
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	140; "../ADC.c"	ADCCTL2 =0x24;//采样OPOUT
	MOV	R0,# 0x24
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00042_DS_
	.line	142; "../ADC.c"	}
	CRET	
	.def _Init_ADC2_function_end, debug, value=$

; exit point of _Init_ADC2



func._Init_ADC	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Init_ADC	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;; Starting PostCode block
	.def _Init_ADC_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Init_ADC	;Function start
; 2 exit points
;	::->op : RECEIVE
	.line	63; "../ADC.c"	void Init_ADC(unsigned mode)
	BANKSEL	r0x1002
	MOV	r0x1002, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x1003
	MOV	r0x1003, R0
;	::->op :*  =
	.line	65; "../ADC.c"	TR04 =1;
	BANKSEL	_TR0_bits
	SET	_TR0_bits, 4
;	::->op :*  =
	.line	67; "../ADC.c"	ANS37 =1;//ADC采样引脚需要配置为模拟输入
	BANKSEL	_ANS3_bits
	SET	_ANS3_bits, 7
;	::->op : <
;unsigned compare: left < lit(0x1=1), size=2
	.line	70; "../ADC.c"	switch(mode)
	MOV	R0,# 0x00
	BANKSEL	r0x1002
	SUB	R0, r0x1002
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00033_DS_
	MOV	R0,# 0x01
	BANKSEL	r0x1003
	SUB	R0, r0x1003
_00033_DS_
	JB	PSW, 0
	JMP	_00029_DS_
;	::->op : >
;swapping arguments (AOP_TYPEs 1/2)
;unsigned compare: left >= lit(0x6=6), size=2
	MOV	R0,# 0x00
	BANKSEL	r0x1002
	SUB	R0, r0x1002
;comparing bytes at offset 1
	JB	PSW, 2
	JMP	_00034_DS_
	MOV	R0,# 0x06
	BANKSEL	r0x1003
	SUB	R0, r0x1003
_00034_DS_
	JNB	PSW, 0
	JMP	_00029_DS_
;	::->op : -
	BANKSEL	r0x1003
	DECR	r0x1003
	BANKSEL	r0x1003
	MOV	r0x1003, R0
;	::->op : JUMPTABLE
	MOV	R1,#high _00035_DS_
	MOV	R0,#_00035_DS_
	BANKSEL	r0x1003
	ADD	R0, r0x1003
	JNB	PSW, 0
	INC	R1
	TRAPPC3	$
	MOV	PCH, R1
	MOV	PCL, R0
_00035_DS_
	JMP	_00023_DS_
	JMP	_00024_DS_
	JMP	_00025_DS_
	JMP	_00026_DS_
	JMP	_00027_DS_
;	::->op : LABEL
;	::->op : =
_00023_DS_
	.line	73; "../ADC.c"	ADCCTL0 =0x81;//采样结果右对齐，且使能ADC
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	74; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : GOTO
	.line	76; "../ADC.c"	break;
	JMP	_00029_DS_
;	::->op : LABEL
;	::->op : =
_00024_DS_
	.line	78; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	79; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	80; "../ADC.c"	ADCCTL2 =0x26;//采样FVR
	MOV	R0,# 0x26
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	81; "../ADC.c"	break;
	JMP	_00029_DS_
;	::->op : LABEL
;	::->op : =
_00025_DS_
	.line	83; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	84; "../ADC.c"	ADCCTL1 =0x54;//参考电压设置为VDD
	MOV	R0,# 0x54
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	85; "../ADC.c"	ADCCTL2 =0x27;//采样内置温度传感器
	MOV	R0,# 0x27
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	86; "../ADC.c"	break;
	JMP	_00029_DS_
;	::->op : LABEL
;	::->op : =
_00026_DS_
	.line	88; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	89; "../ADC.c"	ADCCTL1 =0x5C;//参考电压设置为FVR
	MOV	R0,# 0x5c
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	90; "../ADC.c"	ADCCTL2 =0x05;//采样AD5通道
	MOV	R0,# 0x05
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : GOTO
	.line	91; "../ADC.c"	break;
	JMP	_00029_DS_
;	::->op : LABEL
;	::->op : =
_00027_DS_
	.line	93; "../ADC.c"	ADCCTL0 =0x81;
	MOV	R0,# 0x81
	BANKSEL	_ADCCTL0
	MOV	_ADCCTL0, R0
;	::->op : =
	.line	94; "../ADC.c"	ADCCTL1 =0x5C;//参考电压设置为FVR
	MOV	R0,# 0x5c
	BANKSEL	_ADCCTL1
	MOV	_ADCCTL1, R0
;	::->op : =
	.line	95; "../ADC.c"	ADCCTL2 =0x24;//采样OPOUT
	MOV	R0,# 0x24
	BANKSEL	_ADCCTL2
	MOV	_ADCCTL2, R0
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00029_DS_
	.line	97; "../ADC.c"	}
	CRET	
	.def _Init_ADC_function_end, debug, value=$

; exit point of _Init_ADC



func._Adc_read	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Adc_read	;Function start
; 2 exit points
;has an exit
;functions called:
;   _Adc_fun
;   _Adc_fun
;6 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   STK00
;   r0x100D
;; Starting PostCode block
	.def _Adc_read_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Adc_read	;Function start
; 2 exit points
;	::->op : =
	.line	47; "../ADC.c"	unsigned int Adc_sum = 0 ; 		          //adc采样累加变量
	BANKSEL	r0x1009
	CLR	r0x1009
	BANKSEL	r0x100A
	CLR	r0x100A
;	::->op : =
	.line	49; "../ADC.c"	for(i = 0; i < 8; i++)
	MOV	R0,# 0x08
	BANKSEL	r0x100B
	MOV	r0x100B, R0
;	::->op : LABEL
;	::->op : CALL
_00018_DS_
	.line	51; "../ADC.c"	Adc_sum += Adc_fun();		  //累加八次采样值
	TRAPPC1	_Adc_fun
	TRAPPC2	_Adc_fun
	PAGESEL	_Adc_fun
	CALL	_Adc_fun
	TRAPPC1	$+2
	TRAPPC2	$+1
	PAGESEL	$
	BANKSEL	r0x100C
	MOV	r0x100C, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : +
	BANKSEL	r0x100D
	MOV	R0, r0x100D
	BANKSEL	r0x1009
	ADD	r0x1009, R0
	BANKSEL	r0x100C
	MOVZ	R0, r0x100C
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00049_DS_
	BANKSEL	r0x100A
	ADD	r0x100A, R0
;	::->op : CAST
_00049_DS_
	BANKSEL	r0x100B
	MOVZ	R0, r0x100B
	BANKSEL	r0x100D
	MOV	r0x100D, R0
;	::->op : -
	BANKSEL	r0x100D
	DEC	r0x100D
;	::->op : CAST
	BANKSEL	r0x100D
	MOVZ	R0, r0x100D
	BANKSEL	r0x100B
	MOV	r0x100B, R0
;	::->op : IFX
	.line	49; "../ADC.c"	for(i = 0; i < 8; i++)
	MOV	R0,# 0x00
	BANKSEL	r0x100B
	ORL	R0, r0x100B
	JB	PSW, 2
	JMP	_00018_DS_
;	::->op : RIGHT_OP
	.line	53; "../ADC.c"	Adc_sum >>= 3;		              //右移动3位  除8求均值
	CLR	PSW, 0
	BANKSEL	r0x100A
	RRC	r0x100A
	BANKSEL	r0x1009
	RRC	r0x1009
	CLR	PSW, 0
	BANKSEL	r0x100A
	RRC	r0x100A
	BANKSEL	r0x1009
	RRC	r0x1009
	CLR	PSW, 0
	BANKSEL	r0x100A
	RRC	r0x100A
	BANKSEL	r0x1009
	RRC	r0x1009
;	::->op : RETURN
	.line	54; "../ADC.c"	return Adc_sum;
	BANKSEL	r0x1009
	MOVZ	R0, r0x1009
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x100A
	MOVZ	R0, r0x100A
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _Adc_read_function_end, debug, value=$

; exit point of _Adc_read



func._Adc_fun	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _Adc_fun	;Function start
; 2 exit points
;has an exit
;6 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;   r0x1008
;   STK00
;; Starting PostCode block
	.def _Adc_fun_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_Adc_fun	;Function start
; 2 exit points
;	::->op :*  =
	.line	32; "../ADC.c"	START = 1;					  //启动ADC
	BANKSEL	_ADCCTL0_bits
	SET	_ADCCTL0_bits, 1
;	::->op : LABEL
;	::->op : GET_VALUE_AT_ADDRESS
_00009_DS_
	.line	33; "../ADC.c"	while(START);                 //等待转换结束
	BANKSEL	_ADCCTL0_bits
	JNB	_ADCCTL0_bits, 1
	JMP	_00009_DS_
;	::->op : CAST
	.line	34; "../ADC.c"	Adc_num = ADCDATA0H;	  	  //将高位加进去
	BANKSEL	_ADCDATA0H
	MOVZ	R0, _ADCDATA0H
	BANKSEL	r0x1004
	MOV	r0x1004, R0
	BANKSEL	r0x1005
	CLR	r0x1005
;	::->op : LEFT_OP
	.line	35; "../ADC.c"	Adc_num <<=8;
	BANKSEL	r0x1004
	MOVZ	R0, r0x1004
	BANKSEL	r0x1005
	MOV	r0x1005, R0
	BANKSEL	r0x1004
	CLR	r0x1004
;	::->op : =
	.line	36; "../ADC.c"	Adc_num += ADCDATA0L;		  //将低位加进去
	BANKSEL	_ADCDATA0L
	MOVZ	R0, _ADCDATA0L
	BANKSEL	r0x1006
	MOV	r0x1006, R0
;	::->op : CAST
	BANKSEL	r0x1006
	MOVZ	R0, r0x1006
	BANKSEL	r0x1007
	MOV	r0x1007, R0
;;1	CLR	r0x1008
;	::->op : +
	BANKSEL	r0x1007
	MOV	R0, r0x1007
	BANKSEL	r0x1004
	ADD	r0x1004, R0
	MOV	R0,# 0x00
	JNB	PSW, 0
	INC	R0
	JNB	PSW, 2
	JMP	_00050_DS_
	BANKSEL	r0x1005
	ADD	r0x1005, R0
;	::->op : RETURN
_00050_DS_
	.line	37; "../ADC.c"	return Adc_num;			      //返回转换值
	BANKSEL	r0x1004
	MOVZ	R0, r0x1004
	BANKSEL	STK00
	MOV	STK00, R0
	BANKSEL	r0x1005
	MOVZ	R0, r0x1005
;	::->op : LABEL
;	::->op : ENDFUNCTION
	CRET	
	.def _Adc_fun_function_end, debug, value=$

; exit point of _Adc_fun



func._delay_5us	.code
;***
;  PostBlock Stats: dbName = C
;***
;entry:  _delay_5us	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;; Starting PostCode block
	.def _delay_5us_function_begin, debug, value=$

;	::->op : LABEL
;	::->op : FUNCTION
_delay_5us	;Function start
; 2 exit points
;	::->op : RECEIVE
	.line	12; "../ADC.c"	void delay_5us(unsigned int time)
	BANKSEL	r0x100E
	MOV	r0x100E, R0
	BANKSEL	STK00
	MOVZ	R0, STK00
	BANKSEL	r0x100F
	MOV	r0x100F, R0
;	::->op : =
;	::->op : LABEL
;	::->op : =
_00001_DS_
	.line	14; "../ADC.c"	while( time--)
	BANKSEL	r0x100F
	MOVZ	R0, r0x100F
	BANKSEL	r0x1010
	MOV	r0x1010, R0
	BANKSEL	r0x100E
	MOVZ	R0, r0x100E
	BANKSEL	r0x1011
	MOV	r0x1011, R0
;	::->op : -
	MOV	R0,# 0xff
	BANKSEL	r0x100F
	ADD	r0x100F, R0
	JNB	PSW, 0
	JMP	_00051_DS_
	BANKSEL	r0x100E
	DEC	r0x100E
;	::->op : IFX
_00051_DS_
	BANKSEL	r0x1010
	MOVZ	R0, r0x1010
	BANKSEL	r0x1011
	ORL	R0, r0x1011
	JNB	PSW, 2
	JMP	_00004_DS_
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : INLINEASM
	NOP 
;	::->op : GOTO
	JMP	_00001_DS_
;	::->op : LABEL
;	::->op : ENDFUNCTION
_00004_DS_
	CRET	
	.def _delay_5us_function_end, debug, value=$

; exit point of _delay_5us


;	code size estimation:
;	  225+  106 =   331 instructions (  874 byte)

	.type _delay_5us,  32
	.dim _delay_5us, 1, (_delay_5us_function_end&0xFF00)>>8, _delay_5us_function_end&0xFF,0,12,0,21 , 1, 1
	.type _Adc_fun,  32
	.dim _Adc_fun, 1, (_Adc_fun_function_end&0xFF00)>>8, _Adc_fun_function_end&0xFF,0,29,0,38 , 1, 1
	.type _Adc_read,  32
	.dim _Adc_read, 1, (_Adc_read_function_end&0xFF00)>>8, _Adc_read_function_end&0xFF,0,45,0,55 , 1, 1
	.type _Init_ADC,  32
	.dim _Init_ADC, 1, (_Init_ADC_function_end&0xFF00)>>8, _Init_ADC_function_end&0xFF,0,63,0,98 , 1, 1
	.type _Init_ADC2,  32
	.dim _Init_ADC2, 1, (_Init_ADC2_function_end&0xFF00)>>8, _Init_ADC2_function_end&0xFF,0,108,0,143 , 1, 1
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
