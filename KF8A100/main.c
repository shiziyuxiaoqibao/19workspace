/*************************************************************************************
* ��Ŀ����   Mid_Light V2.0
* ����������ChipON IDE
* SW:V1.0.1.230104
* HW:V1.0.0.221228
* ʹ��оƬ��KF8A100GQP
* ���ߣ� shizi
* �޸ļ�¼:
*
* 1)���ı��������ʽ��λȡֵ����Ϊֱ�Ӹ�ֵ
* 2)�޸�Ϊ�ⲿ����
* 3)���ӿ��͹���
* 4)���ܻ������� ������ 221230
*
* note:Ӳ������R26��Ҫ��100K����Ϊ10K
*************************************************************************************/

#include "includes.h"

//ȫ�ֱ���������ָ��Ҫ��ȡCAN����֡�ĵڼ���,��ʼΪ0
volatile unsigned char can_data_hand=0;
volatile unsigned char CAN_Rev_BUF[13];
volatile CAN_DATA_INF CAN_Rev_DATA;
volatile unsigned int	Time_count;
volatile unsigned int	key_count;
unsigned char length =0;
//unsigned char ADC_data;

unsigned char Data_fram , Status_fram=0 ,Fram_lenth;
unsigned int ID_fram =0;
unsigned char Data[8]={0};
unsigned char   TX_Data[8];
unsigned char RX_Data[8];


//������
void main()
{
	unsigned int  can_point=0;
	unsigned int  Delay_Count ;
	unsigned char i;

	PLLCTL =0xb3;     //2��Ƶ
	HFCKCTL =0xcf;//ʹ�ܸ�Ƶ����ʱ�ӣ�INTHF,16M
	SCLKCTL =0X7c;//��ֹ���ʱ�ӣ�ѡ���ڲ���Ƶ��Ϊʱ��Դ����Ƶ��1:1��Ƶ

//	SCLKCTL =0x7c;
//	HFCKCTL =0xef;


//	PLLCTL =0xb3;

	PORT_Init();
	Timer1_Init();
	UART2_Init();
	Init_ADC(0x01);


	if(CAN_IDFilterConfig(0,1,0x24C0,0x0600) == OK) //����CAN��ʶ�������֡�ǣ���׼֡ID Ϊ0x116 ��0x126 ��0x136//0x24c0 0x0f00
	CAN_Init(2,5,2,0,2);		//500K
//	CAN_Init(2,6,1,0,8);		//125K
//	CAN_Init(2,7,2,0,8);		//100K

	PUIE = 1;
	AIE = 1;
	delay_ms(300);
	while(1)
	{
			keyl_detection();
			_NOP();
			_NOP();
			_NOP();
			_NOP();
			keyr_detection();


//��ʱ����Can��Ϣ
		if(Time_count>=100)			//500ms
		{
			Time_count=0;

//д������͵�����
			Status_fram =0;
			Data_fram =0;
			Fram_lenth =8;
			ID_fram =0x243;
//�������͵�����
			Delay_Count=0;
			while(!TXBSTA)//�ȴ�CPU���Է��ʷ��ͻ�����
			{
				P3LR0 =!P3LR0;
				if(++Delay_Count>0xFE0)
					break;
			}
//������д��
			CANTXINF = (Status_fram<<7)|(Data_fram<<6)|Fram_lenth;
			if(!Status_fram)//��׼֡
			{
				ID_fram <<=5;
				CANTXID0=ID_fram >> 8;
				CANTXID1=(unsigned char)ID_fram;
				if(!Data_fram)//����֡
				{
					CANTXID2=TX_Data[0];
					CANTXID3=TX_Data[1];
					CANTXDT0=TX_Data[2];
					CANTXDT1=TX_Data[3];
					CANTXDT2=TX_Data[4];
					CANTXDT3=TX_Data[5];
					CANTXDT4=TX_Data[6];
					CANTXDT5=TX_Data[7];
				}
			}

		//���η���
			CANCMR = 0x03;
		//�ȴ��������
			Delay_Count=0;
			while(!TCSTA)
			{
				if(++Delay_Count>0xFE0)
					break;
			}

	//		UART2_SendBuf(0,13,CAN_Rev_BUF);
	//		UART2_SendOneByte(0xAA);
		}
//�жϾ����������Ľ�����Ϣ���ж���ʹ��ָ��ᱨ�����������洦�����
		if(CANRXIF)
		{
//��������ָ��
			if(can_data_hand<8)
			{
				can_point =0x1C80 + can_data_hand * 0x10;
			}
			else
			{
				can_point =0x1D80+(can_data_hand-8)*0x10;
			}
			can_data_hand++;//ָ��+1
			if(can_data_hand==16)//��ָ��ָ��15���ϣ�����0
			{
				can_data_hand=0;
			}
//ȡ��can������������
			for(i=0;i<13;i++)
			{
				CAN_Rev_BUF[i]=*((unsigned char *)(can_point+i));
			}
//���ձ�׼֡�������ݰ�
			Status_fram =(CAN_Rev_BUF[0]&0x80) >>7; //0�Ǳ�׼֡
			Data_fram =(CAN_Rev_BUF[0]&0x40) >>6; //0������֡
			Fram_lenth =CAN_Rev_BUF[0]&0x0F; //���ݳ���

			ID_fram =CAN_Rev_BUF[1];
			ID_fram <<=8;
			ID_fram += CAN_Rev_BUF[2];
			ID_fram >>=5; //���ݳ���
			for (i =0;i<8;i++)
			{
				Data[i]=CAN_Rev_BUF[i+3];
//				CAN_RX_DATA[i]=CAN_Rev_BUF[i+5];    // ��չ֡
			}
//�����ƺ�����
			CANCMR = 0x04;//��ʹ��Ϣ��������1
			CANRXIF =0;


		}

	}	//end of while
}	//end of main

static unsigned int cleantime = 0U;
void Main_DataClean(void)
{
	static old_data0 = 0U ,old_data1 = 0U;
	if (TX_Data[0]!= 0U || TX_Data[1]!= 0U)
	{
		if (cleantime >= 100)
		{
			cleantime = 0;
			TX_Data[0] = 0U;
			TX_Data[1] = 0U;
		}
	}
}


void Main_CleanTimeSet(void)
{
	cleantime = 0U;
}
//�жϺ���0:0X04��ڵ�ַ
void int_fun0() __interrupt (0)
{
	if(T1IE && T1IF)			//T1��ʱ�ж�		500us gptrget1
	{
		T1IF=0;
		_CWDT();
		Time_count++;
		key_count++;
		cleantime ++;
	}
}


//�жϺ���1:0x14��ڵ�ַ
void int_fun1() __interrupt (1)
{

}
