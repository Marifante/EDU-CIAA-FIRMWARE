/*
===============================================================================
 Name        : TP.c
 Author      : Ezequiel Canay / Julian Rodriguez
 Version     : 1.0
 Description : main definition
===============================================================================
*/


#include "../inc/main.h"


/*  */
gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
gpioPin_t tec1, tec2, tec3, tec4;

//interrupciones pulsadores
void GPIO0_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 0);
	flags[0] = !flags[0];
	//flags[1] = !flags[1];
	Escribir_Salida();
	toggleGpio(&led0_r);
 }

void GPIO1_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 1);
	flags[1] = !flags[1];
	Escribir_Salida();
	toggleGpio(&led1);
}

void GPIO2_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 2);

	flags[2] = !flags[2];
	Escribir_Salida();
	toggleGpio(&led2);
}

void GPIO3_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 3);

	flags[3] = !flags[3];
	Escribir_Salida();
	toggleGpio(&led3);
 }





//tiene que tardar lo menos posible
void SysTick_Handler(void){

	Chip_DAC_UpdateValue(LPC_DAC, lista_salida[j]);
	j++;
	if(j==CANTIDAD_MUESTRAS)
	{j=0;}


}


int main(void) {

	//configuro leds

	configLed(LED0_R, &led0_r);
	configLed(LED0_G, &led0_g);
	configLed(LED0_B, &led0_b);
	configLed(LED1, &led1);
	configLed(LED2, &led2);
	configLed(LED3, &led3);

	//pongo todo en 0
	writeGpio(&led0_r,0);
	writeGpio(&led0_g,0);
	writeGpio(&led0_b,0);
	writeGpio(&led1,0);
	writeGpio(&led2,0);
	writeGpio(&led3,0);

	flags[0]=0;
	flags[1]=0;
	flags[2]=0;
	flags[3]=0;

	j=0;

	//pongo la lista en 0
	Escribir_Salida();

	//configuro DAC y timer

	/* Freq muestre de 160kHz => periodo de 0.00625 ms*/
	float interval_time = (float) (1/((float)FREQ_SYS_TICK));

	enableDAC();

	enable_IntSysTick(interval_time);

	/* Configuro teclas */
	/* Tecla 1 */
	configGpio(TEC1, &tec1, INPUT_GPIO);
	configTecInterrupts(&tec1, 0, ASCENDENT);
	/* Tecla 2 */
	configGpio(TEC2, &tec2, INPUT_GPIO);
	configTecInterrupts(&tec2, 1, ASCENDENT);
	/* Tecla 3 */
	configGpio(TEC3, &tec3, INPUT_GPIO);
	configTecInterrupts(&tec3, 2, ASCENDENT);
	/* Tecla 4 */
	configGpio(TEC4, &tec4, INPUT_GPIO);
	configTecInterrupts(&tec4, 3, ASCENDENT);



	//configTecInterrupts(1, 0, 0);
	//configTecInterrupts(2, 0, 0);
	//configTecInterrupts(3, 0, 0);

   while(1){}

}

//no importa cuanto tarde, se hace poco
void Escribir_Salida (void){
	float aux;
	int i;
	for(i=0;i<CANTIDAD_MUESTRAS;i++){
		aux=(flags[0]*sin(1*2*pi*i/CANTIDAD_MUESTRAS)+flags[1]*sin(2*2*pi*i/CANTIDAD_MUESTRAS)+flags[2]*sin(4*2*pi*i/CANTIDAD_MUESTRAS)+flags[3]*sin(8*2*pi*i/CANTIDAD_MUESTRAS)); //genero senoidal
		aux=(aux/(flags[0]+flags[1]+flags[2]+flags[3])); //normaliso en funsion de cantidad de senoidales
		aux=((aux+1)*(AMPLITUD/2)); //amplitud y offset
		lista_salida[i]=(int)aux; //flotante a int, no estoy muy seguro de como hacer
		}

}
