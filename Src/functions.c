#include "stm8l15x.h"
#include "functions.h"
#include "ssd1306.h"
#include "bitmap.h"
#include "font.h"
#include "tempos.h"
#include "delay.h"
#include "main.h"


unsigned short int ADC_STEP = 1023, ADC_AC;
float ADC_CORRENTE;
unsigned short int ADC_STEP_BUFFER[17] = {0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF,0x3FF};
unsigned short int ADC_CORRENTE_BUFFER[17], ADC_AC_BUFFER[17];
unsigned short int ADC_BUFFER[3];
unsigned char current_position, function, before_position;
unsigned short int time_to_gate = 815;
unsigned char flag_special_functions = 0;
unsigned char executing, before_executing;
unsigned char flag_ice_crush;
unsigned char flag_smooth, first_time_smooth;
unsigned short int cont_tmr_smooth, tmr_smooth_seg, tmr_smooth_alterna;
unsigned char state_smooth = 0;
unsigned char flag_tmr_max;
unsigned short int cont_tmr_max, cont_tmr_max_seg, cont_tmr_max_seg_change;
char buffer_lcd [3];
unsigned char flag_alterou_velocidade;
unsigned char velocidade_histerese = VELOCIDADE10;
unsigned short int cont_tmr_histerese; 
unsigned char flag_tmr_irq;
unsigned short int cont_tmr_irq;
unsigned char flag_rec_learning, flag_tmr_learning;
unsigned short int cont_tmr_learning, cont_tmr_learning_seg,cont_tmr_learning_seg_total, debounce_transition_learning;
unsigned char step_rec_learning, grava_posicao, step_execute_learning, flag_salva_eeprom, flag_read_eeprom;
unsigned char vetor_learning[75];
unsigned char barra_velocidade, barra_velocidade_anterior;
unsigned short int cont_debounce_touch;
unsigned char flag_atualiza_adc;
unsigned short int cont_tmr_protecao;
unsigned char tensao_placa;

unsigned short int cont_tmr_protection,cont_tmr_protection_seg;
unsigned char flag_tmr_protection, cont_tmr_max_protection_change, state_protection;

unsigned long int temp;

unsigned short int debounce_transition_vel;
unsigned short int TENSAO_FASE;

unsigned short int cont_tmr_over_current;
unsigned char flag_tmr_mix;
unsigned short int cont_tmr_mix;

 

unsigned const int matriz[2][15] = {{407,240,219,207,195,183,168,153,134,110,80,040,010}, //127V      5        PERFEITO
                                    {407,302,578,551,525,503,480,480,480,480,480},}; //220V      14       PERFEITO


#ifdef FW_PRODUCAO
/************************************************************/
/*            Função: read_function                         */
/* Descrição: Faz leitura da posição da chave               */
/* Entrada:                                                 */
/* Saída:                                                   */
/************************************************************/
void read_function(void)
{ 
  /*
  current_position = calc_position();  
  if (current_position != before_position)                              //Se mudou a chave de posição...
  {
    
    //if(current_position == 1 && before_position == 0)
    //{
    //  if(executing != VELOCIDADES)flag_alterou_velocidade = 1;
    //  before_position = current_position; 
    //  debounce_transition_vel = 5000;
    //  executing = VELOCIDADES;
    //  return;
   // }

    
    if(!flag_rec_learning && (executing != PROTECAO_MOTOR))
    {
      executing = VELOCIDADES;                                          //Muda status de execução para execução das velocidades
    }
    before_position = current_position;                                 //Atualiza valor da posição para a proxima leitura      
    if(executing != VELOCIDADES)flag_alterou_velocidade = 1;
    debounce_transition_vel = DEBOUNCE_ROTACAO;
  }
  else
  {
    executing = executing;                                              //Se não mudou a chave deposição...continua fazendo o que estava fazendo
  }
*/
}
/************************************************************/

/************************************************************************/
/*            Função: execute_function                                  */
/* Descrição: Executa a velocidade de acordo com a posição da chave     */
/* ou executa a velocidade de acordo com a função escolhida por BT      */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void execute_function(void)
{
  /*
  if(executing == VELOCIDADES)
  {
    if(!debounce_transition_vel)
    {
      flag_alterou_velocidade = 1;
      time_to_gate = matriz[0][current_position];
      barra_velocidade = current_position;
      flag_ice_crush = 0;
    }
  }
  */
  if(executing == STATE_VELOCIDADE0)                                            //Se o cursor está na posição zero...
  {
    current_position = calc_position();                                         //Semnpre verifica a posição do botão..
    if(current_position != before_position)                                     //Se houve alteração na posição da chave...
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE0];
        barra_velocidade = VELOCIDADE0;
      }
    }
  }  
  else if(executing == STATE_VELOCIDADE1)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)
      {
        //executing = STATE_MIX;
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE1];
        barra_velocidade = VELOCIDADE1;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE2)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)
      {
        //executing = STATE_MIX;
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE2];
        barra_velocidade = VELOCIDADE2;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE3)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        //flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE3];
        barra_velocidade = VELOCIDADE3;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE4)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE4];
        barra_velocidade = VELOCIDADE4;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE5)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE5];
        barra_velocidade = VELOCIDADE5;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE6)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE6];
        barra_velocidade = VELOCIDADE6;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE7)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE7];
        barra_velocidade = VELOCIDADE7;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE8)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE8];
        barra_velocidade = VELOCIDADE8;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE9)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE9];
        barra_velocidade = VELOCIDADE9;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE10)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE10];
        barra_velocidade = VELOCIDADE10;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE11)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE11];
        barra_velocidade = VELOCIDADE11;
      }
    }
  }
  else if(executing == STATE_VELOCIDADE12)
  {
    current_position = calc_position();
    if(current_position != before_position)
    {
      before_position = current_position;
      if(current_position == VELOCIDADE1)                                       //Se foi para a posição 1 da chave..
      {
        //executing = STATE_MIX;                                                  //Executa função MIX
        executing = current_position;                                           
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
      else
      {
        executing = current_position;
        debounce_transition_vel = DEBOUNCE_ROTACAO;
        flag_alterou_velocidade = 1;
      }
    }
    else
    {
      if(!debounce_transition_vel)
      {
        time_to_gate = matriz[0][VELOCIDADE12];
        barra_velocidade = VELOCIDADE12;
      }
    }
  }
  else if(executing == QUEBRA_GELO)
  {
    flag_ice_crush = 1;
    current_position = calc_position();
    if(current_position != before_position)
    {
      reseta_variaveis();
      before_position = current_position;
      executing = current_position;
      debounce_transition_vel = DEBOUNCE_ROTACAO;
      flag_alterou_velocidade = 1;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      
    }
  }
  else if(executing == SMOOTH)
  {
    smooth();
    current_position = calc_position();
    if(current_position != before_position)
    {
      reseta_variaveis();
      before_position = current_position;
      executing = current_position;
      debounce_transition_vel = DEBOUNCE_ROTACAO;
      flag_alterou_velocidade = 1;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      
    }
  }
  else if(executing == TIMMER)
  {
    timmer_max();
    current_position = calc_position();
    if(current_position != before_position)
    {
      reseta_variaveis();
      before_position = current_position;
      executing = current_position;
      debounce_transition_vel = DEBOUNCE_ROTACAO;
      flag_alterou_velocidade = 1;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      
    }
  }
  else if(executing == REC_LEARNING)
  {
    rec_learning();
  }
  else if(executing == END_REC_LEARNING)
  {
    time_to_gate = matriz[0][0];
  }
  else if(executing == EXECUTE_LEARNING)
  {
    execute_learning();
    current_position = calc_position();
    if(current_position != before_position)
    {
      reseta_variaveis();
      before_position = current_position;
      executing = current_position;
      debounce_transition_vel = DEBOUNCE_ROTACAO;
      flag_alterou_velocidade = 1;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      
    }
  }
  else if(executing == SMART)
  {
    smart_function_hysteresis();
    current_position = calc_position();
    if(current_position != before_position)
    {
      reseta_variaveis();
      before_position = current_position;
      executing = current_position;
      debounce_transition_vel = DEBOUNCE_ROTACAO;
      flag_alterou_velocidade = 1;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      
    }
  }
  else if(executing == DESLIGADO)
  {
    desligado();
  }
  else if(executing == PROTECAO_MOTOR)
  {
    protecao_travamento();
  }
  else if(executing == STATE_MIX)
  {
    mix_function();
  }

}
/************************************************************************/

