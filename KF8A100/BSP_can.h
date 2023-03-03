#ifndef BSP_CAN_H_
#define BSP_CAN_H_

typedef enum
{
	False = 0,
	OK
}FilterConfig_STATE,CAN_SendData_STATE,LIN_Config_STATE,LIN_Receive_STATE;

typedef enum
{
	RESET_STATE = 0,
	SET_STATE = !RESET_STATE
}ITStatus;

typedef union
{
	struct
	{
		unsigned char data_ide;		//��0Ϊ��׼֡����1Ϊ��չ֡
		unsigned char data_rtr;		//��0Ϊ����֡����1ΪԶ��֡
		unsigned char data_length;	//���ݳ��ȣ�С�ڵ���8
		unsigned char data_id[4];	//����ʶ���룬��Ϊ��׼֡ʱΪ2�����ݣ���չ֡Ϊ4������
		unsigned char raw_data[8];		//���͵����ݣ�Զ��֡�����ã�ʹ�ó��ȵ������ݳ���
	};
	unsigned char CAN_DATA_Format[15];
}CAN_DATA_INF;

/*
 * ����һ���ж�
 */
#define 	CAN_TX_Int_enable()				(CANTXIF= 0,CANTXIE= 1)
#define 	CAN_TX_Int_disable()			(CANTXIF= 0,CANTXIE= 0)
/*
 * ����һ���ж�
 */
#define 	CAN_RX_Int_enable()				(CANRXIF= 0,CANRXIE= 1)
#define 	CAN_RX_Int_disable()			(CANRXIF= 0,CANRXIE= 0)
/*
 * ���ջ��������ж�,15��ȫ������ж�
 */
#define		CAN_RX_BuffOver_Int_enable()	(RXINF=0,RXINE=1)
#define		CAN_RX_BuffOver_Intt_disable()	(RXINF=0,RXINE=1)
/*
 * ���ߴ����ж�
 */
#define		CAN_BUS_ERROR_Int_enable()		(BEIF=0,BEIE=1)
#define		CAN_BUS_ERROR_Int_disable()		(BEIF=0,BEIE=1)




//CANģʽ�Ĵ���									-------CANMOD
//CANʹ��ѡ��
#define		CAN_enable						0x80
#define		CAN_disable						0x00
//CANʱ��ѡ��
#define		CANCLK_SEL_SCLK					0x00
#define		CANCLK_SEL_HFCLK				0x20
#define		CANCLK_SEL_LFCLK				0x40
//CAN˯��ģʽ����λ,��λģʽ�²���д
#define		CAN_SLEEP_enable				0x08
#define		CAN_SLEEP_disable				0x00
//CAN�ػ�ģʽ����λ
#define		CAN_LBACK_enable				0x04
#define		CAN_LBACK_disable				0x00
//CAN��Ĭģʽ����λ
#define		CAN_SILENT_enable				0x02
#define		CAN_SILENT_disable				0x00
//CAN��λģʽ����λ
#define		CAN_reset						0x01

//CAN����Ĵ���									-------CANCMR

//CAN�����ʼĴ���								-------CANBTR
//CANͬ����ת���
#define		CAN_SJW_4tq						0xC0
#define		CAN_SJW_3tq						0x80
#define		CAN_SJW_2tq						0x40
#define		CAN_SJW_1tq						0x00
//CAN������Ԥ��ֵ,HCLK=16Mʱ��
#define		CAN_baud_800K					0x00
#define		CAN_baud_400K					0X01
#define		CAN_baud_200K					0X03
#define		CAN_baud_100K					0X07

//CANλ���ʼĴ���								-------CANSEG
//CAN���߲�������
#define		CAN_Sample_3					0x80
#define		CAN_Sample_1					0x00

/* In case interrupt is generated if the AIE bit is set */
/* In case interrupt is generated if the PUIE bit is set */
//CAN�жϱ�־�Ĵ���								-------CANIF
#define		CAN_IT_BE						0x80			//���ߴ����ж�
#define		CAN_IT_AL						0x40			//�ٲö�ʧ�жϱ�־λ
#define		CAN_IT_EN						0x20			//���������жϱ�־λ
#define		CAN_IT_WU						0x10			//�����жϱ�־λ
#define		CAN_IT_DOVF						0x08			//��������жϱ�־λ
#define		CAN_IT_EA						0x04			//���󱨾��жϱ�־λ
#define		CAN_IT_CANTX					0x02			//�����жϱ�־λ
#define		CAN_IT_CANRX					0x01			//�����жϱ�־λ

extern volatile CAN_DATA_INF CAN_Rev_DATA;


//����
void CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS2, uint8 CAN_MODE, uint8 CAN_pre);
FilterConfig_STATE CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID);
CAN_SendData_STATE CAN_Transmit_Message(CAN_DATA_INF* CAN_Send_DATA);
void CAN_Receive_Message_Configuration(void);
//�ж�����
void CAN_SetITStatus(unsigned char CAN_IT_bit);
void CAN_UnsetITStatus(unsigned char CAN_IT_bit);
ITStatus CAN_GetITStatus(unsigned char CAN_IT_bit);
void CAN_ClearITStatus(unsigned char CAN_IT_bit);
#endif /* BSP_CAN_H_ */
