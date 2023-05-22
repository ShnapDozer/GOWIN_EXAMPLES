################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include USER/Common/source/subdir.mk
-include USER/subdir.mk
-include SYSTEM/subdir.mk
-include STARTUP/subdir.mk
-include PERIPHERALS/Sources/subdir.mk
-include FreeRTOS/portable/MemMang/subdir.mk
-include FreeRTOS/portable/GNU/ARM_CM3/subdir.mk
-include FreeRTOS/subdir.mk
-include CORE/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
sm3_freertos_app.bin \

SECONDARY_SIZE += \
sm3_freertos_app.siz \


# All Target
all: sm3_freertos_app.elf secondary-outputs

# Tool invocations
sm3_freertos_app.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM Cross C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -T "C:\Users\Work\Desktop\sm3_freertos_app\Script\GOWIN_M3_flash.ld" -Xlinker --gc-sections -Wl,-Map,"sm3_freertos_app.map" -o "sm3_freertos_app.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

sm3_freertos_app.bin: sm3_freertos_app.elf
	@echo 'Invoking: GNU ARM Cross Create Flash Image'
	arm-none-eabi-objcopy -O binary "sm3_freertos_app.elf"  "sm3_freertos_app.bin"
	@echo 'Finished building: $@'
	@echo ' '

sm3_freertos_app.siz: sm3_freertos_app.elf
	@echo 'Invoking: GNU ARM Cross Print Size'
	arm-none-eabi-size --format=berkeley "sm3_freertos_app.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) sm3_freertos_app.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