/************************************************************************/
/*            Função: calc_position                                     */
/* Descrição: Faz o calculo de qual posição a chave está de acordo com  */
/* o valor lido no ADC                                                  */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
unsigned char calc_position(void)
{
  unsigned char position;
  if (ADC_STEP < 79)                             //15 -> Posição 12 da chave
  {                                             //Velocidade 6  
    position = 12;
  }
  else if (ADC_STEP > 80 && ADC_STEP < 200)    //155 -> Posição 11 da chave
  {                                             //Velocidade 5
    position = 11;
  }
  else if (ADC_STEP > 201 && ADC_STEP < 309)    //304 -> Posição 10 da chave   273
  {                                             //Velocidade 4
    position = 10;
  }
  else if (ADC_STEP > 310 && ADC_STEP < 439)    //411 -> Posição 9 da chave
  {                                       //Velocidade 3                        
    position = 9;
  }
  else if (ADC_STEP > 440 && ADC_STEP < 589)    //552 -> Posição 8 da chave
  {                                       //Velocidade 2
    position = 8;
  }
  else if (ADC_STEP > 590 && ADC_STEP < 689)    //701 -> Posição 7 da chave
  {                                       //Velocidade 1
    position = 7;
  }
  else if (ADC_STEP > 690 && ADC_STEP < 759)    //782 -> Posição 6 da chave
  {
    position = 6;     
  }
  else if (ADC_STEP > 760 && ADC_STEP < 850)    //840 -> Posição 5 da chave
  {
    position = 5;
  }
  else if (ADC_STEP > 851 && ADC_STEP < 920)    //908 -> Posição 4 da chave
  {
    position = 4;
  }
  else if (ADC_STEP > 921 && ADC_STEP < 964)    //956 -> Posição 3 da chave
  {
    position = 3;
  }
  else if (ADC_STEP > 965 && ADC_STEP < 989)    //979 -> Posição 2 da chave
  {
    position = 2;
  }
  else if (ADC_STEP > 990 && ADC_STEP < 1009)    //956 -> Posição 1 da chave
  {
    position = 1;
  }
  else if ((ADC_STEP > 1010))    //1023 -> Posição 0 da chave
  {
    position = 0;
  }
      
  return position;

}
/************************************************************************/


/********************************************************************************/
/*            Função: smooth                                                    */
/* Descrição: Execução da função smooth, fazendo a rampa para o milkshake       */
/* Entrada:                                                                     */
/* Saída:                                                                       */
/********************************************************************************/
void smooth(void)
{
  if(state_smooth == ICE_CRUSH)
  {
    flag_ice_crush = 1;                                         //Primeira coisa que faz é dar um ICE CRUSH
    flag_smooth = 1;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL1)
  {
    flag_smooth = 1;                                                            //Inicia o timer par aa função smooth
    time_to_gate = matriz[0][VELOCIDADE1];                                      //Motor na velocidade 1         
    barra_velocidade = VELOCIDADE1;                                             //Atualiza o valor da barra de potência do motor
    if(tmr_smooth_seg >= (Tempo_Total_Rampa_Espuma / 10) * 1) state_smooth = RAMPA_SUBIDA_VEL2;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL2)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE2]; 
    barra_velocidade = VELOCIDADE2;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 2) state_smooth = RAMPA_SUBIDA_VEL3;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL3)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE3]; 
    barra_velocidade = VELOCIDADE3;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 3) state_smooth = RAMPA_SUBIDA_VEL4;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL4)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE4]; 
    barra_velocidade = VELOCIDADE4;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 4) state_smooth = RAMPA_SUBIDA_VEL5;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL5)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE5];   
    barra_velocidade = VELOCIDADE5;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 5) state_smooth = RAMPA_SUBIDA_VEL6;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL6)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE6];    
    barra_velocidade = VELOCIDADE6;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 6) state_smooth = RAMPA_SUBIDA_VEL7;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL7)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE7];  
    barra_velocidade = VELOCIDADE7;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 7) state_smooth = RAMPA_SUBIDA_VEL8;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL8)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE8];  
    barra_velocidade = VELOCIDADE8;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 8) state_smooth = RAMPA_SUBIDA_VEL9;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL9)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE9];   
    barra_velocidade = VELOCIDADE9;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 9) state_smooth = RAMPA_SUBIDA_VEL10;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL10)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE10];  
    barra_velocidade = VELOCIDADE10;
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 10) 
    {
      state_smooth = ALTERNADO_BAIXO;
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Baixo_Espuma;
    }
  }
  else if(state_smooth == ALTERNADO_BAIXO)
  {
    time_to_gate = matriz[0][Velocidade_Pulso_Baixo_Espuma];
    barra_velocidade = Velocidade_Pulso_Baixo_Espuma;
    if(tmr_smooth_seg == tmr_smooth_alterna)
    {
      state_smooth = ALTERNADO_ALTO;  
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Alto_Espuma;
    }
  }
  else if(state_smooth == ALTERNADO_ALTO)
  {
    time_to_gate = matriz[0][Velocidade_Pulso_Alto_Espuma];
    barra_velocidade = Velocidade_Pulso_Alto_Espuma;
    if(tmr_smooth_seg == tmr_smooth_alterna)
    {
      state_smooth = ALTERNADO_BAIXO;  
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Baixo_Espuma;
    }
  }
  else if (state_smooth == SMOOTH_END)
  {
    executing = DESLIGADO;
  }
  if(tmr_smooth_seg >= Tempo_Total_Funcao_Espuma)
  {
    flag_smooth = 0;
    state_smooth = SMOOTH_END;
    tmr_smooth_seg = 0;
  }
  
}
/************************************************************************/

/********************************************************************************/
/*            Função: timmer_max                                                */
/* Descrição: Execução da função timer, como liquidificador na velocidade max   */
/* Entrada:                                                                     */
/* Saída:                                                                       */
/********************************************************************************/
void timmer_max(void)
{
  flag_tmr_max = 1;
  time_to_gate = matriz[0][VELOCIDADE12];
  if(cont_tmr_max_seg >= Tempo_Timer_Velocidade_Maxima)
  {
    flag_tmr_max = 0;
    cont_tmr_max_seg = 0;
    executing = DESLIGADO;
  }
}
/********************************************************************************/


