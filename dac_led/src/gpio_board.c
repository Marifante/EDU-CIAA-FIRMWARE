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

/*===================[external functions declaration]========================*/

/**
 * @brief config GPIO pin.
 * @boardGpioPin GPIO of the EDU-CIAA to config (see gpioMap_t enum).
 * @gpioPinStruct pointer to the struct of the gpio of the EDU-CIAA.
 * @direction OUTPUT_GPIO (1) or INPUT_GPIO (0)
 * @return nothing
 */
void configGpio(gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct, uint8_t direction){
	gpioPinStruct->boardGpioPin = boardGpioPin;

	switch(boardGpioPin){

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

	SCU_SetPinFunc(gpioPinStruct->scu_group, gpioPinStruct->scu_pin, gpioPinStruct->scu_func);

	/*
	 * Configuro el pin como entrada o salida.
	 * La configuracion depende si es un LED o una TECLA.
	 *  boardGpioPin<6 => LED ; 6<=boardGpioPin<10 => TECLA
	 */

	if(boardGpioPin<6){		// Si es un LED, uso el registro DIR
		if (direction){
			GPIO_SetPinDIROutput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
		}else{
			GPIO_SetPinDIRInput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
		}
	} else if (boardGpioPin<10){	//Si es una tecla hay que activar el buffer de entrada
		GPIO_SetPinDIRInput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
		SCU_activateInputBuffer(gpioPinStruct->scu_group, gpioPinStruct->scu_pin);
	} else if (boardGpioPin>=10) {
		if (direction){
			GPIO_SetPinDIROutput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
		}else{
			GPIO_SetPinDIRInput(gpioPinStruct->gpio_port, gpioPinStruct->gpio_pin);
		}
	}

	return;
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
uint8_t readGpio(gpioPin_t* gpioToRead){
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
void toggleGpio(gpioPin_t* gpioToToggle){
	GPIO_SetPinNOT(gpioToToggle->gpio_port, gpioToToggle->gpio_pin);
	return;
}

/*
 * @brief config a certain led of the board
 * */
void configLed(gpioMap_t ledToConfig, gpioPin_t *ledStruct){
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


/*===================[external functions for interrupts]=====================*/

