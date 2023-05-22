#include <stdbool.h>
#include <stdio.h>

#include "GOWIN_M3.h"
#include "FreeRTOS.h"
#include "task.h"

#include "Common/include/gpioWrapper.h"
#include "Common/include/uartWrapper.h"

//Macros
#define     REG_START_ADDR                 (AHB2PERIPH_BASE + 0x0000000)
#define     REG0_VALUE                *(volatile uint32_t*)REG0_ADDR

#define     REG1_ADDR                 (AHB2PERIPH_BASE + 0x0000004)
#define     REG1_VALUE                *(volatile uint32_t*)REG1_ADDR

#define     REG2_ADDR                 (AHB2PERIPH_BASE + 0x0000008)
#define     REG2_VALUE                *(volatile uint32_t*)REG2_ADDR

#define     REG3_ADDR                 (AHB2PERIPH_BASE + 0x0000003)
#define     REG3_VALUE                *(volatile uint32_t*)REG3_ADDR

TaskHandle_t blinkLedTaskHandler;

static void sysTickInit(void);

static void blinkLedTask(void);



int main(void)
{
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
	uartInit(115200);
	gpioInit();
	sysTickInit();
	printUart("Init section success! :)");

	uint32_t space = 0x0000004;

	*(volatile uint32_t*)(REG_START_ADDR + space*0) = (uint32_t)1;
	for(int i = 0; i < 32; ++i) {
		char str[10];
		sprintf(str, "%d", *(volatile uint32_t*)(REG_START_ADDR + space*i));
		printUart(str);

	}

//	printf("AXI4_Lite_Slave REG0(Address = 0x0) Value is %d\r\n",reg0_read);
//	uart_input_receive();
//	REG0_VALUE = reg0_write;

	taskENTER_CRITICAL();
	
    xTaskCreate((TaskFunction_t)blinkLedTask,
                (const char *)"blinkLedTask",
                (uint16_t)16,
                (void *)NULL,
                (UBaseType_t)0,
                (TaskHandle_t *)blinkLedTaskHandler);
				
    taskEXIT_CRITICAL();
	
    vTaskStartScheduler();
	
	for(;;);
}

static void sysTickInit(void)
{
	uint32_t temp;
	temp = (1000 / configTICK_RATE_HZ) * (SystemCoreClock / 1000) - 1;

	SysTick->LOAD = temp;
	SysTick->VAL = temp;
	SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;
}

static void blinkLedTask(void) {

	bool ledOn = 0;

    while (1)
	{
    	ledOn ? GPIO_ResetBit(GPIO0, GPIO_Pin_1) : GPIO_SetBit(GPIO0, GPIO_Pin_1);
    	ledOn = !ledOn;

		vTaskDelay(50);
	}
}
