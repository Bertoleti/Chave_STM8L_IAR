#include "stm8l15x.h"
#include "main.h"
#include "init.h"
#include "ssd1306.h"
#include "functions.h"


#define ADC1_DR_ADDRESS        ((uint16_t)0x5344)
#define BUFFER_SIZE            ((uint8_t) 0x03)
#define BUFFER_ADDRESS         ((uint16_t)(&ADC_BUFFER))


/************************************************************************/
/*            Função: CLK_Config	                                */
/* Descrição: Inicializa o clock em 16MHz				*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void CLK_Config(void)
{
  CLK_DeInit();
   
 
  CLK_HSEConfig(CLK_HSE_OFF);
  CLK_LSICmd(DISABLE);
  CLK_HSICmd(ENABLE);
  
  while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
  
  CLK_SYSCLKSourceSwitchCmd(ENABLE);  
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  
  while (CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI);

  CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);

  CLK_CCOConfig(CLK_CCOSource_Off, CLK_CCODiv_1);  
}
/************************************************************************/

/************************************************************************/
/*            Função: GPIO_setup	                                */
/* Descrição: Inicializa os GPIOs					*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void GPIO_setup(void)
{                          
  GPIO_DeInit(GPIOA);						
  GPIO_DeInit(GPIOB);
  GPIO_DeInit(GPIOC);
  GPIO_DeInit(GPIOD);
  GPIO_DeInit(GPIOE);
  GPIO_DeInit(GPIOF);
  
  
  GPIO_Init(ZERO_CROSS_GPIO_Port, ZERO_CROSS_Pin, GPIO_Mode_In_FL_IT);		//Pino do  ZERO CROSS como Entrada
  GPIO_Init(GATE_GPIO_Port, GATE_Pin, GPIO_Mode_Out_PP_Low_Fast);		//Pino do GATE como saída
  GPIO_Init(STEP_GPIO_Port, STEP_Pin,GPIO_Mode_In_FL_No_IT);			//Pino do STEP como entrada Flutuante sem Interrupção
  GPIO_Init(CORRENTE_GPIO_Port, CORRENTE_Pin, GPIO_Mode_In_FL_No_IT);		//Pino da CORRENTE como entrada flutuante sem interrupção
  GPIO_Init(AC_IN_GPIO_Port, AC_IN_Pin, GPIO_Mode_In_FL_No_IT);			//Pino do AC_IN como entrada flutuante sem interrupção
  GPIO_Init(GLCD_RESET_GPIO_Port, GLCD_RESET_Pin, GPIO_Mode_Out_PP_Low_Fast);	//Pino do GLCD_RESET como saída push pull rápida
  GPIO_Init(GLCD_CS1_GPIO_Port, GLCD_CS1_Pin, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(GLCD_A0_GPIO_Port, GLCD_A0_Pin, GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(SPI_MOSI_GPIO_Port, SPI_MOSI_Pin, GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(SPI_CLK_GPIO_Port, SPI_CLK_Pin, GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, GPIO_Mode_Out_OD_HiZ_Fast);
  GPIO_Init(I2C_IRQ_GPIO_Port,I2C_IRQ_Pin, GPIO_Mode_In_FL_IT);
  GPIO_Init(SDA_GPIO_Port, SDA_Pin, GPIO_Mode_Out_OD_HiZ_Fast);
  GPIO_Init(SCL_GPIO_Port, SCL_Pin,GPIO_Mode_Out_OD_HiZ_Fast);
  GPIO_Init(OSCILADOR_GPIO_Port, OSCILADOR_Pin, GPIO_Mode_Out_PP_Low_Fast);    
  GPIO_Init(JUMPER_VOLTAGE_GPIO_Port, JUMPER_VOLTAGE_Pin, GPIO_Mode_In_PU_No_IT);  
  
}
/************************************************************************/

/************************************************************************/
/*            Função: EXTI_setup	                                */
/* Descrição: Inicializa as interrupções externas			*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void EXTI_setup(void)
{
  ITC_DeInit();
  
  
  EXTI_DeInit();
  
  //EXTI_SetPortSensitivity(EXTI_Port_D,EXTI_Trigger_Falling);
  EXTI_SetPinSensitivity(EXTI_Pin_7, EXTI_Trigger_Rising_Falling);
  EXTI_SetPinSensitivity(EXTI_Pin_3, EXTI_Trigger_Rising_Falling);
  //ITC_SetSoftwarePriority(EXTI7_IRQn ,ITC_PriorityLevel_3);
  
}
/************************************************************************/

/************************************************************************/
/*            Função: init_timer2	                                */
/* Descrição: Inicializa o timer4 em 1ms				*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void init_timer2(void)
{
  TIM2_DeInit();
  TIM2_TimeBaseInit(TIM2_Prescaler_8, TIM2_CounterMode_Up, 2000);
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  
  TIM2_Cmd(ENABLE);
}
/************************************************************************/

/************************************************************************/
/*            Função: init_timer4	                                */
/* Descrição: Inicializa o timer4 em 10us				*/
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void init_timer4(void)
{
  TIM4_DeInit();							//Deinitializes the TIM4 peripheral registers to their default reset values
  TIM4_TimeBaseInit(TIM4_Prescaler_4,80);				//Seta o timer para estourar a cada 10us
  //ITC_SetSoftwarePriority(TIM4_UPD_OVF_TRG_IRQn ,ITC_PriorityLevel_1);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);				//Habilita a interrupção para estouro to timer
  TIM4_Cmd(ENABLE);							//Liga o periférico
    
}


void DMA_Setup(void)
{
  SYSCFG_REMAPDMAChannelConfig(REMAP_DMA1Channel_ADC1ToChannel0);
  
  DMA_Init(DMA1_Channel0, BUFFER_ADDRESS,
           ADC1_DR_ADDRESS,
           BUFFER_SIZE,
           DMA_DIR_PeripheralToMemory,
           DMA_Mode_Circular,
           DMA_MemoryIncMode_Inc,
           DMA_Priority_Low,
           DMA_MemoryDataSize_HalfWord);
	   
  /* DMA Channel0 enable */
  DMA_Cmd(DMA1_Channel0, ENABLE);

  /* Enable DMA1 channel0 Transfer complete interrupt */
  DMA_ITConfig(DMA1_Channel0, DMA_ITx_TC, ENABLE);

  /* DMA enable */
  DMA_GlobalCmd(ENABLE);
  
}












