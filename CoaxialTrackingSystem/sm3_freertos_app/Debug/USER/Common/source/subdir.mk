################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USER/Common/source/ethernetWrapper.c \
../USER/Common/source/gpioWrapperr.c \
../USER/Common/source/uartWrapper.c 

OBJS += \
./USER/Common/source/ethernetWrapper.o \
./USER/Common/source/gpioWrapperr.o \
./USER/Common/source/uartWrapper.o 

C_DEPS += \
./USER/Common/source/ethernetWrapper.d \
./USER/Common/source/gpioWrapperr.d \
./USER/Common/source/uartWrapper.d 


# Each subdirectory must supply rules for building sources it contributes
USER/Common/source/%.o: ../USER/Common/source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"C:\Users\Work\Desktop\sm3_freertos_app\CORE" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\include" -I"C:\Users\Work\Desktop\sm3_freertos_app\PERIPHERALS\Includes" -I"C:\Users\Work\Desktop\sm3_freertos_app\SYSTEM" -I"C:\Users\Work\Desktop\sm3_freertos_app\USER" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\portable\GNU\ARM_CM3" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


