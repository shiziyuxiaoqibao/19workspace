#include "includes.h"


/****************************************************************************************
 * ������     ��CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID)
 * �������ܣ�CAN���չ�������������
 * ��ڲ�����֡�ṹѡ��					 0����׼֡ 1����չ֡
 * 			 ���ݶ����ʽ��    CANID_MODE  ��0����ʵID�Ҷ���,1���Ĵ�����ʽ����룩
 * 			 ������ID��    	   CAN_FilterID����׼֡,11λ��Ч,��ǰ��λ����Ϊ���ԣ�
 * 			 					                  ����չ֡,29λ��Ч,��ǰ��λ����Ϊ���ԣ�
 * 			 ��ûλID��   	   CAN_MASKID  ����ӦλΪ1����û��0Ϊ�Ƚϣ�
 * ����          ��1-ƥ��ID���óɹ�	 0-ƥ��ID���ô���
****************************************************************************************/
FilterConfig_STATE CAN_IDFilterConfig(uint8 CAN_IDE, uint8 CANID_MODE, uint32 CAN_FilterID, uint32 CAN_MASKID)
{
	if(CAN_IDE == 0) //��׼ģʽ
	{
// ID�������
		if(CANID_MODE == 0) //11λID�Ҷ���
		{
			if(CAN_FilterID>0x7FFF)
				return False;
			else
			{
				CAN_FilterID <<=5;
				CAN_MASKID <<=5;
			}
		}
		else//11λID�����
		{
			if(CAN_FilterID>0xFFE0) //11λID����룬��ֵ����11λ�����ж�����ID����
				return False;
		}
		if(CAN_FilterID&0xFE00 == 0xFE00) //11λID����룬CANЭ��Ҫ�󣬸�7λ����ȫ��������λ������7λȫ��Ϊ1�Ǵ����ID��
			return False;
// ID�������
		CANMOD |= CAN_reset; //CANģ����븴λģʽ����ʼ������Ĵ���
		CANACR0 = CAN_FilterID>>8;  //���ý���ʶ��ID
		CANACR1 = CAN_FilterID&0xE0;
		CANACR2 = 0;
		CANACR3 = 0;
		CANMSK0 = CAN_MASKID>>8;  //����ʶ��ID����  CAN_MASKID>>8
		CANMSK1 = CAN_MASKID&0xE0;//CAN_MASKID&0xE0
		CANMSK2 = 0xFF;
		CANMSK3 = 0xFF;
		CANMOD &= ~CAN_reset; //CANģ���˳���λģʽ�����빤��ģʽ
		return OK;
	}
	else
	{
		if(CANID_MODE == 0)
		{
			if(CAN_FilterID>0x1FFFFFFF)
				return False;
			else
			{
				CAN_FilterID <<=3;
				CAN_MASKID   <<=3;
			}
		}
		else
		{
			if(CAN_FilterID>0xFFFFFFF8)
				return False;
		}
		if(CAN_FilterID&0xFE000000 == 0xFE000000)
			return False;
		CANMOD |= CAN_reset;
		CANACR0 = CAN_FilterID>>24;
		CANACR1 = CAN_FilterID>>16;
		CANACR2 = CAN_FilterID>>8;
		CANACR3 = CAN_FilterID&0xF8;
		CANMSK0 = CAN_MASKID>>24;
		CANMSK1 = CAN_MASKID>>16;
		CANMSK2 = CAN_MASKID>>8;
		CANMSK3 = CAN_MASKID&0xF8;
		CANMOD &= ~CAN_reset;
		return OK;
	}
}

