
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/


/*==================[inclusions]=============================================*/

#include "../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../libraries/board_specific/inc/edu_ciaa_hl.h"

/*==================[macros and definitions]=================================*/

#define pi 3.14159265

#define MINORFREQ 			1000
#define SAMPLES				256

#define AMPLITUD 			1023

#define FIRSTBUFFER 		0
#define SECONDBUFFER 		1

/*==================[external data declaration]==============================*/
/* @brief El flujo del programa puede tener 3 estados.
 * Cada estado determina que es lo que debe hacer el super loop. */
typedef enum{
	NOTHING,			// No debe hacer nada
	NEWBUTTON,			// Se presiono una tecla, por lo tanto, se debe volver a escribir la lista de los valores de salida
	DMAEND				// Termino una transferencia el DMA, por lo tanto, se debe ejecutar la funcion DMATransferEnds()
}State_t;

/*==================[external data definition]===============================*/

/* @brief Lista que contiene todos los valores de la salida. */
int outputValues[SAMPLES];

/* @brief Este arreglo contiene los datos para cada una de las listas enlazadas para la
 * transferencia de datos del DMA. */
int lliValues[2][SAMPLES];

/* Flag para saber que lista se acabo de transmitir por el dma */
uint8_t whoBufferGoes = FIRSTBUFFER;

State_t programState = NOTHING;

/*@brief flags que indican que boton está presionado. */
bool buttonFlags[4] = {0, 0, 0, 0};

/*	Listas enlazadas a usar	*/
lli_t first_data_lli, second_data_lli;


/*==================[external function declaration]==========================*/


/* @brief Calcula el valor de la senal de salida requerida.
 * Los valores son guardados a un vector => outputValues. */
void WriteOutputValues( void );

/* @brief Funcion que se ejecuta cuando se termina una tranferencia del DAC.
 * Cuando se termina la transferencia de un buffer, hay que escribir sobre ese
 * mismo buffer los valores de la nueva salida mientras se mandan los datos del
 * otro buffer.
 * NOTA: el programa empieza con el primer buffer, por lo cual, en el primer disparo
 * de la interrupcion del DMA se copian los valores de la lista de salida al
 * primer buffer.
 * */
void DMATransferEnds( void );

void ToggleBuffer( void );

/* @brief Configura los leds y los apaga. */
void InitializateAllLeds( void );

/* @brief Configuro las 4 teclas.*/
void ConfigAllButtons( void );

/* @brief Funcion antirebote. */
bool isABounce( gpioMap_t tecla );
