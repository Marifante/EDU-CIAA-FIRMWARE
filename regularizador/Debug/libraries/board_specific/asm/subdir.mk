################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../libraries/board_specific/asm/delay.s \
../libraries/board_specific/asm/gpio_board.s \
../libraries/board_specific/asm/interrupts_board.s \
../libraries/board_specific/asm/pwm_board.s 

OBJS += \
./libraries/board_specific/asm/delay.o \
./libraries/board_specific/asm/gpio_board.o \
./libraries/board_specific/asm/interrupts_board.o \
./libraries/board_specific/asm/pwm_board.o 


# Each subdirectory must supply rules for building sources it contributes
libraries/board_specific/asm/%.o: ../libraries/board_specific/asm/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU Assembler'
	arm-none-eabi-gcc -c -x assembler-with-cpp -DDEBUG -D__CODE_RED -DCORE_M4 -D__LPC43XX__ -D__REDLIB__ -D__MULTICORE_NONE -I"C:\Users\Julian\Documents\electronica_digital2\EDU-CIAA-FIRMWARE\firmware_base\inc" -g3 -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb -D__REDLIB__ -specs=redlib.specs -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


