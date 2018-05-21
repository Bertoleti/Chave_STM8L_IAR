#include "delay.h"
#include "stm8l15x.h"


unsigned int cont_delay;
unsigned char libera_while;

void Delay_us (unsigned short int delay)
{
  //TIM2_CR1_CEN = 1;
  if(delay > 5)delay = delay / 5;
  else delay = 1;
  cont_delay = delay;
  while(cont_delay);
  //TIM2_CR1_CEN = 0;
}


/************************************************************************/
/*            Função: Delay_ms                                          */
/* Descrição: Executa delay contando tempo pela serial                  */
/* Entrada: Valor do delay desejado em ms                               */
/* Saída:                                                               */
/************************************************************************/
void Delay_ms(unsigned short int delay)
{  
unsigned long int x;
  x = 0xFF;
  libera_while = 1;
  cont_delay = delay * 1;

  while(x > 0 || cont_delay)
  {
    if (x <= 2) x = 0;
    else x--;
  }
}
/************************************************************************/


void Delay(void)
{
    unsigned int wt = 0xFFFF;
    while(wt>0)
    {
        wt--;
    }

}