   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 82 void PWR_DeInit(void)
  50                     ; 83 {
  51                     .text:	section	.text,new
  52  0000               f_PWR_DeInit:
  56                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  58  0000 352050b2      	mov	20658,#32
  59                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  61  0004 725f50b3      	clr	20659
  62                     ; 86 }
  65  0008 87            	retf	
 161                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 161                     ; 103 {
 162                     .text:	section	.text,new
 163  0000               f_PWR_PVDLevelConfig:
 165  0000 88            	push	a
 166       00000000      OFST:	set	0
 169                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 171                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 173  0001 c650b2        	ld	a,20658
 174  0004 a4f1          	and	a,#241
 175  0006 c750b2        	ld	20658,a
 176                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 178  0009 c650b2        	ld	a,20658
 179  000c 1a01          	or	a,(OFST+1,sp)
 180  000e c750b2        	ld	20658,a
 181                     ; 113 }
 184  0011 84            	pop	a
 185  0012 87            	retf	
 239                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 239                     ; 122 {
 240                     .text:	section	.text,new
 241  0000               f_PWR_PVDCmd:
 245                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 247                     ; 126   if (NewState != DISABLE)
 249  0000 4d            	tnz	a
 250  0001 2705          	jreq	L111
 251                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 253  0003 721050b2      	bset	20658,#0
 256  0007 87            	retf	
 257  0008               L111:
 258                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 260  0008 721150b2      	bres	20658,#0
 261                     ; 136 }
 264  000c 87            	retf	
 298                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 298                     ; 172 {
 299                     .text:	section	.text,new
 300  0000               f_PWR_FastWakeUpCmd:
 304                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 306                     ; 176   if (NewState != DISABLE)
 308  0000 4d            	tnz	a
 309  0001 2705          	jreq	L331
 310                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 312  0003 721450b3      	bset	20659,#2
 315  0007 87            	retf	
 316  0008               L331:
 317                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 319  0008 721550b3      	bres	20659,#2
 320                     ; 186 }
 323  000c 87            	retf	
 358                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 358                     ; 195 {
 359                     .text:	section	.text,new
 360  0000               f_PWR_UltraLowPowerCmd:
 364                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 366                     ; 199   if (NewState != DISABLE)
 368  0000 4d            	tnz	a
 369  0001 2705          	jreq	L551
 370                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 372  0003 721250b3      	bset	20659,#1
 375  0007 87            	retf	
 376  0008               L551:
 377                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 379  0008 721350b3      	bres	20659,#1
 380                     ; 209 }
 383  000c 87            	retf	
 417                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 417                     ; 233 {
 418                     .text:	section	.text,new
 419  0000               f_PWR_PVDITConfig:
 423                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 425                     ; 237   if (NewState != DISABLE)
 427  0000 4d            	tnz	a
 428  0001 2705          	jreq	L771
 429                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 431  0003 721850b2      	bset	20658,#4
 434  0007 87            	retf	
 435  0008               L771:
 436                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 438  0008 721950b2      	bres	20658,#4
 439                     ; 247 }
 442  000c 87            	retf	
 534                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 534                     ; 262 {
 535                     .text:	section	.text,new
 536  0000               f_PWR_GetFlagStatus:
 538  0000 88            	push	a
 539  0001 88            	push	a
 540       00000001      OFST:	set	1
 543                     ; 263   FlagStatus bitstatus = RESET;
 545                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 547                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 549  0002 a501          	bcp	a,#1
 550  0004 2709          	jreq	L742
 551                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 553  0006 720150b302    	btjf	20659,#0,L152
 554                     ; 272       bitstatus = SET;
 556  000b 2009          	jpf	LC002
 557  000d               L152:
 558                     ; 276       bitstatus = RESET;
 559  000d 200b          	jpf	L752
 560  000f               L742:
 561                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 563  000f c650b2        	ld	a,20658
 564  0012 1502          	bcp	a,(OFST+1,sp)
 565  0014 2704          	jreq	L752
 566                     ; 283       bitstatus = SET;
 568  0016               LC002:
 570  0016 a601          	ld	a,#1
 573  0018 2001          	jra	L552
 574  001a               L752:
 575                     ; 287       bitstatus = RESET;
 578  001a 4f            	clr	a
 580  001b               L552:
 581                     ; 292   return((FlagStatus)bitstatus);
 585  001b 85            	popw	x
 586  001c 87            	retf	
 608                     ; 300 void PWR_PVDClearFlag(void)
 608                     ; 301 {
 609                     .text:	section	.text,new
 610  0000               f_PWR_PVDClearFlag:
 614                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 616  0000 721a50b2      	bset	20658,#5
 617                     ; 304 }
 620  0004 87            	retf	
 669                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 669                     ; 312 {
 670                     .text:	section	.text,new
 671  0000               f_PWR_PVDGetITStatus:
 673  0000 89            	pushw	x
 674       00000002      OFST:	set	2
 677                     ; 313   ITStatus bitstatus = RESET;
 679                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 683                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 685  0001 c650b2        	ld	a,20658
 686  0004 a420          	and	a,#32
 687  0006 6b01          	ld	(OFST-1,sp),a
 689                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 691  0008 c650b2        	ld	a,20658
 692  000b a410          	and	a,#16
 693  000d 6b02          	ld	(OFST+0,sp),a
 695                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 697  000f 7b01          	ld	a,(OFST-1,sp)
 698  0011 2708          	jreq	L513
 700  0013 7b02          	ld	a,(OFST+0,sp)
 701  0015 2704          	jreq	L513
 702                     ; 322     bitstatus = (ITStatus)SET;
 704  0017 a601          	ld	a,#1
 707  0019 2001          	jra	L713
 708  001b               L513:
 709                     ; 326     bitstatus = (ITStatus)RESET;
 711  001b 4f            	clr	a
 713  001c               L713:
 714                     ; 328   return ((ITStatus)bitstatus);
 718  001c 85            	popw	x
 719  001d 87            	retf	
 742                     ; 336 void PWR_PVDClearITPendingBit(void)
 742                     ; 337 {
 743                     .text:	section	.text,new
 744  0000               f_PWR_PVDClearITPendingBit:
 748                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 750  0000 721a50b2      	bset	20658,#5
 751                     ; 340 }
 754  0004 87            	retf	
 766                     	xdef	f_PWR_PVDClearITPendingBit
 767                     	xdef	f_PWR_PVDClearFlag
 768                     	xdef	f_PWR_GetFlagStatus
 769                     	xdef	f_PWR_PVDGetITStatus
 770                     	xdef	f_PWR_PVDITConfig
 771                     	xdef	f_PWR_UltraLowPowerCmd
 772                     	xdef	f_PWR_FastWakeUpCmd
 773                     	xdef	f_PWR_PVDCmd
 774                     	xdef	f_PWR_PVDLevelConfig
 775                     	xdef	f_PWR_DeInit
 794                     	end
