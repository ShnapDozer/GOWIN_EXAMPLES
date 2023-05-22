#include <stdbool.h>
#include <stdio.h>

#ifndef __GPIOWRAPPER_H_
#define __GPIOWRAPPER_H_

extern void gpioInit(void);
extern void writeBit(uint32_t pins, bool value);
extern void writeVector(uint32_t pins, uint32_t value);



#endif /* __GPIO_WRAPPER_H_ */
