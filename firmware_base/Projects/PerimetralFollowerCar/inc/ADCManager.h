/*
 * ADCManager.h
 *
 *  Created on: Dec 17, 2019
 *      Author: Julian
 */

#ifndef PROJECTS_PERIMETRALFOLLOWERCAR_INC_ADCMANAGER_H_
#define PROJECTS_PERIMETRALFOLLOWERCAR_INC_ADCMANAGER_H_

/*==================[inclusions]=============================================*/
#include "../../../libraries/utils.h"

/*==================[external functions definition]==========================*/
int ADCManager_ADC0takeData( uint8_t channel );
int ADCManager_ADC1takeData( uint8_t channel );

#endif /* PROJECTS_PERIMETRALFOLLOWERCAR_INC_ADCMANAGER_H_ */