/************************************************************************/
/*            Função: smart_function_hysteresis                         */
/* Descrição: Execução da função smart, muda a velocidade de acordo com */
/* a carga adicinada no liquidificador                                  */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void smart_function_hysteresis(void)
{
  time_to_gate = matriz[0][velocidade_histerese];
  
  //Se for para motor com tensão de 127V
  if(tensao_placa == 127)
  {
    if(velocidade_histerese == VELOCIDADE3)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE >= TRANSICAO_1_TO_6_127V)
        {
          velocidade_histerese = VELOCIDADE6;
          barra_velocidade = VELOCIDADE6;
        }
      }
    }
    
    if(velocidade_histerese == VELOCIDADE6)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE >= TRANSICAO_6_TO_12_127V)
        {
          velocidade_histerese = VELOCIDADE12;
          barra_velocidade = VELOCIDADE12;
        }
        else if(ADC_CORRENTE <= TRANSICAO_6_TO_1_127V)
        {
          velocidade_histerese = VELOCIDADE3;
          barra_velocidade = VELOCIDADE3;
        }
      }
    }
    
    if(velocidade_histerese == VELOCIDADE12)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE <= TRANSICAO_12_TO_6_127V)
        {
          velocidade_histerese = VELOCIDADE6;
          barra_velocidade = VELOCIDADE6;
        }
      }
    }
  }
  
  //Se for para motor com tensão de 220V
  if (tensao_placa == 220)
  {
    if(velocidade_histerese == VELOCIDADE3)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE >= TRANSICAO_1_TO_6_220V)
        {
          velocidade_histerese = VELOCIDADE6;
          barra_velocidade = VELOCIDADE6;
        }
      }
    }
    
    else if(velocidade_histerese == VELOCIDADE6)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE >= TRANSICAO_6_TO_12_220V)
        {
          velocidade_histerese = VELOCIDADE12;
          barra_velocidade = VELOCIDADE12;
        }
        else if(ADC_CORRENTE <= TRANSICAO_6_TO_1_220V)
        {
          velocidade_histerese = VELOCIDADE3;
          barra_velocidade = VELOCIDADE3;
        }
      }
    }
    
    else if(velocidade_histerese == VELOCIDADE12)
    {
      if (!cont_tmr_histerese)
      {
        cont_tmr_histerese = 500;
        if(ADC_CORRENTE <= TRANSICAO_12_TO_6_220V)
        {
          velocidade_histerese = VELOCIDADE6;
          barra_velocidade = VELOCIDADE6;
        }
      }
    }
  }
}
/************************************************************************/

/************************************************************************/
/*            Função: reseta_variaveis                                  */
/* Descrição: reseta variáveis das funções especiais                    */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void reseta_variaveis(void)
{
  flag_tmr_max = 0;
  cont_tmr_max_seg = 0;
  
  flag_tmr_protection = 0;
  cont_tmr_protection = 0;
  cont_tmr_protection_seg = 0;
  
  flag_smooth = 0;
  tmr_smooth_seg = 0;
  number_ice_crush = 0;
  flag_ice_crush = 0;
    
  flag_smooth = 0;
  state_smooth = SMOOTH_END;
  
  
  flag_rec_learning = 0;
  flag_tmr_learning = 0;
  cont_tmr_learning_seg = 0;
  cont_tmr_learning_seg_total = 0;
  cont_tmr_learning = 0;
  step_rec_learning = 0;
  
  barra_velocidade = 0;
  barra_velocidade_anterior = 0;
  
  flag_tmr_mix = 0;
  cont_tmr_mix = 0;
  
}
/************************************************************************/

/************************************************************************/
/*            Função: rec_learning                                      */
/* Descrição: Verifica e executa a gravação das velocidades da função   */
/* learning                                                             */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void rec_learning(void)
{
  current_position = calc_position();
  if(current_position != before_position)
  {
    flag_tmr_mix = 0;                                                           //Assim que mudar a chave, pára a função mix.
    cont_tmr_mix = 0;
    before_position = current_position;
    flag_alterou_velocidade = 1;
    time_to_gate = matriz[0][current_position];
  }
  
  if(flag_alterou_velocidade)
  {
    flag_alterou_velocidade = 0;
    debounce_transition_learning = 500;
  }
  if(grava_posicao)
  {
    grava_posicao = 0;
    if(step_rec_learning >= 35)
    {
      step_rec_learning = 35;                                                   //Limita em 36 alterações de posição
    }
    barra_velocidade = current_position;
    
    vetor_learning[step_rec_learning] = cont_tmr_learning_seg;                  //Tempo
    //FLASH_ProgramByte(EEPROM_OFFSET + step_rec_learning, cont_tmr_learning_seg);
    cont_tmr_learning_seg = 0;
    step_rec_learning++;
    vetor_learning[step_rec_learning + 37] = current_position;                  //Posição
    //FLASH_ProgramByte(EEPROM_OFFSET + (step_rec_learning + 37),current_position);
  }  
}
/************************************************************************/

/************************************************************************/
/*            Função: execute_learning                                  */
/* Descrição: Faz as tratativas da execução da função learning          */
/* learning                                                             */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void execute_learning(void)
{
  if ((vetor_learning[step_execute_learning] != 0xAA) && (cont_tmr_learning_seg_total <= 90))
  {
    if(cont_tmr_learning_seg == ((vetor_learning[step_execute_learning])))
    {
      time_to_gate = matriz[0][(vetor_learning[step_execute_learning + 38])];
      step_execute_learning++;
      cont_tmr_learning_seg = 0;
      flag_alterou_velocidade = 1;
    }
  }
  else
  {
    reseta_variaveis();
    atualiza_barra(VELOCIDADE0);
    //Uso o proprio END_REC_LEARNING pq ele só vai escrever "FIM" na tela, desarmar o relé e depois ir para a o estado DESLIGADO.
    executing = END_REC_LEARNING;
  }
}
/************************************************************************/

