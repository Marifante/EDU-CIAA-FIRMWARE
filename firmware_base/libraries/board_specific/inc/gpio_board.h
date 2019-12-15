/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpio_board
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_BOARD_SPECIFIC_INC_GPIO_BOARD_H_
#define _LIBRARIES_BOARD_SPECIFIC_INC_GPIO_BOARD_H_

/*==================[inclusions]=============================================*/
#include "../../utils.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"
#include "gpio_map.h"

/*==================[macros and definitions]=================================*/
/* Macros for direction of gpios */
#define INPUT_GPIO 0
#define OUTPUT_GPIO 1

/*==================[external data declaration]==============================*/
/* gpioPin_t struct
 * contains the necessary information of the gpio of the board to use.
 * */
typedef struct
{
	gpioMap_t boardGpioPin;
	uint8_t gpio_port;
	uint8_t gpio_pin;
	uint8_t scu_func;
	uint8_t scu_group;
	uint8_t scu_pin;
}gpioPin_t;

/*==================[internal functions declaration]=========================*/

/*==================[external functions declaration]==========================*/

/* @brief config GPIO pin.
 * @boardGpioPin GPIO of the EDU-CIAA to config (see gpioMap_t enum).
 * @gpioPinStruct pointer to the struct of the gpio of the EDU-CIAA.
 * @direction OUTPUT_GPIO (1) or INPUT_GPIO (0) */
void configGpio( gpioMap_t boardGpioPin, gpioPin_t* gpioPinStruct, uint8_t direction );

/* @brief read value GPIO pin (GPION[x])
 * @return 0 if LOW, 1 if HIGH */
uint8_t readGpio( gpioPin_t* gpioToRead );

/* @brief write GPIO pin (GPION[x]). */
void writeGpio( gpioPin_t* gpioToWrite, uint8_t logicState );

/* @brief toggle value in GPIO pin (GPION[x]). */
void toggleGpio( gpioPin_t* gpioToToggle );

/* @brief config a certain led of the board. */
void configLed( gpioMap_t ledToConfig, gpioPin_t *ledStruct );

/* @brief Initializate all leds in OFF state. */
void GPIOBoard_initializateAllLeds( void );

/* @brief Functions to set LEDS */
void GPIOBoard_setLED1( uint8_t logicState );
void GPIOBoard_setLED2( uint8_t logicState );
void GPIOBoard_setLED3( uint8_t logicState );
void GPIOBoard_setLEDRGBRed( uint8_t logicState );
void GPIOBoard_setLEDRGBGreen( uint8_t logicState );
void GPIOBoard_setLEDRGBBlue( uint8_t logicState );

/* @brief Functions to toggle LEDS. */
void GPIOBoard_toggleLED1( void );
void GPIOBoard_toggleLED2( void );
void GPIOBoard_toggleLED3( void );
void GPIOBoard_toggleLEDRGBRed( void );
void GPIOBoard_toggleLEDRGBGreen( void );
void GPIOBoard_toggleLEDRGBBlue( void );

/* @brief Set all leds. */
void GPIOBoard_setAllLEDS( uint8_t logicState );

/* @brief Configuracion de interrupcion para las teclas
 * @gpioStruct puntero a la estructura del gpio asociada a la tecla
 * @gpioPinInterruptNum	 El lpc4337 soporta hasta 8 interrupciones para los GPIO,
 * cada una con un Handler diferente.
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(gpioPin_t *gpioStruct, uint8_t gpioPinInterruptNum, edgeTypeInt_t asc_desc);

/* @brief config TEC1.
 * Handler of this interrupt is: void GPIO0_IRQHandler( void ) */
void GPIOBoard_configTec1( void );

/* @brief config TEC2.
 * Handler of this interrupt is: void GPIO1_IRQHandler( void ) */
void GPIOBoard_configTec2( void );

/* @brief config TEC3.
 * Handler of this interrupt is: void GPIO2_IRQHandler( void ) */
void GPIOBoard_configTec3( void );

/* @brief config TEC4.
 * Handler of this interrupt is: void GPIO3_IRQHandler( void ) */
void GPIOBoard_configTec4( void );

/* @brief config all tecs. */
void GPIOBoard_configAllTecs( void );

/* @brief check the state of a button. */
uint8_t checkButtonState( gpioMap_t tec );

/* @brief Blocking antibounce function for a desired button. */
bool isABounce( gpioMap_t button, uint8_t chosenTimer );



#endif /*_LIBRARIES_BOARD_SPECIFIC_INC_GPIO_BOARD_H_*/
