#ifndef	_UART_H
#define	_UART_H

#include <stdint.h>
#include "GOWIN_M3.h"

#define DEFAULTCONSOLE UART0

extern void uartInit(uint32_t baudrate);
extern void _putchar(char character);
extern void printUart(const char *str);


#endif   