/**************************************************************************/
/*            Função: atualiza_display                                    */
/* Descrição: Atualiz a escrita nodisplay de acordo com a posiçãoda chave */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void atualiza_display(void)
{
  /*
  if(executing == VELOCIDADES)                                                  //Se está executando velocidades normais (pela posiçãoda chave)
  {
    if(before_executing != executing)                                           //Se não estava executando velocidades normais anteriormente
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
    }
    if (flag_alterou_velocidade)                                                //Se achave mudou de posição (velocidade)
    {
      flag_alterou_velocidade = 0;
      buffer_lcd[0] = ((current_position / 10)) + 0x30;
      buffer_lcd[1] = ((char)current_position + 0x30) - ((buffer_lcd[0] - 0x30) * 10);
      //Oled_SetFont(Segment_25x40,25,40,46,58);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text((char*)(buffer_lcd), 80, LINHA_ESCRITA);
      
      atualiza_barra(barra_velocidade);                                         //muda a barra de velocidade para de acordo com a velocidade atual
    }
  }
*/
  
  if(executing == STATE_VELOCIDADE0)
  {
    if(before_executing != executing)                                           //Se não estava executando velocidades normais anteriormente
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_Image(Logo);
    }
  }
  else if(executing == STATE_VELOCIDADE1)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE1) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"01", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE1);
    }
  }
  else if(executing == STATE_VELOCIDADE2)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE2) 
    {
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      before_executing = executing;
      Oled_Text((char*)"02", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE2);
    }
  }
  else if(executing == STATE_VELOCIDADE3)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE3) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"03", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE3);
    }
  }
  else if(executing == STATE_VELOCIDADE4)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE4) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"04", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE4);
    }
  }
  else if(executing == STATE_VELOCIDADE5)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE5) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"05", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE5);
    }
  }
  else if(executing == STATE_VELOCIDADE6)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE6) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"06", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE6);
    }
  }
  else if(executing == STATE_VELOCIDADE7)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE7) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"07", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE7);
    }
  }
  else if(executing == STATE_VELOCIDADE8)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE8) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"08", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE8);
    }
  }
  else if(executing == STATE_VELOCIDADE9)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE9) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"09", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE9);
    }
  }
  else if(executing == STATE_VELOCIDADE10)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE10) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"10", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE10);
    }
  }
  else if(executing == STATE_VELOCIDADE11)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE11) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"11", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE11);
    }
  }
  else if(executing == STATE_VELOCIDADE12)
  {
    if((before_executing != (STATE_VELOCIDADE1)) && (before_executing != (STATE_VELOCIDADE2)) && (before_executing != (STATE_VELOCIDADE3))
       && (before_executing != (STATE_VELOCIDADE4)) && (before_executing != (STATE_VELOCIDADE5)) && (before_executing != (STATE_VELOCIDADE6)) && (before_executing != (STATE_VELOCIDADE7))
         && (before_executing != (STATE_VELOCIDADE8)) && (before_executing != (STATE_VELOCIDADE9)) && (before_executing != (STATE_VELOCIDADE10)) && (before_executing != (STATE_VELOCIDADE11))
           && (before_executing != (STATE_VELOCIDADE12)))                                       
    {
      Oled_FillScreen(0x00);
      Oled_Image(velocidade);
    }
    if(before_executing != STATE_VELOCIDADE12) 
    {
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
      Oled_Text((char*)"12", 80, LINHA_ESCRITA);
      atualiza_barra(VELOCIDADE12);
    }
  }
  else if (executing == QUEBRA_GELO)                                            //Se está executando função de quebra gelo
  {
    if(before_executing != executing)                                           //Se não estava executando quebra gelo antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_Image(ice);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      //Oled_ConstText("LIG", COLUNA_ESCRITA, LINHA_ESCRITA);
    }
    if((barra_velocidade != barra_velocidade_anterior))
    {
      barra_velocidade_anterior = barra_velocidade;
      buffer_lcd[0] = (((Quantidade_Pulsos_Quebra_Gelo - number_ice_crush) / 10)) + 0x30;
      buffer_lcd[1] = ((char)(Quantidade_Pulsos_Quebra_Gelo - number_ice_crush) + 0x30) - ((buffer_lcd[0] - 0x30) * 10);
      //Oled_SetFont(Segment_25x40,25,40,46,58);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text((char*)(buffer_lcd), 80, LINHA_ESCRITA);
      atualiza_barra(barra_velocidade);
    }
    
  }
  else if (executing == SMOOTH)                                                 //Se está executando função smooth
  {
    if(before_executing != executing)                                           //Se não estava na função smooth antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_Image(smoothie);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      //Oled_ConstText("LIG", COLUNA_ESCRITA, LINHA_ESCRITA);
      cont_tmr_max_seg_change = cont_tmr_max_seg;
      buffer_lcd[0] = (((Tempo_Total_Funcao_Espuma - tmr_smooth_seg) / 10)) + 0x30;
      buffer_lcd[1] = ((char)(Tempo_Total_Funcao_Espuma - tmr_smooth_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
      Oled_Text((char*)(buffer_lcd),COLUNA_ESCRITA,LINHA_ESCRITA);
    }

    else
    {
      if(cont_tmr_max_seg_change != tmr_smooth_seg)                           //Cai aqui uma vez por segundo para não ficar atualizando o display toda hora
      {                                                                         //Caso contrário, não vai conseguir ler o botão pressionado corretamente                                
        cont_tmr_max_seg_change = tmr_smooth_seg;
        buffer_lcd[0] = (((Tempo_Total_Funcao_Espuma - tmr_smooth_seg) / 10)) + 0x30;
        buffer_lcd[1] = ((char)(Tempo_Total_Funcao_Espuma - tmr_smooth_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
        Oled_Text((char*)(buffer_lcd),COLUNA_ESCRITA,LINHA_ESCRITA);
      }
    }

   
      //barra_velocidade = 10 - ((tmr_smooth_seg * 10) / Tempo_Total_Funcao_Espuma);
      if((barra_velocidade != barra_velocidade_anterior))
      {
        barra_velocidade_anterior = barra_velocidade;
        atualiza_barra(barra_velocidade);
      }


  }
  else if (executing == TIMMER)                                                 //Se está executando a função de timmer
  {
    if(before_executing != executing)                                           //Se não estava na função timmer antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);      
      Oled_ConstText("TEMPO: ", 10, 5);
      cont_tmr_max_seg_change = cont_tmr_max_seg;
      buffer_lcd[0] = (((Tempo_Timer_Velocidade_Maxima - cont_tmr_max_seg) / 10)) + 0x30;
      buffer_lcd[1] = ((char)(Tempo_Timer_Velocidade_Maxima - cont_tmr_max_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
      Oled_Text((char*)(buffer_lcd),90,5);
    }
    else
    {
      if(cont_tmr_max_seg_change != cont_tmr_max_seg)                           //Cai aqui uma vezpor segundo para não ficar atualizando o display toda hora
      {                                                                         //Caso contrário, não vai conseguir ler o botão pressionado corretamente                                
        cont_tmr_max_seg_change = cont_tmr_max_seg;
        buffer_lcd[0] = (((Tempo_Timer_Velocidade_Maxima - cont_tmr_max_seg) / 10)) + 0x30;
        buffer_lcd[1] = ((char)(Tempo_Timer_Velocidade_Maxima - cont_tmr_max_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
        Oled_Text((char*)(buffer_lcd),90,5);
      }
      
    }
  }
  else if (executing == SMART)                                                  //Se está executando a função de velocidade inteligente
  {
    if(before_executing != executing)                                           //Se não estava executando a velocidade inteligente antes...
    {   
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_Image(cake);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      //Oled_ConstText("LIG", COLUNA_ESCRITA, LINHA_ESCRITA);

    }
    if(barra_velocidade != barra_velocidade_anterior)
    {
      barra_velocidade_anterior = barra_velocidade;
      atualiza_barra(barra_velocidade);                                         //Mostra na barra de potência a velocidade que está no momento...
    }                                
  } 
  else if (executing == REC_LEARNING)                                           //Se está executando a função de velocidade inteligente
  {
    if(before_executing != executing)                                           //Se não estava executando a velocidade inteligente antes...
    {   
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_ConstText("REC", COLUNA_ESCRITA, LINHA_ESCRITA);
    }
    if(barra_velocidade != barra_velocidade_anterior)
    {
      barra_velocidade_anterior = barra_velocidade;
      atualiza_barra(barra_velocidade);
    }
  } 
  else if (executing == END_REC_LEARNING)                                       //Se terminou de gravar a velocidade
  {
    if(before_executing != executing)                                           
    {   
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_ConstText("FIM", COLUNA_ESCRITA, LINHA_ESCRITA);
      GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, RESET);
      Delay_ms(500);
      GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, SET);
      Delay_ms(1000);
      executing = DESLIGADO;
    }
  }
  else if (executing == EXECUTE_LEARNING)                                       //Se está executando a função de learning
  {
    if(before_executing != executing)                                           
    {   
      before_executing = executing;
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text("00", COLUNA_ESCRITA, LINHA_ESCRITA);
    }
    if (flag_alterou_velocidade)                                                //Se achave mudou de posição (velocidade)
    {
      unsigned char temp1 = (vetor_learning[step_execute_learning + 37]);
      if (temp1 >= 100) temp1 = 0;
      flag_alterou_velocidade = 0;
      buffer_lcd[0] = ((temp1 / 10)) + 0x30;
      buffer_lcd[1] = ((char)temp1 + 0x30) - ((buffer_lcd[0] - 0x30) * 10);
      atualiza_barra(temp1);                                                     //muda a barra de velocidade para de acordo com a velocidade atual
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text((buffer_lcd), COLUNA_ESCRITA, LINHA_ESCRITA);
    }
  }
  else if (executing == DESLIGADO)                                              //Se está na função de desligado
  {
    if(before_executing != executing)                                           //Se não estava desligado antes...
    {
      GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, RESET);
      Delay_ms(500);
      GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, SET);
      before_executing = executing;
      atualiza_barra(0);                                                        //Apaga a barra de velocidade
      Oled_FillScreen(0x00);
      Oled_Image(RETORNE_PARA_0);
      reseta_variaveis();
    }
  }
  else if(executing == PROTECAO_MOTOR)                                          //Se entrou na proteção de sobrecorrente
  {
    if(before_executing != executing)                                           //Se não estava na função timmer antes...
    {
      before_executing = executing;
      Oled_Image(alerta);
      Oled_SetFont(Font_6x8, 6, 8, 32, 127);
      Oled_ConstText("SOBRECARGA DETECTADA ", 9, 5);
      Oled_ConstText("AGUARDE    SEGUNDOS ", 11, 7);
      //Oled_ConstText("UTILIZADA", 39, 7);
      cont_tmr_max_protection_change = cont_tmr_protection_seg;
      buffer_lcd[0] = (((Tempo_Protecao_Travamento - cont_tmr_protection_seg) / 10)) + 0x30;
      buffer_lcd[1] = ((char)(Tempo_Protecao_Travamento - cont_tmr_protection_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
      Oled_Text((char*)(buffer_lcd),60,7);
    }
    
    if(cont_tmr_max_protection_change != cont_tmr_protection_seg)                           //Cai aqui uma vezpor segundo para não ficar atualizando o display toda hora
    {                                                                         //Caso contrário, não vai conseguir ler o botão pressionado corretamente                                
      cont_tmr_max_protection_change = cont_tmr_protection_seg;
      buffer_lcd[0] = (((Tempo_Protecao_Travamento - cont_tmr_protection_seg) / 10)) + 0x30;
      buffer_lcd[1] = ((char)(Tempo_Protecao_Travamento - cont_tmr_protection_seg + 0x30)) - ((buffer_lcd[0] - 0x30) * 10);
      Oled_Text((char*)(buffer_lcd),60,7);
    }
  }
  else if(executing == STATE_MIX)                                               //Se entrou na função mix
  {
    if(before_executing != STATE_MIX)                                           //Se não estava na função timmer antes...
    {
      Oled_FillScreen(0x00);
      Oled_SetFont(Font_6x8, 6, 8, 32, 127);
      Oled_ConstText("FUNCAO MIX ", 22, 3);
    }
    
  }
}
/**************************************************************************/

/**************************************************************************/
/*            Função: atualiza_barra                                      */
/* Descrição: Atualiza barra de potência de acordo com a posição da chave */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void atualiza_barra(unsigned char velocidade)
{
  
  if     (velocidade == 0)Oled_Icon(barra_0,110,0,16,64);
  else if(velocidade == 1)Oled_Icon(barra_1,110,0,16,64);
  else if(velocidade == 2)Oled_Icon(barra_2,110,0,16,64);
  else if(velocidade == 3)Oled_Icon(barra_3,110,0,16,64);
  else if(velocidade == 4)Oled_Icon(barra_4,110,0,16,64);
  else if(velocidade == 5)Oled_Icon(barra_5,110,0,16,64);
  else if(velocidade == 6)Oled_Icon(barra_6,110,0,16,64);
  else if(velocidade == 7)Oled_Icon(barra_7,110,0,16,64);
  else if(velocidade == 8)Oled_Icon(barra_8,110,0,16,64);
  else if(velocidade == 9)Oled_Icon(barra_9,110,0,16,64);
  else if(velocidade == 10)Oled_Icon(barra_10,110,0,16,64);
  else if(velocidade == 11)Oled_Icon(barra_11,110,0,16,64);
  else if(velocidade == 12)Oled_Icon(barra_12,110,0,16,64);
  
}
/**************************************************************************/

/**************************************************************************/
/*            Função: atualiza_barra_tempo                                */
/* Descrição: Atualiza barra de tempo                                     */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void atualiza_barra_tempo(unsigned char tempo)
{
  /*
  if     (tempo == 0)Oled_Icon(tempo_0,107,0,16,64);
  else if(tempo == 1)Oled_Icon(tempo_1,107,0,16,64);
  else if(tempo == 2)Oled_Icon(tempo_2,107,0,16,64);
  else if(tempo == 3)Oled_Icon(tempo_3,107,0,16,64);
  else if(tempo == 4)Oled_Icon(tempo_4,107,0,16,64);
  else if(tempo == 5)Oled_Icon(tempo_5,107,0,16,64);
  else if(tempo == 6)Oled_Icon(tempo_6,107,0,16,64);
  else if(tempo == 7)Oled_Icon(tempo_7,107,0,16,64);
  else if(tempo == 8)Oled_Icon(tempo_8,107,0,16,64);
  else if(tempo == 9)Oled_Icon(tempo_9,107,0,16,64);
  else if(tempo == 10)Oled_Icon(tempo_10,107,0,16,64);
  else if(tempo == 11)Oled_Icon(tempo_11,107,0,16,64);
  else if(tempo == 12)Oled_Icon(tempo_12,107,0,16,64);
  */
}
/**************************************************************************/

/**************************************************************************/
/*            Função: protecao_travamento                                 */
/* Descrição: Inibe o funcionamento do motor caso ele atinja a corrente   */
/* máxima de funcionamento                                                */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void protecao_travamento(void)
{
  if (state_protection == TIMEOUT)
  {
    GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, RESET);
    flag_tmr_protection = 1;
    time_to_gate = matriz[0][0];
    if(cont_tmr_protection_seg == Tempo_Protecao_Travamento)
    {
      flag_tmr_protection = 0;
      cont_tmr_protection = 0;
      cont_tmr_protection_seg = 0;
      cont_tmr_max_protection_change = 0;
      Oled_Image(alerta);
      Oled_SetFont(Font_6x8, 6, 8, 32, 127);
      Oled_ConstText("RETORNE PARA A ", 22, 5);
      Oled_ConstText("POSICAO INICIAL", 22, 7);
      state_protection = WAIT_RETURN_TO_ZERO;
    }
  }
  if(state_protection == WAIT_RETURN_TO_ZERO)
  {
    current_position = calc_position();
    if(current_position == VELOCIDADE0)
    {
      GPIO_WriteBit(LED_DEBUG_GPIO_Port, LED_DEBUG_Pin, SET);
      state_protection = PROTECTION_OFF;
      executing = DESLIGADO;
      Oled_FillScreen(0x00);
      flag_tmr_protection = 0;
      cont_tmr_protection = 0;
      cont_tmr_protection_seg = 0;
      //executing = VELOCIDADES;
      barra_velocidade = current_position;
    }
  }
}

/**************************************************************************/
/*            Função: desligado                                           */
/* Descrição: Desliga motor completamente e só volta a ligar após         */
/* voltar par a posição zero                                              */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void desligado(void)
{
  time_to_gate = matriz[0][0];
  current_position = calc_position();
  if(current_position == VELOCIDADE0)
  {
    executing = STATE_VELOCIDADE0;
  }
}

/**************************************************************************/
/*            Função: mix_function                                        */
/* Descrição: Desliga motor completamente e só volta a ligar após         */
/* voltar par a posição zero                                              */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void mix_function(void)
{
  current_position = calc_position();
  if(current_position != before_position)
  {
    reseta_variaveis();
    before_position = current_position;
    executing = current_position;
    debounce_transition_vel = DEBOUNCE_ROTACAO;
    flag_alterou_velocidade = 1;
    Oled_SetFont(Terminal12x16, 12, 16, 32, 127);
    
  }
  if(before_executing != STATE_MIX)
  {
    before_executing = STATE_MIX;
    flag_tmr_mix = 10;
  }
  
    
}

#endif


#ifdef FW_TESTE
#include <stdio.h>

extern char buffer[3];


unsigned short int cont_tmr_mostra_corrente;
unsigned short int mascara_bits_velocidade;
unsigned short int mascara_bits_corrente;
extern unsigned char jumper_solda;
/************************************************************/
/*            Função: read_function                         */
/* Descrição: Faz leitura da posição da chave               */
/* Entrada:                                                 */
/* Saída:                                                   */
/************************************************************/
void read_function(void)
{
  current_position = calc_position();  
  if (current_position != before_position)                              //Se mudou a chave de posição...
  {
    if(!flag_rec_learning && (executing != PROTECAO_MOTOR))
    {
      executing = VELOCIDADES;                                          //Muda status de execução para execução das velocidades
    }
    before_position = current_position;                                 //Atualiza valor da posição para a proxima leitura      
    flag_alterou_velocidade = 1;
    debounce_transition_vel = 30;
  }
  else
  {
    executing = executing;                                              //Se não mudou a chave deposição...continua fazendo o que estava fazendo
  }
  //atualiza_display();
}
/************************************************************/

/************************************************************************/
/*            Função: execute_function                                  */
/* Descrição: Executa a velocidade de acordo com a posição da chave     */
/* ou executa a velocidade de acordo com a função escolhida por BT      */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void execute_function(void)
{
  if(executing == VELOCIDADES)
  {
    if(!debounce_transition_vel)
    {
      time_to_gate = matriz[0][current_position];
      barra_velocidade = current_position;
      
      if (ADC_CORRENTE <= 0.29)
      {
        ADC_CORRENTE = 0.0;
      }
      
      if(!cont_tmr_mostra_corrente)
      {
        if(TENSAO_FASE == 127)
        {
          if     ( current_position == 0)   mascara_bits_corrente = 0;
          else if ( current_position == 1 && ADC_CORRENTE >= 3 && ADC_CORRENTE <= 5)    mascara_bits_corrente   |= 1;
          else if ( current_position == 12 && ADC_CORRENTE >= 5.8 && ADC_CORRENTE <= 8) mascara_bits_corrente   |= 2;
        }
        
        if(TENSAO_FASE == 220)
        {
          if     ( current_position == 0)   mascara_bits_corrente = 0;
          else if ( current_position == 1 && ADC_CORRENTE >= 1.8 && ADC_CORRENTE <= 2.8)    mascara_bits_corrente   |= 1;
          else if ( current_position == 12 && ADC_CORRENTE >= 2.8 && ADC_CORRENTE <= 4.5) mascara_bits_corrente   |= 2;
        }    
        
        
        cont_tmr_mostra_corrente = 300;
        sprintf(buffer,"%f",ADC_CORRENTE);
        Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
        if(mascara_bits_corrente != 3) Oled_Text((buffer), 80, 3);
        else Oled_Text("  OK", 80,3);
        
        cont_tmr_mostra_corrente = 300;
        sprintf(buffer,"%d",TENSAO_FASE);
        Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
        Oled_Text((buffer), 85, 6);
        
      }
      
      if     ( current_position == 0)   mascara_bits_velocidade = 0;
      else if( current_position == 1)   mascara_bits_velocidade |= 1;
      else if( current_position == 2)   mascara_bits_velocidade |= 2;
      else if( current_position == 3)   mascara_bits_velocidade |= 4;
      else if( current_position == 4)   mascara_bits_velocidade |= 8;
      else if( current_position == 5)   mascara_bits_velocidade |= 16;
      else if( current_position == 6)   mascara_bits_velocidade |= 32;
      else if( current_position == 7)   mascara_bits_velocidade |= 64;
      else if( current_position == 8)   mascara_bits_velocidade |= 128;
      else if( current_position == 9)   mascara_bits_velocidade |= 256;
      else if( current_position == 10)   mascara_bits_velocidade |= 512;
      else if( current_position == 11)   mascara_bits_velocidade |= 1024;
      else if( current_position == 12)   mascara_bits_velocidade |= 2048;
    }
  }
  if(executing == QUEBRA_GELO)
  {
    //flag_ice_crush = 1;
  }
  if(executing == SMOOTH)
  {
    //smooth();
  }
  if(executing == TIMMER)
  {
    //timmer_max();
  }
  if(executing == REC_LEARNING)
  {
    //rec_learning();
  }
  if(executing == END_REC_LEARNING)
  {
    //time_to_gate = matriz[0][0];
  }
  if (executing == EXECUTE_LEARNING)
  {
    //execute_learning();
  }
  if(executing == SMART)
  {
    //smart_function_hysteresis();
  }
  if (executing == DESLIGADO)
  {
      time_to_gate = matriz[0][0];
      if (ADC_CORRENTE <= 0.29)
      {
        ADC_CORRENTE = 0.0;
      }
  }
  
}
/************************************************************************/

/************************************************************************/
/*            Função: calc_position                                     */
/* Descrição: Faz o calculo de qual posição a chave está de acordo com  */
/* o valor lido no ADC                                                  */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
unsigned char calc_position(void)
{
  unsigned char position;
  if (ADC_STEP < 79)                             //15 -> Posição 12 da chave
  {                                             //Velocidade 6  
    position = 12;
  }
  else if (ADC_STEP > 80 && ADC_STEP < 200)    //155 -> Posição 11 da chave
  {                                             //Velocidade 5
    position = 11;
  }
  else if (ADC_STEP > 201 && ADC_STEP < 349)    //304 -> Posição 10 da chave   273
  {                                             //Velocidade 4
    position = 10;
  }
  else if (ADC_STEP > 350 && ADC_STEP < 499)    //411 -> Posição 9 da chave
  {                                       //Velocidade 3                        
    position = 9;
  }
  else if (ADC_STEP > 500 && ADC_STEP < 629)    //552 -> Posição 8 da chave
  {                                       //Velocidade 2
    position = 8;
  }
  else if (ADC_STEP > 630 && ADC_STEP < 729)    //701 -> Posição 7 da chave
  {                                       //Velocidade 1
    position = 7;
  }
  else if (ADC_STEP > 720 && ADC_STEP < 790)    //782 -> Posição 6 da chave
  {
    position = 6;     
  }
  else if (ADC_STEP > 791 && ADC_STEP < 850)    //840 -> Posição 5 da chave
  {
    position = 5;
  }
  else if (ADC_STEP > 851 && ADC_STEP < 960)    //908 -> Posição 4 da chave
  {
    position = 4;
  }
  else if (ADC_STEP > 921 && ADC_STEP < 980)    //956 -> Posição 3 da chave
  {
    position = 3;
  }
  else if (ADC_STEP > 981 && ADC_STEP < 999)    //979 -> Posição 2 da chave
  {
    position = 2;
  }
  else if (ADC_STEP > 1000 && ADC_STEP < 1009)    //956 -> Posição 1 da chave
  {
    position = 1;
  }
  else if ((ADC_STEP > 1010))    //1023 -> Posição 0 da chave
  {
    position = 0;
    debounce_transition_vel = 0;
  }
      
  return position;

}
/************************************************************************/

/********************************************************************************/
/*            Função: smooth                                                    */
/* Descrição: Execução da função smooth, fazendo a rampa para o milkshake       */
/* Entrada:                                                                     */
/* Saída:                                                                       */
/********************************************************************************/
void smooth(void)
{
  if(state_smooth == ICE_CRUSH)
  {
    flag_ice_crush = 1;                                         //Primeira coisa que faz é dar um ICE CRUSH
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL1)
  {
    flag_smooth = 1;                                                            //Inicia o timer par aa função smooth
    time_to_gate = matriz[0][VELOCIDADE1];                                      //Motor na velocidade 1         
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 1) state_smooth = RAMPA_SUBIDA_VEL2;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL2)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE2];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 2) state_smooth = RAMPA_SUBIDA_VEL3;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL3)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE3];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 3) state_smooth = RAMPA_SUBIDA_VEL4;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL4)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE4];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 4) state_smooth = RAMPA_SUBIDA_VEL5;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL5)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE5];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 5) state_smooth = RAMPA_SUBIDA_VEL6;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL6)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE6];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 6) state_smooth = RAMPA_SUBIDA_VEL7;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL7)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE7];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 7) state_smooth = RAMPA_SUBIDA_VEL8;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL8)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE8];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 8) state_smooth = RAMPA_SUBIDA_VEL9;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL9)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE9];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 9) state_smooth = RAMPA_SUBIDA_VEL10;
  }
  else if(state_smooth == RAMPA_SUBIDA_VEL10)
  {
    flag_smooth = 1;
    time_to_gate = matriz[0][VELOCIDADE10];    
    if(tmr_smooth_seg == (Tempo_Total_Rampa_Espuma / 10) * 10) 
    {
      state_smooth = ALTERNADO_BAIXO;
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Baixo_Espuma;
    }
  }
  else if(state_smooth == ALTERNADO_BAIXO)
  {
    time_to_gate = matriz[0][Velocidade_Pulso_Baixo_Espuma];
    if(tmr_smooth_seg == tmr_smooth_alterna)
    {
      state_smooth = ALTERNADO_ALTO;  
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Alto_Espuma;
    }
  }
  else if(state_smooth == ALTERNADO_ALTO)
  {
    time_to_gate = matriz[0][Velocidade_Pulso_Alto_Espuma];
    if(tmr_smooth_seg == tmr_smooth_alterna)
    {
      state_smooth = ALTERNADO_BAIXO;  
      tmr_smooth_alterna = tmr_smooth_seg + Tempo_Pulso_Baixo_Espuma;
    }
  }
  else if (state_smooth == SMOOTH_END)
  {
    executing = DESLIGADO;
  }
  if(tmr_smooth_seg >= Tempo_Total_Funcao_Espuma)
  {
    flag_smooth = 0;
    state_smooth = SMOOTH_END;
    tmr_smooth_seg = 0;
  }
  
}
/************************************************************************/

