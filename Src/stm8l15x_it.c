/**
  ******************************************************************************
  * @file    EXTI/EXTI_IOControl/stm8l15x_it.c
  * @author  MCD Application Team
  * @version V1.5.2
  * @date    30-September-2014
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all peripherals interrupt service routine.
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
#include "stm8l15x_it.h"
#include "stm8l15x.h"
#include "main.h"
#include "ssd1306.h"
#include "font.h"
#include "touch_holtek.h"
#include "functions.h"
#include "tempos.h"
#include "bitmap.h"
#include "delay.h"
#include "math.h"
#include "my_i2c.h"


/** @addtogroup STM8L15x_StdPeriph_Examples
  * @{
  */
/** @addtogroup EXTI_IOControl
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern unsigned char touch_pressed;
unsigned long int cont_tmr14;
unsigned short int cont_tmr_adc;
unsigned short int mean_adc;
unsigned char start_dimmer;

unsigned char m, number_ice_crush, ciclos, inibe;
float TENSAOA, TENSAOB, TENSAOC;
unsigned short int cont_tmr_rms;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef FW_PRODUCAO
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{

}

INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
{

}

//DMA
INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)                                //DMA
{
  DMA_ClearITPendingBit(DMA1_IT_TC0);
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  if (flag_atualiza_adc == 0)                                   //só entra aqui após calcular o RMS lá no main         
  {
    mean_adc++;                                                 //Somo a posição do vetor para tiraras médiasde leitura do ADC
    ADC_STEP_BUFFER[mean_adc] = ADC_BUFFER[2];                    
    ADC_CORRENTE_BUFFER[mean_adc] = ADC_BUFFER[1];
    ADC_AC_BUFFER[mean_adc] = ADC_BUFFER[0];
    
  }
  if (mean_adc == 16)                                           //A cada 16 leituras, ou seja, 16ms
  {
    unsigned char i;
    flag_atualiza_adc = 1;                                      //Seta flag para calculo do RMS lá no main... pois fazer isso na interrupção leva muito tempo
    mean_adc = 0; 
  
    //Média móvel do STEP
    temp = 0;
    for(i = 0; i < 16; i++)
    {
      temp += ADC_STEP_BUFFER[i];
    }
    ADC_STEP = temp/i;
    
    //Média móvel do AC
    temp = 0;
    for(i = 0; i < 16; i++)
    {
      temp += ADC_AC_BUFFER[i];
    }
    ADC_AC = temp/i;
  }

}

INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
{

}

INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
{

}

INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
{

}

INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
{

}

INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
{

}

INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
{

}

INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
{

}

INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
{

}

//ZeroCross
INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)                                 //ZeroCross
{
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  start_dimmer = 1;
  
  
  if (flag_ice_crush)                                                           //Tratativa para o ice crush (deixando passar x ciclos ON e x ciclos OFF
  {  
    m++;
    if (m == 2)                                                                 //Como a interrupção é por borda, faço ela pegar a cada 2 bordas, assim faço a tratativa por ciclos
    {
      m = 0;
      ciclos ++;
    }
    if (number_ice_crush <Quantidade_Pulsos_Quebra_Gelo)                                     //Quantidade de pulsos do quebra gelo
    {
      if (ciclos == 20)
      {
          time_to_gate = matriz [0][VELOCIDADE12];   //PERÍODO ON
          inibe = 0;
          barra_velocidade = 10;
      }
      if (ciclos == 30)
      {
          time_to_gate = matriz [0][VELOCIDADE0];    //Período OFf
          inibe = 1;
          ciclos = 0;
          number_ice_crush++;
          if(state_smooth != ICE_CRUSH)                 //Só atualiza as barras se for ICE crush. se for smoothue, não mexe nas barras
          {
            //barra_velocidade = Quantidade_Pulsos_Quebra_Gelo - number_ice_crush;        //Barra decrescente
            //barra_velocidade = number_ice_crush;                                        //Barra Crescente
           // barra_velocidade = 0;
          }
          barra_velocidade = 0;                         //Atualiza tanto na função ice crush, quanto na função smooth
      }
    }
    else                                        //Depois que deu a quantidade de pulsos, fica um tempo em OFF (intervalo))
    {
      time_to_gate = matriz [0][VELOCIDADE0];
      inibe = 1;
      if (ciclos == 60)                       //Tempo do intervalo
      {
          ciclos = 0;
          number_ice_crush = 0;
          m = 0;
          flag_ice_crush = 0;                   //Desliga o ICE_CRUSH
          if(state_smooth == ICE_CRUSH)
          {
            state_smooth = RAMPA_SUBIDA_VEL1; 
            //tmr_smooth_seg = 0;
          }
          else 
          {
            executing = DESLIGADO;                //Atualiza o status de execução para desligado
          }
          
      }
    }
  }

  EXTI_ClearITPendingBit(EXTI_IT_Pin3);
}

INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
{

}

INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
{

}

INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
{

}

//I2C_IRQ
INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)                                 //I2C_IRQ
{
  EXTI_ClearITPendingBit(EXTI_IT_Pin7);
  
  if(GPIO_ReadInputDataBit(I2C_IRQ_GPIO_Port, GPIO_Pin_7) && (state_protection == PROTECTION_OFF))               //Borda de subida
  {
    flag_tmr_irq = 0;                                                    //Pausa a contagem do tempo de pressionamento do botão touch
    if(touch_pressed == 4)
    {
      touch_pressed = 0;      
      if((cont_tmr_irq >= 4000))
      {
        cont_tmr_irq = 0;
      }
      
#ifdef COM_DISPLAY
      //Executa o learning
      else if ((cont_tmr_irq >= DEBOUNCE_TOUCH_VALUE))
      {
        reseta_variaveis();
        if (executing == EXECUTE_LEARNING)
        {
          executing = DESLIGADO;
          flag_tmr_learning = 0;
          step_execute_learning = 0;
        }
        else if (executing != DESLIGADO)
        {
          Oled_Image(smart);
          executing = EXECUTE_LEARNING;
          time_to_gate = matriz[0][VELOCIDADE0];
          flag_tmr_learning = 1;
          step_execute_learning = 0;
        }
      }

#endif
    }
    
    else touch_pressed = 0;
  }
  
  if((GPIO_ReadInputDataBit(I2C_IRQ_GPIO_Port,I2C_IRQ_Pin) == 0) && !cont_debounce_touch && (state_protection == PROTECTION_OFF) 
     && executing != STATE_VELOCIDADE0 && executing != DESLIGADO)                     //Borda de descida
  {
    cont_debounce_touch = DEBOUNCE_TOUCH_VALUE;                                                 //Seta um debounce para evitar "rebote" dobotão touch
    touch_pressed = read_key_pressed();
    flag_tmr_irq = 1;
    cont_tmr_irq = 0;  
  }
  
  
}

INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
{

}

INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
{

}

INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
{

}

//Timer2 1mS
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)		//1ms
{
  TIM2_ClearFlag(TIM2_FLAG_Update);
  
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  cont_tmr_adc++;
  
  ADC_SoftwareStartConv(ADC1);
  if(flag_smooth)
  {
    cont_tmr_smooth++;
    if (cont_tmr_smooth == 1000)
    {
      cont_tmr_smooth = 0;
      tmr_smooth_seg++;  
    }
  }
  
  if(flag_tmr_max)
  {
    cont_tmr_max++;
    if(cont_tmr_max == 1000)
    {
      cont_tmr_max = 0;
      cont_tmr_max_seg++;
    }
  }
  
  if(flag_tmr_protection)
  {
    cont_tmr_protection++;
    if(cont_tmr_protection == 1000)
    {
      cont_tmr_protection = 0;
      cont_tmr_protection_seg++;
    }
  }
  
  if(cont_tmr_histerese)
  {
    cont_tmr_histerese--;
  }
  
  if(flag_tmr_irq)                                                      //Conta o tempo que qualquer botão do touch foi pressionado
  {
    cont_tmr_irq++;
    
    if(cont_tmr_irq == DEBOUNCE_TOUCH_VALUE)                            //Se ficou pelo menos x ms como touch pressionado...
    {                                                                   //Fiz isso pra evitar que ruídos deem "falso touch"        
      if(touch_pressed == 1)
      {
        reseta_variaveis();
        if (executing == QUEBRA_GELO)
        {
          executing = DESLIGADO;
        }
        else executing = QUEBRA_GELO;
      }
      
      if(touch_pressed == 2)
      {
        reseta_variaveis();
        if (executing == SMOOTH)
        {
          executing = DESLIGADO;
        }
        else 
        {
          executing = SMOOTH;
          state_smooth = ICE_CRUSH;
        }
      }
      
#ifdef COM_DISPLAY
          
    if(touch_pressed == 3)                                      //Cake
    {
      reseta_variaveis();
      if (executing == SMART)
      {
        executing = DESLIGADO;
      }
      else 
      {
        executing = SMART;
        velocidade_histerese = VELOCIDADE12;                    //Começa na velocidade máxima
        barra_velocidade = VELOCIDADE12;
        cont_tmr_histerese = 2000;                              //Para ficar os 2 primeiros segundos da função na velocidade max
      }                               
    }
    
    if(touch_pressed == 4)                                      //Learn
    {
      if((executing != DESLIGADO) || (executing == REC_LEARNING))
      {
        Oled_Image(smart);  
      } 
      
      else if (executing == EXECUTE_LEARNING)
      {
        time_to_gate = matriz[0][0];
        flag_tmr_learning = 0;
        step_execute_learning = 0;
      }
    }
    
#endif
      
      
#ifdef SEM_DISPLAY
    
    if(touch_pressed == 3)                                      //Timer
    {
      reseta_variaveis();
      if (executing == TIMMER)
      {
        executing = DESLIGADO;
      }
      else 
      {
        executing = TIMMER;
      }
    }    
    
    if(touch_pressed == 4)                                      //Cake
    {
      reseta_variaveis();
      if (executing == SMART)
      {
        executing = DESLIGADO;
      }
      else 
      {
        executing = SMART;
        velocidade_histerese = VELOCIDADE12;                    //Começa na velocidade máxima
        barra_velocidade = VELOCIDADE12;
        cont_tmr_histerese = 2000;                              //Para ficar os 2 primeiros segundos da função na velocidade max
      }                               
    }
    
    
#endif

    }
    
    if((cont_tmr_irq == 4000) && (touch_pressed == 4))
    {
      touch_pressed = 0;                                                        //Zera o touch pressed para caso haja algum ruído.. não pause a gravação
      //cont_tmr_irq = 0;
      if (executing == REC_LEARNING)
      {
                //Faz a gravação da posição atual para ela não ser perdida.
        vetor_learning[step_rec_learning] = cont_tmr_learning_seg;                  //Tempo
        cont_tmr_learning_seg = 0;
        step_rec_learning++;
        vetor_learning[step_rec_learning + 37] = current_position; 
        
        
	executing = END_REC_LEARNING;
        //executing = DESLIGADO;
	vetor_learning[step_rec_learning] = 0xAA;                             //0xAA indica que acabou a gravação
	flag_rec_learning = 0;
	flag_tmr_learning = 0;
	step_rec_learning = 0;
	flag_salva_eeprom = 1;
	reseta_variaveis();
      }
      else if (executing != DESLIGADO)
      {
	unsigned char j;
        unsigned short int temp_1, temp_2;
        
        temp_1 = flag_tmr_mix;                  //Le os valores da função mix, para não parar após começar o rec
        temp_2 = cont_tmr_mix;
	reseta_variaveis();
	for(j = 0; j < 74; j++)
	{
	  vetor_learning[j]= 0xBB;
	}
        flag_tmr_mix = temp_1;                  //Recupera os valores para não parar o mix após começar o REC
        cont_tmr_mix = temp_2;
        
        //before_position = 1;
        flag_alterou_velocidade = 1;
        
        Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
	Oled_ConstText("REC", COLUNA_ESCRITA, LINHA_ESCRITA);
	executing = REC_LEARNING;
	flag_rec_learning = 1;
	flag_tmr_learning = 1;	
      }
    }
  }
  
  if(flag_tmr_learning)
  {
    cont_tmr_learning++;
    if(cont_tmr_learning == 1000)
    {
      cont_tmr_learning = 0;
      cont_tmr_learning_seg++;
      cont_tmr_learning_seg_total++;
    }
  }
  
  if(debounce_transition_learning)
  {
    debounce_transition_learning--;
    if(debounce_transition_learning == 2)
    {
      debounce_transition_learning = 0;
      grava_posicao = 1;
    }
  }
  
  if(cont_debounce_touch)
  {
    cont_debounce_touch--;
  }
  
  if(cont_delay)
  {
    cont_delay--;
  }
  
  if(debounce_transition_vel)
  {
    debounce_transition_vel--;
  }
  
  cont_tmr_over_current ++;
  if(cont_tmr_over_current == 100)
  {
    cont_tmr_over_current = 0;
    
    if(tensao_placa == 127)                                   //Proteção por sobrecorrente em 127V
    {
      if(ADC_CORRENTE >= CORRENTE_TRAVAMENTO_127)                   //8.0 = 12A | 4.80 = 6.0A | 5.00 = 6.2A | 5.8 = 7A | 6.3 = 8.0A | 7.8 = 11A
      {
        cont_tmr_protecao++;        
      }
      else if(ADC_CORRENTE <= 9.0)
      {
        cont_tmr_protecao = 0;
      }
      
      if(cont_tmr_protecao >= 50)      //700 = 30s             //Se atingiu o tempo com corrente acima do limite de corrente
      {
        executing = PROTECAO_MOTOR;   
        state_protection = TIMEOUT;
      }
    }
      
    else if(tensao_placa == 220)                              //Proteção por sobrecorrente em 220V 
    {
      if(ADC_CORRENTE >= CORRENTE_TRAVAMENTO_220)                   //8.0 = 12A | 4.80 = 6.0A | 5.00 = 6.2A | 5.8 = 7A | 6.3 = 8.0A | 7.8 = 11A
      {
        cont_tmr_protecao++;        
      }
      else if(ADC_CORRENTE <= 5.0)
      {
        cont_tmr_protecao = 0;
      }
      if(cont_tmr_protecao >= 40)                             //Se atingiu o tempo com corrente acima do limite de corrente
      {
        executing = PROTECAO_MOTOR;   
        state_protection = TIMEOUT;
      }
    }
  }
  
  if(flag_tmr_mix)
  {
    cont_tmr_mix++;
    
    //Dá os pulsos na função MIX
    if(cont_tmr_mix < TEMPO_LIGADO_FUNCAO_MIX)                                  
    {
      time_to_gate = matriz[0][VELOCIDADE1];
    }
    else
    {
      time_to_gate = matriz[0][VELOCIDADE0];
    }
    if(cont_tmr_mix == TEMPO_CICLO_FUNCAO_MIX)
    {
      cont_tmr_mix = 0;
      flag_tmr_mix--;
      //Desliga o RELE após realizar todos os ciclos...
      if(!flag_tmr_mix)                 
      {
        executing = DESLIGADO;
      }
    }
    
    
  }
  
}

INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
{

}

INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
{

}

INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
{

}

INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
{

}

INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
{

}

INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)			        //20us
{
  TIM4_ClearFlag(TIM4_FLAG_Update);
  GPIO_ToggleBits(OSCILADOR_GPIO_Port,OSCILADOR_Pin);
  //GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,SET);
  
  if (start_dimmer)
  {
    cont_tmr14++;
    if (cont_tmr14 == time_to_gate)
    {
      GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,SET);
    }
    if (cont_tmr14 == 350)
    {
      GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,RESET);
      cont_tmr14 = 0;
      start_dimmer = 0;
    }
  }
  else
  {
    GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,RESET);
  }


}

INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
{
  
}

INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
{

}

INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
{

}

INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
{
  
  I2C_ClearITPendingBit(I2C1, I2C_IT_SMBALERT);
  I2C_ClearITPendingBit(I2C1, I2C_IT_TIMEOUT);
  I2C_ClearITPendingBit(I2C1, I2C_IT_PECERR);
  I2C_ClearITPendingBit(I2C1, I2C_IT_WUFH);
  I2C_ClearITPendingBit(I2C1, I2C_IT_AF);
  I2C_ClearITPendingBit(I2C1, I2C_IT_ARLO);
  I2C_ClearITPendingBit(I2C1, I2C_IT_BERR);
  
}

#endif


#ifdef FW_TESTE
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{

}

INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
{

}

//DMA
INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)                                //DMA
{
  DMA_ClearITPendingBit(DMA1_IT_TC0);
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  if (flag_atualiza_adc == 0)                                   //só entra aqui após calcular o RMS lá no main         
  {
    mean_adc++;                                                 //Somo a posição do vetor para tiraras médiasde leitura do ADC
    ADC_STEP_BUFFER[mean_adc] = ADC_BUFFER[2];                    
    ADC_CORRENTE_BUFFER[mean_adc] = ADC_BUFFER[1];
    ADC_AC_BUFFER[mean_adc] = ADC_BUFFER[0];
    
  }
  if (mean_adc == 16)                                           //A cada 16 leituras, ou seja, 16ms
  {
    unsigned char i;
    flag_atualiza_adc = 1;                                      //Seta flag para calculo do RMS lá no main... pois fazer isso na interrupção leva muito tempo
    mean_adc = 0; 
  
    //Média móvel do STEP
    temp = 0;
    for(i = 0; i < 16; i++)
    {
      temp += ADC_STEP_BUFFER[i];
    }
    ADC_STEP = temp/i;
    
    //Média móvel do AC
    temp = 0;
    for(i = 0; i < 16; i++)
    {
      temp += ADC_AC_BUFFER[i];
    }
    ADC_AC = temp/i;
    //TENSAO_FASE = (unsigned short int)((float)((ADC_AC*0.28532042654)/1.414213562));
    
    if ((ADC_AC >= 720) && (ADC_AC <= 900)) TENSAO_FASE = 220;
    else if((ADC_AC > 500) && (ADC_AC <= 700)) TENSAO_FASE = 127;
    else TENSAO_FASE = 999;

  }

}

INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
{

}

INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
{

}

INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
{

}

INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
{

}

INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
{

}

INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
{

}

INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
{

}

INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
{

}

//ZeroCross
INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)                                 //ZeroCross
{
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  start_dimmer = 1;
  
  
  if (flag_ice_crush)                                                           //Tratativa para o ice crush (deixando passar x ciclos ON e x ciclos OFF
  {  
    m++;
    if (m == 2)                                                                 //Como a interrupção é por borda, faço ela pegar a cada 2 bordas, assim faço a tratativa por ciclos
    {
      m = 0;
      ciclos ++;
    }
    if (number_ice_crush <Quantidade_Pulsos_Quebra_Gelo)                                     //Quantidade de pulsos do quebra gelo
    {
      if (ciclos == 20)
      {
          time_to_gate = matriz [0][VELOCIDADE10];   //PERÍODO ON
          inibe = 0;
      }
      if (ciclos == 30)
      {
          time_to_gate = matriz [0][VELOCIDADE0];    //Período OFf
          inibe = 1;
          ciclos = 0;
          number_ice_crush++;
          if(state_smooth != ICE_CRUSH)                 //Só atualiza as barras se for ICE crush. se for smoothue, não mexe nas barras
          {
            barra_velocidade = Quantidade_Pulsos_Quebra_Gelo - number_ice_crush;
          }
      }
    }
    else                                        //Depois que deu a quantidade de pulsos, fica um tempo em OFF (intervalo))
    {
      time_to_gate = matriz [0][VELOCIDADE0];
      inibe = 1;
      if (ciclos == 60)                       //Tempo do intervalo
      {
          ciclos = 0;
          number_ice_crush = 0;
          m = 0;
          flag_ice_crush = 0;                   //Desliga o ICE_CRUSH
          if(state_smooth == ICE_CRUSH)
          {
            state_smooth = RAMPA_SUBIDA_VEL1; 
          }
          else 
          {
            executing = DESLIGADO;                //Atualiza o status de execução para desligado
          }
          
      }
    }
  }

  EXTI_ClearITPendingBit(EXTI_IT_Pin3);
}

INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
{

}

INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
{

}

INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
{

}

INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)                                 //I2C_IRQ
{
  EXTI_ClearITPendingBit(EXTI_IT_Pin7);
  
  if((GPIO_ReadInputDataBit(I2C_IRQ_GPIO_Port,I2C_IRQ_Pin)))
  {
    reseta_variaveis();
    //executing = DESLIGADO;
  }
  
  
  if((GPIO_ReadInputDataBit(I2C_IRQ_GPIO_Port,I2C_IRQ_Pin) == 0) && !cont_debounce_touch)                     //Borda de descida
  {
    cont_debounce_touch = 200;                                                 //Seta um debounce para evitar "rebote" dobotão touch
    touch_pressed = read_key_pressed();
   
    if(touch_pressed == 1)
    {
      reseta_variaveis();
      executing = QUEBRA_GELO;
    }
    if(touch_pressed == 2)
    {
      reseta_variaveis();
      executing = SMOOTH;
    }
    if(touch_pressed == 3)
    {
      reseta_variaveis();
      executing = REC_LEARNING;     
    }
    if(touch_pressed == 4)
    {
      reseta_variaveis();
      executing = SMART;                            //Para ficar os 2 primeiros segundos da função na velocidade max
                                   
    }
  }
}

INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
{

}

INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
{

}

INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
{

}

//Timer2 1mS
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)		//1ms
{
  TIM2_ClearFlag(TIM2_FLAG_Update);
  
  
  //GPIO_ToggleBits(LED_DEBUG_GPIO_Port,LED_DEBUG_Pin);
  cont_tmr_adc++;
  
  ADC_SoftwareStartConv(ADC1);
  if(flag_smooth)
  {
    cont_tmr_smooth++;
    if (cont_tmr_smooth == 1000)
    {
      cont_tmr_smooth = 0;
      tmr_smooth_seg++;  
    }
  }
  
  if(flag_tmr_max)
  {
    cont_tmr_max++;
    if(cont_tmr_max == 1000)
    {
      cont_tmr_max = 0;
      cont_tmr_max_seg++;
      
    }
  }
  
  if(cont_tmr_histerese)
  {
    cont_tmr_histerese--;
  }
  
  if(flag_tmr_irq)
  {
    cont_tmr_irq++;
  }
  
  if(flag_tmr_learning)
  {
    cont_tmr_learning++;
    if(cont_tmr_learning == 1000)
    {
      cont_tmr_learning = 0;
      cont_tmr_learning_seg++;
      cont_tmr_learning_seg_total++;
    }
  }
  
  if(debounce_transition_learning)
  {
    debounce_transition_learning--;
    if(debounce_transition_learning == 2)
    {
      debounce_transition_learning = 0;
      grava_posicao = 1;
    }
  }
  
  if(cont_debounce_touch)
  {
    cont_debounce_touch--;
  }
  
  if(cont_delay)
  {
    cont_delay--;
  }
  
  if(cont_tmr_mostra_corrente)
  {
    cont_tmr_mostra_corrente--;
  }
  
  if(debounce_transition_vel)
  {
    debounce_transition_vel--;
  }
    
}

INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
{

}

INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
{

}

INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
{

}

INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
{

}

INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
{

}

INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)			        //20us
{
  TIM4_ClearFlag(TIM4_FLAG_Update);
  GPIO_ToggleBits(OSCILADOR_GPIO_Port,OSCILADOR_Pin);
  if (start_dimmer)
  {
    cont_tmr14++;
    if (cont_tmr14 == time_to_gate)
    {
      GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,SET);
    }
    if (cont_tmr14 == 350)
    {
      GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,RESET);
      cont_tmr14 = 0;
      start_dimmer = 0;
    }
  }
  else
  {
    GPIO_WriteBit(GATE_GPIO_Port,GATE_Pin,RESET);
  }

}

INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
{
  
}

INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
{

}

INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
{

}

INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
{
  
  I2C_ClearITPendingBit(I2C1, I2C_IT_SMBALERT);
  I2C_ClearITPendingBit(I2C1, I2C_IT_TIMEOUT);
  I2C_ClearITPendingBit(I2C1, I2C_IT_PECERR);
  I2C_ClearITPendingBit(I2C1, I2C_IT_WUFH);
  I2C_ClearITPendingBit(I2C1, I2C_IT_AF);
  I2C_ClearITPendingBit(I2C1, I2C_IT_ARLO);
  I2C_ClearITPendingBit(I2C1, I2C_IT_BERR);
  
}
#endif

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/