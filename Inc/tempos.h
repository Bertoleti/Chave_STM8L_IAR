#ifndef _TEMPOS_H_
#define	_TEMPOS_H_

// **************** Par�metros da Fun��o Espuma ******************

#define Tempo_Total_Rampa_Espuma        30              //Segundos
#define Tempo_Transicao_Rampa_Espuma    (Tempo_Total_Rampa_Espuma / 10) //Segundos
#define Tempo_Pulso_Alto_Espuma         1               //Segundos
#define Velocidade_Pulso_Alto_Espuma    11              
#define Tempo_Pulso_Baixo_Espuma        2               //Segundos
#define Velocidade_Pulso_Baixo_Espuma   5               
#define Tempo_Total_Funcao_Espuma       55              //Segundos



// ********** Par�metros do Timer na Velocidade Maxima ***********
#define Tempo_Timer_Velocidade_Maxima   10              //Segundos

//Tempo em que inibeo funcionamento do liquidificador ap�s ter dado sobrecarga nele
#define Tempo_Protecao_Travamento       30              //Segundos

// ********** Par�metros da fun��o Quebra Gelo ***********
#define Quantidade_Pulsos_Quebra_Gelo   10              //Quantidade de pulsos que ter� na fun��o


#endif