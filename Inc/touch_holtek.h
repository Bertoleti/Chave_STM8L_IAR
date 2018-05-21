/*
 * touch_holtek.h
 *
 *  Created on: 24 de nov de 2017
 *      Author: Bruno
 */

#ifndef TOUCH_HOLTEK_H_
#define TOUCH_HOLTEK_H_

unsigned char read_key_pressed(void);
unsigned char read_holtek_register(unsigned char reg);
void write_holtek_register(unsigned char B0, unsigned char B4, unsigned char B5, unsigned char C0);


extern unsigned char touch_pressed;


#define TOUCH_HOLTEK_ADDRESS		0x50 << 1				//Tem que deslocar pois é endereço de 7 bits.. e a função usa endereço de 8 bits


#endif /* TOUCH_HOLTEK_H_ */
