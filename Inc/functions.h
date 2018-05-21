#ifndef _FUNCTIONS_H_
#define	_FUNCTIONS_H_

//#include "stdint.h"


typedef enum
{
  VELOCIDADE0 = 0,
  VELOCIDADE1,
  VELOCIDADE2,
  VELOCIDADE3,
  VELOCIDADE4,
  VELOCIDADE5,
  VELOCIDADE6,
  VELOCIDADE7,
  VELOCIDADE8,
  VELOCIDADE9,
  VELOCIDADE10,
  VELOCIDADE11,
  VELOCIDADE12
}velocidade_atual;

typedef enum 
{
  STATE_VELOCIDADE0 = 0,
  STATE_VELOCIDADE1,
  STATE_VELOCIDADE2,
  STATE_VELOCIDADE3,
  STATE_VELOCIDADE4,
  STATE_VELOCIDADE5,
  STATE_VELOCIDADE6,
  STATE_VELOCIDADE7,
  STATE_VELOCIDADE8,
  STATE_VELOCIDADE9,
  STATE_VELOCIDADE10,
  STATE_VELOCIDADE11,
  STATE_VELOCIDADE12,
  QUEBRA_GELO,
  SMOOTH,
  TIMMER,
  SMART,
  REC_LEARNING,
  END_REC_LEARNING,
  EXECUTE_LEARNING,
  DESLIGADO,
  PROTECAO_MOTOR,
  STATE_MIX,
}states;

enum status_smooth
{
  ICE_CRUSH = 1,
  RAMPA_SUBIDA_VEL1,
  RAMPA_SUBIDA_VEL2,
  RAMPA_SUBIDA_VEL3,
  RAMPA_SUBIDA_VEL4,
  RAMPA_SUBIDA_VEL5,
  RAMPA_SUBIDA_VEL6,
  RAMPA_SUBIDA_VEL7,
  RAMPA_SUBIDA_VEL8,
  RAMPA_SUBIDA_VEL9,
  RAMPA_SUBIDA_VEL10,
  ALTERNADO_ALTO,
  ALTERNADO_BAIXO,
  SMOOTH_END
};

enum status_protection
{
  PROTECTION_OFF = 0,
  TIMEOUT = 1,
  WAIT_RETURN_TO_ZERO
};

#define LINHA_ESCRITA                   0x04
#define COLUNA_ESCRITA                  68
#define DEBOUNCE_TOUCH_VALUE            150     //ms
#define DEBOUNCE_ROTACAO                10      //ms
#define TIMEOUT_TRANSICAO_0_to_1        5000    //ms

#define COM_DISPLAY
//#define SEM_DISPLAY

//#define FW_TESTE
#define FW_PRODUCAO


#define PLACA_127V              0x00

#define EEPROM_OFFSET           0x1000



#define TRANSICAO_1_TO_6_127V   3.5     //440W 3.5
#define TRANSICAO_6_TO_1_127V   4.2     //533W
#define TRANSICAO_6_TO_12_127V  5.4     //685W
#define TRANSICAO_12_TO_6_127V  5.1     //660W

#define TRANSICAO_1_TO_6_220V   2.0     //440W
#define TRANSICAO_6_TO_1_220V   1.9     //418W
#define TRANSICAO_6_TO_12_220V  3.1     //682W
#define TRANSICAO_12_TO_6_220V  3.0     //660W

#define CORRENTE_TRAVAMENTO_127 11.5    
#define CORRENTE_TRAVAMENTO_220 7.0

#define TEMPO_LIGADO_FUNCAO_MIX 100     //ms
#define TEMPO_CICLO_FUNCAO_MIX  1000    //ms



