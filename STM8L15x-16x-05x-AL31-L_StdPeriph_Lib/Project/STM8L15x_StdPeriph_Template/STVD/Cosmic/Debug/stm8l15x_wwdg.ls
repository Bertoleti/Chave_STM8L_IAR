   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  66                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  66                     ; 120 {
  67                     .text:	section	.text,new
  68  0000               f_WWDG_Init:
  70  0000 89            	pushw	x
  71       00000000      OFST:	set	0
  74                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  76                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  78  0001 357f50d4      	mov	20692,#127
  79                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  81  0005 9e            	ld	a,xh
  82  0006 aa80          	or	a,#128
  83  0008 c750d3        	ld	20691,a
  84                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  86  000b 7b02          	ld	a,(OFST+2,sp)
  87  000d a47f          	and	a,#127
  88  000f c750d4        	ld	20692,a
  89                     ; 127 }
  92  0012 85            	popw	x
  93  0013 87            	retf	
 134                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 134                     ; 136 {
 135                     .text:	section	.text,new
 136  0000               f_WWDG_SetWindowValue:
 138  0000 88            	push	a
 139       00000001      OFST:	set	1
 142                     ; 137   __IO uint8_t tmpreg = 0;
 144  0001 0f01          	clr	(OFST+0,sp)
 146                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 148                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 150  0003 a47f          	and	a,#127
 151  0005 1a01          	or	a,(OFST+0,sp)
 152  0007 6b01          	ld	(OFST+0,sp),a
 154                     ; 146   WWDG->WR = tmpreg;
 156  0009 7b01          	ld	a,(OFST+0,sp)
 157  000b c750d4        	ld	20692,a
 158                     ; 147 }
 161  000e 84            	pop	a
 162  000f 87            	retf	
 193                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 193                     ; 157 {
 194                     .text:	section	.text,new
 195  0000               f_WWDG_SetCounter:
 199                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 201                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 203  0000 a47f          	and	a,#127
 204  0002 c750d3        	ld	20691,a
 205                     ; 164 }
 208  0005 87            	retf	
 239                     ; 187 void WWDG_Enable(uint8_t Counter)
 239                     ; 188 {
 240                     .text:	section	.text,new
 241  0000               f_WWDG_Enable:
 245                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 247                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 249  0000 aa80          	or	a,#128
 250  0002 c750d3        	ld	20691,a
 251                     ; 192 }
 254  0005 87            	retf	
 276                     ; 216 uint8_t WWDG_GetCounter(void)
 276                     ; 217 {
 277                     .text:	section	.text,new
 278  0000               f_WWDG_GetCounter:
 282                     ; 218   return(WWDG->CR);
 284  0000 c650d3        	ld	a,20691
 287  0003 87            	retf	
 309                     ; 226 void WWDG_SWReset(void)
 309                     ; 227 {
 310                     .text:	section	.text,new
 311  0000               f_WWDG_SWReset:
 315                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 317  0000 358050d3      	mov	20691,#128
 318                     ; 229 }
 321  0004 87            	retf	
 333                     	xdef	f_WWDG_SWReset
 334                     	xdef	f_WWDG_GetCounter
 335                     	xdef	f_WWDG_Enable
 336                     	xdef	f_WWDG_SetCounter
 337                     	xdef	f_WWDG_SetWindowValue
 338                     	xdef	f_WWDG_Init
 357                     	end
