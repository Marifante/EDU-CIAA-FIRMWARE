/*
 * MovementManager.c
 *
 *	This MovementManager controls the movement of a car with 2 motors,
 *	using a L293D chip as motor driver. Motor directions is controlled via
 *	two GPIOs & the velocity is controlled via the duty cycle of a PWM signal.
 *
 *	The PWM signal is generated via the function SINGLEPWM of SCTPWM library.
 *
 *	Pin-out:
 *
 *	Motor	|	Backward GPIO	|	Forward GPIO	|	PWM output Pin			|
 *	Left	|	GPIO7			|	GPIO5			|	CTOUT_3 / T_FIL3 / P4_3	|
 *	Right	|	GPIO3			|	GPIO1			|	CTOUT_0 / T_FIL2 / P4_1	|
 *
 *
 *  Created on: Dec 14, 2019
 *      Author: Julian Rodriguez
 */

/*==================[inclusions]=============================================*/
#include "../inc/MovementManager.h"
#include "../../../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../../../libraries/board_specific/inc/edu_ciaa_hl.h"
#include "../../../libraries/utils.h"

/*==================[macros and constants]===================================*/
// Frequency of PWM signal to control velocity of motors.
#define PWM_FREQ				8000

#define LEFT_MOTOR_PWM_OUTPUT	CTOUT_3
#define RIGHT_MOTOR_PWM_OUTPUT	CTOUT_0

// Structs for GPIOS who controls the direction of the motors.
gpioPin_t RightMotorForward, RightMotorBackward;
gpioPin_t LeftMotorForward, LeftMotorBackward;

/*==================[internal functions definition]==========================*/
/* @brief config pwm signals of both motor. */
void MovementManager_configMotorPWM( void )
{
	// Output for PWM signal of right motor: P4_1 of LPC4337
	SCU_SetPinFunc( 4, 1, 1 );
	// Output for PWM signal of left motor: P4_3 of LPC4337
	SCU_SetPinFunc( 4, 3, 1 );
	SCTPWM_twoOutputPWM( LEFT_MOTOR_PWM_OUTPUT, RIGHT_MOTOR_PWM_OUTPUT, PWM_FREQ );
}

/* @brief set left motor velocity changing duty cycle of its pwm signal. */
void MovementManager_setLeftMotorVelocity( int velocityPercentage )
{
	SCTPWM_twoOutputPWMSetDutyCycle( LEFT_MOTOR_PWM_OUTPUT, velocityPercentage );
}

/* @brief set right motor velocity changing duty cycle of its pwm signal. */
void MovementManager_setRightMotorVelocity( int velocityPercentage )
{
	SCTPWM_twoOutputPWMSetDutyCycle( RIGHT_MOTOR_PWM_OUTPUT, velocityPercentage );
}

/*==================[external functions definition]==========================*/
/* @brief Configurate the GPIOs & the PWM signal who manipulate the motors. */
void MovementManager_configMotors( void )
{
	MovementManager_configMotorPWM();

	// Config left motor
	configGpio( GPIO5, &LeftMotorForward, OUTPUT_GPIO );
	configGpio( GPIO7, &LeftMotorBackward, OUTPUT_GPIO );

	writeGpio( &LeftMotorForward, LOW );
	writeGpio( &LeftMotorBackward, LOW );

	// Config right motor
	configGpio( GPIO1, &RightMotorForward, OUTPUT_GPIO );
	configGpio( GPIO3, &RightMotorBackward, OUTPUT_GPIO );

	writeGpio( &RightMotorForward, LOW );
	writeGpio( &RightMotorBackward, LOW );
}

/* @brief Moves left motor forward.
 * @param velocity: velocity of motor in % (from 0 to 99) */
void MovementManager_moveLeftMotor( MOTOR_DIRECTION_T direction, int velocityPercentage )
{
	// Set motor direction:
	writeGpio( &LeftMotorForward, direction );
	writeGpio( &LeftMotorBackward, !direction );

	MovementManager_setLeftMotorVelocity( velocityPercentage );
}

void MovementManager_stopLeftMotor( void )
{
	writeGpio( &LeftMotorForward, LOW );
	writeGpio( &LeftMotorBackward, LOW );
}

/* @brief Moves left motor forward.
 * @param velocity: velocity of motor in % (from 0 to 99) */
void MovementManager_moveRightMotor( MOTOR_DIRECTION_T direction, int velocityPercentage )
{
	// Set motor direction:
	writeGpio( &RightMotorForward, direction );
	writeGpio( &RightMotorBackward, !direction );

	MovementManager_setRightMotorVelocity( velocityPercentage );
}

void MovementManager_stopRightMotor( void )
{
	writeGpio( &RightMotorForward, LOW );
	writeGpio( &RightMotorBackward, LOW );
}

void MovementManager_stopMotors( void )
{
	MovementManager_stopLeftMotor();
	MovementManager_stopRightMotor();
}
