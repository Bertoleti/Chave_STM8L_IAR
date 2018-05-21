   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  85                     ; 129 {
  86                     .text:	section	.text,new
  87  0000               f_IWDG_WriteAccessCmd:
  91                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  93                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 133 }
  99  0003 87            	retf	
 188                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 188                     ; 149 {
 189                     .text:	section	.text,new
 190  0000               f_IWDG_SetPrescaler:
 194                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 196                     ; 152   IWDG->PR = IWDG_Prescaler;
 198  0000 c750e1        	ld	20705,a
 199                     ; 153 }
 202  0003 87            	retf	
 233                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 233                     ; 163 {
 234                     .text:	section	.text,new
 235  0000               f_IWDG_SetReload:
 239                     ; 164   IWDG->RLR = IWDG_Reload;
 241  0000 c750e2        	ld	20706,a
 242                     ; 165 }
 245  0003 87            	retf	
 267                     ; 173 void IWDG_ReloadCounter(void)
 267                     ; 174 {
 268                     .text:	section	.text,new
 269  0000               f_IWDG_ReloadCounter:
 273                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 275  0000 35aa50e0      	mov	20704,#170
 276                     ; 176 }
 279  0004 87            	retf	
 301                     ; 199 void IWDG_Enable(void)
 301                     ; 200 {
 302                     .text:	section	.text,new
 303  0000               f_IWDG_Enable:
 307                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 309  0000 35cc50e0      	mov	20704,#204
 310                     ; 202 }
 313  0004 87            	retf	
 325                     	xdef	f_IWDG_Enable
 326                     	xdef	f_IWDG_ReloadCounter
 327                     	xdef	f_IWDG_SetReload
 328                     	xdef	f_IWDG_SetPrescaler
 329                     	xdef	f_IWDG_WriteAccessCmd
 348                     	end
