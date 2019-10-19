/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpio_board
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _GPIO_BOARD_H_
#define _GPIO_BOARD_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"
#include "gpio_map.h"

/*==================[macros and definitions]=================================*/
/*
 * macros for direction of gpios
 */
#define INPUT_GPIO 0
#define OUTPUT_GPIO 1

/*==================[external data declaration]==============================*/

/* gpioPin_t struct
 * contains the necessary information of the gpio of the board to use.
 * */
typedef struct {
	gpioMap_t boardGpioPin;
	uint8_t gpio_port;
	uint8_t gpio_pin;
	uint8_t scu_func;
	uint8_t scu_group;
	uint8_t scu_pin;
}gpioPin_t;

/*==================[internal functions declaration]=========================*/

/*==================[external functions declaration]==========================*/

/**
 * @brief config GPIO pin.
 * @boardGpioPin GPIO of the EDU-CIAA to config (see gpioMap_t enum).
 * @gpioPinStruct pointer to the struct of the gpio of the EDU-CIAA.
 * @direction OUTPUT_GPIO (1) or INPUT_GPIO (0)
 * @return nothing
 */
void configGpio(gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct, uint8_t direction);

/**
 * @brief read value GPIO pin (GPION[x])
 * @return 0 if LOW, 1 if HIGH
 */
uint8_t readGpio(gpioPin_t* gpioToRead);


/**
 * @brief write GPIO pin (GPION[x])
 */
void writeGpio(gpioPin_t* gpioToWrite, uint8_t logicState);

/**
 * @brief toggle value in GPIO pin (GPION[x])
 */
void toggleGpio(gpioPin_t* gpioToToggle);

/*
 * @brief config a certain led of the board
 * */
void configLed(gpioMap_t ledToConfig, gpioPin_t *ledStruct);

#endif /*_GPIO_BOARD_H_*/
