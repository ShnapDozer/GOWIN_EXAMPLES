################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LCD_lib/source/lcd_hd44780.c 

OBJS += \
./LCD_lib/source/lcd_hd44780.o 

C_DEPS += \
./LCD_lib/source/lcd_hd44780.d 


# Each subdirectory must supply rules for building sources it contributes
LCD_lib/source/%.o: ../LCD_lib/source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"C:\Users\Work\Desktop\sm3_freertos_app\CORE" -I"C:\Users\Work\Desktop\sm3_freertos_app\LCD_lib\include" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\include" -I"C:\Users\Work\Desktop\sm3_freertos_app\PERIPHERALS\Includes" -I"C:\Users\Work\Desktop\sm3_freertos_app\SYSTEM" -I"C:\Users\Work\Desktop\sm3_freertos_app\USER" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\portable\GNU\ARM_CM3" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