/****************************************************************************************
 * ������     ��CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS1, uint8 CAN_MODE, uint8 CAN_pre)
 * �������ܣ�CAN��ʼ��
 * ��ڲ�������ͬ��ʱ�ӿ�ȣ�    CAN_SJW��1~4��
 * 			 ��λ�����1��	 CAN_BS1��1~16��
 * 			 ��λ�����2��	 CAN_BS2��1~8��
 * 			 �ػ�ģʽ	�� 		 1-ʹ��,0-����
 * 			 CAN��Ƶ: 		 CAN_pre(1~64)	(Tscl =  2*Tclk*CAN_pre) TclkΪʱ����СTq=0.0625us
 * ����          ����
 *
****************************************************************************************/
void CAN_Init(uint8 CAN_SJW, uint8 CAN_BS1, uint8 CAN_BS2, uint8 CAN_MODE, uint8 CAN_pre)
{
	//���ų�ʼ��,���� CANRX Ϊ�������룬CANTX Ϊ��������� 2,6,1,0,8
	ANS15 = 0;
	ANS14 = 0;
	TR15 = 0;
	TR14 = 1;
	//ʹ�ܽ��븴λģʽ
	CANMOD |= CAN_reset;
	//Ĭ��ѡ���������ʱ��16M,��������Ҫ���ò�ͬ�ķ�Ƶ����С��Ƶ����
	if(CAN_MODE)
	{
		CANMOD |= CAN_enable|CANCLK_SEL_HFCLK|CAN_LBACK_disable;
	}
	else
	{
		CANMOD |= CAN_enable|CANCLK_SEL_HFCLK;
	}

	//���ò����ʣ�λ����
	CANBTR = (CAN_SJW-1)<<6|(CAN_pre-1);
	CANSEG = CAN_Sample_1|(CAN_BS1-1)|(CAN_BS2-1)<<4;
	//�������ƼĴ���,Ĭ��96
	//TX�������,��λʱΪ0,����255���߹ر�
	//RX�������,��λʱΪ0
	//���մ���Ĵ���,ƥ��ID
	CANMOD &= ~CAN_reset;
}

/****************************************************************************************
 * ������     ��CAN_Transmit_Message(unsigned char* CAN_send_data)
 * �������ܣ�CAN���ݷ���
 * ��ڲ���������������
 * ����          ��CAN_SendData_STATE,���ͳɹ�&ʧ��
 *
****************************************************************************************/
CAN_SendData_STATE CAN_Transmit_Message(CAN_DATA_INF* CAN_Send_DATA)
{
	unsigned char temp;
	unsigned int Delay_Count ;

	Delay_Count=0;
	while(!TXBSTA)//�ȴ�CPU���Է��ʷ��ͻ�����
	{
		if(++Delay_Count>0xFE0)
			return False;
	}
//������д��
	temp = (CAN_Send_DATA->data_ide<<7)|(CAN_Send_DATA->data_rtr<<6|CAN_Send_DATA->data_length);
	CANTXINF = temp;
	if(CAN_Send_DATA->data_ide==0)//��׼֡
	{
		if(CAN_Send_DATA->data_rtr==0)//����֡
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->raw_data[0];
			CANTXID3=CAN_Send_DATA->raw_data[1];
			CANTXDT0=CAN_Send_DATA->raw_data[2];
			CANTXDT1=CAN_Send_DATA->raw_data[3];
			CANTXDT2=CAN_Send_DATA->raw_data[4];
			CANTXDT3=CAN_Send_DATA->raw_data[5];
			CANTXDT4=CAN_Send_DATA->raw_data[6];
			CANTXDT5=CAN_Send_DATA->raw_data[7];
		}
		else//��׼Զ��֡
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
		}
	}
	else//��չ֡
	{
		if(CAN_Send_DATA->data_rtr==0) //Ϊ����֡
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->data_id[2];
			CANTXID3=CAN_Send_DATA->data_id[3];
			CANTXDT0=CAN_Send_DATA->raw_data[0];
			CANTXDT1=CAN_Send_DATA->raw_data[1];
			CANTXDT2=CAN_Send_DATA->raw_data[2];
			CANTXDT3=CAN_Send_DATA->raw_data[3];
			CANTXDT4=CAN_Send_DATA->raw_data[4];
			CANTXDT5=CAN_Send_DATA->raw_data[5];
			CANTXDT6=CAN_Send_DATA->raw_data[6];
			CANTXDT7=CAN_Send_DATA->raw_data[7];
		}
		else//Զ��֡
		{
			CANTXID0=CAN_Send_DATA->data_id[0];
			CANTXID1=CAN_Send_DATA->data_id[1];
			CANTXID2=CAN_Send_DATA->data_id[2];
			CANTXID3=CAN_Send_DATA->data_id[3];
		}
	}

//���η���
	CANCMR = 0x03;
//�ȴ��������
	Delay_Count=0;
	while(!TCSTA)
	{
		if(++Delay_Count>0xFE0)
			return False;
	}

	return OK;
}

