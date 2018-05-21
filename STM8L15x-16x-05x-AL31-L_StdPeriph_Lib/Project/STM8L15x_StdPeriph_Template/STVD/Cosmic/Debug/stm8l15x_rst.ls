   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 131                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 131                     ; 100 {
 132                     .text:	section	.text,new
 133  0000               f_RST_GetFlagStatus:
 137                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 139                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 141  0000 c450b1        	and	a,20657
 142  0003 2702          	jreq	L01
 143  0005 a601          	ld	a,#1
 144  0007               L01:
 147  0007 87            	retf	
 181                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 181                     ; 121 {
 182                     .text:	section	.text,new
 183  0000               f_RST_ClearFlag:
 187                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 189                     ; 125   RST->SR = (uint8_t)RST_Flag;
 191  0000 c750b1        	ld	20657,a
 192                     ; 126 }
 195  0003 87            	retf	
 217                     ; 149 void RST_GPOutputEnable(void)
 217                     ; 150 {
 218                     .text:	section	.text,new
 219  0000               f_RST_GPOutputEnable:
 223                     ; 152   RST->CR = RST_CR_MASK;
 225  0000 35d050b0      	mov	20656,#208
 226                     ; 153 }
 229  0004 87            	retf	
 241                     	xdef	f_RST_GPOutputEnable
 242                     	xdef	f_RST_ClearFlag
 243                     	xdef	f_RST_GetFlagStatus
 262                     	end
