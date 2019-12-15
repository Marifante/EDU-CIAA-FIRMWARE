/*
 * MovementManager.h
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
 *	Left	|	GPIO0			|	GPIO1			|	CTOUT_0 / T_FIL2 / P4_1	|
 *	Right	|	GPIO2			|	GPIO3			|	CTOUT_1	/ T_FIL1 / P4_2	|
 *
 *
 *  Created on: Dec 14, 2019
 *      Author: Julian Rodriguez
 */

#ifndef PROJECTS_PERIMETRALFOLLOWERCAR_INC_MOVEMENTMANAGER_H_
#define PROJECTS_PERIMETRALFOLLOWERCAR_INC_MOVEMENTMANAGER_H_

/*==================[inclusions]=============================================*/

/*==================[macros and constants]===================================*/
/* @brief enum for motor direction. */
typedef enum
{
	MM_BACKWARD = 0,
	MM_FORWARD = 1
} MOTOR_DIRECTION_T;

/*==================[external functions declaration]=========================*/
/* @brief Configurate the GPIOs & the PWM signal who manipulate the motors. */
void MovementManager_configMotors( void );

void MovementManager_moveLeftMotor( MOTOR_DIRECTION_T direction, int velocityPercentage );
void MovementManager_stopLeftMotor( void );

void MovementManager_moveRightMotor( MOTOR_DIRECTION_T direction, int velocityPercentage );
void MovementManager_stopRightMotor( void );

void MovementManager_stopMotors( void );

#endif /* PROJECTS_PERIMETRALFOLLOWERCAR_INC_MOVEMENTMANAGER_H_ */