#ifdef FW_PRODUCAO
//Variáveis externas
extern unsigned short int ADC_STEP, ADC_AC;
extern float ADC_CORRENTE;
extern unsigned short int ADC_STEP_BUFFER[17], ADC_CORRENTE_BUFFER[17], ADC_AC_BUFFER[17];
extern unsigned short int ADC_BUFFER[3];
extern unsigned short int time_to_gate;
extern unsigned char flag_ice_crush;
extern unsigned const int matriz[2][15];
extern unsigned char executing, before_executing;
extern unsigned short int cont_tmr_smooth, tmr_smooth_seg;
extern unsigned char flag_smooth, first_time_smooth;
extern unsigned char state_smooth;
extern unsigned char flag_tmr_max;
extern unsigned short int cont_tmr_max, cont_tmr_max_seg;
extern char buffer_lcd [3];
extern unsigned char flag_alterou_velocidade;
extern unsigned char current_position, function, before_position;
extern unsigned short int cont_tmr_histerese; 
extern unsigned char velocidade_histerese;
extern unsigned char flag_tmr_irq;
extern unsigned short int cont_tmr_irq;
extern unsigned char flag_rec_learning, flag_tmr_learning;
extern unsigned char step_rec_learning, grava_posicao, step_execute_learning, flag_salva_eeprom, flag_read_eeprom;
extern unsigned short int cont_tmr_learning, cont_tmr_learning_seg, cont_tmr_learning_seg_total, debounce_transition_learning;
extern unsigned char vetor_learning[75];
extern unsigned char barra_velocidade, barra_velocidade_anterior;
extern unsigned short int cont_debounce_touch;

extern unsigned char number_ice_crush;
extern unsigned char flag_atualiza_adc;
extern unsigned long int temp;
extern unsigned short int cont_tmr_protecao;
extern unsigned char tensao_placa;

extern unsigned short int cont_tmr_protection,cont_tmr_protection_seg;
extern unsigned char flag_tmr_protection, cont_tmr_max_protection_change, state_protection;
extern unsigned short int debounce_transition_vel;

extern unsigned short int cont_tmr_over_current;
extern unsigned char flag_tmr_mix;
extern unsigned short int cont_tmr_mix;



// Protótipo das funções
void read_function(void);
unsigned char calc_position(void);
void execute_function(void);
void smooth(void);
void timmer_max(void);
void reseta_variaveis(void);
void atualiza_display(void);
void smart_function_hysteresis(void);
void rec_learning(void);
void execute_learning(void);
void atualiza_barra(unsigned char velocidade);
void desenha_barra_velocidade(unsigned char velocidade);
void atualiza_barra_tempo(unsigned char tempo);
void protecao_travamento(void);
void desligado(void);
void mix_function(void);

#endif

#ifdef FW_TESTE
//Variáveis externas
extern unsigned short int ADC_STEP, ADC_AC;
extern float ADC_CORRENTE;
extern unsigned short int ADC_STEP_BUFFER[17], ADC_CORRENTE_BUFFER[17], ADC_AC_BUFFER[17];
extern unsigned short int ADC_BUFFER[3];
extern unsigned short int time_to_gate;
extern unsigned char flag_ice_crush;
extern unsigned const int matriz[2][15];
extern unsigned char executing, before_executing;
extern unsigned short int cont_tmr_smooth, tmr_smooth_seg;
extern unsigned char flag_smooth, first_time_smooth;
extern unsigned char state_smooth;
extern unsigned char flag_tmr_max;
extern unsigned short int cont_tmr_max, cont_tmr_max_seg;
extern char buffer_lcd [3];
extern unsigned char current_position, function, before_position;
extern unsigned short int cont_tmr_histerese; 
extern unsigned char velocidade_histerese;
extern unsigned char flag_tmr_irq;
extern unsigned short int cont_tmr_irq;
extern unsigned char flag_rec_learning, flag_tmr_learning;
extern unsigned char step_rec_learning, grava_posicao, step_execute_learning, flag_salva_eeprom, flag_read_eeprom;
extern unsigned short int cont_tmr_learning, cont_tmr_learning_seg, cont_tmr_learning_seg_total, debounce_transition_learning;
extern unsigned char vetor_learning[75];
extern unsigned char barra_velocidade, barra_velocidade_anterior;
extern unsigned short int cont_debounce_touch;

extern unsigned char number_ice_crush;
extern unsigned char flag_atualiza_adc;
extern unsigned long int temp;

extern unsigned short int cont_tmr_mostra_corrente;
extern unsigned short int TENSAO_FASE;
extern unsigned short int debounce_transition_vel;
  
// Protótipo das funções
void read_function(void);
unsigned char calc_position(void);
void execute_function(void);
void smooth(void);
void timmer_max(void);
void reseta_variaveis(void);
void atualiza_display(void);
void smart_function_hysteresis(void);
void rec_learning(void);
void execute_learning(void);
void atualiza_barra(unsigned char velocidade);
void desenha_barra_velocidade(unsigned char velocidade);
void atualiza_tempo(unsigned char tempo);
void verifica_jumper_solda(void);


#endif


#endif