/****************************************************************************************
 * ������     ��CAN_Receive_Message_Configuration
 * �������ܣ�CAN���ݽ���
 * ��ڲ�����ȫ�ֱ���,CAN_Rev_DATA,���յ������ݷ���˽ṹ��
 * ����          ����
 *
****************************************************************************************/
void CAN_Receive_Message_Configuration(void)
{
	unsigned int  can_point=0;
	unsigned char i;

	//����ָ��
	if(can_data_hand<8)
	{
		can_point =(0x1C80 + can_data_hand * 0x10);
	}
	else
	{
		can_point =(0x1D80+(can_data_hand-8)*0x10);
	}
	//ȡ������
	for(i=0;i<13;i++)
	{
		CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
	}
	//��ȡ֡��Ϣ��֡����
	CAN_Rev_DATA.data_ide = CAN_Rev_BUF[0]>>7;
	CAN_Rev_DATA.data_rtr = (CAN_Rev_BUF[0]&0x40)>>6;
	CAN_Rev_DATA.data_length = CAN_Rev_BUF[0]&0x0F;
	if(CAN_Rev_DATA.data_ide)	  //��չ֡
	{
		//����ID
		CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
		CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2];
		CAN_Rev_DATA.data_id[2]=CAN_Rev_BUF[3];
		CAN_Rev_DATA.data_id[3]=CAN_Rev_BUF[4]&0xF8;

		if(CAN_Rev_DATA.data_rtr)//Զ��֡
		{
			;
		}
		else						//����֡
		{
			if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//�ж����ݳ���
			{
				//��������
				for(i=0;i<CAN_Rev_DATA.data_length;i++)
				{
					CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[5+i];
				}
			}
		}
	}
	else//��׼֡
	{
		//����ID
		CAN_Rev_DATA.data_id[0]=CAN_Rev_BUF[1];
		CAN_Rev_DATA.data_id[1]=CAN_Rev_BUF[2]&0xE0;

		if(CAN_Rev_DATA.data_rtr)//Զ��֡
		{
			;
		}
		else//����֡
		{
			if(CAN_Rev_DATA.data_length&&(CAN_Rev_DATA.data_length<=8))//�ж����ݳ���
			{
				//��������
				for(i=0;i<CAN_Rev_DATA.data_length;i++)
				{
					CAN_Rev_DATA.raw_data[i]=CAN_Rev_BUF[3+i];
				}
			}
		}
	}

	//���ݴ�����ϣ����±���
	CANCMR = 0x04;//�ͷŻ�����

	can_data_hand++;//ָ��+1
	if(can_data_hand==16)//��ָ��ָ��15���ϣ�����0
	{
		can_data_hand=0;
	}
}

/****************************************************************************************
 * ������     ��unsigned char CAN_GetITStatus
 * �������ܣ���ȡCAN�жϱ�־λ
 * ��ڲ������ж�����
 * ����          ��״̬��RESET 0  SET 1
 * ���Ҫ���ж���ʹ�ã���Ҫ�򿪶�Ӧ�ж�ʹ��
****************************************************************************************/
ITStatus CAN_GetITStatus(unsigned char CAN_IT_bit)
{
	if(CANIF&CAN_IT_bit)
		return SET_STATE;
	else
		return RESET_STATE;
}

/****************************************************************************************
 * ������     ��CAN_CLRITStatus
 * �������ܣ������ӦCAN�жϱ�־λ
 * ��ڲ������ж�����
 * ����          ����
****************************************************************************************/
void CAN_ClearITStatus(unsigned char CAN_IT_bit)
{
	CANIF &= (~CAN_IT_bit);
}

/****************************************************************************************
 * ������     ��CAN_SetITStatus
 * �������ܣ����ö�ӦCAN�ж�
 * ��ڲ������ж�����
 * ����          ����
****************************************************************************************/
void CAN_SetITStatus(unsigned char CAN_IT_bit)
{
	CANIF &= (~CAN_IT_bit);
	CANIE = CAN_IT_bit;
}

/****************************************************************************************
 * ������     ��CAN_UnsetITStatus
 * �������ܣ�ȡ����ӦCAN�ж�
 * ��ڲ������ж�����
 * ����          ����
****************************************************************************************/
void CAN_UnsetITStatus(unsigned char CAN_IT_bit)
{
	CANIE &= (~CAN_IT_bit);
}