/********************************************************************************/
/*            Função: timmer_max                                                */
/* Descrição: Execução da função timer, como liquidificador na velocidade max   */
/* Entrada:                                                                     */
/* Saída:                                                                       */
/********************************************************************************/
void timmer_max(void)
{
  flag_tmr_max = 1;
  time_to_gate = matriz[0][VELOCIDADE10];
  if(cont_tmr_max_seg >= Tempo_Timer_Velocidade_Maxima)
  {
    flag_tmr_max = 0;
    cont_tmr_max_seg = 0;
    executing = DESLIGADO;
  }
}
/********************************************************************************/

/************************************************************************/
/*            Função: smart_function_hysteresis                         */
/* Descrição: Execução da função smart, muda a velocidade de acordo com */
/* a carga adicinada no liquidificador                                  */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void smart_function_hysteresis(void)
{
  time_to_gate = matriz[0][velocidade_histerese];
  
  if(velocidade_histerese == VELOCIDADE1)
  {
    if (!cont_tmr_histerese)
    {
      cont_tmr_histerese = 500;
      if(ADC_CORRENTE >= 2)
      {
        velocidade_histerese = VELOCIDADE6;
        barra_velocidade = VELOCIDADE6;
      }
    }
  }
  
  else if(velocidade_histerese == VELOCIDADE6)
  {
    if (!cont_tmr_histerese)
    {
      cont_tmr_histerese = 500;
      if(ADC_CORRENTE >= 3.1)
      {
        velocidade_histerese = VELOCIDADE12;
        barra_velocidade = VELOCIDADE12;
      }
      else if(ADC_CORRENTE <= 1.9)
      {
        velocidade_histerese = VELOCIDADE1;
        barra_velocidade = VELOCIDADE1;
      }
    }
  }
  
  else if(velocidade_histerese == VELOCIDADE12)
  {
    if (!cont_tmr_histerese)
    {
      cont_tmr_histerese = 500;
      if(ADC_CORRENTE <= 3.0)
      {
        velocidade_histerese = VELOCIDADE6;
        barra_velocidade = VELOCIDADE6;
      }
    }
  }
  
  
  
}
/************************************************************************/

