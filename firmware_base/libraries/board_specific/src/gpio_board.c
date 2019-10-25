/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpio_board
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/gpio_board.h"
#include "../inc/delay.h"

/*===================[internal functions declaration]========================*/

/* @brief fill gpio struct with gpio port, pin, scu function & scu group. */
void fillGPIOBasicSettings( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct );

/*===================[internal functions definition]=========================*/
/* @brief fill gpio struct with gpio port, pin, scu function & scu group. */
void fillGPIOBasicSettings( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct )
{
	switch( boardGpioPin )
	{
		case LED0_R: //GPIO5[0] (FUNC4) (P2_0)
			gpioPinStruct->gpio_port = 5;
			gpioPinStruct->gpio_pin = 0;
			gpioPinStruct->scu_func = 4;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 0;
			break;
		case LED0_G: //GPIO5[1] (FUNC4) (P2_1)
			gpioPinStruct->gpio_port = 5;
			gpioPinStruct->gpio_pin = 1;
			gpioPinStruct->scu_func = 4;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 1;
			break;
		case LED0_B: //GPIO5[2] (FUNC4) (P2_2)
			gpioPinStruct->gpio_port = 5;
			gpioPinStruct->gpio_pin = 2;
			gpioPinStruct->scu_func = 4;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 2;
			break;
		case LED1: //GPIO0[14] (FUNC0) (P2_10)
			gpioPinStruct->gpio_port = 0;
			gpioPinStruct->gpio_pin = 14;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 11;
			break;
		case LED2: //GPIO0[11] (FUNC0) (P2_11)
			gpioPinStruct->gpio_port = 1;
			gpioPinStruct->gpio_pin = 11;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 11;
			break;
		case LED3: //GPIO0[12] (FUNC0) (P2_12)
			gpioPinStruct->gpio_port = 1;
			gpioPinStruct->gpio_pin = 12;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 2;
			gpioPinStruct->scu_pin = 12;
			break;
		case TEC1: //GPIO0[4] (FUNC0) (P1_0)
			gpioPinStruct->gpio_port = 0;
			gpioPinStruct->gpio_pin = 4;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 1;
			gpioPinStruct->scu_pin = 0;
			break;
		case TEC2: //GPIO0[8] (FUNC0) (P1_1)
			gpioPinStruct->gpio_port = 0;
			gpioPinStruct->gpio_pin = 8;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 1;
			gpioPinStruct->scu_pin = 1;
			break;
		case TEC3: //GPIO0[9] (FUNC0) (P1_2)
			gpioPinStruct->gpio_port = 0;
			gpioPinStruct->gpio_pin = 9;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 1;
			gpioPinStruct->scu_pin = 2;
			break;
		case TEC4: //GPIO1[9] (FUNC0) (P1_6)
			gpioPinStruct->gpio_port = 1;
			gpioPinStruct->gpio_pin = 9;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 1;
			gpioPinStruct->scu_pin = 6;
			break;
		case GPIO0: //GPIO3[0] (FUNC0) (P6_1)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 0;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 1;
			break;
		case GPIO1: //GPIO3[3] (FUNC0) (P6_4)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 3;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 4;
			break;
		case GPIO2: //GPIO3[4] (FUNC0) (P6_5)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 4;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 5;
			break;
		case GPIO3:	//GPIO5[15] (FUNC4) (P6_7)
			gpioPinStruct->gpio_port = 5;
			gpioPinStruct->gpio_pin = 15;
			gpioPinStruct->scu_func = 4;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 7;
			break;
		default:
			return;
		}
}

/*===================[external functions definition]=========================*/

/* @brief config GPIO pin.
 * @boardGpioPin GPIO of the EDU-CIAA to config (see gpioMap_t enum).
 * @gpioPinStruct pointer to the struct of the gpio of the EDU-CIAA.
 * @direction OUTPUT_GPIO (1) or INPUT_GPIO (0). */
void configGpio( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct, uint8_t direction )
{
	gpioPinStruct->boardGpioPin = boardGpioPin;

	fillGPIOBasicSettings( boardGpioPin, gpioPinStruct );

	SCU_SetPinFunc( gpioPinStruct->scu_group, gpioPinStruct->scu_pin, gpioPinStruct->scu_func );

	/* Configuro el pin como entrada o salida.
	 * La configuracion depende si es un LED, una TECLA o un pin de proposito general de la placa.	 */

	if( boardGpioPin <= LED3 ) // Si es un LED, uso el registro DIR para setearlo como salida
		GPIO_SetPinDIROutput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
	else
	if( boardGpioPin <= TEC4 )
	{	//Si es una tecla hay que activar el buffer de entrada
		GPIO_SetPinDIRInput( gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin );
		SCU_activateInputBuffer( gpioPinStruct->scu_group, gpioPinStruct->scu_pin );
	}
	else
	if( boardGpioPin >= GPIO0 )
	{	//Si es un GPIO de proposito general de la placa, lo tengo que poder configurar como entrada o salida
		if( direction == OUTPUT_GPIO )
			GPIO_SetPinDIROutput( gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin );
		else
			GPIO_SetPinDIRInput( gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin );
	}
}

