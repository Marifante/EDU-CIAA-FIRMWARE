################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/board_specific/src/delay.c \
../libraries/board_specific/src/gpio_board.c \
../libraries/board_specific/src/interrupts_board.c \
../libraries/board_specific/src/pwm_board.c 

OBJS += \
./libraries/board_specific/src/delay.o \
./libraries/board_specific/src/gpio_board.o \
./libraries/board_specific/src/interrupts_board.o \
./libraries/board_specific/src/pwm_board.o 

C_DEPS += \
./libraries/board_specific/src/delay.d \
./libraries/board_specific/src/gpio_board.d \
./libraries/board_specific/src/interrupts_board.d \
./libraries/board_specific/src/pwm_board.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/board_specific/src/%.o: ../libraries/board_specific/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__USE_LPCOPEN -D__CODE_RED -DCORE_M4 -D__LPC43XX__ -D__REDLIB__ -D__MULTICORE_NONE -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\lpc_chip_43xx\inc" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\lpc_chip_43xx\inc\usbd" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\regularizador\libraries\board_specific\inc" -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\regularizador\libraries\lpc4337_specific\inc" -O0 -fno-common -g3 -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -fsingle-precision-constant -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


