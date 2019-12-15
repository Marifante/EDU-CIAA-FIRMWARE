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

/*==================[macros & constants]=====================================*/
gpioPin_t Tec1, Tec2, Tec3, Tec4;
gpioPin_t Led0_R, Led0_G, Led0_B, Led1, Led2, Led3;
/*===================[internal functions declaration]========================*/
/* @brief fill gpio struct with gpio port, pin, scu function & scu group. */
void GPIOBoard_fillGPIOStruct( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct );

/*===================[internal functions definition]=========================*/
/* @brief fill gpio struct with gpio port, pin, scu function & scu group. */
void GPIOBoard_fillGPIOStruct( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct )
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
		case GPIO4:	//GPIO5[16] (FUNC4) (P6_8)
			gpioPinStruct->gpio_port = 5;
			gpioPinStruct->gpio_pin = 16;
			gpioPinStruct->scu_func = 4;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 8;
			break;
		case GPIO5:	//GPIO3[5] (FUNC0) (P6_9)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 5;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 9;
			break;
		case GPIO6:	//GPIO3[6] (FUNC0) (P6_10)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 6;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 10;
			break;
		case GPIO7:	//GPIO3[7] (FUNC0) (P6_11)
			gpioPinStruct->gpio_port = 3;
			gpioPinStruct->gpio_pin = 7;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 11;
			break;
		case GPIO8:	//GPIO2[8] (FUNC0) (P6_12)
			gpioPinStruct->gpio_port = 2;
			gpioPinStruct->gpio_pin = 8;
			gpioPinStruct->scu_func = 0;
			gpioPinStruct->scu_group = 6;
			gpioPinStruct->scu_pin = 12;
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

	GPIOBoard_fillGPIOStruct( boardGpioPin, gpioPinStruct );

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

	if( gpioToRead->boardGpioPin < 6 )
	{
		read_value = GPIO_GetPinSET(gpioToRead->gpio_port, gpioToRead->gpio_pin);
	}
	else
	{
		read_value = GPIO_GetPinBYTE(gpioToRead->gpio_port, gpioToRead->gpio_pin);
		read_value &= (0x1); //limpio los valores de los bits 7:1 leidos del registro byte por si las dudas
		// Si el pin es una tecla hay que negar la senal leida.
		// La tecla pone un 1 en el pin del micro cuando NO es apretada y un 0 cuando lo es.

		if( gpioToRead->boardGpioPin < 10 )
		{
			if( read_value == 1 )
				read_value = 0;
			else
				read_value = 1;
		}
	}
	return read_value;
}

/* @brief write GPIO pin (GPION[x])
 * @brief logicState: 1 = HIGH, 0 = LOW. */
void writeGpio( gpioPin_t* gpioToWrite, uint8_t logicState )
{
	// para setear un estado en un pin hay que modificar los registros set y clear
	// para poner en 1 el pin hay que poner en 1 el bit x del registro set
	// para poner en 0 el pin hay que poner en 1 el bit x del gistro clear
	if( logicState == HIGH )
		GPIO_SetPinSET( gpioToWrite->gpio_port, gpioToWrite->gpio_pin );
	else
		GPIO_SetPinCLR( gpioToWrite->gpio_port, gpioToWrite->gpio_pin );
}

/* @brief toggle value in GPIO pin (GPION[x]). */
void toggleGpio( gpioPin_t* gpioToToggle )
{
	GPIO_SetPinNOT( gpioToToggle->gpio_port, gpioToToggle->gpio_pin );
}

/*
 * @brief config a certain led of the board
 * */
void configLed( gpioMap_t ledToConfig, gpioPin_t *ledStruct )
{
	configGpio(ledToConfig, ledStruct, OUTPUT_GPIO);
	writeGpio(ledStruct, LOW);
	return;
}

/* @brief Configura los leds y los apaga. */
void GPIOBoard_initializateAllLeds( void )
{
	//	configuro leds
	configLed( LED0_R,	&Led0_B );
	configLed( LED0_G,	&Led0_G );
	configLed( LED0_B,	&Led0_B );
	configLed( LED1,	&Led1 );
	configLed( LED2,	&Led2 );
	configLed( LED3,	&Led3 );

	//	pongo todo en 0
	writeGpio( &Led0_R, LOW );
	writeGpio( &Led0_G, LOW );
	writeGpio( &Led0_B, LOW );
	writeGpio( &Led1,	LOW );
	writeGpio( &Led2,	LOW );
	writeGpio( &Led3,	LOW );
}

/* @brief Functions to set LEDS */
void GPIOBoard_setLED1( uint8_t logicState )
{
	writeGpio( &Led1, logicState );
}

void GPIOBoard_setLED2( uint8_t logicState )
{
	writeGpio( &Led2, logicState );
}

void GPIOBoard_setLED3( uint8_t logicState )
{
	writeGpio( &Led3, logicState );
}

