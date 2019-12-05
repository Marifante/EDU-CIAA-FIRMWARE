################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/lpc4337_specific/src/adc_peripheral.c \
../libraries/lpc4337_specific/src/ccu_peripheral.c \
../libraries/lpc4337_specific/src/chip_core.c \
../libraries/lpc4337_specific/src/cr_startup_lpc43xx.c \
../libraries/lpc4337_specific/src/creg_peripheral.c \
../libraries/lpc4337_specific/src/dac_peripheral.c \
../libraries/lpc4337_specific/src/gpdma_peripheral.c \
../libraries/lpc4337_specific/src/gpio_peripheral.c \
../libraries/lpc4337_specific/src/nvic_peripheral.c \
../libraries/lpc4337_specific/src/sct_peripheral.c \
../libraries/lpc4337_specific/src/sct_pwm.c \
../libraries/lpc4337_specific/src/scu_peripheral.c \
../libraries/lpc4337_specific/src/sysinit.c \
../libraries/lpc4337_specific/src/timer_peripheral.c 

OBJS += \
./libraries/lpc4337_specific/src/adc_peripheral.o \
./libraries/lpc4337_specific/src/ccu_peripheral.o \
./libraries/lpc4337_specific/src/chip_core.o \
./libraries/lpc4337_specific/src/cr_startup_lpc43xx.o \
./libraries/lpc4337_specific/src/creg_peripheral.o \
./libraries/lpc4337_specific/src/dac_peripheral.o \
./libraries/lpc4337_specific/src/gpdma_peripheral.o \
./libraries/lpc4337_specific/src/gpio_peripheral.o \
./libraries/lpc4337_specific/src/nvic_peripheral.o \
./libraries/lpc4337_specific/src/sct_peripheral.o \
./libraries/lpc4337_specific/src/sct_pwm.o \
./libraries/lpc4337_specific/src/scu_peripheral.o \
./libraries/lpc4337_specific/src/sysinit.o \
./libraries/lpc4337_specific/src/timer_peripheral.o 

C_DEPS += \
./libraries/lpc4337_specific/src/adc_peripheral.d \
./libraries/lpc4337_specific/src/ccu_peripheral.d \
./libraries/lpc4337_specific/src/chip_core.d \
./libraries/lpc4337_specific/src/cr_startup_lpc43xx.d \
./libraries/lpc4337_specific/src/creg_peripheral.d \
./libraries/lpc4337_specific/src/dac_peripheral.d \
./libraries/lpc4337_specific/src/gpdma_peripheral.d \
./libraries/lpc4337_specific/src/gpio_peripheral.d \
./libraries/lpc4337_specific/src/nvic_peripheral.d \
./libraries/lpc4337_specific/src/sct_peripheral.d \
./libraries/lpc4337_specific/src/sct_pwm.d \
./libraries/lpc4337_specific/src/scu_peripheral.d \
./libraries/lpc4337_specific/src/sysinit.d \
./libraries/lpc4337_specific/src/timer_peripheral.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/lpc4337_specific/src/%.o: ../libraries/lpc4337_specific/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_LPCOPEN -D__CODE_RED -DCORE_M4 -D__LPC43XX__ -D__REDLIB__ -D__MULTICORE_NONE -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\lpc_chip_43xx\inc" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\lpc_chip_43xx\inc\usbd" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\regularizador\libraries\board_specific\inc" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\regularizador\libraries\lpc4337_specific\inc" -O0 -fno-common -g3 -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fsingle-precision-constant -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


