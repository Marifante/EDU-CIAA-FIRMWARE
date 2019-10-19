/*****************************************************************************
 * High Level EDU-CIAA firmware
 * designed for high level programming of the board
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *
 * Documentacion:
 *    - UM10503 (LPC43xx ARM Cortex-M4/M0 multi-core microcontroller User
 *      Manual)
 *    - PINES UTILIZADOS DEL NXP LPC4337 JBD144 (Ing. Eric Pernia)
 *	  - firmware_structure.txt
 *****************************************************************************/


/*==================[inclusions]=============================================*/

#include "../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../libraries/board_specific/inc/edu_ciaa_hl.h"

/*==================[macros and definitions]=================================*/

/*==================[external data declaration]==============================*/

#define pi 3.14159265

//hay que calcular esto, en funcion del timer
#define FREQ_SYS_TICK 1600000 //160
#define MINOR_FREQ 1000	//1
// Quiero que la senal se muestree CANTIDAD_MUESTRAS veces por periodo
#define CANTIDAD_MUESTRAS (FREQ_SYS_TICK/MINOR_FREQ)	// CANTIDAD_MUESTRAS = frecuencia timer/ frecuancia menor
//#define CANTIDAD_MUESTRAS 512


#define AMPLITUD 1023

//#define OFFSET 128 // mitad de la amplitud

/* Lista que contiene todos los valores de la salida */
int lista_salida[CANTIDAD_MUESTRAS];

/* counter */
int j = 0;

/* Flags for logic */
bool flags[4] = {0, 0, 0, 0};

/*	Listas enlazadas a usar	*/
lli_node_t first_data_lli, second_data_lli;


/*==================[external function declaration]===========================*/
//no importa cuanto tarde, se hace poco
void Escribir_Salida (void);


