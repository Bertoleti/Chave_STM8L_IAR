/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.1
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"
#include "delay.h"
#include "init.h"
#include "main.h"
#include "ssd1306.h"
#include "my_i2c.h"
#include "font.h"
#include "bitmap.h"
#include "stm8l15x_it.h"
#include "my_adc.h"
#include "functions.h"
#include "math.h"
#include "my_spi.h"
#include "touch_holtek.h"
#include <stdio.h>

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
unsigned char i;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

#ifdef FW_PRODUCAO
void main(void)
{
  CLK_Config();
    for(unsigned long int k = 0; k < 100000; k++)
  {
    __no_operation();
  }
  init_timer2();                        //1ms
  init_timer4();                        //20us
  GPIO_setup();                         //Inicializa os Ports
  I2C_Setup();                          //Inicializaa I2C
  SPI_Setup();                          //Inicializa a SPI
  EXTI_setup();                         //Configura as interrupções externas
  ADC_Setup();                          //Inicializa ADC
  DMA_Setup();                          //Inicializa DMA
  
  
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  FLASH_Unlock(FLASH_MemType_Data);
  //Aguarda flag de EEPROM desbloqueada
  while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
  
  ADC_DMACmd(ADC1,ENABLE);
  ADC_SoftwareStartConv(ADC1);
  
  
  Oled_Init();
  I2C_Setup();
  Oled_Image(Logo);
  Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
  enableInterrupts(); 
  Delay_ms(3000);
  
  if((GPIO_ReadInputDataBit(JUMPER_VOLTAGE_GPIO_Port, JUMPER_VOLTAGE_Pin)) == 0)        //Se o jumper estiver fechado...
  {
    tensao_placa = 127;
  }
  else
  {
    tensao_placa = 220;
  }
  
  
#ifdef COM_DISPLAY
  if(tensao_placa == 127)                //Jumper fechado é 127V
  {
    if(ADC_AC > 720)
    {
      Oled_Image(alerta);
      Oled_SetFont(Font_6x8, 6, 8, 32, 127);
      Oled_ConstText("VERIFIQUE A VOLTAGEM", 5, 5);
      Oled_ConstText("DA TOMADA UTILIZADA", 7, 7);
      disableInterrupts();
      //NVIC_DisableIRQ(EXTI4_15_IRQn);
      while(1);
    }
  }
  
  else
  {
    if(ADC_AC <= 720)
    {
      Oled_Image(alerta);
      Oled_SetFont(Font_6x8, 6, 8, 32, 127);
      Oled_ConstText("VERIFIQUE A VOLTAGEM", 5, 5);
      Oled_ConstText("DA TOMADA UTILIZADA", 7, 7);
      disableInterrupts();
      //NVIC_DisableIRQ(EXTI4_15_IRQn);
      while(1);
    }
  }
#endif

  

  
  for(i = 0; i < 74; i++)
  {
    vetor_learning[i] = FLASH_ReadByte(EEPROM_OFFSET + i);
  }

  write_holtek_register(0x00,0xD8,0x08,0x50);                         //Valor default do CHIP é 0x10...
  //read_holtek_register(0x08);
  
  current_position = calc_position();
  if(current_position != VELOCIDADE0)
  {
    executing = DESLIGADO;
  }
  else (executing = STATE_VELOCIDADE0);
  
  
  /* Infinite loop */
  while (1)
  {
    //read_function();
    execute_function();
    atualiza_display();
   
    if(flag_atualiza_adc)                                       //Se fez as 16 leituras lá na interrupção do DMA
    {
      //Calcula o RMS da CORRENTE
      temp = 0;
      for(i = 0; i <= 16; i++)                               
      {
        temp += pow(ADC_CORRENTE_BUFFER[i],2);                  //Elevo cada posiçãodo vetor ao quadrado.. para fazer o root
      }
      temp = temp/i;                                            //Divido pela quantidade de leituras (mean)
      //ADC_CORRENTE = ((sqrt(temp) * 0.017755681) + 0.0) * 3;  //Calculo a raiz quadrada.. square Corrente = 3/1024/(0.33/2)
      ADC_CORRENTE = ((sqrt(temp) * 0.0266335227) + 0.0) * 3;   //Calculo a raiz quadrada.. square Corrente = 3/1024/(0.22/2)
      flag_atualiza_adc = 0;                                    //Zera a flag de atualiza ADC  
    }
    
    if(flag_salva_eeprom)
    {
      flag_salva_eeprom = 0;
      for(i = 0; i < 74; i++)
      {
        FLASH_ProgramByte(EEPROM_OFFSET + i, vetor_learning[i]);
        while(FLASH_GetFlagStatus(FLASH_FLAG_EOP) == RESET);    //Aguarda o final da gravação da EEPROM
      }
      for(i = 0; i < 74; i++)
      {
        vetor_learning[i] = FLASH_ReadByte(EEPROM_OFFSET + i);
        Delay_ms(5);
      }
    }
  }
}
#endif


