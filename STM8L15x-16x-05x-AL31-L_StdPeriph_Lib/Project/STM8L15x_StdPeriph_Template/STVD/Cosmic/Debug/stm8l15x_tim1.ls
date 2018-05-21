   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 181 void TIM1_DeInit(void)
  50                     ; 182 {
  51                     .text:	section	.text,new
  52  0000               f_TIM1_DeInit:
  56                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  58  0000 725f52b0      	clr	21168
  59                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  61  0004 725f52b1      	clr	21169
  62                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  64  0008 725f52b2      	clr	21170
  65                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  67  000c 725f52b3      	clr	21171
  68                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  70  0010 725f52b5      	clr	21173
  71                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  0014 725f52bd      	clr	21181
  74                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  0018 725f52be      	clr	21182
  77                     ; 193   TIM1->CCMR1 = 0x01;
  79  001c 350152b9      	mov	21177,#1
  80                     ; 194   TIM1->CCMR2 = 0x01;
  82  0020 350152ba      	mov	21178,#1
  83                     ; 195   TIM1->CCMR3 = 0x01;
  85  0024 350152bb      	mov	21179,#1
  86                     ; 196   TIM1->CCMR4 = 0x01;
  88  0028 350152bc      	mov	21180,#1
  89                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  91  002c 725f52bd      	clr	21181
  92                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  94  0030 725f52be      	clr	21182
  95                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  97  0034 725f52b9      	clr	21177
  98                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 100  0038 725f52ba      	clr	21178
 101                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 103  003c 725f52bb      	clr	21179
 104                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 106  0040 725f52bc      	clr	21180
 107                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 109  0044 725f52bf      	clr	21183
 110                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 112  0048 725f52c0      	clr	21184
 113                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 115  004c 725f52c1      	clr	21185
 116                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 118  0050 725f52c2      	clr	21186
 119                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 121  0054 35ff52c3      	mov	21187,#255
 122                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 124  0058 35ff52c4      	mov	21188,#255
 125                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 127  005c 725f52c6      	clr	21190
 128                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 130  0060 725f52c7      	clr	21191
 131                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 133  0064 725f52c8      	clr	21192
 134                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 136  0068 725f52c9      	clr	21193
 137                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 139  006c 725f52ca      	clr	21194
 140                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 142  0070 725f52cb      	clr	21195
 143                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 145  0074 725f52cc      	clr	21196
 146                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 148  0078 725f52cd      	clr	21197
 149                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 151  007c 725f52d0      	clr	21200
 152                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 154  0080 350152b8      	mov	21176,#1
 155                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 157  0084 725f52cf      	clr	21199
 158                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 160  0088 725f52ce      	clr	21198
 161                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 163  008c 725f52c5      	clr	21189
 164                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 166  0090 725f52b6      	clr	21174
 167                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 169  0094 725f52b7      	clr	21175
 170                     ; 225 }
 173  0098 87            	retf	
 275                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 275                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 275                     ; 243                        uint16_t TIM1_Period,
 275                     ; 244                        uint8_t TIM1_RepetitionCounter)
 275                     ; 245 {
 276                     .text:	section	.text,new
 277  0000               f_TIM1_TimeBaseInit:
 279       fffffffe      OFST: set -2
 282                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 284                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 286  0000 7b05          	ld	a,(OFST+7,sp)
 287  0002 c752c3        	ld	21187,a
 288                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 290  0005 7b06          	ld	a,(OFST+8,sp)
 291  0007 c752c4        	ld	21188,a
 292                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 294  000a 9e            	ld	a,xh
 295  000b c752c1        	ld	21185,a
 296                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 298  000e 9f            	ld	a,xl
 299  000f c752c2        	ld	21186,a
 300                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 300                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 302  0012 c652b0        	ld	a,21168
 303  0015 a48f          	and	a,#143
 304  0017 1a04          	or	a,(OFST+6,sp)
 305  0019 c752b0        	ld	21168,a
 306                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 308  001c 7b07          	ld	a,(OFST+9,sp)
 309  001e c752c5        	ld	21189,a
 310                     ; 265 }
 313  0021 87            	retf	
 377                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 377                     ; 280 {
 378                     .text:	section	.text,new
 379  0000               f_TIM1_PrescalerConfig:
 381       fffffffe      OFST: set -2
 384                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 386                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 388  0000 9e            	ld	a,xh
 389  0001 c752c1        	ld	21185,a
 390                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 392  0004 9f            	ld	a,xl
 393  0005 c752c2        	ld	21186,a
 394                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 396  0008 7b04          	ld	a,(OFST+6,sp)
 397  000a c752b8        	ld	21176,a
 398                     ; 290 }
 401  000d 87            	retf	
 436                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 436                     ; 304 {
 437                     .text:	section	.text,new
 438  0000               f_TIM1_CounterModeConfig:
 440  0000 88            	push	a
 441       00000000      OFST:	set	0
 444                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 446                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 446                     ; 311                         | (uint8_t)TIM1_CounterMode);
 448  0001 c652b0        	ld	a,21168
 449  0004 a48f          	and	a,#143
 450  0006 1a01          	or	a,(OFST+1,sp)
 451  0008 c752b0        	ld	21168,a
 452                     ; 312 }
 455  000b 84            	pop	a
 456  000c 87            	retf	
 487                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 487                     ; 321 {
 488                     .text:	section	.text,new
 489  0000               f_TIM1_SetCounter:
 493                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 495  0000 9e            	ld	a,xh
 496  0001 c752bf        	ld	21183,a
 497                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 499  0004 9f            	ld	a,xl
 500  0005 c752c0        	ld	21184,a
 501                     ; 325 }
 504  0008 87            	retf	
 535                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 535                     ; 334 {
 536                     .text:	section	.text,new
 537  0000               f_TIM1_SetAutoreload:
 541                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 543  0000 9e            	ld	a,xh
 544  0001 c752c3        	ld	21187,a
 545                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 547  0004 9f            	ld	a,xl
 548  0005 c752c4        	ld	21188,a
 549                     ; 338 }
 552  0008 87            	retf	
 597                     ; 345 uint16_t TIM1_GetCounter(void)
 597                     ; 346 {
 598                     .text:	section	.text,new
 599  0000               f_TIM1_GetCounter:
 601  0000 5204          	subw	sp,#4
 602       00000004      OFST:	set	4
 605                     ; 348   uint16_t tmpcntr = 0;
 607                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 611                     ; 351   tmpcntrh = TIM1->CNTRH;
 613  0002 c652bf        	ld	a,21183
 614  0005 6b02          	ld	(OFST-2,sp),a
 616                     ; 352   tmpcntrl = TIM1->CNTRL;
 618  0007 c652c0        	ld	a,21184
 619  000a 6b01          	ld	(OFST-3,sp),a
 621                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 623  000c 5f            	clrw	x
 624  000d 97            	ld	xl,a
 625  000e 1f03          	ldw	(OFST-1,sp),x
 627                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 629  0010 5f            	clrw	x
 630  0011 7b02          	ld	a,(OFST-2,sp)
 631  0013 97            	ld	xl,a
 632  0014 7b04          	ld	a,(OFST+0,sp)
 633  0016 01            	rrwa	x,a
 634  0017 1a03          	or	a,(OFST-1,sp)
 635  0019 01            	rrwa	x,a
 637                     ; 358   return (uint16_t)tmpcntr;
 641  001a 5b04          	addw	sp,#4
 642  001c 87            	retf	
 673                     ; 366 uint16_t TIM1_GetPrescaler(void)
 673                     ; 367 {
 674                     .text:	section	.text,new
 675  0000               f_TIM1_GetPrescaler:
 677  0000 89            	pushw	x
 678       00000002      OFST:	set	2
 681                     ; 368   uint16_t tmpreg = 0;
 683                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 685  0001 c652c1        	ld	a,21185
 686  0004 97            	ld	xl,a
 687  0005 4f            	clr	a
 688  0006 02            	rlwa	x,a
 689  0007 1f01          	ldw	(OFST-1,sp),x
 691                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 693  0009 c652c2        	ld	a,21186
 694  000c 5f            	clrw	x
 695  000d 97            	ld	xl,a
 696  000e 01            	rrwa	x,a
 697  000f 1a02          	or	a,(OFST+0,sp)
 698  0011 01            	rrwa	x,a
 699  0012 1a01          	or	a,(OFST-1,sp)
 700  0014 01            	rrwa	x,a
 703  0015 5b02          	addw	sp,#2
 704  0017 87            	retf	
 759                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 759                     ; 381 {
 760                     .text:	section	.text,new
 761  0000               f_TIM1_UpdateDisableConfig:
 765                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 767                     ; 386   if (NewState != DISABLE)
 769  0000 4d            	tnz	a
 770  0001 2705          	jreq	L352
 771                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 773  0003 721252b0      	bset	21168,#1
 776  0007 87            	retf	
 777  0008               L352:
 778                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 780  0008 721352b0      	bres	21168,#1
 781                     ; 394 }
 784  000c 87            	retf	
 841                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 841                     ; 405 {
 842                     .text:	section	.text,new
 843  0000               f_TIM1_UpdateRequestConfig:
 847                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 849                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 851  0000 4d            	tnz	a
 852  0001 2705          	jreq	L503
 853                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 855  0003 721452b0      	bset	21168,#2
 858  0007 87            	retf	
 859  0008               L503:
 860                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 862  0008 721552b0      	bres	21168,#2
 863                     ; 418 }
 866  000c 87            	retf	
 901                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 901                     ; 427 {
 902                     .text:	section	.text,new
 903  0000               f_TIM1_ARRPreloadConfig:
 907                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 909                     ; 432   if (NewState != DISABLE)
 911  0000 4d            	tnz	a
 912  0001 2705          	jreq	L723
 913                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 915  0003 721e52b0      	bset	21168,#7
 918  0007 87            	retf	
 919  0008               L723:
 920                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 922  0008 721f52b0      	bres	21168,#7
 923                     ; 440 }
 926  000c 87            	retf	
 982                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 982                     ; 451 {
 983                     .text:	section	.text,new
 984  0000               f_TIM1_SelectOnePulseMode:
 988                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 990                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 992  0000 4d            	tnz	a
 993  0001 2705          	jreq	L163
 994                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
 996  0003 721652b0      	bset	21168,#3
 999  0007 87            	retf	
1000  0008               L163:
1001                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1003  0008 721752b0      	bres	21168,#3
1004                     ; 464 }
1007  000c 87            	retf	
1041                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1041                     ; 473 {
1042                     .text:	section	.text,new
1043  0000               f_TIM1_Cmd:
1047                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1049                     ; 478   if (NewState != DISABLE)
1051  0000 4d            	tnz	a
1052  0001 2705          	jreq	L304
1053                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1055  0003 721052b0      	bset	21168,#0
1058  0007 87            	retf	
1059  0008               L304:
1060                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1062  0008 721152b0      	bres	21168,#0
1063                     ; 486 }
1066  000c 87            	retf	
1348                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1348                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1348                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1348                     ; 580                   uint16_t TIM1_Pulse,
1348                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1348                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1348                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1348                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1348                     ; 585 {
1349                     .text:	section	.text,new
1350  0000               f_TIM1_OC1Init:
1352  0000 89            	pushw	x
1353  0001 5203          	subw	sp,#3
1354       00000003      OFST:	set	3
1357                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1359                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1361                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1363                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1365                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1367                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1369                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1371                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1371                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1373  0003 c652bd        	ld	a,21181
1374  0006 a4f0          	and	a,#240
1375  0008 c752bd        	ld	21181,a
1376                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1376                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1376                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1376                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1378  000b 7b0d          	ld	a,(OFST+10,sp)
1379  000d a408          	and	a,#8
1380  000f 6b03          	ld	(OFST+0,sp),a
1382  0011 7b0c          	ld	a,(OFST+9,sp)
1383  0013 a402          	and	a,#2
1384  0015 1a03          	or	a,(OFST+0,sp)
1385  0017 6b02          	ld	(OFST-1,sp),a
1387  0019 7b09          	ld	a,(OFST+6,sp)
1388  001b a404          	and	a,#4
1389  001d 6b01          	ld	(OFST-2,sp),a
1391  001f 9f            	ld	a,xl
1392  0020 a401          	and	a,#1
1393  0022 1a01          	or	a,(OFST-2,sp)
1394  0024 1a02          	or	a,(OFST-1,sp)
1395  0026 ca52bd        	or	a,21181
1396  0029 c752bd        	ld	21181,a
1397                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1397                     ; 608                           | (uint8_t)TIM1_OCMode);
1399  002c c652b9        	ld	a,21177
1400  002f a48f          	and	a,#143
1401  0031 1a04          	or	a,(OFST+1,sp)
1402  0033 c752b9        	ld	21177,a
1403                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1405  0036 c652d0        	ld	a,21200
1406  0039 a4fc          	and	a,#252
1407  003b c752d0        	ld	21200,a
1408                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1408                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1410  003e 7b0f          	ld	a,(OFST+12,sp)
1411  0040 a402          	and	a,#2
1412  0042 6b03          	ld	(OFST+0,sp),a
1414  0044 7b0e          	ld	a,(OFST+11,sp)
1415  0046 a401          	and	a,#1
1416  0048 1a03          	or	a,(OFST+0,sp)
1417  004a ca52d0        	or	a,21200
1418  004d c752d0        	ld	21200,a
1419                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1421  0050 7b0a          	ld	a,(OFST+7,sp)
1422  0052 c752c6        	ld	21190,a
1423                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1425  0055 7b0b          	ld	a,(OFST+8,sp)
1426  0057 c752c7        	ld	21191,a
1427                     ; 619 }
1430  005a 5b05          	addw	sp,#5
1431  005c 87            	retf	
1532                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1532                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1532                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1532                     ; 661                   uint16_t TIM1_Pulse,
1532                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1532                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1532                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1532                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1532                     ; 666 {
1533                     .text:	section	.text,new
1534  0000               f_TIM1_OC2Init:
1536  0000 89            	pushw	x
1537  0001 5203          	subw	sp,#3
1538       00000003      OFST:	set	3
1541                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1543                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1545                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1547                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1549                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1551                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1553                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1555                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1557  0003 c652bd        	ld	a,21181
1558  0006 a40f          	and	a,#15
1559  0008 c752bd        	ld	21181,a
1560                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1560                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1562  000b 7b0d          	ld	a,(OFST+10,sp)
1563  000d a480          	and	a,#128
1564  000f 6b03          	ld	(OFST+0,sp),a
1566  0011 7b0c          	ld	a,(OFST+9,sp)
1567  0013 a420          	and	a,#32
1568  0015 1a03          	or	a,(OFST+0,sp)
1569  0017 6b02          	ld	(OFST-1,sp),a
1571  0019 7b09          	ld	a,(OFST+6,sp)
1572  001b a440          	and	a,#64
1573  001d 6b01          	ld	(OFST-2,sp),a
1575  001f 9f            	ld	a,xl
1576  0020 a410          	and	a,#16
1577  0022 1a01          	or	a,(OFST-2,sp)
1578  0024 1a02          	or	a,(OFST-1,sp)
1579  0026 ca52bd        	or	a,21181
1580  0029 c752bd        	ld	21181,a
1581                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1583  002c c652ba        	ld	a,21178
1584  002f a48f          	and	a,#143
1585  0031 1a04          	or	a,(OFST+1,sp)
1586  0033 c752ba        	ld	21178,a
1587                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1589  0036 c652d0        	ld	a,21200
1590  0039 a4f3          	and	a,#243
1591  003b c752d0        	ld	21200,a
1592                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1594  003e 7b0f          	ld	a,(OFST+12,sp)
1595  0040 a408          	and	a,#8
1596  0042 6b03          	ld	(OFST+0,sp),a
1598  0044 7b0e          	ld	a,(OFST+11,sp)
1599  0046 a404          	and	a,#4
1600  0048 1a03          	or	a,(OFST+0,sp)
1601  004a ca52d0        	or	a,21200
1602  004d c752d0        	ld	21200,a
1603                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1605  0050 7b0a          	ld	a,(OFST+7,sp)
1606  0052 c752c8        	ld	21192,a
1607                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1609  0055 7b0b          	ld	a,(OFST+8,sp)
1610  0057 c752c9        	ld	21193,a
1611                     ; 696 }
1614  005a 5b05          	addw	sp,#5
1615  005c 87            	retf	
1716                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1716                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1716                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1716                     ; 738                   uint16_t TIM1_Pulse,
1716                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1716                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1716                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1716                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1716                     ; 743 {
1717                     .text:	section	.text,new
1718  0000               f_TIM1_OC3Init:
1720  0000 89            	pushw	x
1721  0001 5203          	subw	sp,#3
1722       00000003      OFST:	set	3
1725                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1727                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1729                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1731                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1733                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1735                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1737                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1739                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1741  0003 c652be        	ld	a,21182
1742  0006 a4f0          	and	a,#240
1743  0008 c752be        	ld	21182,a
1744                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1744                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1746  000b 7b0d          	ld	a,(OFST+10,sp)
1747  000d a408          	and	a,#8
1748  000f 6b03          	ld	(OFST+0,sp),a
1750  0011 7b0c          	ld	a,(OFST+9,sp)
1751  0013 a402          	and	a,#2
1752  0015 1a03          	or	a,(OFST+0,sp)
1753  0017 6b02          	ld	(OFST-1,sp),a
1755  0019 7b09          	ld	a,(OFST+6,sp)
1756  001b a404          	and	a,#4
1757  001d 6b01          	ld	(OFST-2,sp),a
1759  001f 9f            	ld	a,xl
1760  0020 a401          	and	a,#1
1761  0022 1a01          	or	a,(OFST-2,sp)
1762  0024 1a02          	or	a,(OFST-1,sp)
1763  0026 ca52be        	or	a,21182
1764  0029 c752be        	ld	21182,a
1765                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1767  002c c652bb        	ld	a,21179
1768  002f a48f          	and	a,#143
1769  0031 1a04          	or	a,(OFST+1,sp)
1770  0033 c752bb        	ld	21179,a
1771                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1773  0036 c652d0        	ld	a,21200
1774  0039 a4cf          	and	a,#207
1775  003b c752d0        	ld	21200,a
1776                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1778  003e 7b0f          	ld	a,(OFST+12,sp)
1779  0040 a420          	and	a,#32
1780  0042 6b03          	ld	(OFST+0,sp),a
1782  0044 7b0e          	ld	a,(OFST+11,sp)
1783  0046 a410          	and	a,#16
1784  0048 1a03          	or	a,(OFST+0,sp)
1785  004a ca52d0        	or	a,21200
1786  004d c752d0        	ld	21200,a
1787                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1789  0050 7b0a          	ld	a,(OFST+7,sp)
1790  0052 c752ca        	ld	21194,a
1791                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1793  0055 7b0b          	ld	a,(OFST+8,sp)
1794  0057 c752cb        	ld	21195,a
1795                     ; 773 }
1798  005a 5b05          	addw	sp,#5
1799  005c 87            	retf	
2003                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2003                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2003                     ; 805                      uint8_t TIM1_DeadTime,
2003                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2003                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2003                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2003                     ; 809 {
2004                     .text:	section	.text,new
2005  0000               f_TIM1_BDTRConfig:
2007  0000 89            	pushw	x
2008  0001 88            	push	a
2009       00000001      OFST:	set	1
2012                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2014                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2016                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2018                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2020                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2022                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2024  0002 7b07          	ld	a,(OFST+6,sp)
2025  0004 c752cf        	ld	21199,a
2026                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2026                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2026                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2028  0007 7b08          	ld	a,(OFST+7,sp)
2029  0009 1a09          	or	a,(OFST+8,sp)
2030  000b 1a0a          	or	a,(OFST+9,sp)
2031  000d 6b01          	ld	(OFST+0,sp),a
2033  000f 9f            	ld	a,xl
2034  0010 1a02          	or	a,(OFST+1,sp)
2035  0012 1a01          	or	a,(OFST+0,sp)
2036  0014 c752ce        	ld	21198,a
2037                     ; 826 }
2040  0017 5b03          	addw	sp,#3
2041  0019 87            	retf	
2076                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2076                     ; 835 {
2077                     .text:	section	.text,new
2078  0000               f_TIM1_CtrlPWMOutputs:
2082                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2084                     ; 841   if (NewState != DISABLE)
2086  0000 4d            	tnz	a
2087  0001 2705          	jreq	L1301
2088                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2090  0003 721e52ce      	bset	21198,#7
2093  0007 87            	retf	
2094  0008               L1301:
2095                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2097  0008 721f52ce      	bres	21198,#7
2098                     ; 849 }
2101  000c 87            	retf	
2179                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2179                     ; 872 {
2180                     .text:	section	.text,new
2181  0000               f_TIM1_SelectOCxM:
2183  0000 89            	pushw	x
2184       00000000      OFST:	set	0
2187                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2189                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2191                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2193  0001 9e            	ld	a,xh
2194  0002 4d            	tnz	a
2195  0003 2610          	jrne	L3701
2196                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2198  0005 721152bd      	bres	21181,#0
2199                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2201  0009 c652b9        	ld	a,21177
2202  000c a48f          	and	a,#143
2203  000e 1a02          	or	a,(OFST+2,sp)
2204  0010 c752b9        	ld	21177,a
2206  0013 2023          	jra	L5701
2207  0015               L3701:
2208                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2210  0015 7b01          	ld	a,(OFST+1,sp)
2211  0017 4a            	dec	a
2212  0018 2610          	jrne	L7701
2213                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2215  001a 721952bd      	bres	21181,#4
2216                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2218  001e c652ba        	ld	a,21178
2219  0021 a48f          	and	a,#143
2220  0023 1a02          	or	a,(OFST+2,sp)
2221  0025 c752ba        	ld	21178,a
2223  0028 200e          	jra	L5701
2224  002a               L7701:
2225                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2227  002a 721152be      	bres	21182,#0
2228                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2230  002e c652bb        	ld	a,21179
2231  0031 a48f          	and	a,#143
2232  0033 1a02          	or	a,(OFST+2,sp)
2233  0035 c752bb        	ld	21179,a
2234  0038               L5701:
2235                     ; 902 }
2238  0038 85            	popw	x
2239  0039 87            	retf	
2270                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2270                     ; 911 {
2271                     .text:	section	.text,new
2272  0000               f_TIM1_SetCompare1:
2276                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2278  0000 9e            	ld	a,xh
2279  0001 c752c6        	ld	21190,a
2280                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2282  0004 9f            	ld	a,xl
2283  0005 c752c7        	ld	21191,a
2284                     ; 916 }
2287  0008 87            	retf	
2318                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2318                     ; 925 {
2319                     .text:	section	.text,new
2320  0000               f_TIM1_SetCompare2:
2324                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2326  0000 9e            	ld	a,xh
2327  0001 c752c8        	ld	21192,a
2328                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2330  0004 9f            	ld	a,xl
2331  0005 c752c9        	ld	21193,a
2332                     ; 929 }
2335  0008 87            	retf	
2366                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2366                     ; 938 {
2367                     .text:	section	.text,new
2368  0000               f_TIM1_SetCompare3:
2372                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2374  0000 9e            	ld	a,xh
2375  0001 c752ca        	ld	21194,a
2376                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2378  0004 9f            	ld	a,xl
2379  0005 c752cb        	ld	21195,a
2380                     ; 942 }
2383  0008 87            	retf	
2414                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2414                     ; 951 {
2415                     .text:	section	.text,new
2416  0000               f_TIM1_SetCompare4:
2420                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2422  0000 9e            	ld	a,xh
2423  0001 c752cc        	ld	21196,a
2424                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2426  0004 9f            	ld	a,xl
2427  0005 c752cd        	ld	21197,a
2428                     ; 955 }
2431  0008 87            	retf	
2466                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2466                     ; 964 {
2467                     .text:	section	.text,new
2468  0000               f_TIM1_CCPreloadControl:
2472                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2474                     ; 969   if (NewState != DISABLE)
2476  0000 4d            	tnz	a
2477  0001 2705          	jreq	L1021
2478                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2480  0003 721052b1      	bset	21169,#0
2483  0007 87            	retf	
2484  0008               L1021:
2485                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2487  0008 721152b1      	bres	21169,#0
2488                     ; 977 }
2491  000c 87            	retf	
2548                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2548                     ; 988 {
2549                     .text:	section	.text,new
2550  0000               f_TIM1_ForcedOC1Config:
2552  0000 88            	push	a
2553       00000000      OFST:	set	0
2556                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2558                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2560  0001 c652b9        	ld	a,21177
2561  0004 a48f          	and	a,#143
2562  0006 1a01          	or	a,(OFST+1,sp)
2563  0008 c752b9        	ld	21177,a
2564                     ; 994 }
2567  000b 84            	pop	a
2568  000c 87            	retf	
2603                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2603                     ; 1005 {
2604                     .text:	section	.text,new
2605  0000               f_TIM1_ForcedOC2Config:
2607  0000 88            	push	a
2608       00000000      OFST:	set	0
2611                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2613                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2615  0001 c652ba        	ld	a,21178
2616  0004 a48f          	and	a,#143
2617  0006 1a01          	or	a,(OFST+1,sp)
2618  0008 c752ba        	ld	21178,a
2619                     ; 1011 }
2622  000b 84            	pop	a
2623  000c 87            	retf	
2658                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2658                     ; 1022 {
2659                     .text:	section	.text,new
2660  0000               f_TIM1_ForcedOC3Config:
2662  0000 88            	push	a
2663       00000000      OFST:	set	0
2666                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2668                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2670  0001 c652bb        	ld	a,21179
2671  0004 a48f          	and	a,#143
2672  0006 1a01          	or	a,(OFST+1,sp)
2673  0008 c752bb        	ld	21179,a
2674                     ; 1028 }
2677  000b 84            	pop	a
2678  000c 87            	retf	
2713                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2713                     ; 1037 {
2714                     .text:	section	.text,new
2715  0000               f_TIM1_OC1PreloadConfig:
2719                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2721                     ; 1042   if (NewState != DISABLE)
2723  0000 4d            	tnz	a
2724  0001 2705          	jreq	L5031
2725                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2727  0003 721652b9      	bset	21177,#3
2730  0007 87            	retf	
2731  0008               L5031:
2732                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2734  0008 721752b9      	bres	21177,#3
2735                     ; 1050 }
2738  000c 87            	retf	
2773                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2773                     ; 1059 {
2774                     .text:	section	.text,new
2775  0000               f_TIM1_OC2PreloadConfig:
2779                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2781                     ; 1064   if (NewState != DISABLE)
2783  0000 4d            	tnz	a
2784  0001 2705          	jreq	L7231
2785                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2787  0003 721652ba      	bset	21178,#3
2790  0007 87            	retf	
2791  0008               L7231:
2792                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2794  0008 721752ba      	bres	21178,#3
2795                     ; 1072 }
2798  000c 87            	retf	
2833                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2833                     ; 1081 {
2834                     .text:	section	.text,new
2835  0000               f_TIM1_OC3PreloadConfig:
2839                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2841                     ; 1086   if (NewState != DISABLE)
2843  0000 4d            	tnz	a
2844  0001 2705          	jreq	L1531
2845                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2847  0003 721652bb      	bset	21179,#3
2850  0007 87            	retf	
2851  0008               L1531:
2852                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2854  0008 721752bb      	bres	21179,#3
2855                     ; 1094 }
2858  000c 87            	retf	
2893                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2893                     ; 1103 {
2894                     .text:	section	.text,new
2895  0000               f_TIM1_OC4PreloadConfig:
2899                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2901                     ; 1108   if (NewState != DISABLE)
2903  0000 4d            	tnz	a
2904  0001 2705          	jreq	L3731
2905                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2907  0003 721652bc      	bset	21180,#3
2910  0007 87            	retf	
2911  0008               L3731:
2912                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2914  0008 721752bc      	bres	21180,#3
2915                     ; 1116 }
2918  000c 87            	retf	
2952                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2952                     ; 1125 {
2953                     .text:	section	.text,new
2954  0000               f_TIM1_OC1FastConfig:
2958                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2960                     ; 1130   if (NewState != DISABLE)
2962  0000 4d            	tnz	a
2963  0001 2705          	jreq	L5141
2964                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2966  0003 721452b9      	bset	21177,#2
2969  0007 87            	retf	
2970  0008               L5141:
2971                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2973  0008 721552b9      	bres	21177,#2
2974                     ; 1138 }
2977  000c 87            	retf	
3011                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3011                     ; 1147 {
3012                     .text:	section	.text,new
3013  0000               f_TIM1_OC2FastConfig:
3017                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3019                     ; 1152   if (NewState != DISABLE)
3021  0000 4d            	tnz	a
3022  0001 2705          	jreq	L7341
3023                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3025  0003 721452ba      	bset	21178,#2
3028  0007 87            	retf	
3029  0008               L7341:
3030                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3032  0008 721552ba      	bres	21178,#2
3033                     ; 1160 }
3036  000c 87            	retf	
3070                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3070                     ; 1169 {
3071                     .text:	section	.text,new
3072  0000               f_TIM1_OC3FastConfig:
3076                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3078                     ; 1174   if (NewState != DISABLE)
3080  0000 4d            	tnz	a
3081  0001 2705          	jreq	L1641
3082                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3084  0003 721452bb      	bset	21179,#2
3087  0007 87            	retf	
3088  0008               L1641:
3089                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3091  0008 721552bb      	bres	21179,#2
3092                     ; 1182 }
3095  000c 87            	retf	
3129                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3129                     ; 1191 {
3130                     .text:	section	.text,new
3131  0000               f_TIM1_ClearOC1Ref:
3135                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3137                     ; 1196   if (NewState != DISABLE)
3139  0000 4d            	tnz	a
3140  0001 2705          	jreq	L3051
3141                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3143  0003 721e52b9      	bset	21177,#7
3146  0007 87            	retf	
3147  0008               L3051:
3148                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3150  0008 721f52b9      	bres	21177,#7
3151                     ; 1204 }
3154  000c 87            	retf	
3188                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3188                     ; 1213 {
3189                     .text:	section	.text,new
3190  0000               f_TIM1_ClearOC2Ref:
3194                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3196                     ; 1218   if (NewState != DISABLE)
3198  0000 4d            	tnz	a
3199  0001 2705          	jreq	L5251
3200                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3202  0003 721e52ba      	bset	21178,#7
3205  0007 87            	retf	
3206  0008               L5251:
3207                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3209  0008 721f52ba      	bres	21178,#7
3210                     ; 1226 }
3213  000c 87            	retf	
3247                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3247                     ; 1235 {
3248                     .text:	section	.text,new
3249  0000               f_TIM1_ClearOC3Ref:
3253                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3255                     ; 1240   if (NewState != DISABLE)
3257  0000 4d            	tnz	a
3258  0001 2705          	jreq	L7451
3259                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3261  0003 721e52bb      	bset	21179,#7
3264  0007 87            	retf	
3265  0008               L7451:
3266                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3268  0008 721f52bb      	bres	21179,#7
3269                     ; 1248 }
3272  000c 87            	retf	
3306                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3306                     ; 1257 {
3307                     .text:	section	.text,new
3308  0000               f_TIM1_ClearOC4Ref:
3312                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3314                     ; 1262   if (NewState != DISABLE)
3316  0000 4d            	tnz	a
3317  0001 2705          	jreq	L1751
3318                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3320  0003 721e52bc      	bset	21180,#7
3323  0007 87            	retf	
3324  0008               L1751:
3325                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3327  0008 721f52bc      	bres	21180,#7
3328                     ; 1270 }
3331  000c 87            	retf	
3366                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3366                     ; 1281 {
3367                     .text:	section	.text,new
3368  0000               f_TIM1_OC1PolarityConfig:
3372                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3374                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3376  0000 4d            	tnz	a
3377  0001 2705          	jreq	L3161
3378                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3380  0003 721252bd      	bset	21181,#1
3383  0007 87            	retf	
3384  0008               L3161:
3385                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3387  0008 721352bd      	bres	21181,#1
3388                     ; 1294 }
3391  000c 87            	retf	
3426                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3426                     ; 1305 {
3427                     .text:	section	.text,new
3428  0000               f_TIM1_OC1NPolarityConfig:
3432                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3434                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3436  0000 4d            	tnz	a
3437  0001 2705          	jreq	L5361
3438                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3440  0003 721652bd      	bset	21181,#3
3443  0007 87            	retf	
3444  0008               L5361:
3445                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3447  0008 721752bd      	bres	21181,#3
3448                     ; 1318 }
3451  000c 87            	retf	
3486                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3486                     ; 1329 {
3487                     .text:	section	.text,new
3488  0000               f_TIM1_OC2PolarityConfig:
3492                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3494                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3496  0000 4d            	tnz	a
3497  0001 2705          	jreq	L7561
3498                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3500  0003 721a52bd      	bset	21181,#5
3503  0007 87            	retf	
3504  0008               L7561:
3505                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3507  0008 721b52bd      	bres	21181,#5
3508                     ; 1342 }
3511  000c 87            	retf	
3546                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3546                     ; 1353 {
3547                     .text:	section	.text,new
3548  0000               f_TIM1_OC2NPolarityConfig:
3552                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3554                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3556  0000 4d            	tnz	a
3557  0001 2705          	jreq	L1071
3558                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3560  0003 721e52bd      	bset	21181,#7
3563  0007 87            	retf	
3564  0008               L1071:
3565                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3567  0008 721f52bd      	bres	21181,#7
3568                     ; 1366 }
3571  000c 87            	retf	
3606                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3606                     ; 1377 {
3607                     .text:	section	.text,new
3608  0000               f_TIM1_OC3PolarityConfig:
3612                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3614                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3616  0000 4d            	tnz	a
3617  0001 2705          	jreq	L3271
3618                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3620  0003 721252be      	bset	21182,#1
3623  0007 87            	retf	
3624  0008               L3271:
3625                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3627  0008 721352be      	bres	21182,#1
3628                     ; 1390 }
3631  000c 87            	retf	
3666                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3666                     ; 1401 {
3667                     .text:	section	.text,new
3668  0000               f_TIM1_OC3NPolarityConfig:
3672                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3674                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3676  0000 4d            	tnz	a
3677  0001 2705          	jreq	L5471
3678                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3680  0003 721652be      	bset	21182,#3
3683  0007 87            	retf	
3684  0008               L5471:
3685                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3687  0008 721752be      	bres	21182,#3
3688                     ; 1414 }
3691  000c 87            	retf	
3749                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3749                     ; 1425 {
3750                     .text:	section	.text,new
3751  0000               f_TIM1_SelectOCREFClear:
3755                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3757                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3759  0000 721752b2      	bres	21170,#3
3760                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3762  0004 ca52b2        	or	a,21170
3763  0007 c752b2        	ld	21170,a
3764                     ; 1432 }
3767  000a 87            	retf	
3801                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3801                     ; 1441 {
3802                     .text:	section	.text,new
3803  0000               f_TIM1_SelectCOM:
3807                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3809                     ; 1446   if (NewState != DISABLE)
3811  0000 4d            	tnz	a
3812  0001 2705          	jreq	L5102
3813                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3815  0003 721452b1      	bset	21169,#2
3818  0007 87            	retf	
3819  0008               L5102:
3820                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3822  0008 721552b1      	bres	21169,#2
3823                     ; 1454 }
3826  000c 87            	retf	
3870                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3870                     ; 1469 {
3871                     .text:	section	.text,new
3872  0000               f_TIM1_CCxCmd:
3874  0000 89            	pushw	x
3875       00000000      OFST:	set	0
3878                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3880                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3882                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3884  0001 9e            	ld	a,xh
3885  0002 4d            	tnz	a
3886  0003 2610          	jrne	L3402
3887                     ; 1477     if (NewState != DISABLE)
3889  0005 9f            	ld	a,xl
3890  0006 4d            	tnz	a
3891  0007 2706          	jreq	L5402
3892                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3894  0009 721052bd      	bset	21181,#0
3896  000d 203e          	jra	L1502
3897  000f               L5402:
3898                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3900  000f 721152bd      	bres	21181,#0
3901  0013 2038          	jra	L1502
3902  0015               L3402:
3903                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3905  0015 7b01          	ld	a,(OFST+1,sp)
3906  0017 a101          	cp	a,#1
3907  0019 2610          	jrne	L3502
3908                     ; 1489     if (NewState != DISABLE)
3910  001b 7b02          	ld	a,(OFST+2,sp)
3911  001d 2706          	jreq	L5502
3912                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3914  001f 721852bd      	bset	21181,#4
3916  0023 2028          	jra	L1502
3917  0025               L5502:
3918                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3920  0025 721952bd      	bres	21181,#4
3921  0029 2022          	jra	L1502
3922  002b               L3502:
3923                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3925  002b a102          	cp	a,#2
3926  002d 2610          	jrne	L3602
3927                     ; 1501     if (NewState != DISABLE)
3929  002f 7b02          	ld	a,(OFST+2,sp)
3930  0031 2706          	jreq	L5602
3931                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3933  0033 721052be      	bset	21182,#0
3935  0037 2014          	jra	L1502
3936  0039               L5602:
3937                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3939  0039 721152be      	bres	21182,#0
3940  003d 200e          	jra	L1502
3941  003f               L3602:
3942                     ; 1513     if (NewState != DISABLE)
3944  003f 7b02          	ld	a,(OFST+2,sp)
3945  0041 2706          	jreq	L3702
3946                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3948  0043 721852be      	bset	21182,#4
3950  0047 2004          	jra	L1502
3951  0049               L3702:
3952                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3954  0049 721952be      	bres	21182,#4
3955  004d               L1502:
3956                     ; 1522 }
3959  004d 85            	popw	x
3960  004e 87            	retf	
4004                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4004                     ; 1536 {
4005                     .text:	section	.text,new
4006  0000               f_TIM1_CCxNCmd:
4008  0000 89            	pushw	x
4009       00000000      OFST:	set	0
4012                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4014                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4016                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4018  0001 9e            	ld	a,xh
4019  0002 4d            	tnz	a
4020  0003 2610          	jrne	L1212
4021                     ; 1544     if (NewState != DISABLE)
4023  0005 9f            	ld	a,xl
4024  0006 4d            	tnz	a
4025  0007 2706          	jreq	L3212
4026                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4028  0009 721452bd      	bset	21181,#2
4030  000d 2029          	jra	L7212
4031  000f               L3212:
4032                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4034  000f 721552bd      	bres	21181,#2
4035  0013 2023          	jra	L7212
4036  0015               L1212:
4037                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4039  0015 7b01          	ld	a,(OFST+1,sp)
4040  0017 4a            	dec	a
4041  0018 2610          	jrne	L1312
4042                     ; 1556     if (NewState != DISABLE)
4044  001a 7b02          	ld	a,(OFST+2,sp)
4045  001c 2706          	jreq	L3312
4046                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4048  001e 721c52bd      	bset	21181,#6
4050  0022 2014          	jra	L7212
4051  0024               L3312:
4052                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4054  0024 721d52bd      	bres	21181,#6
4055  0028 200e          	jra	L7212
4056  002a               L1312:
4057                     ; 1568     if (NewState != DISABLE)
4059  002a 7b02          	ld	a,(OFST+2,sp)
4060  002c 2706          	jreq	L1412
4061                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4063  002e 721452be      	bset	21182,#2
4065  0032 2004          	jra	L7212
4066  0034               L1412:
4067                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4069  0034 721552be      	bres	21182,#2
4070  0038               L7212:
4071                     ; 1577 }
4074  0038 85            	popw	x
4075  0039 87            	retf	
4240                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4240                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4240                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4240                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4240                     ; 1668                  uint8_t TIM1_ICFilter)
4240                     ; 1669 {
4241                     .text:	section	.text,new
4242  0000               f_TIM1_ICInit:
4244  0000 89            	pushw	x
4245       00000000      OFST:	set	0
4248                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4250                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4252                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4254                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4256                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4258                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4260  0001 9e            	ld	a,xh
4261  0002 4d            	tnz	a
4262  0003 2616          	jrne	L7322
4263                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4265  0005 7b08          	ld	a,(OFST+8,sp)
4266  0007 88            	push	a
4267  0008 7b07          	ld	a,(OFST+7,sp)
4268  000a 97            	ld	xl,a
4269  000b 7b03          	ld	a,(OFST+3,sp)
4270  000d 95            	ld	xh,a
4271  000e 8d000000      	callf	L3f_TI1_Config
4273  0012 84            	pop	a
4274                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4276  0013 7b07          	ld	a,(OFST+7,sp)
4277  0015 8d000000      	callf	f_TIM1_SetIC1Prescaler
4280  0019 204a          	jra	L1422
4281  001b               L7322:
4282                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4284  001b 7b01          	ld	a,(OFST+1,sp)
4285  001d a101          	cp	a,#1
4286  001f 2616          	jrne	L3422
4287                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4289  0021 7b08          	ld	a,(OFST+8,sp)
4290  0023 88            	push	a
4291  0024 7b07          	ld	a,(OFST+7,sp)
4292  0026 97            	ld	xl,a
4293  0027 7b03          	ld	a,(OFST+3,sp)
4294  0029 95            	ld	xh,a
4295  002a 8d000000      	callf	L5f_TI2_Config
4297  002e 84            	pop	a
4298                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4300  002f 7b07          	ld	a,(OFST+7,sp)
4301  0031 8d000000      	callf	f_TIM1_SetIC2Prescaler
4304  0035 202e          	jra	L1422
4305  0037               L3422:
4306                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4308  0037 a102          	cp	a,#2
4309  0039 2616          	jrne	L7422
4310                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4312  003b 7b08          	ld	a,(OFST+8,sp)
4313  003d 88            	push	a
4314  003e 7b07          	ld	a,(OFST+7,sp)
4315  0040 97            	ld	xl,a
4316  0041 7b03          	ld	a,(OFST+3,sp)
4317  0043 95            	ld	xh,a
4318  0044 8d000000      	callf	L7f_TI3_Config
4320  0048 84            	pop	a
4321                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4323  0049 7b07          	ld	a,(OFST+7,sp)
4324  004b 8d000000      	callf	f_TIM1_SetIC3Prescaler
4327  004f 2014          	jra	L1422
4328  0051               L7422:
4329                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4331  0051 7b08          	ld	a,(OFST+8,sp)
4332  0053 88            	push	a
4333  0054 7b07          	ld	a,(OFST+7,sp)
4334  0056 97            	ld	xl,a
4335  0057 7b03          	ld	a,(OFST+3,sp)
4336  0059 95            	ld	xh,a
4337  005a 8d000000      	callf	L11f_TI4_Config
4339  005e 84            	pop	a
4340                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4342  005f 7b07          	ld	a,(OFST+7,sp)
4343  0061 8d000000      	callf	f_TIM1_SetIC4Prescaler
4345  0065               L1422:
4346                     ; 1706 }
4349  0065 85            	popw	x
4350  0066 87            	retf	
4445                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4445                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4445                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4445                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4445                     ; 1737                      uint8_t TIM1_ICFilter)
4445                     ; 1738 {
4446                     .text:	section	.text,new
4447  0000               f_TIM1_PWMIConfig:
4449  0000 89            	pushw	x
4450  0001 89            	pushw	x
4451       00000002      OFST:	set	2
4454                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4456                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4458                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4460                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4462                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4464                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4466                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4468  0002 9f            	ld	a,xl
4469  0003 4a            	dec	a
4470  0004 2702          	jreq	L7132
4471                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4473  0006 a601          	ld	a,#1
4475  0008               L7132:
4476                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4478  0008 6b01          	ld	(OFST-1,sp),a
4480                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4482  000a 7b08          	ld	a,(OFST+6,sp)
4483  000c 4a            	dec	a
4484  000d 2604          	jrne	L3232
4485                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4487  000f a602          	ld	a,#2
4489  0011 2002          	jra	L5232
4490  0013               L3232:
4491                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4493  0013 a601          	ld	a,#1
4494  0015               L5232:
4495  0015 6b02          	ld	(OFST+0,sp),a
4497                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4499  0017 7b03          	ld	a,(OFST+1,sp)
4500  0019 262a          	jrne	L7232
4501                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4503  001b 7b0a          	ld	a,(OFST+8,sp)
4504  001d 88            	push	a
4505  001e 7b09          	ld	a,(OFST+7,sp)
4506  0020 97            	ld	xl,a
4507  0021 7b05          	ld	a,(OFST+3,sp)
4508  0023 95            	ld	xh,a
4509  0024 8d000000      	callf	L3f_TI1_Config
4511  0028 84            	pop	a
4512                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4514  0029 7b09          	ld	a,(OFST+7,sp)
4515  002b 8d000000      	callf	f_TIM1_SetIC1Prescaler
4517                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4519  002f 7b0a          	ld	a,(OFST+8,sp)
4520  0031 88            	push	a
4521  0032 7b03          	ld	a,(OFST+1,sp)
4522  0034 97            	ld	xl,a
4523  0035 7b02          	ld	a,(OFST+0,sp)
4524  0037 95            	ld	xh,a
4525  0038 8d000000      	callf	L5f_TI2_Config
4527  003c 84            	pop	a
4528                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4530  003d 7b09          	ld	a,(OFST+7,sp)
4531  003f 8d000000      	callf	f_TIM1_SetIC2Prescaler
4534  0043 2028          	jra	L1332
4535  0045               L7232:
4536                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4538  0045 7b0a          	ld	a,(OFST+8,sp)
4539  0047 88            	push	a
4540  0048 7b09          	ld	a,(OFST+7,sp)
4541  004a 97            	ld	xl,a
4542  004b 7b05          	ld	a,(OFST+3,sp)
4543  004d 95            	ld	xh,a
4544  004e 8d000000      	callf	L5f_TI2_Config
4546  0052 84            	pop	a
4547                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4549  0053 7b09          	ld	a,(OFST+7,sp)
4550  0055 8d000000      	callf	f_TIM1_SetIC2Prescaler
4552                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4554  0059 7b0a          	ld	a,(OFST+8,sp)
4555  005b 88            	push	a
4556  005c 7b03          	ld	a,(OFST+1,sp)
4557  005e 97            	ld	xl,a
4558  005f 7b02          	ld	a,(OFST+0,sp)
4559  0061 95            	ld	xh,a
4560  0062 8d000000      	callf	L3f_TI1_Config
4562  0066 84            	pop	a
4563                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4565  0067 7b09          	ld	a,(OFST+7,sp)
4566  0069 8d000000      	callf	f_TIM1_SetIC1Prescaler
4568  006d               L1332:
4569                     ; 1796 }
4572  006d 5b04          	addw	sp,#4
4573  006f 87            	retf	
4618                     ; 1803 uint16_t TIM1_GetCapture1(void)
4618                     ; 1804 {
4619                     .text:	section	.text,new
4620  0000               f_TIM1_GetCapture1:
4622  0000 5204          	subw	sp,#4
4623       00000004      OFST:	set	4
4626                     ; 1807   uint16_t tmpccr1 = 0;
4628                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4632                     ; 1810   tmpccr1h = TIM1->CCR1H;
4634  0002 c652c6        	ld	a,21190
4635  0005 6b02          	ld	(OFST-2,sp),a
4637                     ; 1811   tmpccr1l = TIM1->CCR1L;
4639  0007 c652c7        	ld	a,21191
4640  000a 6b01          	ld	(OFST-3,sp),a
4642                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4644  000c 5f            	clrw	x
4645  000d 97            	ld	xl,a
4646  000e 1f03          	ldw	(OFST-1,sp),x
4648                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4650  0010 5f            	clrw	x
4651  0011 7b02          	ld	a,(OFST-2,sp)
4652  0013 97            	ld	xl,a
4653  0014 7b04          	ld	a,(OFST+0,sp)
4654  0016 01            	rrwa	x,a
4655  0017 1a03          	or	a,(OFST-1,sp)
4656  0019 01            	rrwa	x,a
4658                     ; 1816   return (uint16_t)tmpccr1;
4662  001a 5b04          	addw	sp,#4
4663  001c 87            	retf	
4708                     ; 1824 uint16_t TIM1_GetCapture2(void)
4708                     ; 1825 {
4709                     .text:	section	.text,new
4710  0000               f_TIM1_GetCapture2:
4712  0000 5204          	subw	sp,#4
4713       00000004      OFST:	set	4
4716                     ; 1828   uint16_t tmpccr2 = 0;
4718                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4722                     ; 1831   tmpccr2h = TIM1->CCR2H;
4724  0002 c652c8        	ld	a,21192
4725  0005 6b02          	ld	(OFST-2,sp),a
4727                     ; 1832   tmpccr2l = TIM1->CCR2L;
4729  0007 c652c9        	ld	a,21193
4730  000a 6b01          	ld	(OFST-3,sp),a
4732                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4734  000c 5f            	clrw	x
4735  000d 97            	ld	xl,a
4736  000e 1f03          	ldw	(OFST-1,sp),x
4738                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4740  0010 5f            	clrw	x
4741  0011 7b02          	ld	a,(OFST-2,sp)
4742  0013 97            	ld	xl,a
4743  0014 7b04          	ld	a,(OFST+0,sp)
4744  0016 01            	rrwa	x,a
4745  0017 1a03          	or	a,(OFST-1,sp)
4746  0019 01            	rrwa	x,a
4748                     ; 1837   return (uint16_t)tmpccr2;
4752  001a 5b04          	addw	sp,#4
4753  001c 87            	retf	
4798                     ; 1845 uint16_t TIM1_GetCapture3(void)
4798                     ; 1846 {
4799                     .text:	section	.text,new
4800  0000               f_TIM1_GetCapture3:
4802  0000 5204          	subw	sp,#4
4803       00000004      OFST:	set	4
4806                     ; 1848   uint16_t tmpccr3 = 0;
4808                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4812                     ; 1851   tmpccr3h = TIM1->CCR3H;
4814  0002 c652ca        	ld	a,21194
4815  0005 6b02          	ld	(OFST-2,sp),a
4817                     ; 1852   tmpccr3l = TIM1->CCR3L;
4819  0007 c652cb        	ld	a,21195
4820  000a 6b01          	ld	(OFST-3,sp),a
4822                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4824  000c 5f            	clrw	x
4825  000d 97            	ld	xl,a
4826  000e 1f03          	ldw	(OFST-1,sp),x
4828                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4830  0010 5f            	clrw	x
4831  0011 7b02          	ld	a,(OFST-2,sp)
4832  0013 97            	ld	xl,a
4833  0014 7b04          	ld	a,(OFST+0,sp)
4834  0016 01            	rrwa	x,a
4835  0017 1a03          	or	a,(OFST-1,sp)
4836  0019 01            	rrwa	x,a
4838                     ; 1857   return (uint16_t)tmpccr3;
4842  001a 5b04          	addw	sp,#4
4843  001c 87            	retf	
4888                     ; 1865 uint16_t TIM1_GetCapture4(void)
4888                     ; 1866 {
4889                     .text:	section	.text,new
4890  0000               f_TIM1_GetCapture4:
4892  0000 5204          	subw	sp,#4
4893       00000004      OFST:	set	4
4896                     ; 1868   uint16_t tmpccr4 = 0;
4898                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4902                     ; 1871   tmpccr4h = TIM1->CCR4H;
4904  0002 c652cc        	ld	a,21196
4905  0005 6b02          	ld	(OFST-2,sp),a
4907                     ; 1872   tmpccr4l = TIM1->CCR4L;
4909  0007 c652cd        	ld	a,21197
4910  000a 6b01          	ld	(OFST-3,sp),a
4912                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
4914  000c 5f            	clrw	x
4915  000d 97            	ld	xl,a
4916  000e 1f03          	ldw	(OFST-1,sp),x
4918                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4920  0010 5f            	clrw	x
4921  0011 7b02          	ld	a,(OFST-2,sp)
4922  0013 97            	ld	xl,a
4923  0014 7b04          	ld	a,(OFST+0,sp)
4924  0016 01            	rrwa	x,a
4925  0017 1a03          	or	a,(OFST-1,sp)
4926  0019 01            	rrwa	x,a
4928                     ; 1877   return (uint16_t)tmpccr4;
4932  001a 5b04          	addw	sp,#4
4933  001c 87            	retf	
4968                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
4968                     ; 1891 {
4969                     .text:	section	.text,new
4970  0000               f_TIM1_SetIC1Prescaler:
4972  0000 88            	push	a
4973       00000000      OFST:	set	0
4976                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
4978                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
4980  0001 c652b9        	ld	a,21177
4981  0004 a4f3          	and	a,#243
4982  0006 1a01          	or	a,(OFST+1,sp)
4983  0008 c752b9        	ld	21177,a
4984                     ; 1897 }
4987  000b 84            	pop	a
4988  000c 87            	retf	
5023                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5023                     ; 1910 {
5024                     .text:	section	.text,new
5025  0000               f_TIM1_SetIC2Prescaler:
5027  0000 88            	push	a
5028       00000000      OFST:	set	0
5031                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5033                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5035  0001 c652ba        	ld	a,21178
5036  0004 a4f3          	and	a,#243
5037  0006 1a01          	or	a,(OFST+1,sp)
5038  0008 c752ba        	ld	21178,a
5039                     ; 1916 }
5042  000b 84            	pop	a
5043  000c 87            	retf	
5078                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5078                     ; 1929 {
5079                     .text:	section	.text,new
5080  0000               f_TIM1_SetIC3Prescaler:
5082  0000 88            	push	a
5083       00000000      OFST:	set	0
5086                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5088                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5090  0001 c652bb        	ld	a,21179
5091  0004 a4f3          	and	a,#243
5092  0006 1a01          	or	a,(OFST+1,sp)
5093  0008 c752bb        	ld	21179,a
5094                     ; 1936 }
5097  000b 84            	pop	a
5098  000c 87            	retf	
5133                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5133                     ; 1949 {
5134                     .text:	section	.text,new
5135  0000               f_TIM1_SetIC4Prescaler:
5137  0000 88            	push	a
5138       00000000      OFST:	set	0
5141                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5143                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5145  0001 c652bc        	ld	a,21180
5146  0004 a4f3          	and	a,#243
5147  0006 1a01          	or	a,(OFST+1,sp)
5148  0008 c752bc        	ld	21180,a
5149                     ; 1956 }
5152  000b 84            	pop	a
5153  000c 87            	retf	
5259                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5259                     ; 1992 {
5260                     .text:	section	.text,new
5261  0000               f_TIM1_ITConfig:
5263  0000 89            	pushw	x
5264       00000000      OFST:	set	0
5267                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5269                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5271                     ; 1997   if (NewState != DISABLE)
5273  0001 9f            	ld	a,xl
5274  0002 4d            	tnz	a
5275  0003 2706          	jreq	L1752
5276                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5278  0005 9e            	ld	a,xh
5279  0006 ca52b5        	or	a,21173
5281  0009 2006          	jra	L3752
5282  000b               L1752:
5283                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5285  000b 7b01          	ld	a,(OFST+1,sp)
5286  000d 43            	cpl	a
5287  000e c452b5        	and	a,21173
5288  0011               L3752:
5289  0011 c752b5        	ld	21173,a
5290                     ; 2007 }
5293  0014 85            	popw	x
5294  0015 87            	retf	
5398                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5398                     ; 2024 {
5399                     .text:	section	.text,new
5400  0000               f_TIM1_GenerateEvent:
5404                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5406                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5408  0000 c752b8        	ld	21176,a
5409                     ; 2030 }
5412  0003 87            	retf	
5581                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5581                     ; 2050 {
5582                     .text:	section	.text,new
5583  0000               f_TIM1_GetFlagStatus:
5585  0000 89            	pushw	x
5586  0001 89            	pushw	x
5587       00000002      OFST:	set	2
5590                     ; 2051   FlagStatus bitstatus = RESET;
5592                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5596                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5598                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5600  0002 9f            	ld	a,xl
5601  0003 c452b6        	and	a,21174
5602  0006 6b01          	ld	(OFST-1,sp),a
5604                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5606  0008 c652b7        	ld	a,21175
5607  000b 1403          	and	a,(OFST+1,sp)
5608  000d 6b02          	ld	(OFST+0,sp),a
5610                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5612  000f 1a01          	or	a,(OFST-1,sp)
5613  0011 2702          	jreq	L1372
5614                     ; 2062     bitstatus = SET;
5616  0013 a601          	ld	a,#1
5619  0015               L1372:
5620                     ; 2066     bitstatus = RESET;
5623                     ; 2068   return (FlagStatus)(bitstatus);
5627  0015 5b04          	addw	sp,#4
5628  0017 87            	retf	
5662                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5662                     ; 2090 {
5663                     .text:	section	.text,new
5664  0000               f_TIM1_ClearFlag:
5666  0000 89            	pushw	x
5667       00000000      OFST:	set	0
5670                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5672                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5674  0001 9f            	ld	a,xl
5675  0002 43            	cpl	a
5676  0003 c752b6        	ld	21174,a
5677                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5679  0006 7b01          	ld	a,(OFST+1,sp)
5680  0008 43            	cpl	a
5681  0009 a41e          	and	a,#30
5682  000b c752b7        	ld	21175,a
5683                     ; 2097 }
5686  000e 85            	popw	x
5687  000f 87            	retf	
5746                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5746                     ; 2115 {
5747                     .text:	section	.text,new
5748  0000               f_TIM1_GetITStatus:
5750  0000 88            	push	a
5751  0001 89            	pushw	x
5752       00000002      OFST:	set	2
5755                     ; 2116   ITStatus bitstatus = RESET;
5757                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5761                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5763                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5765  0002 c452b6        	and	a,21174
5766  0005 6b01          	ld	(OFST-1,sp),a
5768                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5770  0007 c652b5        	ld	a,21173
5771  000a 1403          	and	a,(OFST+1,sp)
5772  000c 6b02          	ld	(OFST+0,sp),a
5774                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5776  000e 7b01          	ld	a,(OFST-1,sp)
5777  0010 2708          	jreq	L1003
5779  0012 7b02          	ld	a,(OFST+0,sp)
5780  0014 2704          	jreq	L1003
5781                     ; 2129     bitstatus = SET;
5783  0016 a601          	ld	a,#1
5786  0018 2001          	jra	L3003
5787  001a               L1003:
5788                     ; 2133     bitstatus = RESET;
5790  001a 4f            	clr	a
5792  001b               L3003:
5793                     ; 2135   return (ITStatus)(bitstatus);
5797  001b 5b03          	addw	sp,#3
5798  001d 87            	retf	
5833                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5833                     ; 2153 {
5834                     .text:	section	.text,new
5835  0000               f_TIM1_ClearITPendingBit:
5839                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5841                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5843  0000 43            	cpl	a
5844  0001 c752b6        	ld	21174,a
5845                     ; 2159 }
5848  0004 87            	retf	
6385                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6385                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6385                     ; 2169 {
6386                     .text:	section	.text,new
6387  0000               f_TIM1_DMAConfig:
6391                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6393                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6395                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6397  0000 9e            	ld	a,xh
6398  0001 c752d1        	ld	21201,a
6399                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6401  0004 9f            	ld	a,xl
6402  0005 c752d2        	ld	21202,a
6403                     ; 2177 }
6406  0008 87            	retf	
6499                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6499                     ; 2190 {
6500                     .text:	section	.text,new
6501  0000               f_TIM1_DMACmd:
6503  0000 89            	pushw	x
6504       00000000      OFST:	set	0
6507                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6509                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6511                     ; 2195   if (NewState != DISABLE)
6513  0001 9f            	ld	a,xl
6514  0002 4d            	tnz	a
6515  0003 2706          	jreq	L7133
6516                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6518  0005 9e            	ld	a,xh
6519  0006 ca52b4        	or	a,21172
6521  0009 2006          	jra	L1233
6522  000b               L7133:
6523                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6525  000b 7b01          	ld	a,(OFST+1,sp)
6526  000d 43            	cpl	a
6527  000e c452b4        	and	a,21172
6528  0011               L1233:
6529  0011 c752b4        	ld	21172,a
6530                     ; 2205 }
6533  0014 85            	popw	x
6534  0015 87            	retf	
6568                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6568                     ; 2214 {
6569                     .text:	section	.text,new
6570  0000               f_TIM1_SelectCCDMA:
6574                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6576                     ; 2218   if (NewState != DISABLE)
6578  0000 4d            	tnz	a
6579  0001 2705          	jreq	L1433
6580                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6582  0003 721652b1      	bset	21169,#3
6585  0007 87            	retf	
6586  0008               L1433:
6587                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6589  0008 721752b1      	bres	21169,#3
6590                     ; 2228 }
6593  000c 87            	retf	
6616                     ; 2251 void TIM1_InternalClockConfig(void)
6616                     ; 2252 {
6617                     .text:	section	.text,new
6618  0000               f_TIM1_InternalClockConfig:
6622                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6624  0000 c652b2        	ld	a,21170
6625  0003 a4f8          	and	a,#248
6626  0005 c752b2        	ld	21170,a
6627                     ; 2255 }
6630  0008 87            	retf	
6716                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6716                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6716                     ; 2274                                  uint8_t ICFilter)
6716                     ; 2275 {
6717                     .text:	section	.text,new
6718  0000               f_TIM1_TIxExternalClockConfig:
6720  0000 89            	pushw	x
6721       00000000      OFST:	set	0
6724                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6726                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6728                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6730                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6732  0001 9e            	ld	a,xh
6733  0002 a160          	cp	a,#96
6734  0004 260e          	jrne	L3143
6735                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6737  0006 7b06          	ld	a,(OFST+6,sp)
6738  0008 88            	push	a
6739  0009 9f            	ld	a,xl
6740  000a ae0001        	ldw	x,#1
6741  000d 95            	ld	xh,a
6742  000e 8d000000      	callf	L5f_TI2_Config
6745  0012 200d          	jra	L5143
6746  0014               L3143:
6747                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6749  0014 7b06          	ld	a,(OFST+6,sp)
6750  0016 88            	push	a
6751  0017 7b03          	ld	a,(OFST+3,sp)
6752  0019 ae0001        	ldw	x,#1
6753  001c 95            	ld	xh,a
6754  001d 8d000000      	callf	L3f_TI1_Config
6756  0021               L5143:
6757  0021 84            	pop	a
6758                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6760  0022 7b01          	ld	a,(OFST+1,sp)
6761  0024 8d000000      	callf	f_TIM1_SelectInputTrigger
6763                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6765  0028 c652b2        	ld	a,21170
6766  002b aa07          	or	a,#7
6767  002d c752b2        	ld	21170,a
6768                     ; 2296 }
6771  0030 85            	popw	x
6772  0031 87            	retf	
6886                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6886                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6886                     ; 2316                               uint8_t ExtTRGFilter)
6886                     ; 2317 {
6887                     .text:	section	.text,new
6888  0000               f_TIM1_ETRClockMode1Config:
6890  0000 89            	pushw	x
6891       00000000      OFST:	set	0
6894                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6896                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6898                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6900                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6902  0001 7b06          	ld	a,(OFST+6,sp)
6903  0003 88            	push	a
6904  0004 7b02          	ld	a,(OFST+2,sp)
6905  0006 95            	ld	xh,a
6906  0007 8d000000      	callf	f_TIM1_ETRConfig
6908  000b 84            	pop	a
6909                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6909                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6911  000c c652b2        	ld	a,21170
6912  000f aa77          	or	a,#119
6913  0011 c752b2        	ld	21170,a
6914                     ; 2329 }
6917  0014 85            	popw	x
6918  0015 87            	retf	
6973                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6973                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6973                     ; 2349                               uint8_t ExtTRGFilter)
6973                     ; 2350 {
6974                     .text:	section	.text,new
6975  0000               f_TIM1_ETRClockMode2Config:
6977  0000 89            	pushw	x
6978       00000000      OFST:	set	0
6981                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6983                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6985                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6987  0001 7b06          	ld	a,(OFST+6,sp)
6988  0003 88            	push	a
6989  0004 7b02          	ld	a,(OFST+2,sp)
6990  0006 95            	ld	xh,a
6991  0007 8d000000      	callf	f_TIM1_ETRConfig
6993  000b 721c52b3      	bset	21171,#6
6994                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
6996                     ; 2360 }
6999  000f 5b03          	addw	sp,#3
7000  0011 87            	retf	
7106                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7106                     ; 2411 {
7107                     .text:	section	.text,new
7108  0000               f_TIM1_SelectInputTrigger:
7110  0000 88            	push	a
7111       00000000      OFST:	set	0
7114                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7116                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7118  0001 c652b2        	ld	a,21170
7119  0004 a48f          	and	a,#143
7120  0006 1a01          	or	a,(OFST+1,sp)
7121  0008 c752b2        	ld	21170,a
7122                     ; 2417 }
7125  000b 84            	pop	a
7126  000c 87            	retf	
7231                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7231                     ; 2434 {
7232                     .text:	section	.text,new
7233  0000               f_TIM1_SelectOutputTrigger:
7235  0000 88            	push	a
7236       00000000      OFST:	set	0
7239                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7241                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7243  0001 c652b1        	ld	a,21169
7244  0004 a48f          	and	a,#143
7245  0006 1a01          	or	a,(OFST+1,sp)
7246  0008 c752b1        	ld	21169,a
7247                     ; 2439 }
7250  000b 84            	pop	a
7251  000c 87            	retf	
7324                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7324                     ; 2452 {
7325                     .text:	section	.text,new
7326  0000               f_TIM1_SelectSlaveMode:
7328  0000 88            	push	a
7329       00000000      OFST:	set	0
7332                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7334                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7336  0001 c652b2        	ld	a,21170
7337  0004 a4f8          	and	a,#248
7338  0006 1a01          	or	a,(OFST+1,sp)
7339  0008 c752b2        	ld	21170,a
7340                     ; 2459 }
7343  000b 84            	pop	a
7344  000c 87            	retf	
7379                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7379                     ; 2468 {
7380                     .text:	section	.text,new
7381  0000               f_TIM1_SelectMasterSlaveMode:
7385                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7387                     ; 2473   if (NewState != DISABLE)
7389  0000 4d            	tnz	a
7390  0001 2705          	jreq	L7663
7391                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7393  0003 721e52b2      	bset	21170,#7
7396  0007 87            	retf	
7397  0008               L7663:
7398                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7400  0008 721f52b2      	bres	21170,#7
7401                     ; 2481 }
7404  000c 87            	retf	
7457                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7457                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7457                     ; 2501                     uint8_t ExtTRGFilter)
7457                     ; 2502 {
7458                     .text:	section	.text,new
7459  0000               f_TIM1_ETRConfig:
7461  0000 89            	pushw	x
7462       00000000      OFST:	set	0
7465                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7467                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7467                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7467                     ; 2508                          | (uint8_t) ExtTRGFilter);
7469  0001 9f            	ld	a,xl
7470  0002 1a01          	or	a,(OFST+1,sp)
7471  0004 1a06          	or	a,(OFST+6,sp)
7472  0006 ca52b3        	or	a,21171
7473  0009 c752b3        	ld	21171,a
7474                     ; 2509 }
7477  000c 85            	popw	x
7478  000d 87            	retf	
7563                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7563                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7563                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7563                     ; 2550 {
7564                     .text:	section	.text,new
7565  0000               f_TIM1_EncoderInterfaceConfig:
7567  0000 89            	pushw	x
7568       00000000      OFST:	set	0
7571                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7573                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7575                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7577                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7579  0001 9f            	ld	a,xl
7580  0002 4d            	tnz	a
7581  0003 2706          	jreq	L7573
7582                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7584  0005 721252bd      	bset	21181,#1
7586  0009 2004          	jra	L1673
7587  000b               L7573:
7588                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7590  000b 721352bd      	bres	21181,#1
7591  000f               L1673:
7592                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7594  000f 7b06          	ld	a,(OFST+6,sp)
7595  0011 2706          	jreq	L3673
7596                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7598  0013 721a52bd      	bset	21181,#5
7600  0017 2004          	jra	L5673
7601  0019               L3673:
7602                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7604  0019 721b52bd      	bres	21181,#5
7605  001d               L5673:
7606                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7608  001d c652b2        	ld	a,21170
7609  0020 a4f0          	and	a,#240
7610  0022 1a01          	or	a,(OFST+1,sp)
7611  0024 c752b2        	ld	21170,a
7612                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7614  0027 c652b9        	ld	a,21177
7615  002a a4fc          	and	a,#252
7616  002c aa01          	or	a,#1
7617  002e c752b9        	ld	21177,a
7618                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7620  0031 c652ba        	ld	a,21178
7621  0034 a4fc          	and	a,#252
7622  0036 aa01          	or	a,#1
7623  0038 c752ba        	ld	21178,a
7624                     ; 2581 }
7627  003b 85            	popw	x
7628  003c 87            	retf	
7663                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7663                     ; 2590 {
7664                     .text:	section	.text,new
7665  0000               f_TIM1_SelectHallSensor:
7669                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7671                     ; 2595   if (NewState != DISABLE)
7673  0000 4d            	tnz	a
7674  0001 2705          	jreq	L5004
7675                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7677  0003 721e52b1      	bset	21169,#7
7680  0007 87            	retf	
7681  0008               L5004:
7682                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7684  0008 721f52b1      	bres	21169,#7
7685                     ; 2603 }
7688  000c 87            	retf	
7733                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7733                     ; 2624 {
7734                     .text:	section	.text,new
7735  0000               L3f_TI1_Config:
7737  0000 89            	pushw	x
7738  0001 88            	push	a
7739       00000001      OFST:	set	1
7742                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7744  0002 721152bd      	bres	21181,#0
7745                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7745                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7747  0006 7b07          	ld	a,(OFST+6,sp)
7748  0008 97            	ld	xl,a
7749  0009 a610          	ld	a,#16
7750  000b 42            	mul	x,a
7751  000c 9f            	ld	a,xl
7752  000d 1a03          	or	a,(OFST+2,sp)
7753  000f 6b01          	ld	(OFST+0,sp),a
7755  0011 c652b9        	ld	a,21177
7756  0014 a40c          	and	a,#12
7757  0016 1a01          	or	a,(OFST+0,sp)
7758  0018 c752b9        	ld	21177,a
7759                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7761  001b 7b02          	ld	a,(OFST+1,sp)
7762  001d 2706          	jreq	L1304
7763                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7765  001f 721252bd      	bset	21181,#1
7767  0023 2004          	jra	L3304
7768  0025               L1304:
7769                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7771  0025 721352bd      	bres	21181,#1
7772  0029               L3304:
7773                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7775  0029 721052bd      	bset	21181,#0
7776                     ; 2647 }
7779  002d 5b03          	addw	sp,#3
7780  002f 87            	retf	
7825                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7825                     ; 2664 {
7826                     .text:	section	.text,new
7827  0000               L5f_TI2_Config:
7829  0000 89            	pushw	x
7830  0001 88            	push	a
7831       00000001      OFST:	set	1
7834                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7836  0002 721952bd      	bres	21181,#4
7837                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7837                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7839  0006 7b07          	ld	a,(OFST+6,sp)
7840  0008 97            	ld	xl,a
7841  0009 a610          	ld	a,#16
7842  000b 42            	mul	x,a
7843  000c 9f            	ld	a,xl
7844  000d 1a03          	or	a,(OFST+2,sp)
7845  000f 6b01          	ld	(OFST+0,sp),a
7847  0011 c652ba        	ld	a,21178
7848  0014 a40c          	and	a,#12
7849  0016 1a01          	or	a,(OFST+0,sp)
7850  0018 c752ba        	ld	21178,a
7851                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7853  001b 7b02          	ld	a,(OFST+1,sp)
7854  001d 2706          	jreq	L5504
7855                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7857  001f 721a52bd      	bset	21181,#5
7859  0023 2004          	jra	L7504
7860  0025               L5504:
7861                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7863  0025 721b52bd      	bres	21181,#5
7864  0029               L7504:
7865                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7867  0029 721852bd      	bset	21181,#4
7868                     ; 2682 }
7871  002d 5b03          	addw	sp,#3
7872  002f 87            	retf	
7917                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7917                     ; 2699 {
7918                     .text:	section	.text,new
7919  0000               L7f_TI3_Config:
7921  0000 89            	pushw	x
7922  0001 88            	push	a
7923       00000001      OFST:	set	1
7926                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7928  0002 721152be      	bres	21182,#0
7929                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7929                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7931  0006 7b07          	ld	a,(OFST+6,sp)
7932  0008 97            	ld	xl,a
7933  0009 a610          	ld	a,#16
7934  000b 42            	mul	x,a
7935  000c 9f            	ld	a,xl
7936  000d 1a03          	or	a,(OFST+2,sp)
7937  000f 6b01          	ld	(OFST+0,sp),a
7939  0011 c652bb        	ld	a,21179
7940  0014 a40c          	and	a,#12
7941  0016 1a01          	or	a,(OFST+0,sp)
7942  0018 c752bb        	ld	21179,a
7943                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7945  001b 7b02          	ld	a,(OFST+1,sp)
7946  001d 2706          	jreq	L1014
7947                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7949  001f 721252be      	bset	21182,#1
7951  0023 2004          	jra	L3014
7952  0025               L1014:
7953                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7955  0025 721352be      	bres	21182,#1
7956  0029               L3014:
7957                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7959  0029 721052be      	bset	21182,#0
7960                     ; 2718 }
7963  002d 5b03          	addw	sp,#3
7964  002f 87            	retf	
8009                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8009                     ; 2734 {
8010                     .text:	section	.text,new
8011  0000               L11f_TI4_Config:
8013  0000 89            	pushw	x
8014  0001 88            	push	a
8015       00000001      OFST:	set	1
8018                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8020  0002 721952be      	bres	21182,#4
8021                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8021                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8023  0006 7b07          	ld	a,(OFST+6,sp)
8024  0008 97            	ld	xl,a
8025  0009 a610          	ld	a,#16
8026  000b 42            	mul	x,a
8027  000c 9f            	ld	a,xl
8028  000d 1a03          	or	a,(OFST+2,sp)
8029  000f 6b01          	ld	(OFST+0,sp),a
8031  0011 c652bc        	ld	a,21180
8032  0014 a40c          	and	a,#12
8033  0016 1a01          	or	a,(OFST+0,sp)
8034  0018 c752bc        	ld	21180,a
8035                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8037  001b 7b02          	ld	a,(OFST+1,sp)
8038  001d 2706          	jreq	L5214
8039                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8041  001f 721a52be      	bset	21182,#5
8043  0023 2004          	jra	L7214
8044  0025               L5214:
8045                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8047  0025 721b52be      	bres	21182,#5
8048  0029               L7214:
8049                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8051  0029 721852be      	bset	21182,#4
8052                     ; 2755 }
8055  002d 5b03          	addw	sp,#3
8056  002f 87            	retf	
8068                     	xdef	f_TIM1_SelectHallSensor
8069                     	xdef	f_TIM1_EncoderInterfaceConfig
8070                     	xdef	f_TIM1_ETRConfig
8071                     	xdef	f_TIM1_SelectMasterSlaveMode
8072                     	xdef	f_TIM1_SelectSlaveMode
8073                     	xdef	f_TIM1_SelectOutputTrigger
8074                     	xdef	f_TIM1_SelectInputTrigger
8075                     	xdef	f_TIM1_ETRClockMode2Config
8076                     	xdef	f_TIM1_ETRClockMode1Config
8077                     	xdef	f_TIM1_TIxExternalClockConfig
8078                     	xdef	f_TIM1_InternalClockConfig
8079                     	xdef	f_TIM1_SelectCCDMA
8080                     	xdef	f_TIM1_DMACmd
8081                     	xdef	f_TIM1_DMAConfig
8082                     	xdef	f_TIM1_ClearITPendingBit
8083                     	xdef	f_TIM1_GetITStatus
8084                     	xdef	f_TIM1_ClearFlag
8085                     	xdef	f_TIM1_GetFlagStatus
8086                     	xdef	f_TIM1_GenerateEvent
8087                     	xdef	f_TIM1_ITConfig
8088                     	xdef	f_TIM1_SetIC4Prescaler
8089                     	xdef	f_TIM1_SetIC3Prescaler
8090                     	xdef	f_TIM1_SetIC2Prescaler
8091                     	xdef	f_TIM1_SetIC1Prescaler
8092                     	xdef	f_TIM1_GetCapture4
8093                     	xdef	f_TIM1_GetCapture3
8094                     	xdef	f_TIM1_GetCapture2
8095                     	xdef	f_TIM1_GetCapture1
8096                     	xdef	f_TIM1_PWMIConfig
8097                     	xdef	f_TIM1_ICInit
8098                     	xdef	f_TIM1_CCxNCmd
8099                     	xdef	f_TIM1_CCxCmd
8100                     	xdef	f_TIM1_SelectCOM
8101                     	xdef	f_TIM1_SelectOCREFClear
8102                     	xdef	f_TIM1_OC3NPolarityConfig
8103                     	xdef	f_TIM1_OC3PolarityConfig
8104                     	xdef	f_TIM1_OC2NPolarityConfig
8105                     	xdef	f_TIM1_OC2PolarityConfig
8106                     	xdef	f_TIM1_OC1NPolarityConfig
8107                     	xdef	f_TIM1_OC1PolarityConfig
8108                     	xdef	f_TIM1_ClearOC4Ref
8109                     	xdef	f_TIM1_ClearOC3Ref
8110                     	xdef	f_TIM1_ClearOC2Ref
8111                     	xdef	f_TIM1_ClearOC1Ref
8112                     	xdef	f_TIM1_OC3FastConfig
8113                     	xdef	f_TIM1_OC2FastConfig
8114                     	xdef	f_TIM1_OC1FastConfig
8115                     	xdef	f_TIM1_OC4PreloadConfig
8116                     	xdef	f_TIM1_OC3PreloadConfig
8117                     	xdef	f_TIM1_OC2PreloadConfig
8118                     	xdef	f_TIM1_OC1PreloadConfig
8119                     	xdef	f_TIM1_ForcedOC3Config
8120                     	xdef	f_TIM1_ForcedOC2Config
8121                     	xdef	f_TIM1_ForcedOC1Config
8122                     	xdef	f_TIM1_CCPreloadControl
8123                     	xdef	f_TIM1_SetCompare4
8124                     	xdef	f_TIM1_SetCompare3
8125                     	xdef	f_TIM1_SetCompare2
8126                     	xdef	f_TIM1_SetCompare1
8127                     	xdef	f_TIM1_SelectOCxM
8128                     	xdef	f_TIM1_CtrlPWMOutputs
8129                     	xdef	f_TIM1_BDTRConfig
8130                     	xdef	f_TIM1_OC3Init
8131                     	xdef	f_TIM1_OC2Init
8132                     	xdef	f_TIM1_OC1Init
8133                     	xdef	f_TIM1_Cmd
8134                     	xdef	f_TIM1_SelectOnePulseMode
8135                     	xdef	f_TIM1_ARRPreloadConfig
8136                     	xdef	f_TIM1_UpdateRequestConfig
8137                     	xdef	f_TIM1_UpdateDisableConfig
8138                     	xdef	f_TIM1_GetPrescaler
8139                     	xdef	f_TIM1_GetCounter
8140                     	xdef	f_TIM1_SetAutoreload
8141                     	xdef	f_TIM1_SetCounter
8142                     	xdef	f_TIM1_CounterModeConfig
8143                     	xdef	f_TIM1_PrescalerConfig
8144                     	xdef	f_TIM1_TimeBaseInit
8145                     	xdef	f_TIM1_DeInit
8164                     	end
