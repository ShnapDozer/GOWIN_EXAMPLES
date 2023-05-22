#include "../include/uartWrapper.h"

void uartInit(uint32_t baudrate)
{
	UART_InitTypeDef UART_InitStruct;

	UART_InitStruct.UART_Mode.UARTMode_Tx = ENABLE;
	UART_InitStruct.UART_Mode.UARTMode_Rx = ENABLE;
	UART_InitStruct.UART_Int.UARTInt_Tx = DISABLE;//TX Interrupt
	UART_InitStruct.UART_Int.UARTInt_Rx = ENABLE;//RX Interrupt
	UART_InitStruct.UART_Ovr.UARTOvr_Tx = DISABLE;
	UART_InitStruct.UART_Ovr.UARTOvr_Rx = DISABLE;
	UART_InitStruct.UART_Hstm = DISABLE;
	UART_InitStruct.UART_BaudRate = baudrate;//Baud Rate

	UART_Init(UART0,&UART_InitStruct);
}

void _putchar(char character)
{
	UART_SendChar(DEFAULTCONSOLE, character);
}

void printUart(const char *str)
{
	UART_SendString(DEFAULTCONSOLE, (char *)str);
	UART_SendString(DEFAULTCONSOLE, (char *)"\r\n");
}
