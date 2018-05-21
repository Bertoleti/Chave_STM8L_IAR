#ifndef __MY_ADC_H
#define __MY_ADC_H

#include "stm8l15x_adc.h"

void ADC_Setup(void);
unsigned short int adc_read (ADC_Channel_TypeDef ADC_Channels);

#endif