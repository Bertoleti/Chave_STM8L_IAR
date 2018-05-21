/*
 * touch_holtek.c
 *
 *  Created on: 24 de nov de 2017
 *      Author: Bruno
 */


#include "main.h"
#include "touch_holtek.h"
#include "stm8l15x.h"
#include "my_i2c.h"

unsigned char touch_pressed;
unsigned char i2c_received[18];

/****************************************************************/
/*            Função: read_key_pressed                          */
/* Descrição: VFaz a leitura de qual chave foi pressionada      */
/* Entrada:                                                     */
/* Saída: Número da tecla que foi pessionada                    */
/****************************************************************/
unsigned char read_key_pressed(void)
{
  unsigned char data[2];
  data[0] = 0x08;
  data[1] = 0x00;
  
  I2C_Master_Read(TOUCH_HOLTEK_ADDRESS, data[0], i2c_received);

  if (i2c_received[0] == 1) return 1;
  else if (i2c_received[0] == 2) return 2;
  else if (i2c_received[0] == 4) return 3;
  else if (i2c_received[0] == 8) return 4;
  else if (i2c_received[0] == 16) return 5;
  else if (i2c_received[0] == 32) return 6;
  else if (i2c_received[0] == 64) return 7;
  else if (i2c_received[0] == 128) return 8;
  else if (i2c_received[1] == 1) return 9;
  else if (i2c_received[1] == 2) return 10;
  else if (i2c_received[1] == 4) return 11;
  else if (i2c_received[1] == 8) return 12;

  return 0;                                                                   //Erro
}
/****************************************************************/

/****************************************************************/
/*            Função: read_holtek_register                      */
/* Descrição: Lê o valor de todos os registradores do chip e re */
/* torna apenas o valor de um registrador específico		    */
/* Entrada: Registrador que se quer saber o valor (0 - 12)      */
/* Saída: Valor do registrador específico                       */
/****************************************************************/
unsigned char read_holtek_register(unsigned char reg)
{
  unsigned char ret;
  //unsigned char data[1];
  //data[0] = 0xB0;
  //HAL_I2C_Master_Transmit(&hi2c1,TOUCH_HOLTEK_ADDRESS,data,01,100);
  //HAL_I2C_Master_Receive(&hi2c1,TOUCH_HOLTEK_ADDRESS,i2c_received,18,100);
  //I2C_Master_Transmit(TOUCH_HOLTEK_ADDRESS,data,1);		//Faz a transmissão por I2C
  I2C_Master_Read_Bytes(TOUCH_HOLTEK_ADDRESS,0xB0,i2c_received,17);
  ret = i2c_received[reg];
  return ret;
}

/****************************************************************/
/*            Função: write_holtek_register                     */
/* Descrição: Escreve os valores de sensibilidade nos registra- */
/* dores do chip        										*/
/* Entrada: IRQ_OMS; OPTION2; SENSIBILIDADE; SENSIBILIDADE/MODE */
/* Saída: NENHUM                                                */
/****************************************************************/
void write_holtek_register(unsigned char B0, unsigned char B4, unsigned char B5, unsigned char C0)
{
  unsigned int checksum = 0x50;			//Começa o checksum com o valor do endereço
  unsigned char data[19];
  unsigned char i = 0;
  
  data[0] = 0xB0;							//Tabela do datasheet com os registradores
  data[1] = 0x00;							//IRQ_OMS
  data[2] = 0x00;							//Reserved
  data[3] = 0x83;							//Reserved
  data[4] = 0xF3;							//Reserved
  data[5] = 0xD8;							//Option2
  data[6] = B5;							        //KEY1
  data[7] = B5;
  data[8] = B5;
  data[9] = B5;
  data[10] = B5;
  data[11] = B5;
  data[12] = B5;
  data[13] = B5;
  data[14] = B5;
  data[15] = B5;
  data[16] = B5;
  data[17] = C0;						        //KEY12


  for(i = 0; i < 18; i++)
  {
      checksum = checksum + data[i];
  }
  checksum = checksum % 256;				                //Calcula checksum
  data[18] = checksum;
  I2C_Master_Transmit(TOUCH_HOLTEK_ADDRESS,data,19);		        //Faz a transmissão por I2C

}
/****************************************************************/