#ifdef FW_TESTE

char buffer[3];
unsigned char jumper_solda;

#include <stdio.h>
void main(void)
{
  CLK_Config();
  GPIO_setup();
  init_timer2();                        //1ms
  init_timer4();                        //20us
  I2C_Setup();
  SPI_Setup();
  EXTI_setup();
  ADC_Setup();
  DMA_Setup();
  
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);
  FLASH_Unlock(FLASH_MemType_Data);
  //Aguarda flag de EEPROM desbloqueada
  while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
  
  ADC_DMACmd(ADC1,ENABLE);
  ADC_SoftwareStartConv(ADC1);
  
  Oled_Init();
  Oled_FillScreen(0xFF);
  enableInterrupts();
  Delay_ms(3000);
  Oled_FillScreen(0x00);
  Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
  Oled_Text("POSICAO:",0 , 0);
  Oled_Text("CORR.:",0 , 3);
  Oled_Text("TENSAO:",0 , 6);
  Oled_Text("00", 100, 0);
  
  if((GPIO_ReadInputDataBit(JUMPER_VOLTAGE_GPIO_Port, JUMPER_VOLTAGE_Pin)) == 0)        //Se o jumper estiver fechado...
  {
    jumper_solda = 0;
  }
  else
  {
    jumper_solda = 1;
  }
  
  
  write_holtek_register(0x00,0xD8,0x08,0x50);                         //Valor default do CHIP é 0x10...
    
  /* Infinite loop */
  while (1)
  {
    read_function();
    execute_function();
    atualiza_display();
    
   
    if(flag_atualiza_adc)                                       //Se fez as 16 leituras lá na interrupção do DMA
    {
      //Calcula o RMS da CORRENTE
      temp = 0;
      for(i = 0; i <= 16; i++)                               
      {
        temp += pow(ADC_CORRENTE_BUFFER[i],2);                  //Elevo cada posiçãodo vetor ao quadrado.. para fazer o root
      }
      temp = temp/i;                                            //Divido pela quantidade de leituras (mean)
      ADC_CORRENTE = ((sqrt(temp) * 0.0266335227) - 0.0) * 3;         //Calculo a raiz quadrada.. square
      flag_atualiza_adc = 0;                                    //Zera a flag de atualiza ADC    
    }
    /*
    if(!cont_tmr_mostra_corrente)
    {
      cont_tmr_mostra_corrente = 1000;
      sprintf(buffer,"%f",ADC_CORRENTE);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text((buffer), 80, 4);
    }
*/

    if(flag_salva_eeprom)
    {
      flag_salva_eeprom = 0;
      for(i = 0; i < 74; i++)
      {
        FLASH_ProgramByte(EEPROM_OFFSET + i, vetor_learning[i]);
        while(FLASH_GetFlagStatus(FLASH_FLAG_EOP) == RESET);    //Aguarda o final da gravação da EEPROM
      }
      for(i = 0; i < 74; i++)
      {
        vetor_learning[i] = FLASH_ReadByte(EEPROM_OFFSET + i);
        Delay_ms(5);
      }
    }
  }
}

#endif


#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  //printf("Wrong parameters value: file %s on line %d\r\n", file, line);
  /* Infinite loop */
  while (1)
  {
    
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
