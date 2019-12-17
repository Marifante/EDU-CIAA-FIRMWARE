/*****************************************************************************
 *

 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/main.h"
/*==================[macros & constants]=====================================*/
#define PWM_FREQUENCY	1000

typedef enum
{
	NO_ACCION =	0,
	TEST_MODE = 4
} CarState_t;

CarState_t ProgramState = 0;

void ADC_takeData( void )
{
	int analogVal[10];
	char msg[64];
	float adcMeasureMedian;
	uint32_t distance;
	for( int i = 0; i<10; i++)
	{
		analogVal[i] = ADC0_read(1);
		adcMeasureMedian += (float) analogVal[i];
		Delay_us(10000, TIMER0);
	}
	adcMeasureMedian = adcMeasureMedian / 10;

	distance =  pow( (3027.4 /(float) adcMeasureMedian), 1.2134 );
	//Delay_us(1000000/2, TIMER0);

	sprintf(msg, "analogVal: %f, distance: %d cm\r\n", adcMeasureMedian, distance);
	SerialLog_print( msg );
}
/*==================[main program]===========================================*/
int main( void )
{
	GPIOBoard_initializateAllLeds();
	GPIOBoard_configAllTecs();
	SerialLog_config();
	ADC0_init();
	MovementManager_configMotors();
	MovementManager_moveLeftMotor( MM_FORWARD, 60 );
	MovementManager_moveRightMotor( MM_FORWARD, 60 );
//	SerialLog_print( "Test ADC\r\n" );
	while( 1 )
	{
		switch( ProgramState )
		{
		case NO_ACCION:
			MovementManager_stopMotors();
			GPIOBoard_setAllLEDS( LOW );
			MovementManager_moveLeftMotor( MM_FORWARD, 50 );
			MovementManager_moveRightMotor( MM_FORWARD, 50 );
			break;
		case TEST_MODE:
			GPIOBoard_setLED2( HIGH );

			ADC_takeData();
			MovementManager_moveLeftMotor( MM_FORWARD, 90 );
			MovementManager_moveRightMotor( MM_FORWARD, 30 );
			break;
		default:
			ProgramState = NO_ACCION;
			GPIOBoard_setAllLEDS( LOW );
			break;
		}
	}
}

/*==================[tec interrupt handlers]===================================*/

void GPIO0_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT0 );
}

void GPIO1_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT1 );
}

void GPIO2_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT2 );
	ProgramState = TEST_MODE;
}

void GPIO3_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT3 );
	ProgramState = NO_ACCION;
}

