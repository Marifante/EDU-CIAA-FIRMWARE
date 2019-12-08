/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: Utils
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_UTILS_H_
#define _LIBRARIES_UTILS_H_

/*==================[inclusions]=============================================*/

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>

/*==================[Definitions]============================================*/

/* Define some macros for read and write permissions
 * --Volatile => tells the compiler the variables will change in some point of the
 * program (good for Input and Output).
 * --Constant => constants refer to fixed values that the program may not alter
 * during its execution (good for Input). */

#define	__I     volatile const		 /*!< Defines 'read only' permissions */
#define	__O     volatile             /*!< Defines 'write only' permissions */
#define __IO    volatile             /*!< Defines 'read / write' permissions */

#define HIGH 1
#define LOW 0

#endif /*_LIBRARIES_UTILS_H_*/
