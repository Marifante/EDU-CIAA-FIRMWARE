
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

#ifndef _INC_MAIN_H_
#define _INC_MAIN_H_

/*==================[inclusions]=============================================*/

#include "../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../libraries/board_specific/inc/edu_ciaa_hl.h"

/*==================[macros and definitions]=================================*/

#define pi 3.14159265

#define MINORFREQ 			1000
#define SAMPLES				512

#define AMPLITUD 			1023

#define FIRSTBUFFER 		0
#define SECONDBUFFER 		1

#define DEBOUNCETIME		10000	// 1000 = 1ms
#define LISTSQUANTITY		2		// Cantidad de listas del DMA

/*==================[external data declaration]==============================*/

/* @brief El flujo del programa puede tener 3 estados.
 * Cada estado determina que es lo que debe hacer el super loop. */
typedef enum
{
	NOTHING,			// No debe hacer nada
	NEWBUTTON,			// Se presiono una tecla, por lo tanto, se debe volver a escribir la lista de los valores de salida
	WRITETOLLI			// El vector de valores de salida de actualizo y ademas el DMA acabo de terminar una transferencia.
}State_t;

/*==================[external data definition]===============================*/

/* @brief Estructura gpioPin para los leds y las teclas. */
gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
gpioPin_t tec1, tec2, tec3, tec4;

/* @brief Lista que contiene todos los valores de la salida. */
int outputValues[SAMPLES];
int sinList[SAMPLES]; // Lista auxiliar para debuggear la funcion que genera el seno.

/* @brief Este arreglo contiene los datos para cada una de las listas enlazadas para la
 * transferencia de datos del DMA. */
int lliValues[2][SAMPLES];

/* @brief Flag para saber que lista se acabo de transmitir por el dma */
uint8_t whoBufferGoes = FIRSTBUFFER;

/* @brief Flag para indicar el estado del programa. */
State_t programState = NOTHING;

/* @brief Flags que indican que boton está presionado. */
bool buttonFlags[4] = {0, 0, 0, 0};

/* @brief Listas enlazadas para usar con el DMA. */
lli_t firstDataLLI, secondDataLLI;

/* @brief Flag para indicar la primer presionada de boton del programa. */
bool InitialPress = true;

/* @brief Variable para saber que lista escribir cuando termina
 * cada transferencia del DMA. */
uint32_t listsToWrite = LISTSQUANTITY;

/*==================[external function declaration]==========================*/

/* @brief Calcula el valor de la senal de salida requerida.
 * Los valores son guardados a un vector => outputValues. */
void WriteOutputValues( void );

/* @brief Funcion que se ejecuta cuando se termina una tranferencia del DAC y
 * ademas se actualizo la lista de valores porque se acabo de presionar una tecla.
 * Cuando se termina la transferencia de un buffer, hay que escribir sobre ese
 * mismo buffer los valores de la nueva salida mientras se mandan los datos del
 * otro buffer.
 * NOTA: el programa empieza con el primer buffer, por lo cual, en el primer disparo
 * de la interrupcion del DMA se copian los valores de la lista de salida al
 * primer buffer.
 * */
void updateLinkedList( void );

/* @brief Configuro las 4 teclas.*/
void ConfigAllButtons( void );

/* @brief Configuro los leds que se van a usar. */
void ConfigLeds( void );

/* @brief Configuro el DMA para usar una lista enlazada con dos
 * nodos como doble buffer. */
void ConfigDMA( void );

/* @brief Configurar el DAC para que envie la request signal al DMA controller. */
void ConfigDAC( void );


#endif /*_INC_MAIN_H_*/

