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
 *	Left	|	GPIO0			|	GPIO1			|	CTOUT_0 / T_FIL2 / P4_1	|
 *	Right	|	GPIO2			|	GPIO3			|	CTOUT_1	/ T_FIL1 / P4_2	|
 *
 *
 *  Created on: Dec 14, 2019
 *      Author: Julian Rodriguez
 */


/*==================[inclusions]=============================================*/
#include "../inc/MovementManager.h"

/*==================[macros and definitions]=================================*/

/*==================[external functions definition]==========================*/
/*==================[internal functions definition]==========================*/
void MovementManager_setLeftMotorVelocity( int velocityPercentage );

void MovementManager_setRightMotorVelocity( int velocityPercentage );

/* @brief Configurate the GPIOs & the PWM signal who manipulate the motors. */
void MovementManager_configMotors( void );
