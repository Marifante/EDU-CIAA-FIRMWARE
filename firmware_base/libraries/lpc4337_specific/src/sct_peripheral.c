/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: sct_peripheral
 *
 * El periférico State Configurable Timer sirve para generar diversos tipos
 * de seniales. Consta de hasta 2 contadores con los cuales se pueden generar
 * diversas seniales configurando eventos disparadores. Cada vez que alguno
 * de estos eventos ocurra, una salida de este periferico se pone en HIGH
 * o LOW y asi se generan varios tipos de seniales, como PWM.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/sct_peripheral.h"
#include "../inc/cgu_peripheral.h"

/*==================[external functions definition]==========================*/

/* @brief set two 16-bit timer mode ¿with autolimit? */
void SCT_enableTwoTimersMode( void )
{
	//LPC_SCT->CONFIG |= (1 << 17);
	// Setting in cero the UNIFY bit in CONFIG register does this
	LPC_SCT->CONFIG &= ~(1 << 0);
}

/* @brief chose SCT clock mode. */
void SCT_chooseClkMode( );

/* @brief set low timer prescaler. */
void SCT_setLowTimerPrescaler( uint8_t divFactor )
{
	// The and is for segurity, to not write more than bits 12:5
	LPC_SCT->CTRL_L |= ( ( divFactor-1 ) & 0x1F ) << 5 ;
}

/* @brief sets the event who restarts the timer.
 * Setting HIGH the bit n of this registers makes the n event restarts the timer.*/
void SCT_setLimitLowTimer( uint8_t eventNumber )
{
	LPC_SCT->LIMIT_L |= eventNumber;
}

/* @brief set the match reload value of the low timer.
 * When BIDIR is 0, this value is copied to MATCH value of the MATCH register.
 * The MATCH registers of the SCT cannot be writed directly. */
void SCT_setLowTimerMatchReload( uint8_t matchNumber, uint32_t matchValue )
{
	LPC_SCT->MATCHREL[matchNumber].L = matchValue;
}

/* @brief associate a match with a determinated event. */
void SCT_associateMatchWithEvent( uint8_t event, uint8_t match )
{
	LPC_SCT->EVENT[event].CTRL |= ( 1 << match );
}

/* @brief set how the event occurs.
 * If combmode = 1, the event occurs only when the match associated occurs. */
void SCT_setEventCombMode( uint8_t event, uint8_t combMode )
{
	LPC_SCT->EVENT[event].CTRL |= ( (combMode & 0x3) << 12 );
}

/* @brief set in what state happens a desired event.
 * Each bit of statesMask corresponds to a single state.
 * If 0xFFFFFFFF happens in all states. */
void SCT_setEventState( uint8_t event, uint32_t statesMask )
{
	LPC_SCT->EVENT[event].STATE = statesMask;
}

/* @brief set if a event gonna set a determinated output. */
void SCT_setOutputSETReg( SCT_outputPin sctOutput, uint8_t event )
{
	LPC_SCT->OUT[sctOutput].SET = (1 << event );
}

/* @brief set if a event gonna clear a determinated output. */
void SCT_setOutputCLEARReg( SCT_outputPin sctOutput, uint8_t event )
{
	LPC_SCT->OUT[sctOutput].CLR = (1 << event );
}

/* @brief unhalt sct peripheral. */
void SCT_unhalt( void )
{
	LPC_SCT->CTRL_L &= ~(1 << 2);
}