/************************************************************************/
/*            Função: reseta_variaveis                                  */
/* Descrição: reseta variáveis das funções especiais                    */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void reseta_variaveis(void)
{
  flag_tmr_max = 0;
  cont_tmr_max_seg = 0;
  flag_smooth = 0;
  tmr_smooth_seg = 0;
  number_ice_crush = 0;
  flag_ice_crush = 0;
    
  flag_smooth = 0;
  state_smooth = SMOOTH_END;
  
  
  flag_rec_learning = 0;
  flag_tmr_learning = 0;
  cont_tmr_learning_seg = 0;
  cont_tmr_learning_seg_total = 0;
  cont_tmr_learning = 0;
  step_rec_learning = 0;
  
  barra_velocidade = 0;
  barra_velocidade_anterior = 0;
  
  
  
  
}
/************************************************************************/

/************************************************************************/
/*            Função: rec_learning                                      */
/* Descrição: Verifica e executa a gravação das velocidades da função   */
/* learning                                                             */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void rec_learning(void)
{
  time_to_gate = matriz[0][current_position];
  if(flag_alterou_velocidade)
  {
    flag_alterou_velocidade = 0;
    debounce_transition_learning = 500;
  }
  if(grava_posicao)
  {
    grava_posicao = 0;
    if(step_rec_learning >= 35)
    {
      step_rec_learning = 35;                                                   //Limita em 36 alterações de posição
    }
    barra_velocidade = current_position;
    
    vetor_learning[step_rec_learning] = cont_tmr_learning_seg;                  //Tempo
    //FLASH_ProgramByte(EEPROM_OFFSET + step_rec_learning, cont_tmr_learning_seg);
    cont_tmr_learning_seg = 0;
    step_rec_learning++;
    vetor_learning[step_rec_learning + 37] = current_position;                  //Posição
    //FLASH_ProgramByte(EEPROM_OFFSET + (step_rec_learning + 37),current_position);
  }  
}
/************************************************************************/

