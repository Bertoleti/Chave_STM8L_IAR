#include "my_spi.h"
#include "stm8l15x.h"
#include "main.h"



/************************************************************************/
/*            Função: SPI_Setup		                                */
/* Descrição: Inicializa a I2C     					*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void SPI_Setup(void)
{
  SPI_DeInit(SPI1);
  SPI_Init(SPI1, SPI_FirstBit_MSB, 
           SPI_BaudRatePrescaler_128, 
           SPI_Mode_Master, 
           SPI_CPOL_Low,
           SPI_CPHA_1Edge,
           SPI_Direction_1Line_Tx,
           SPI_NSS_Soft,
           0x00);
  
  SPI_Cmd(SPI1, ENABLE);
}



void SPI_Transmit_Byte (unsigned char data)
{
  
  //while(SPI_GetFlagStatus(SPI1, SPI_FLAG_BSY));
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, RESET);
  
  SPI_SendData(SPI1, data);
  while(!SPI_GetFlagStatus(SPI1, SPI_FLAG_TXE));
  while(SPI_GetFlagStatus(SPI1, SPI_FLAG_BSY));
  
  GPIO_WriteBit(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, SET);
  Delay_Spi();
}

void spi_command(unsigned char data)
{
  Delay_Spi();
  SPI_Transmit_Byte(data);
  Delay_Spi();    
}



void Delay_Spi(void)
{
    unsigned int wt = 1000;
    while(wt>0)
    {
        wt--;
    }

}