/*
 * *****************************************************************************************
 *
 * 		Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
 * 		
 * @file			GOWIN_M3_it.c
 * @author		Embedded Development Team
 * @version		V1.0.0
 * @date			2020-4-1 09:00:00
 * @brief			Main Interrupt Service Routines.
 * 						This file provides template for all exceptions handler and
 * 						peripherals interrupt service routine.
 ******************************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "GOWIN_M3_it.h"
#include "GOWIN_M3_uart.h"

#include "FreeRTOS.h"
#include "task.h"

/** @addtogroup GOWIN_M3_StdPeriph_Template
  * @{
  */


/**
  * @brief  This function handles NMI exception.
  * @param  none
  * @retval none
  */
void NMI_Handler(void)
{
}

/**
  * @brief  This function handles Hard Fault exception.
  * @param  none
  * @retval none
  */
void HardFault_Handler(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Memory Manage exception.
  * @param  none
  * @retval none
  */
void MemManage_Handler(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Bus Fault exception.
  * @param  none
  * @retval none
  */
void BusFault_Handler(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles Usage Fault exception.
  * @param  none
  * @retval none
  */
void UsageFault_Handler(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/**
  * @brief  This function handles SVCall exception.
  * @param  none
  * @retval none
  */
//void SVC_Handler(void)
//{
//}

/**
  * @brief  This function handles Debug Monitor exception.
  * @param  none
  * @retval none
  */
void DebugMon_Handler(void)
{
}

/**
  * @brief  This function handles PendSVC exception.
  * @param  none
  * @retval none
  */
//void PendSV_Handler(void)
//{
//}

extern void xPortSysTickHandler(void);
void SysTick_Handler(void)
{
	if(xTaskGetSchedulerState()!= taskSCHEDULER_NOT_STARTED) {
		xPortSysTickHandler();
	}
}

/******************************************************************************/
/*             Gowin_EMPU_M3 Peripherals Interrupt Handlers                   */
/*  Add here the Interrupt Handler for the used peripheral(s) (XXX), for the  */
/*  available peripheral interrupt handler's name please refer to the startup */
/*  file (startup_GOWIN_M3.s).                                                */
/******************************************************************************/

/**
  * @brief  This function handles UART0 interrupt request.
  * @param  none
  * @retval none
  */
void UART0_Handler(void)
{
//	if(UART_GetRxIRQStatus(UART0) == SET) {
//
//		if(uart_rx_cnt == UART_RX_LEN-1) {
//			uart_rx_cnt = 0;
//		} else {
//			uart_rx_cnt = uart_rx_cnt + 1;
//		}
//
//		uart_rx_buf[uart_rx_cnt] = UART_ReceiveChar(UART0);
//
//		if(uart_rx_buf[uart_rx_cnt] == 0x0d) { // Line breaks:0x0A-->\n   carriage return:0x0D-->\r
//			comma_detect = 1;
//		}
//	}
//
//	UART_ClearRxIRQ(UART0);
}

/**
  * @brief  This function handles UART1 interrupt request.
  * @param  none
  * @retval none
  */
void UART1_Handler(void)
{
}

/**
  * @brief  This function handles TIMER0 interrupt request.
  * @param  none
  * @retval none
  */
void TIMER0_Handler(void)
{
}

/**
  * @brief  This function handles TIMER1 interrupt request.
  * @param  none
  * @retval none
  */
void TIMER1_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_0~15 combine interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_Handler(void)
{
}

/**
  * @brief  This function handles RTC interrupt request.
  * @param  none
  * @retval none
  */
void RTC_Handler(void)
{	
}

/**
  * @brief  This function handles I2C interrupt request.
  * @param  none
  * @retval none
  */
void I2C_Handler(void)
{
}

/**
  * @brief  This function handles Ethernet interrupt request.
  * @param  none
  * @retval none
  */
void ENT_Handler(void)
{
	if(Ethernet->ETH_RX_IS) {
		Ethernet->ETH_RX_IE = 0;
		rx_int_event();
		Ethernet->ETH_RX_IE = 1;

	} else if(Ethernet->ETH_TX_IS) {
		Ethernet->ETH_TX_IE = 0;
		tx_int_event();
		Ethernet->ETH_TX_IE = 1;

	} else if(Ethernet->MIIM_IS & 0x1) {
		Ethernet->MIIM_IE = 0;
		miim_rd_int_event();
		Ethernet->MIIM_IE = 3;

	} else if(Ethernet->MIIM_IS & 0x2) {
		Ethernet->MIIM_IE = 0;
		miim_wr_int_event();
		Ethernet->MIIM_IE = 3;
	}
}

/**
  * @brief  This function handles GPIO0_0 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_0_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_1 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_1_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_2 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_2_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_3 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_3_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_4 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_4_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_5 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_5_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_6 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_6_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_7 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_7_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_8 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_8_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_9 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_9_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_10 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_10_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_11 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_11_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_12 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_12_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_13 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_13_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_14 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_14_Handler(void)
{
}

/**
  * @brief  This function handles GPIO0_15 interrupt request.
  * @param  none
  * @retval none
  */
void GPIO0_15_Handler(void)
{
}

/**
  * @brief  This function handles USER INT0 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT0_Handler(void)
{
}

/**
  * @brief  This function handles USER INT1 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT1_Handler(void)
{
}

/**
  * @brief  This function handles USER INT2 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT2_Handler(void)
{
}

/**
  * @brief  This function handles USER INT3 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT3_Handler(void)
{
}

/**
  * @brief  This function handles USER INT4 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT4_Handler(void)
{
}

/**
  * @brief  This function handles USER INT5 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT5_Handler(void)
{
}

/**
  * @brief  This function handles USER INT6 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT6_Handler(void)
{
}

/**
  * @brief  This function handles USER INT7 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT7_Handler(void)
{
}

/**
  * @brief  This function handles USER INT8 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT8_Handler(void)
{
}

/**
  * @brief  This function handles USER INT9 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT9_Handler(void)
{
}

/**
  * @brief  This function handles USER INT10 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT10_Handler(void)
{
}

/**
  * @brief  This function handles USER INT11 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT11_Handler(void)
{
}

/**
  * @brief  This function handles USER INT12 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT12_Handler(void)
{
}

/**
  * @brief  This function handles USER INT13 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT13_Handler(void)
{
}

/**
  * @brief  This function handles USER INT14 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT14_Handler(void)
{
}

/**
  * @brief  This function handles USER INT15 interrupt request.
  * @param  none
  * @retval none
  */
void USER_INT15_Handler(void)
{
}

/**
  * @}
  */ 

/*************************GowinSemiconductor*****END OF FILE*********************/