/************************************************************************/
/*            Função: execute_learning                                  */
/* Descrição: Faz as tratativas da execução da função learning          */
/* learning                                                             */
/* Entrada:                                                             */
/* Saída:                                                               */
/************************************************************************/
void execute_learning(void)
{
  if ((vetor_learning[step_execute_learning] != 0xAA) && (cont_tmr_learning_seg_total <= 90))
  {
    if(cont_tmr_learning_seg == ((vetor_learning[step_execute_learning])))
    {
      time_to_gate = matriz[0][(vetor_learning[step_execute_learning + 38])];
      step_execute_learning++;
      cont_tmr_learning_seg = 0;
      flag_alterou_velocidade = 1;
    }
  }
  else
  {
    reseta_variaveis();
    executing = DESLIGADO;
  }
}
/************************************************************************/

/**************************************************************************/
/*            Função: atualiza_display                                    */
/* Descrição: Atualiz a escrita nodisplay de acordo com a posiçãoda chave */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void atualiza_display(void)
{
  if(executing == VELOCIDADES && (!debounce_transition_vel))                                                  //Se está executando velocidades normais (pela posiçãoda chave)
  {
    if(before_executing != executing)                                           //Se não estava executando velocidades normais anteriormente
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      Oled_Text("POSICAO:",0 , 0);
      Oled_Text("CORR.:",0 , 3);
      Oled_Text("TENSAO:",0 , 6);
    }
    if (flag_alterou_velocidade)                                                //Se achave mudou de posição (velocidade)
    {
      flag_alterou_velocidade = 0;
      buffer_lcd[0] = ((current_position / 10)) + 0x30;
      buffer_lcd[1] = ((char)current_position + 0x30) - ((buffer_lcd[0] - 0x30) * 10);
      Oled_SetFont(Terminal12x16, 12, 16, 32, 128);
      
      
      if(mascara_bits_velocidade != 4095)Oled_Text((char*)(buffer_lcd), 100, 0);
      else Oled_Text("OK",100 , 0);
      
      //atualiza_barra(barra_velocidade);                                         //muda a barra de velocidade para de acordo com a velocidade atual
    }
  }
  else if (executing == QUEBRA_GELO)                                            //Se está executando função de quebra gelo
  {
    if(before_executing != executing)                                           //Se não estava executando quebra gelo antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Segment_25x40, 25, 40, 46, 58);
      Oled_Text("1", 50, 0);
      
      verifica_jumper_solda();
      
    }
  }
  else if (executing == SMOOTH)                                                 //Se está executando função smooth
  {
    if(before_executing != executing)                                           //Se não estava na função smooth antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Segment_25x40, 25, 40, 46, 58);
      Oled_Text("2", 50, 0);
      
      verifica_jumper_solda();
    }
  }
  else if (executing == TIMMER)                                                 //Se está executando a função de timmer
  {
    if(before_executing != executing)                                           //Se não estava na função timmer antes...
    {
      before_executing = executing;
      Oled_FillScreen(0x00);
    }
  }
  else if (executing == SMART)                                                  //Se está executando a função de velocidade inteligente
  {
    if(before_executing != executing)                                           //Se não estava executando a velocidade inteligente antes...
    {   
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Segment_25x40, 25, 40, 46, 58);
      Oled_Text("3", 50, 0);
      
      verifica_jumper_solda();
    }                              
  } 
  else if (executing == REC_LEARNING)                                           //Se está executando a função de velocidade inteligente
  {
    if(before_executing != executing)                                           //Se não estava executando a velocidade inteligente antes...
    {   
      before_executing = executing;
      Oled_FillScreen(0x00);
      Oled_SetFont(Segment_25x40, 25, 40, 46, 58);
      Oled_Text("4", 50, 0);
      
      verifica_jumper_solda();
    }
  } 
  else if (executing == END_REC_LEARNING)                                       //Se terminou de gravar a velocidade
  {
    if(before_executing != executing)                                           
    {   
      before_executing = executing;
    }
  }
  else if (executing == EXECUTE_LEARNING)                                       //Se está executando a função de learning
  {
    if(before_executing != executing)                                           
    {   
      before_executing = executing;
    }
  }
  else if (executing == DESLIGADO)                                              //Se está na função de desligado
  {
    if(before_executing != executing)                                           //Se não estava desligado antes...
    {
      before_executing = executing;
      reseta_variaveis();
    }
  }
}
/**************************************************************************/

