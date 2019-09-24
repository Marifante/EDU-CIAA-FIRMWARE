/*
  GPIO map peripheral library for EDU-CIAA
 */

#ifndef _GPIO_MAP_H_
#define _GPIO_MAP_H_

/*==================[inclusions]=============================================*/


/*==================[external data declaration]==============================*/

/*
 * Mapa de pines GPIO de la EDU-CIAA,
 * Sirve para las funciones de gpio_peripheral
 * */

typedef enum{
	LED0_R,		//GPIO5[0] (FUNC4)
	LED0_G,		//GPIO5[1] (FUNC4)
	LED0_B,		//GPIO5[2] (FUNC4)
	LED1, 		//GPIO0[14] (FUNC0)
	LED2,		//GPIO1[11] (FUNC0)
	LED3,		//GPIO1[12] (FUNC0)
	//0 a 5
	TEC1,		//GPIO0[4] (FUNC0)
	TEC2,		//GPIO0[8] (FUNC0)
	TEC3,		//GPIO0[9] (FUNC0)
	TEC4,		//GPIO1[9] (FUNC0)
	//6 a 9
	GPIO0,		//GPIO3[0] (FUNC0)
	GPIO1,		//GPIO3[3] (FUNC0)
	GPIO2,		//GPIO3[4] (FUNC0)
	GPIO3,		//GPIO5[15] (FUNC4)
	//10 a 13
}gpioMap_t;


#endif /*__GPIO_MAP_H_*/
