/*
 * serial_log.h
 *
 *  Created on: Dec 8, 2019
 *      Author: Julian
 */

#ifndef LIBRARIES_BOARD_SPECIFIC_INC_SERIALLOG_H_
#define LIBRARIES_BOARD_SPECIFIC_INC_SERIALLOG_H_

/*==================[inclusions]=============================================*/
#include "../../utils.h"

/*==================[functions declaration]===================================*/
/* @brief config UART2 for serial logs via USB.*/
void SerialLog_config( void );

/* @brief prints a strings to the usb serial port. */
void SerialLog_print( uint8_t *str );

#endif /* LIBRARIES_BOARD_SPECIFIC_INC_SERIALLOG_H_ */