/**
 * @brief read value GPIO pin (GPION[x])
 * This function makes a distinction if the pin gpio has activated the input buffer.
 * If the input buffer is not activated (boardGpioPin <6), it is read from the SET register.
 * In the other case, it is read from the byte register.
 * NOTA: Como las teclas de la EDU-CIAA ponen un HIGH cuando NO estan pulsadas y un LOW cuando lo estan,
 * tuve que negar la senial que se lee del registro byte, para que sea mas usable la funcion.
 * @return 0 if LOW, 1 if HIGH
 */
uint8_t readGpio( gpioPin_t* gpioToRead )
{
	uint8_t read_value;

	if(gpioToRead->boardGpioPin<6){
		read_value = GPIO_GetPinSET(gpioToRead->gpio_port, gpioToRead->gpio_pin);
	} else {
		read_value = GPIO_GetPinBYTE(gpioToRead->gpio_port, gpioToRead->gpio_pin);
		read_value &= (0x1); //limpio los valores de los bits 7:1 leidos del registro byte por si las dudas
		// Si el pin es una tecla hay que negar la senal leida.
		// La tecla pone un 1 en el pin del micro cuando NO es apretada y un 0 cuando lo es.
		if ( gpioToRead->boardGpioPin<10 ){
			if (read_value == 1) {
				read_value = 0;
			} else {
				read_value = 1;
			}
		}
	}
	return read_value;
}

/**
 * @brief write GPIO pin (GPION[x])
 * @brief logicState: 1 = HIGH, 0 = LOW
 */
void writeGpio(gpioPin_t* gpioToWrite, uint8_t logicState){
	// para setear un estado en un pin hay que modificar los registros set y clear
	// para poner en 1 el pin hay que poner en 1 el bit x del registro set
	// para poner en 0 el pin hay que poner en 1 el bit x del gistro clear
	if (logicState){
		GPIO_SetPinSET(gpioToWrite->gpio_port, gpioToWrite->gpio_pin);
	}else{
		GPIO_SetPinCLR(gpioToWrite->gpio_port, gpioToWrite->gpio_pin);
	}
	return;
}

/**
 * @brief toggle value in GPIO pin (GPION[x])
 */
void toggleGpio( gpioPin_t* gpioToToggle )
{
	GPIO_SetPinNOT(gpioToToggle->gpio_port, gpioToToggle->gpio_pin);
	return;
}

/*
 * @brief config a certain led of the board
 * */
void configLed( gpioMap_t ledToConfig, gpioPin_t *ledStruct )
{
	switch(ledToConfig){
	case LED0_R:
		SCU_SetPinFunc(2, 0, 0);
		configGpio(LED0_R, ledStruct, OUTPUT_GPIO);
		break;
	case LED0_G:
		SCU_SetPinFunc(2, 1, 0);
		configGpio(LED0_G, ledStruct, OUTPUT_GPIO);
		break;
	case LED0_B:
		SCU_SetPinFunc(2, 2, 0);
		configGpio(LED0_B, ledStruct, OUTPUT_GPIO);
		break;
	case LED1:
		SCU_SetPinFunc(2, 10, 0);
		configGpio(LED1, ledStruct, OUTPUT_GPIO);
		break;
	case LED2:
		SCU_SetPinFunc(2, 11, 0);
		configGpio(LED2, ledStruct, OUTPUT_GPIO);
		break;
	case LED3:
		SCU_SetPinFunc(2, 12, 0);
		configGpio(LED3, ledStruct, OUTPUT_GPIO);
		break;
	default:
		return;
	}
	writeGpio(ledStruct, LOW);
	return;
}


/* @brief Configura los leds y los apaga. */
void InitializateAllLeds( void )
{
	gpioPin_t tempLed0_r, tempLed0_g, tempLed0_b, tempLed1, tempLed2, tempLed3;
	gpioPin_t tempTec1, tempTec2, tempTec3, tempTec4;

	//	configuro leds
	configLed( LED0_R,	&tempLed0_r );
	configLed( LED0_G,	&tempLed0_g );
	configLed( LED0_B,	&tempLed0_b );
	configLed( LED1,	&tempLed1 );
	configLed( LED2,	&tempLed2 );
	configLed( LED3,	&tempLed3 );

	//	pongo todo en 0
	writeGpio( &tempLed0_r, LOW );
	writeGpio( &tempLed0_g, LOW );
	writeGpio( &tempLed0_b, LOW );
	writeGpio( &tempLed1,	LOW );
	writeGpio( &tempLed2,	LOW );
	writeGpio( &tempLed3,	LOW );
}


/* @brief check the state of a button. */
uint8_t checkButtonState( gpioMap_t tec )
{
	uint8_t state;
	switch( tec )
	{
	case TEC1:
		state = ( GPIO_GetPinPIN( 0, 4 ) >> 4 );
		break;
	case TEC2:
		state = ( GPIO_GetPinPIN( 0, 8 ) >> 8 );
		break;
	case TEC3:
		state = ( GPIO_GetPinPIN( 0, 9 ) >> 9 );
		break;
	case TEC4:
		state = ( GPIO_GetPinPIN( 1, 9 ) >> 9 );
		break;
	default:
		return -1;
	}

	// como los botones de la edu ciaa estan negados
	if( state == 1 )
		state = 0;
	else
		state = 1;

	return state;
}

/* @brief Blocking antibounce function for a desired button. */
bool isABounce( gpioMap_t button )
{
	uint8_t initialState = checkButtonState( button );
	delay_us( 10000 ); // wait for 10ms
	uint8_t finalState = checkButtonState( button );
	if ( finalState == initialState )
		return false;
	else
		return true;
}
