#include "my_i2c.h"
#include "stm8l15x.h"
#include "main.h"

/************************************************************************/
/*            Função: I2C_Setup		                                */
/* Descrição: Inicializa a I2C     					*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void I2C_Setup(void)
{
  I2C_DeInit(I2C1);
  
  I2C_Init(I2C1, 300000, 0x40,  I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  
  I2C_ITConfig(I2C1, I2C_IT_ERR, ENABLE);
  
  I2C_Cmd(I2C1, ENABLE);
}
/************************************************************************/

/************************************************************************/
/*            Função: I2C_Master_Transmit                               */
/* Descrição: Transmite um byte por I2C no modo Master			*/
/* Entrada: Endereço do Slave | vetor a ser enviado | quantidade de	*/
/* bytes a serem enviados						*/
/* Saída:                                                               */
/************************************************************************/
void I2C_Master_Transmit(unsigned char slave_address, unsigned char *data, unsigned char lenght)
{
  unsigned char j;
  if(I2C1->SR3 == 2)                                                            //Verifico se o flag de BUSY está em 1... (não deveria.. mas se estiver...)
  {
    I2C_SoftwareResetCmd(I2C1,ENABLE);                                          //Dá um software reset na I2C
    I2C_Setup();                                                                //Inicializa I2C novamente        
  }
  
  while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));
  
  I2C_GenerateSTART(I2C1,ENABLE);								//Gera condição de start no barramento
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));									
  
  I2C_Send7bitAddress(I2C1, slave_address, I2C_Direction_Transmitter);				//Envia o endereço
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
  
  for( j = 0; j <= (lenght -1); j++)
  {
    I2C_SendData(I2C1, data[j]);
    while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  }

  //while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  
  I2C_GenerateSTOP(I2C1, ENABLE);
  
}
/************************************************************************/

/************************************************************************/
/*            Função: I2C_Master_Receive_Byte                           */
/* Descrição: Recebe byte por I2C no modo Master			*/
/* Entrada: endereço do slave                                           */
/* Saída: byte recebido pela I2C                                        */
/************************************************************************/
void I2C_Master_Read(unsigned char I2C_Slave_Addres, unsigned char Read_Addr, unsigned char *buffer)
{
  if(I2C1->SR3 == 2)                                                            //Verifico se o flag de BUSY está em 1... (não deveria.. mas se estiver...)
  {
    I2C_SoftwareResetCmd(I2C1,ENABLE);                                          //Dá um software reset na I2C
    I2C_Setup();                                                                //Inicializa I2C novamente        
  }
  
  I2C_AcknowledgeConfig(I2C1, ENABLE);
  
  I2C_GenerateSTART(I2C1,ENABLE);						//Gera condição de start no barramento
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
  
  I2C_Send7bitAddress(I2C1, I2C_Slave_Addres, I2C_Direction_Transmitter);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
  
  I2C_SendData(I2C1, Read_Addr);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  
  
  I2C_GenerateSTART(I2C1,ENABLE);						//Gera condição de start no barramento
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
  
  I2C_Send7bitAddress(I2C1, I2C_Slave_Addres, I2C_Direction_Receiver);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED));
  
  *buffer = I2C_ReceiveData(I2C1);
  
  I2C_AcknowledgeConfig(I2C1, DISABLE);
  
  I2C_GenerateSTOP(I2C1, ENABLE);
  
}
/************************************************************************/


/************************************************************************/
/*            Função: I2C_Master_Receive_Byte                           */
/* Descrição: Recebe n bytes por I2C no modo Master			*/
/* Entrada: endereço do slave | endereço a ser lido | onde vai salvar oq*/
/* leu | números de bytes a serem lidos                                 */
/* Saída: byte recebido pela I2C                                        */
/************************************************************************/
void I2C_Master_Read_Bytes(unsigned char I2C_Slave_Addres, unsigned char Read_Addr, unsigned char *buffer, unsigned char number_of_bytes)
{
  if(I2C1->SR3 == 2)                                                            //Verifico se o flag de BUSY está em 1... (não deveria.. mas se estiver...)
  {
    I2C_SoftwareResetCmd(I2C1,ENABLE);                                          //Dá um software reset na I2C
    I2C_Setup();                                                                //Inicializa I2C novamente        
  }
  
  I2C_AcknowledgeConfig(I2C1, ENABLE);
  
  I2C_GenerateSTART(I2C1,ENABLE);						//Gera condição de start no barramento
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
    
  I2C_Send7bitAddress(I2C1, I2C_Slave_Addres, I2C_Direction_Transmitter);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
  
  I2C_SendData(I2C1, Read_Addr);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
  
  I2C_GenerateSTART(I2C1,ENABLE);						//Gera condição de start no barramento
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
  
  I2C_Send7bitAddress(I2C1, I2C_Slave_Addres, I2C_Direction_Receiver);
  
  while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
  
  for(unsigned char j = 1; j < number_of_bytes; j++)
  {
    while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED));
  
    *buffer = I2C_ReceiveData(I2C1);
  }
  
  
  I2C_AcknowledgeConfig(I2C1, DISABLE);
  
  I2C_GenerateSTOP(I2C1, ENABLE);
  
}
/************************************************************************/