void GPIOBoard_setLEDRGBRed( uint8_t logicState )
{
	writeGpio( &Led0_R, logicState );
}

void GPIOBoard_setLEDRGBGreen( uint8_t logicState )
{
	writeGpio( &Led0_G, logicState );
}

void GPIOBoard_setLEDRGBBlue( uint8_t logicState )
{
	writeGpio( &Led0_B, logicState );
}

/* @brief Functions to toggle LEDS. */
void GPIOBoard_toggleLED1( void )
{
	toggleGpio( &Led1 );
}

void GPIOBoard_toggleLED2( void )
{
	toggleGpio( &Led2 );
}

void GPIOBoard_toggleLED3( void )
{
	toggleGpio( &Led3 );
}

void GPIOBoard_toggleLEDRGBRed( void )
{
	toggleGpio( &Led0_R );
}

void GPIOBoard_toggleLEDRGBGreen( void )
{
	toggleGpio( &Led0_G );
}

void GPIOBoard_toggleLEDRGBBlue( void )
{
	toggleGpio( &Led0_B );
}

/* @brief Set all leds. */
void GPIOBoard_setAllLEDS( uint8_t logicState )
{
	GPIOBoard_setLED1( logicState );
	GPIOBoard_setLED2( logicState );
	GPIOBoard_setLED3( logicState );
	GPIOBoard_setLED3( logicState );
}

/* @brief Configuracion de interrupcion para las teclas
 * @gpioStruct puntero a la estructura del gpio asociada a la tecla
 * @gpioPinInterruptNum	 El lpc4337 soporta hasta 8 interrupciones para los GPIO,
 * cada una con un Handler diferente.
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(gpioPin_t *gpioStruct, uint8_t gpioPinInterruptNum, edgeTypeInt_t asc_desc)
{
	/* Registros del periferico SCU a configurar para configurar la interrupcion */
	SCU_GPIOIntPinSel(gpioPinInterruptNum, gpioStruct->gpio_port, gpioStruct->gpio_pin);

	/* Registros del periferico GPIO para configurar la interrupcion */
	setEdgeDetectionGPIOInterrupt(gpioPinInterruptNum);

	switch (asc_desc) {
		case ASCENDENT:
			setRiseEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco asc
			break;
		case DESCENDENT:
			setFallEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco desc
			break;
		case BOTH_EDGES:
			setRiseEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco asc
			setFallEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco desc
			break;
		default:
			return;
	}

	/* Registros del NVIC a configurar para configurar la interrupcion */
	// Habilitacion de las interrupciones en el NVIC
	// _NVIC->ISER[1] = (unsigned int)(1 << boton);
	switch (gpioPinInterruptNum) {
	case 0:
		NVIC_EnaIRQ(PIN_INT0_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 1:
		NVIC_EnaIRQ(PIN_INT1_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 2:
		NVIC_EnaIRQ(PIN_INT2_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 3:
		NVIC_EnaIRQ(PIN_INT3_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;

	}
}

/* @brief config TEC1.
 * Handler of this interrupt is: void GPIO1_IRQHandler( void ).*/
void GPIOBoard_configTec1( void )
{
	configGpio( TEC1, &Tec1, INPUT_GPIO );
	configTecInterrupts( &Tec1, GPIO_INTERRUPT0, DESCENDENT );
}

/* @brief config TEC2.
 * Handler of this interrupt is: void GPIO2_IRQHandler( void ) */
void GPIOBoard_configTec2( void )
{
	configGpio( TEC2, &Tec2, INPUT_GPIO );
	configTecInterrupts( &Tec2, GPIO_INTERRUPT1, DESCENDENT );
}

/* @brief config TEC3.
 * Handler of this interrupt is: void GPIO3_IRQHandler( void ) */
void GPIOBoard_configTec3( void )
{
	configGpio( TEC3, &Tec3, INPUT_GPIO );
	configTecInterrupts( &Tec3, GPIO_INTERRUPT2, DESCENDENT );
}

/* @brief config TEC4.
 * Handler of this interrupt is:  void GPIO4_IRQHandler( void ) */
void GPIOBoard_configTec4( void )
{
	configGpio( TEC4, &Tec4, INPUT_GPIO );
	configTecInterrupts( &Tec4, GPIO_INTERRUPT3, DESCENDENT );
}

/* @brief config all tecs. */
void GPIOBoard_configAllTecs( void )
{
	GPIOBoard_configTec1();
	GPIOBoard_configTec2();
	GPIOBoard_configTec3();
	GPIOBoard_configTec4();
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
bool isABounce( gpioMap_t button, uint8_t chosenTimer )
{
	uint8_t initialState = checkButtonState( button );
	Delay_us( 10000, chosenTimer ); // wait for 10ms
	uint8_t finalState = checkButtonState( button );
	if ( finalState == initialState )
		return false;
	else
		return true;
}
