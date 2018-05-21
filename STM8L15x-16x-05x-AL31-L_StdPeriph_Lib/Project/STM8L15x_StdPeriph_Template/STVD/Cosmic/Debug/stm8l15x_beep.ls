   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 92 void BEEP_DeInit(void)
  50                     ; 93 {
  51                     .text:	section	.text,new
  52  0000               f_BEEP_DeInit:
  56                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  58  0000 725f50f0      	clr	20720
  59                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  61  0004 351f50f3      	mov	20723,#31
  62                     ; 96 }
  65  0008 87            	retf	
 129                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 129                     ; 106 {
 130                     .text:	section	.text,new
 131  0000               f_BEEP_Init:
 133  0000 88            	push	a
 134       00000000      OFST:	set	0
 137                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 139                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 141  0001 c650f3        	ld	a,20723
 142  0004 a41f          	and	a,#31
 143  0006 a11f          	cp	a,#31
 144  0008 260c          	jrne	L15
 145                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 147  000a c650f3        	ld	a,20723
 148  000d a4e0          	and	a,#224
 149  000f c750f3        	ld	20723,a
 150                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 152  0012 721050f3      	bset	20723,#0
 153  0016               L15:
 154                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 156  0016 c650f3        	ld	a,20723
 157  0019 a43f          	and	a,#63
 158  001b c750f3        	ld	20723,a
 159                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 161  001e c650f3        	ld	a,20723
 162  0021 1a01          	or	a,(OFST+1,sp)
 163  0023 c750f3        	ld	20723,a
 164                     ; 122 }
 167  0026 84            	pop	a
 168  0027 87            	retf	
 222                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 222                     ; 131 {
 223                     .text:	section	.text,new
 224  0000               f_BEEP_Cmd:
 228                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 230                     ; 135   if (NewState != DISABLE)
 232  0000 4d            	tnz	a
 233  0001 2705          	jreq	L101
 234                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 236  0003 721a50f3      	bset	20723,#5
 239  0007 87            	retf	
 240  0008               L101:
 241                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 243  0008 721b50f3      	bres	20723,#5
 244                     ; 145 }
 247  000c 87            	retf	
 282                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 282                     ; 179 {
 283                     .text:	section	.text,new
 284  0000               f_BEEP_LSClockToTIMConnectCmd:
 288                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 290                     ; 183   if (NewState != DISABLE)
 292  0000 4d            	tnz	a
 293  0001 2705          	jreq	L321
 294                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 296  0003 721050f0      	bset	20720,#0
 299  0007 87            	retf	
 300  0008               L321:
 301                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 303  0008 721150f0      	bres	20720,#0
 304                     ; 193 }
 307  000c 87            	retf	
 353                     .const:	section	.text
 354  0000               L61:
 355  0000 000003e8      	dc.l	1000
 356                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 356                     ; 208 {
 357                     .text:	section	.text,new
 358  0000               f_BEEP_LSICalibrationConfig:
 360  0000 5206          	subw	sp,#6
 361       00000006      OFST:	set	6
 364                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 366                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 368  0002 96            	ldw	x,sp
 369  0003 1c000a        	addw	x,#OFST+4
 370  0006 8d000000      	callf	d_ltor
 372  000a ae0000        	ldw	x,#L61
 373  000d 8d000000      	callf	d_ludv
 375  0011 be02          	ldw	x,c_lreg+2
 376  0013 1f03          	ldw	(OFST-3,sp),x
 378                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 380  0015 c650f3        	ld	a,20723
 381  0018 a4e0          	and	a,#224
 382  001a c750f3        	ld	20723,a
 383                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 385  001d 54            	srlw	x
 386  001e 54            	srlw	x
 387  001f 54            	srlw	x
 388  0020 1f05          	ldw	(OFST-1,sp),x
 390                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 392  0022 58            	sllw	x
 393  0023 58            	sllw	x
 394  0024 58            	sllw	x
 395  0025 1f01          	ldw	(OFST-5,sp),x
 397  0027 1e03          	ldw	x,(OFST-3,sp)
 398  0029 72f001        	subw	x,(OFST-5,sp)
 399  002c 1605          	ldw	y,(OFST-1,sp)
 400  002e 9058          	sllw	y
 401  0030 905c          	incw	y
 402  0032 8d000000      	callf	d_imul
 404  0036 1605          	ldw	y,(OFST-1,sp)
 405  0038 9058          	sllw	y
 406  003a 9058          	sllw	y
 407  003c bf00          	ldw	c_x,x
 408  003e 9058          	sllw	y
 409  0040 90b300        	cpw	y,c_x
 410  0043 7b06          	ld	a,(OFST+0,sp)
 411  0045 2504          	jrult	L741
 412                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 414  0047 a002          	sub	a,#2
 416  0049 2001          	jra	L151
 417  004b               L741:
 418                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 420  004b 4a            	dec	a
 421  004c               L151:
 422  004c ca50f3        	or	a,20723
 423  004f c750f3        	ld	20723,a
 424                     ; 231 }
 427  0052 5b06          	addw	sp,#6
 428  0054 87            	retf	
 440                     	xdef	f_BEEP_LSICalibrationConfig
 441                     	xdef	f_BEEP_LSClockToTIMConnectCmd
 442                     	xdef	f_BEEP_Cmd
 443                     	xdef	f_BEEP_Init
 444                     	xdef	f_BEEP_DeInit
 445                     	xref.b	c_lreg
 446                     	xref.b	c_x
 465                     	xref	d_imul
 466                     	xref	d_ludv
 467                     	xref	d_ltor
 468                     	end
