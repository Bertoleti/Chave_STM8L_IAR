#include "my_adc.h"
#include "stm8l15x.h"
#include "stm8l15x_adc.h"


/************************************************************************/
/*            Fun��o: ADC_Setup		                                */
/* Descri��o: Inicializa o ADC     					*/
/* Entrada:                                                             */
/* Sa�da:                                                               */
/************************************************************************/
void ADC_Setup(void)
{
  //Deinitializes the ADC peripheral registers to their default reset values.
  ADC_DeInit(ADC1);				                                
  
  ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_10Bit, ADC_Prescaler_2);
  ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
  
  ADC_Cmd(ADC1, ENABLE);
  
  //Habilita os canais que ser�o lidos pelo DMA
  ADC_ChannelCmd(ADC1, ADC_Channel_0, ENABLE);
  ADC_ChannelCmd(ADC1, ADC_Channel_1, ENABLE);
  ADC_ChannelCmd(ADC1, ADC_Channel_2, ENABLE);

}
/************************************************************************/

/************************************************************************/
/*            Fun��o: adc_read		                                */
/* Descri��o: realiza a leitura por ADC do canal selecionado		*/
/* Entrada: Canal a ser lido                                            */
/* Sa�da: Valor obtido pela convers�o                                   */
/************************************************************************/
unsigned short int adc_read (ADC_Channel_TypeDef ADC_Channels)
{
  unsigned short int value;
  
  ADC_ChannelCmd(ADC1, ADC_Channels, ENABLE);			//Escolhe o Canal e habilita ele
  
  ADC_SoftwareStartConv(ADC1);				        //Inicia a convers�o
  
  while(!ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC));		//Aguardao fim da convers�o
  
  value = ADC_GetConversionValue(ADC1);			        //Faz a leitura do valor obtido pelo ADC
  
  ADC_ClearFlag(ADC1, ADC_FLAG_EOC);				//Limpa a flag de END OF CONVERSION

  ADC_ChannelCmd(ADC1, ADC_Channels, DISABLE);			//Desliga o canal selecionado para poder mudar de canal em uma outra leitura
  
  return value;						        //retorna para a fun��o o valor obtido na convers�o

}

