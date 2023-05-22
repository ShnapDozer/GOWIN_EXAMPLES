#include "../include/gpioWrapper.h"

#include "GOWIN_M3.h"

void gpioInit(void)
{
	GPIO_InitTypeDef GPIO_InitType;

	GPIO_InitType.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3;
	GPIO_InitType.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitType.GPIO_Int = GPIO_Int_Disable;

	GPIO_Init(GPIO0,&GPIO_InitType);

	GPIO_WriteBits(GPIO0,0xF);//light : low level
}

void writeBit(uint32_t pins, bool value)
{
	if (value)	{
		GPIO_SetBit(GPIO0, pins);
	} else {
		GPIO_ResetBit(GPIO0, pins);
	}
}

void writeVector(uint32_t pins, uint32_t value)
{
	for (int i = 0; i < 16; i++)	{
		int bitmask = (0x1 << i) & pins; //isolates one pin at a time
		if (bitmask == 0x0) continue; //pin at this position doesn't need to be written
		writeBit(bitmask, (bool) (bitmask & value));
	}
}

