################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../PERIPHERALS/Sources/GOWIN_M3_ddr3.c \
../PERIPHERALS/Sources/GOWIN_M3_ethernet.c \
../PERIPHERALS/Sources/GOWIN_M3_gpio.c \
../PERIPHERALS/Sources/GOWIN_M3_i2c.c \
../PERIPHERALS/Sources/GOWIN_M3_misc.c \
../PERIPHERALS/Sources/GOWIN_M3_rtc.c \
../PERIPHERALS/Sources/GOWIN_M3_spi.c \
../PERIPHERALS/Sources/GOWIN_M3_spi_flash.c \
../PERIPHERALS/Sources/GOWIN_M3_timer.c \
../PERIPHERALS/Sources/GOWIN_M3_uart.c \
../PERIPHERALS/Sources/GOWIN_M3_wdog.c 

OBJS += \
./PERIPHERALS/Sources/GOWIN_M3_ddr3.o \
./PERIPHERALS/Sources/GOWIN_M3_ethernet.o \
./PERIPHERALS/Sources/GOWIN_M3_gpio.o \
./PERIPHERALS/Sources/GOWIN_M3_i2c.o \
./PERIPHERALS/Sources/GOWIN_M3_misc.o \
./PERIPHERALS/Sources/GOWIN_M3_rtc.o \
./PERIPHERALS/Sources/GOWIN_M3_spi.o \
./PERIPHERALS/Sources/GOWIN_M3_spi_flash.o \
./PERIPHERALS/Sources/GOWIN_M3_timer.o \
./PERIPHERALS/Sources/GOWIN_M3_uart.o \
./PERIPHERALS/Sources/GOWIN_M3_wdog.o 

C_DEPS += \
./PERIPHERALS/Sources/GOWIN_M3_ddr3.d \
./PERIPHERALS/Sources/GOWIN_M3_ethernet.d \
./PERIPHERALS/Sources/GOWIN_M3_gpio.d \
./PERIPHERALS/Sources/GOWIN_M3_i2c.d \
./PERIPHERALS/Sources/GOWIN_M3_misc.d \
./PERIPHERALS/Sources/GOWIN_M3_rtc.d \
./PERIPHERALS/Sources/GOWIN_M3_spi.d \
./PERIPHERALS/Sources/GOWIN_M3_spi_flash.d \
./PERIPHERALS/Sources/GOWIN_M3_timer.d \
./PERIPHERALS/Sources/GOWIN_M3_uart.d \
./PERIPHERALS/Sources/GOWIN_M3_wdog.d 


# Each subdirectory must supply rules for building sources it contributes
PERIPHERALS/Sources/%.o: ../PERIPHERALS/Sources/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"C:\Users\Work\Desktop\sm3_freertos_app\CORE" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\include" -I"C:\Users\Work\Desktop\sm3_freertos_app\PERIPHERALS\Includes" -I"C:\Users\Work\Desktop\sm3_freertos_app\SYSTEM" -I"C:\Users\Work\Desktop\sm3_freertos_app\USER" -I"C:\Users\Work\Desktop\sm3_freertos_app\FreeRTOS\portable\GNU\ARM_CM3" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


