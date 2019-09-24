/*
  Some general data types to use
 */

// To avoid redifinition:
#ifndef _DATA_TYPES_H_
#define _DATA_TYPES_H_

/*==================[inclusions]=============================================*/

// stdint is for basic consistent data-types
//typedef unsigned char uint8_t;
//typedef signed char	int8_t;
//typedef unsigned short uint16_t;
//typedef	signed short int16_t;
//typedef unsigned int uint32_t;
//typedef signed int int32_t;
//#include <stdint.h>

/*==================[Definitions]============================================*/

/*
 * Define some macros for read and write permissions
 * volatile => tells the compiler the variables will change in some point of the program (good for Input and Output).
 * constant => constants refer to fixed values that the program may not alter during its execution (good for Input)
 */
#define	__I     volatile const		 /*!< Defines 'read only' permissions */
#define	__O     volatile             /*!< Defines 'write only' permissions */
#define __IO    volatile             /*!< Defines 'read / write' permissions */

#define TRUE 1
#define FALSE 0

#define HIGH 1
#define LOW 0

/*==================[typedef]================================================*/

typedef unsigned char uint8_t;
typedef signed char	int8_t;
typedef unsigned short uint16_t;
typedef	signed short int16_t;
typedef unsigned int uint32_t;
typedef signed int int32_t;
typedef unsigned long long uint64_t;

/* Define Boolean Data Type */
typedef enum {
	false, true
}bool_t;


/* Define Tick Data Type */
typedef uint64_t tick_t;

/*
 * Function Pointer definition
 * --------------------------------------
 * param:  void
 * return: void
 */
typedef void (*callBackFuncPtr_t)(void *);





#endif /*_DATA_TYPES_H_*/