/**************************************************************************/
/*            Função: atualiza_barra                                      */
/* Descrição: Atualiza barra de potência de acordo com a posição da chave */
/* Entrada:                                                               */
/* Saída:                                                                 */
/**************************************************************************/
void atualiza_barra(unsigned char velocidade)
{
  
  if     (velocidade == 0)Oled_Icon(barra_0,107,0,16,64);
  else if(velocidade == 1)Oled_Icon(barra_1,107,0,16,64);
  else if(velocidade == 2)Oled_Icon(barra_2,107,0,16,64);
  else if(velocidade == 3)Oled_Icon(barra_3,107,0,16,64);
  else if(velocidade == 4)Oled_Icon(barra_4,107,0,16,64);
  else if(velocidade == 5)Oled_Icon(barra_5,107,0,16,64);
  else if(velocidade == 6)Oled_Icon(barra_6,107,0,16,64);
  else if(velocidade == 7)Oled_Icon(barra_7,107,0,16,64);
  else if(velocidade == 8)Oled_Icon(barra_8,107,0,16,64);
  else if(velocidade == 9)Oled_Icon(barra_9,107,0,16,64);
  else if(velocidade == 10)Oled_Icon(barra_10,107,0,16,64);
  else if(velocidade == 11)Oled_Icon(barra_11,107,0,16,64);
  else if(velocidade == 12)Oled_Icon(barra_12,107,0,16,64);
  
}
/**************************************************************************/


void verifica_jumper_solda(void)
{
      if(!jumper_solda)                                                          //Verificação do jumper de solda
      {
        Oled_SetFont(Font_6x8, 6, 8, 32, 128);
        Oled_Text("JUMPER FECHADO",0 , 5);
        if(TENSAO_FASE == 127)
        {
          Oled_Text("JUMPER OK",0 , 7);
        }
        else Oled_Text("JUMPER ERRADO",0 , 7);
      }
      else
      {
        Oled_SetFont(Font_6x8, 6, 8, 32, 128);
        Oled_Text("JUMPER ABERTO",0 , 5);
        if(TENSAO_FASE == 220)
        {
          Oled_Text("JUMPER OK",0 , 7);
        }
        else Oled_Text("JUMPER ERRADO",0 , 7);
      }
}


#endif

