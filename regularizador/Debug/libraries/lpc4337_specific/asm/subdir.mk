################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../libraries/lpc4337_specific/asm/adc_peripheral.s \
../libraries/lpc4337_specific/asm/ccu_peripheral.s \
../libraries/lpc4337_specific/asm/chip_core.s \
../libraries/lpc4337_specific/asm/cr_startup_lpc43xx.s \
../libraries/lpc4337_specific/asm/creg_peripheral.s \
../libraries/lpc4337_specific/asm/dac_peripheral.s \
../libraries/lpc4337_specific/asm/gpdma_peripheral.s \
../libraries/lpc4337_specific/asm/gpio_peripheral.s \
../libraries/lpc4337_specific/asm/nvic_peripheral.s \
../libraries/lpc4337_specific/asm/sct_peripheral.s \
../libraries/lpc4337_specific/asm/sct_pwm.s \
../libraries/lpc4337_specific/asm/scu_peripheral.s \
../libraries/lpc4337_specific/asm/sysinit.s \
../libraries/lpc4337_specific/asm/timer_peripheral.s 

OBJS += \
./libraries/lpc4337_specific/asm/adc_peripheral.o \
./libraries/lpc4337_specific/asm/ccu_peripheral.o \
./libraries/lpc4337_specific/asm/chip_core.o \
./libraries/lpc4337_specific/asm/cr_startup_lpc43xx.o \
./libraries/lpc4337_specific/asm/creg_peripheral.o \
./libraries/lpc4337_specific/asm/dac_peripheral.o \
./libraries/lpc4337_specific/asm/gpdma_peripheral.o \
./libraries/lpc4337_specific/asm/gpio_peripheral.o \
./libraries/lpc4337_specific/asm/nvic_peripheral.o \
./libraries/lpc4337_specific/asm/sct_peripheral.o \
./libraries/lpc4337_specific/asm/sct_pwm.o \
./libraries/lpc4337_specific/asm/scu_peripheral.o \
./libraries/lpc4337_specific/asm/sysinit.o \
./libraries/lpc4337_specific/asm/timer_peripheral.o 


# Each subdirectory must supply rules for building sources it contributes
libraries/lpc4337_specific/asm/%.o: ../libraries/lpc4337_specific/asm/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -DDEBUG -D__CODE_RED -DCORE_M4 -D__LPC43XX__ -D__REDLIB__ -D__MULTICORE_NONE -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\firmware_base\inc" -g3 -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -D__REDLIB__ -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


