################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include libraries/lpc4337_specific/src/subdir.mk
-include libraries/board_specific/src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: regularizador.axf

# Tool invocations
regularizador.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\lpc_chip_43xx\Debug" -Xlinker -Map="regularizador.map" -Xlinker --gc-sections -Xlinker -print-memory-usage -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -T "firmware_base_Debug.ld" -o "regularizador.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) regularizador.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "regularizador.axf"; # arm-none-eabi-objcopy -v -O binary "regularizador.axf" "regularizador.bin" ; # checksum -p LPC4337 -d "regularizador.bin";
	-@echo ' '

.PHONY: all clean dependents post-build

-include ../makefile.targets
