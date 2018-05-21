   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 168 void TIM3_DeInit(void)
  50                     ; 169 {
  51                     .text:	section	.text,new
  52  0000               f_TIM3_DeInit:
  56                     ; 170   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5280      	clr	21120
  59                     ; 171   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5281      	clr	21121
  62                     ; 172   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5282      	clr	21122
  65                     ; 173   TIM3->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5283      	clr	21123
  68                     ; 174   TIM3->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5285      	clr	21125
  71                     ; 175   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5287      	clr	21127
  74                     ; 178   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f528b      	clr	21131
  77                     ; 180   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  79  001c 35015289      	mov	21129,#1
  80                     ; 181   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  82  0020 3501528a      	mov	21130,#1
  83                     ; 184   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f528b      	clr	21131
  86                     ; 185   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5289      	clr	21129
  89                     ; 186   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f528a      	clr	21130
  92                     ; 188   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f528c      	clr	21132
  95                     ; 189   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f528d      	clr	21133
  98                     ; 191   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f528e      	clr	21134
 101                     ; 193   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff528f      	mov	21135,#255
 104                     ; 194   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff5290      	mov	21136,#255
 107                     ; 196   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5291      	clr	21137
 110                     ; 197   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5292      	clr	21138
 113                     ; 198   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5293      	clr	21139
 116                     ; 199   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5294      	clr	21140
 119                     ; 202   TIM3->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5296      	clr	21142
 122                     ; 203   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 124  0058 35015288      	mov	21128,#1
 125                     ; 204   TIM3->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5295      	clr	21141
 128                     ; 205   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5286      	clr	21126
 131                     ; 206 }
 134  0064 87            	retf	
 293                     ; 231 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 293                     ; 232                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 293                     ; 233                        uint16_t TIM3_Period)
 293                     ; 234 {
 294                     .text:	section	.text,new
 295  0000               f_TIM3_TimeBaseInit:
 297       fffffffe      OFST: set -2
 300                     ; 236   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 302                     ; 237   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 304                     ; 242   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 306  0000 7b04          	ld	a,(OFST+6,sp)
 307  0002 c7528f        	ld	21135,a
 308                     ; 243   TIM3->ARRL = (uint8_t)(TIM3_Period);
 310  0005 7b05          	ld	a,(OFST+7,sp)
 311  0007 c75290        	ld	21136,a
 312                     ; 246   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 314  000a 9e            	ld	a,xh
 315  000b c7528e        	ld	21134,a
 316                     ; 249   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 318  000e c65280        	ld	a,21120
 319  0011 a48f          	and	a,#143
 320  0013 c75280        	ld	21120,a
 321                     ; 250   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 323  0016 9f            	ld	a,xl
 324  0017 ca5280        	or	a,21120
 325  001a c75280        	ld	21120,a
 326                     ; 253   TIM3->EGR = TIM3_EventSource_Update;
 328  001d 35015288      	mov	21128,#1
 329                     ; 254 }
 332  0021 87            	retf	
 399                     ; 274 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 399                     ; 275                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 399                     ; 276 {
 400                     .text:	section	.text,new
 401  0000               f_TIM3_PrescalerConfig:
 405                     ; 278   assert_param(IS_TIM3_PRESCALER(Prescaler));
 407                     ; 279   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 409                     ; 282   TIM3->PSCR = (uint8_t)(Prescaler);
 411  0000 9e            	ld	a,xh
 412  0001 c7528e        	ld	21134,a
 413                     ; 285   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 415  0004 9f            	ld	a,xl
 416  0005 4a            	dec	a
 417  0006 2605          	jrne	L541
 418                     ; 287     TIM3->EGR |= TIM_EGR_UG ;
 420  0008 72105288      	bset	21128,#0
 423  000c 87            	retf	
 424  000d               L541:
 425                     ; 291     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 427  000d 72115288      	bres	21128,#0
 428                     ; 293 }
 431  0011 87            	retf	
 473                     ; 306 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 473                     ; 307 {
 474                     .text:	section	.text,new
 475  0000               f_TIM3_CounterModeConfig:
 477  0000 88            	push	a
 478  0001 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 308   uint8_t tmpcr1 = 0;
 484                     ; 311   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 486                     ; 313   tmpcr1 = TIM3->CR1;
 488  0002 c65280        	ld	a,21120
 490                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 492  0005 a48f          	and	a,#143
 494                     ; 319   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 496  0007 1a02          	or	a,(OFST+1,sp)
 498                     ; 321   TIM3->CR1 = tmpcr1;
 500  0009 c75280        	ld	21120,a
 501                     ; 322 }
 504  000c 85            	popw	x
 505  000d 87            	retf	
 536                     ; 330 void TIM3_SetCounter(uint16_t Counter)
 536                     ; 331 {
 537                     .text:	section	.text,new
 538  0000               f_TIM3_SetCounter:
 542                     ; 334   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 544  0000 9e            	ld	a,xh
 545  0001 c7528c        	ld	21132,a
 546                     ; 335   TIM3->CNTRL = (uint8_t)(Counter);
 548  0004 9f            	ld	a,xl
 549  0005 c7528d        	ld	21133,a
 550                     ; 336 }
 553  0008 87            	retf	
 584                     ; 344 void TIM3_SetAutoreload(uint16_t Autoreload)
 584                     ; 345 {
 585                     .text:	section	.text,new
 586  0000               f_TIM3_SetAutoreload:
 590                     ; 347   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 592  0000 9e            	ld	a,xh
 593  0001 c7528f        	ld	21135,a
 594                     ; 348   TIM3->ARRL = (uint8_t)(Autoreload);
 596  0004 9f            	ld	a,xl
 597  0005 c75290        	ld	21136,a
 598                     ; 349 }
 601  0008 87            	retf	
 646                     ; 356 uint16_t TIM3_GetCounter(void)
 646                     ; 357 {
 647                     .text:	section	.text,new
 648  0000               f_TIM3_GetCounter:
 650  0000 5204          	subw	sp,#4
 651       00000004      OFST:	set	4
 654                     ; 358   uint16_t tmpcnt = 0;
 656                     ; 361   tmpcntrh = TIM3->CNTRH;
 658  0002 c6528c        	ld	a,21132
 659  0005 6b02          	ld	(OFST-2,sp),a
 661                     ; 362   tmpcntrl = TIM3->CNTRL;
 663  0007 c6528d        	ld	a,21133
 664  000a 6b01          	ld	(OFST-3,sp),a
 666                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 668  000c 5f            	clrw	x
 669  000d 97            	ld	xl,a
 670  000e 1f03          	ldw	(OFST-1,sp),x
 672                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 674  0010 5f            	clrw	x
 675  0011 7b02          	ld	a,(OFST-2,sp)
 676  0013 97            	ld	xl,a
 677  0014 7b04          	ld	a,(OFST+0,sp)
 678  0016 01            	rrwa	x,a
 679  0017 1a03          	or	a,(OFST-1,sp)
 680  0019 01            	rrwa	x,a
 682                     ; 367   return ((uint16_t)tmpcnt);
 686  001a 5b04          	addw	sp,#4
 687  001c 87            	retf	
 710                     ; 383 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 710                     ; 384 {
 711                     .text:	section	.text,new
 712  0000               f_TIM3_GetPrescaler:
 716                     ; 386   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 718  0000 c6528e        	ld	a,21134
 721  0003 87            	retf	
 776                     ; 396 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 776                     ; 397 {
 777                     .text:	section	.text,new
 778  0000               f_TIM3_UpdateDisableConfig:
 782                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 784                     ; 402   if (NewState != DISABLE)
 786  0000 4d            	tnz	a
 787  0001 2705          	jreq	L772
 788                     ; 404     TIM3->CR1 |= TIM_CR1_UDIS;
 790  0003 72125280      	bset	21120,#1
 793  0007 87            	retf	
 794  0008               L772:
 795                     ; 408     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 797  0008 72135280      	bres	21120,#1
 798                     ; 410 }
 801  000c 87            	retf	
 858                     ; 420 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 858                     ; 421 {
 859                     .text:	section	.text,new
 860  0000               f_TIM3_UpdateRequestConfig:
 864                     ; 423   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 866                     ; 426   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 868  0000 4a            	dec	a
 869  0001 2605          	jrne	L133
 870                     ; 428     TIM3->CR1 |= TIM_CR1_URS ;
 872  0003 72145280      	bset	21120,#2
 875  0007 87            	retf	
 876  0008               L133:
 877                     ; 432     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 879  0008 72155280      	bres	21120,#2
 880                     ; 434 }
 883  000c 87            	retf	
 918                     ; 442 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 918                     ; 443 {
 919                     .text:	section	.text,new
 920  0000               f_TIM3_ARRPreloadConfig:
 924                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 926                     ; 448   if (NewState != DISABLE)
 928  0000 4d            	tnz	a
 929  0001 2705          	jreq	L353
 930                     ; 450     TIM3->CR1 |= TIM_CR1_ARPE;
 932  0003 721e5280      	bset	21120,#7
 935  0007 87            	retf	
 936  0008               L353:
 937                     ; 454     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 939  0008 721f5280      	bres	21120,#7
 940                     ; 456 }
 943  000c 87            	retf	
 999                     ; 466 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
 999                     ; 467 {
1000                     .text:	section	.text,new
1001  0000               f_TIM3_SelectOnePulseMode:
1005                     ; 469   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
1007                     ; 472   if (TIM3_OPMode == TIM3_OPMode_Single)
1009  0000 4a            	dec	a
1010  0001 2605          	jrne	L504
1011                     ; 474     TIM3->CR1 |= TIM_CR1_OPM ;
1013  0003 72165280      	bset	21120,#3
1016  0007 87            	retf	
1017  0008               L504:
1018                     ; 478     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1020  0008 72175280      	bres	21120,#3
1021                     ; 480 }
1024  000c 87            	retf	
1058                     ; 488 void TIM3_Cmd(FunctionalState NewState)
1058                     ; 489 {
1059                     .text:	section	.text,new
1060  0000               f_TIM3_Cmd:
1064                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1066                     ; 494   if (NewState != DISABLE)
1068  0000 4d            	tnz	a
1069  0001 2705          	jreq	L724
1070                     ; 496     TIM3->CR1 |= TIM_CR1_CEN;
1072  0003 72105280      	bset	21120,#0
1075  0007 87            	retf	
1076  0008               L724:
1077                     ; 500     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1079  0008 72115280      	bres	21120,#0
1080                     ; 502 }
1083  000c 87            	retf	
1276                     ; 578 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1276                     ; 579                   TIM3_OutputState_TypeDef TIM3_OutputState,
1276                     ; 580                   uint16_t TIM3_Pulse,
1276                     ; 581                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1276                     ; 582                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1276                     ; 583 {
1277                     .text:	section	.text,new
1278  0000               f_TIM3_OC1Init:
1280  0000 89            	pushw	x
1281  0001 88            	push	a
1282       00000001      OFST:	set	1
1285                     ; 584   uint8_t tmpccmr1 = 0;
1287                     ; 587   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1289                     ; 588   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1291                     ; 589   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1293                     ; 590   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1295                     ; 592   tmpccmr1 = TIM3->CCMR1;
1297  0002 c65289        	ld	a,21129
1298  0005 6b01          	ld	(OFST+0,sp),a
1300                     ; 595   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1302  0007 7211528b      	bres	21131,#0
1303                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1305  000b a48f          	and	a,#143
1306  000d 6b01          	ld	(OFST+0,sp),a
1308                     ; 600   tmpccmr1 |= (uint8_t)TIM3_OCMode;
1310  000f 9e            	ld	a,xh
1311  0010 1a01          	or	a,(OFST+0,sp)
1312  0012 6b01          	ld	(OFST+0,sp),a
1314                     ; 602   TIM3->CCMR1 = tmpccmr1;
1316  0014 c75289        	ld	21129,a
1317                     ; 605   if (TIM3_OutputState == TIM3_OutputState_Enable)
1319  0017 9f            	ld	a,xl
1320  0018 4a            	dec	a
1321  0019 2606          	jrne	L145
1322                     ; 607     TIM3->CCER1 |= TIM_CCER1_CC1E;
1324  001b 7210528b      	bset	21131,#0
1326  001f 2004          	jra	L345
1327  0021               L145:
1328                     ; 611     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1330  0021 7211528b      	bres	21131,#0
1331  0025               L345:
1332                     ; 615   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1334  0025 7b09          	ld	a,(OFST+8,sp)
1335  0027 4a            	dec	a
1336  0028 2606          	jrne	L545
1337                     ; 617     TIM3->CCER1 |= TIM_CCER1_CC1P;
1339  002a 7212528b      	bset	21131,#1
1341  002e 2004          	jra	L745
1342  0030               L545:
1343                     ; 621     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1345  0030 7213528b      	bres	21131,#1
1346  0034               L745:
1347                     ; 625   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1349  0034 7b0a          	ld	a,(OFST+9,sp)
1350  0036 4a            	dec	a
1351  0037 2606          	jrne	L155
1352                     ; 627     TIM3->OISR |= TIM_OISR_OIS1;
1354  0039 72105296      	bset	21142,#0
1356  003d 2004          	jra	L355
1357  003f               L155:
1358                     ; 631     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1360  003f 72115296      	bres	21142,#0
1361  0043               L355:
1362                     ; 635   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
1364  0043 7b07          	ld	a,(OFST+6,sp)
1365  0045 c75291        	ld	21137,a
1366                     ; 636   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
1368  0048 7b08          	ld	a,(OFST+7,sp)
1369  004a c75292        	ld	21138,a
1370                     ; 637 }
1373  004d 5b03          	addw	sp,#3
1374  004f 87            	retf	
1452                     ; 664 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1452                     ; 665                   TIM3_OutputState_TypeDef TIM3_OutputState,
1452                     ; 666                   uint16_t TIM3_Pulse,
1452                     ; 667                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1452                     ; 668                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1452                     ; 669 {
1453                     .text:	section	.text,new
1454  0000               f_TIM3_OC2Init:
1456  0000 89            	pushw	x
1457  0001 88            	push	a
1458       00000001      OFST:	set	1
1461                     ; 670   uint8_t tmpccmr2 = 0;
1463                     ; 673   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1465                     ; 674   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1467                     ; 675   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1469                     ; 676   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1471                     ; 678   tmpccmr2 = TIM3->CCMR2;
1473  0002 c6528a        	ld	a,21130
1474  0005 6b01          	ld	(OFST+0,sp),a
1476                     ; 681   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1478  0007 7219528b      	bres	21131,#4
1479                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1481  000b a48f          	and	a,#143
1482  000d 6b01          	ld	(OFST+0,sp),a
1484                     ; 687   tmpccmr2 |= (uint8_t)TIM3_OCMode;
1486  000f 9e            	ld	a,xh
1487  0010 1a01          	or	a,(OFST+0,sp)
1488  0012 6b01          	ld	(OFST+0,sp),a
1490                     ; 689   TIM3->CCMR2 = tmpccmr2;
1492  0014 c7528a        	ld	21130,a
1493                     ; 692   if (TIM3_OutputState == TIM3_OutputState_Enable)
1495  0017 9f            	ld	a,xl
1496  0018 4a            	dec	a
1497  0019 2606          	jrne	L316
1498                     ; 694     TIM3->CCER1 |= TIM_CCER1_CC2E;
1500  001b 7218528b      	bset	21131,#4
1502  001f 2004          	jra	L516
1503  0021               L316:
1504                     ; 698     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1506  0021 7219528b      	bres	21131,#4
1507  0025               L516:
1508                     ; 702   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1510  0025 7b09          	ld	a,(OFST+8,sp)
1511  0027 4a            	dec	a
1512  0028 2606          	jrne	L716
1513                     ; 704     TIM3->CCER1 |= TIM_CCER1_CC2P;
1515  002a 721a528b      	bset	21131,#5
1517  002e 2004          	jra	L126
1518  0030               L716:
1519                     ; 708     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1521  0030 721b528b      	bres	21131,#5
1522  0034               L126:
1523                     ; 713   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1525  0034 7b0a          	ld	a,(OFST+9,sp)
1526  0036 4a            	dec	a
1527  0037 2606          	jrne	L326
1528                     ; 715     TIM3->OISR |= TIM_OISR_OIS2;
1530  0039 72145296      	bset	21142,#2
1532  003d 2004          	jra	L526
1533  003f               L326:
1534                     ; 719     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1536  003f 72155296      	bres	21142,#2
1537  0043               L526:
1538                     ; 723   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
1540  0043 7b07          	ld	a,(OFST+6,sp)
1541  0045 c75293        	ld	21139,a
1542                     ; 724   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
1544  0048 7b08          	ld	a,(OFST+7,sp)
1545  004a c75294        	ld	21140,a
1546                     ; 725 }
1549  004d 5b03          	addw	sp,#3
1550  004f 87            	retf	
1747                     ; 754 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1747                     ; 755                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1747                     ; 756                     TIM3_BreakState_TypeDef TIM3_BreakState,
1747                     ; 757                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1747                     ; 758                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1747                     ; 759 
1747                     ; 760 {
1748                     .text:	section	.text,new
1749  0000               f_TIM3_BKRConfig:
1751  0000 89            	pushw	x
1752  0001 88            	push	a
1753       00000001      OFST:	set	1
1756                     ; 762   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1758                     ; 763   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1760                     ; 764   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1762                     ; 765   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1764                     ; 766   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1766                     ; 772   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1766                     ; 773                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1766                     ; 774                                   TIM3_AutomaticOutput));
1768  0002 7b07          	ld	a,(OFST+6,sp)
1769  0004 1a08          	or	a,(OFST+7,sp)
1770  0006 6b01          	ld	(OFST+0,sp),a
1772  0008 9f            	ld	a,xl
1773  0009 1a02          	or	a,(OFST+1,sp)
1774  000b 1a01          	or	a,(OFST+0,sp)
1775  000d 1a09          	or	a,(OFST+8,sp)
1776  000f c75295        	ld	21141,a
1777                     ; 775 }
1780  0012 5b03          	addw	sp,#3
1781  0014 87            	retf	
1816                     ; 783 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1816                     ; 784 {
1817                     .text:	section	.text,new
1818  0000               f_TIM3_CtrlPWMOutputs:
1822                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1824                     ; 790   if (NewState != DISABLE)
1826  0000 4d            	tnz	a
1827  0001 2705          	jreq	L757
1828                     ; 792     TIM3->BKR |= TIM_BKR_MOE ;
1830  0003 721e5295      	bset	21141,#7
1833  0007 87            	retf	
1834  0008               L757:
1835                     ; 796     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1837  0008 721f5295      	bres	21141,#7
1838                     ; 798 }
1841  000c 87            	retf	
1905                     ; 818 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
1905                     ; 819                      TIM3_OCMode_TypeDef TIM3_OCMode)
1905                     ; 820 {
1906                     .text:	section	.text,new
1907  0000               f_TIM3_SelectOCxM:
1909  0000 89            	pushw	x
1910       00000000      OFST:	set	0
1913                     ; 822   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1915                     ; 823   assert_param(IS_TIM3_OCM(TIM3_OCMode));
1917                     ; 825   if (TIM3_Channel == TIM3_Channel_1)
1919  0001 9e            	ld	a,xh
1920  0002 4d            	tnz	a
1921  0003 2615          	jrne	L5101
1922                     ; 828     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1924  0005 7211528b      	bres	21131,#0
1925                     ; 831     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1927  0009 c65289        	ld	a,21129
1928  000c a48f          	and	a,#143
1929  000e c75289        	ld	21129,a
1930                     ; 834     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
1932  0011 9f            	ld	a,xl
1933  0012 ca5289        	or	a,21129
1934  0015 c75289        	ld	21129,a
1936  0018 2014          	jra	L7101
1937  001a               L5101:
1938                     ; 839     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1940  001a 7219528b      	bres	21131,#4
1941                     ; 842     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1943  001e c6528a        	ld	a,21130
1944  0021 a48f          	and	a,#143
1945  0023 c7528a        	ld	21130,a
1946                     ; 845     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
1948  0026 c6528a        	ld	a,21130
1949  0029 1a02          	or	a,(OFST+2,sp)
1950  002b c7528a        	ld	21130,a
1951  002e               L7101:
1952                     ; 847 }
1955  002e 85            	popw	x
1956  002f 87            	retf	
1987                     ; 855 void TIM3_SetCompare1(uint16_t Compare)
1987                     ; 856 {
1988                     .text:	section	.text,new
1989  0000               f_TIM3_SetCompare1:
1993                     ; 858   TIM3->CCR1H = (uint8_t)(Compare >> 8);
1995  0000 9e            	ld	a,xh
1996  0001 c75291        	ld	21137,a
1997                     ; 859   TIM3->CCR1L = (uint8_t)(Compare);
1999  0004 9f            	ld	a,xl
2000  0005 c75292        	ld	21138,a
2001                     ; 860 }
2004  0008 87            	retf	
2035                     ; 868 void TIM3_SetCompare2(uint16_t Compare)
2035                     ; 869 {
2036                     .text:	section	.text,new
2037  0000               f_TIM3_SetCompare2:
2041                     ; 871   TIM3->CCR2H = (uint8_t)(Compare >> 8);
2043  0000 9e            	ld	a,xh
2044  0001 c75293        	ld	21139,a
2045                     ; 872   TIM3->CCR2L = (uint8_t)(Compare);
2047  0004 9f            	ld	a,xl
2048  0005 c75294        	ld	21140,a
2049                     ; 873 }
2052  0008 87            	retf	
2116                     ; 883 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2116                     ; 884 {
2117                     .text:	section	.text,new
2118  0000               f_TIM3_ForcedOC1Config:
2120  0000 88            	push	a
2121  0001 88            	push	a
2122       00000001      OFST:	set	1
2125                     ; 885   uint8_t tmpccmr1 = 0;
2127                     ; 888   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2129                     ; 890   tmpccmr1 = TIM3->CCMR1;
2131  0002 c65289        	ld	a,21129
2133                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2135  0005 a48f          	and	a,#143
2137                     ; 896   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
2139  0007 1a02          	or	a,(OFST+1,sp)
2141                     ; 898   TIM3->CCMR1 = tmpccmr1;
2143  0009 c75289        	ld	21129,a
2144                     ; 899 }
2147  000c 85            	popw	x
2148  000d 87            	retf	
2190                     ; 909 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2190                     ; 910 {
2191                     .text:	section	.text,new
2192  0000               f_TIM3_ForcedOC2Config:
2194  0000 88            	push	a
2195  0001 88            	push	a
2196       00000001      OFST:	set	1
2199                     ; 911   uint8_t tmpccmr2 = 0;
2201                     ; 914   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2203                     ; 916   tmpccmr2 = TIM3->CCMR2;
2205  0002 c6528a        	ld	a,21130
2207                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2209  0005 a48f          	and	a,#143
2211                     ; 922   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
2213  0007 1a02          	or	a,(OFST+1,sp)
2215                     ; 924   TIM3->CCMR2 = tmpccmr2;
2217  0009 c7528a        	ld	21130,a
2218                     ; 925 }
2221  000c 85            	popw	x
2222  000d 87            	retf	
2257                     ; 933 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2257                     ; 934 {
2258                     .text:	section	.text,new
2259  0000               f_TIM3_OC1PreloadConfig:
2263                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2265                     ; 939   if (NewState != DISABLE)
2267  0000 4d            	tnz	a
2268  0001 2705          	jreq	L7311
2269                     ; 941     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
2271  0003 72165289      	bset	21129,#3
2274  0007 87            	retf	
2275  0008               L7311:
2276                     ; 945     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2278  0008 72175289      	bres	21129,#3
2279                     ; 947 }
2282  000c 87            	retf	
2317                     ; 955 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2317                     ; 956 {
2318                     .text:	section	.text,new
2319  0000               f_TIM3_OC2PreloadConfig:
2323                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2325                     ; 961   if (NewState != DISABLE)
2327  0000 4d            	tnz	a
2328  0001 2705          	jreq	L1611
2329                     ; 963     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
2331  0003 7216528a      	bset	21130,#3
2334  0007 87            	retf	
2335  0008               L1611:
2336                     ; 967     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2338  0008 7217528a      	bres	21130,#3
2339                     ; 969 }
2342  000c 87            	retf	
2376                     ; 977 void TIM3_OC1FastConfig(FunctionalState NewState)
2376                     ; 978 {
2377                     .text:	section	.text,new
2378  0000               f_TIM3_OC1FastConfig:
2382                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2384                     ; 983   if (NewState != DISABLE)
2386  0000 4d            	tnz	a
2387  0001 2705          	jreq	L3021
2388                     ; 985     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
2390  0003 72145289      	bset	21129,#2
2393  0007 87            	retf	
2394  0008               L3021:
2395                     ; 989     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2397  0008 72155289      	bres	21129,#2
2398                     ; 991 }
2401  000c 87            	retf	
2435                     ; 1000 void TIM3_OC2FastConfig(FunctionalState NewState)
2435                     ; 1001 {
2436                     .text:	section	.text,new
2437  0000               f_TIM3_OC2FastConfig:
2441                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2443                     ; 1006   if (NewState != DISABLE)
2445  0000 4d            	tnz	a
2446  0001 2705          	jreq	L5221
2447                     ; 1008     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
2449  0003 7214528a      	bset	21130,#2
2452  0007 87            	retf	
2453  0008               L5221:
2454                     ; 1012     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2456  0008 7215528a      	bres	21130,#2
2457                     ; 1014 }
2460  000c 87            	retf	
2495                     ; 1024 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2495                     ; 1025 {
2496                     .text:	section	.text,new
2497  0000               f_TIM3_OC1PolarityConfig:
2501                     ; 1027   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2503                     ; 1030   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2505  0000 4a            	dec	a
2506  0001 2605          	jrne	L7421
2507                     ; 1032     TIM3->CCER1 |= TIM_CCER1_CC1P ;
2509  0003 7212528b      	bset	21131,#1
2512  0007 87            	retf	
2513  0008               L7421:
2514                     ; 1036     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2516  0008 7213528b      	bres	21131,#1
2517                     ; 1038 }
2520  000c 87            	retf	
2555                     ; 1048 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2555                     ; 1049 {
2556                     .text:	section	.text,new
2557  0000               f_TIM3_OC2PolarityConfig:
2561                     ; 1051   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2563                     ; 1054   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2565  0000 4a            	dec	a
2566  0001 2605          	jrne	L1721
2567                     ; 1056     TIM3->CCER1 |= TIM_CCER1_CC2P ;
2569  0003 721a528b      	bset	21131,#5
2572  0007 87            	retf	
2573  0008               L1721:
2574                     ; 1060     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2576  0008 721b528b      	bres	21131,#5
2577                     ; 1062 }
2580  000c 87            	retf	
2624                     ; 1074 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
2624                     ; 1075                  FunctionalState NewState)
2624                     ; 1076 {
2625                     .text:	section	.text,new
2626  0000               f_TIM3_CCxCmd:
2628  0000 89            	pushw	x
2629       00000000      OFST:	set	0
2632                     ; 1078   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2634                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2636                     ; 1081   if (TIM3_Channel == TIM3_Channel_1)
2638  0001 9e            	ld	a,xh
2639  0002 4d            	tnz	a
2640  0003 2610          	jrne	L7131
2641                     ; 1084     if (NewState != DISABLE)
2643  0005 9f            	ld	a,xl
2644  0006 4d            	tnz	a
2645  0007 2706          	jreq	L1231
2646                     ; 1086       TIM3->CCER1 |= TIM_CCER1_CC1E ;
2648  0009 7210528b      	bset	21131,#0
2650  000d 2014          	jra	L5231
2651  000f               L1231:
2652                     ; 1090       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2654  000f 7211528b      	bres	21131,#0
2655  0013 200e          	jra	L5231
2656  0015               L7131:
2657                     ; 1097     if (NewState != DISABLE)
2659  0015 7b02          	ld	a,(OFST+2,sp)
2660  0017 2706          	jreq	L7231
2661                     ; 1099       TIM3->CCER1 |= TIM_CCER1_CC2E;
2663  0019 7218528b      	bset	21131,#4
2665  001d 2004          	jra	L5231
2666  001f               L7231:
2667                     ; 1103       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2669  001f 7219528b      	bres	21131,#4
2670  0023               L5231:
2671                     ; 1106 }
2674  0023 85            	popw	x
2675  0024 87            	retf	
2836                     ; 1184 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
2836                     ; 1185                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2836                     ; 1186                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
2836                     ; 1187                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2836                     ; 1188                  uint8_t TIM3_ICFilter)
2836                     ; 1189 {
2837                     .text:	section	.text,new
2838  0000               f_TIM3_ICInit:
2840  0000 89            	pushw	x
2841       00000000      OFST:	set	0
2844                     ; 1191   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2846                     ; 1193   if (TIM3_Channel == TIM3_Channel_1)
2848  0001 9e            	ld	a,xh
2849  0002 4d            	tnz	a
2850  0003 2616          	jrne	L5241
2851                     ; 1196     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2853  0005 7b08          	ld	a,(OFST+8,sp)
2854  0007 88            	push	a
2855  0008 7b07          	ld	a,(OFST+7,sp)
2856  000a 97            	ld	xl,a
2857  000b 7b03          	ld	a,(OFST+3,sp)
2858  000d 95            	ld	xh,a
2859  000e 8d000000      	callf	L3f_TI1_Config
2861  0012 84            	pop	a
2862                     ; 1199     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
2864  0013 7b07          	ld	a,(OFST+7,sp)
2865  0015 8d000000      	callf	f_TIM3_SetIC1Prescaler
2868  0019 2014          	jra	L7241
2869  001b               L5241:
2870                     ; 1204     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2872  001b 7b08          	ld	a,(OFST+8,sp)
2873  001d 88            	push	a
2874  001e 7b07          	ld	a,(OFST+7,sp)
2875  0020 97            	ld	xl,a
2876  0021 7b03          	ld	a,(OFST+3,sp)
2877  0023 95            	ld	xh,a
2878  0024 8d000000      	callf	L5f_TI2_Config
2880  0028 84            	pop	a
2881                     ; 1207     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
2883  0029 7b07          	ld	a,(OFST+7,sp)
2884  002b 8d000000      	callf	f_TIM3_SetIC2Prescaler
2886  002f               L7241:
2887                     ; 1209 }
2890  002f 85            	popw	x
2891  0030 87            	retf	
2980                     ; 1235 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
2980                     ; 1236                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2980                     ; 1237                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
2980                     ; 1238                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2980                     ; 1239                      uint8_t TIM3_ICFilter)
2980                     ; 1240 {
2981                     .text:	section	.text,new
2982  0000               f_TIM3_PWMIConfig:
2984  0000 89            	pushw	x
2985  0001 89            	pushw	x
2986       00000002      OFST:	set	2
2989                     ; 1241   uint8_t icpolarity = TIM3_ICPolarity_Rising;
2991                     ; 1242   uint8_t icselection = TIM3_ICSelection_DirectTI;
2993                     ; 1245   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2995                     ; 1248   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
2997  0002 9f            	ld	a,xl
2998  0003 4d            	tnz	a
2999  0004 2605          	jrne	L1741
3000                     ; 1250     icpolarity = TIM3_ICPolarity_Falling;
3002  0006 4c            	inc	a
3003  0007 6b01          	ld	(OFST-1,sp),a
3006  0009 2002          	jra	L3741
3007  000b               L1741:
3008                     ; 1254     icpolarity = TIM3_ICPolarity_Rising;
3010  000b 0f01          	clr	(OFST-1,sp)
3012  000d               L3741:
3013                     ; 1258   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
3015  000d 7b08          	ld	a,(OFST+6,sp)
3016  000f 4a            	dec	a
3017  0010 2604          	jrne	L5741
3018                     ; 1260     icselection = TIM3_ICSelection_IndirectTI;
3020  0012 a602          	ld	a,#2
3022  0014 2002          	jra	L7741
3023  0016               L5741:
3024                     ; 1264     icselection = TIM3_ICSelection_DirectTI;
3026  0016 a601          	ld	a,#1
3027  0018               L7741:
3028  0018 6b02          	ld	(OFST+0,sp),a
3030                     ; 1267   if (TIM3_Channel == TIM3_Channel_1)
3032  001a 7b03          	ld	a,(OFST+1,sp)
3033  001c 262a          	jrne	L1051
3034                     ; 1270     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
3034                     ; 1271                TIM3_ICFilter);
3036  001e 7b0a          	ld	a,(OFST+8,sp)
3037  0020 88            	push	a
3038  0021 7b09          	ld	a,(OFST+7,sp)
3039  0023 97            	ld	xl,a
3040  0024 7b05          	ld	a,(OFST+3,sp)
3041  0026 95            	ld	xh,a
3042  0027 8d000000      	callf	L3f_TI1_Config
3044  002b 84            	pop	a
3045                     ; 1274     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3047  002c 7b09          	ld	a,(OFST+7,sp)
3048  002e 8d000000      	callf	f_TIM3_SetIC1Prescaler
3050                     ; 1277     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3052  0032 7b0a          	ld	a,(OFST+8,sp)
3053  0034 88            	push	a
3054  0035 7b03          	ld	a,(OFST+1,sp)
3055  0037 97            	ld	xl,a
3056  0038 7b02          	ld	a,(OFST+0,sp)
3057  003a 95            	ld	xh,a
3058  003b 8d000000      	callf	L5f_TI2_Config
3060  003f 84            	pop	a
3061                     ; 1280     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3063  0040 7b09          	ld	a,(OFST+7,sp)
3064  0042 8d000000      	callf	f_TIM3_SetIC2Prescaler
3067  0046 2028          	jra	L3051
3068  0048               L1051:
3069                     ; 1285     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
3069                     ; 1286                TIM3_ICFilter);
3071  0048 7b0a          	ld	a,(OFST+8,sp)
3072  004a 88            	push	a
3073  004b 7b09          	ld	a,(OFST+7,sp)
3074  004d 97            	ld	xl,a
3075  004e 7b05          	ld	a,(OFST+3,sp)
3076  0050 95            	ld	xh,a
3077  0051 8d000000      	callf	L5f_TI2_Config
3079  0055 84            	pop	a
3080                     ; 1289     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3082  0056 7b09          	ld	a,(OFST+7,sp)
3083  0058 8d000000      	callf	f_TIM3_SetIC2Prescaler
3085                     ; 1292     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3087  005c 7b0a          	ld	a,(OFST+8,sp)
3088  005e 88            	push	a
3089  005f 7b03          	ld	a,(OFST+1,sp)
3090  0061 97            	ld	xl,a
3091  0062 7b02          	ld	a,(OFST+0,sp)
3092  0064 95            	ld	xh,a
3093  0065 8d000000      	callf	L3f_TI1_Config
3095  0069 84            	pop	a
3096                     ; 1295     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3098  006a 7b09          	ld	a,(OFST+7,sp)
3099  006c 8d000000      	callf	f_TIM3_SetIC1Prescaler
3101  0070               L3051:
3102                     ; 1297 }
3105  0070 5b04          	addw	sp,#4
3106  0072 87            	retf	
3151                     ; 1304 uint16_t TIM3_GetCapture1(void)
3151                     ; 1305 {
3152                     .text:	section	.text,new
3153  0000               f_TIM3_GetCapture1:
3155  0000 5204          	subw	sp,#4
3156       00000004      OFST:	set	4
3159                     ; 1306   uint16_t tmpccr1 = 0;
3161                     ; 1309   tmpccr1h = TIM3->CCR1H;
3163  0002 c65291        	ld	a,21137
3164  0005 6b02          	ld	(OFST-2,sp),a
3166                     ; 1310   tmpccr1l = TIM3->CCR1L;
3168  0007 c65292        	ld	a,21138
3169  000a 6b01          	ld	(OFST-3,sp),a
3171                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3173  000c 5f            	clrw	x
3174  000d 97            	ld	xl,a
3175  000e 1f03          	ldw	(OFST-1,sp),x
3177                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3179  0010 5f            	clrw	x
3180  0011 7b02          	ld	a,(OFST-2,sp)
3181  0013 97            	ld	xl,a
3182  0014 7b04          	ld	a,(OFST+0,sp)
3183  0016 01            	rrwa	x,a
3184  0017 1a03          	or	a,(OFST-1,sp)
3185  0019 01            	rrwa	x,a
3187                     ; 1315   return ((uint16_t)tmpccr1);
3191  001a 5b04          	addw	sp,#4
3192  001c 87            	retf	
3237                     ; 1323 uint16_t TIM3_GetCapture2(void)
3237                     ; 1324 {
3238                     .text:	section	.text,new
3239  0000               f_TIM3_GetCapture2:
3241  0000 5204          	subw	sp,#4
3242       00000004      OFST:	set	4
3245                     ; 1325   uint16_t tmpccr2 = 0;
3247                     ; 1328   tmpccr2h = TIM3->CCR2H;
3249  0002 c65293        	ld	a,21139
3250  0005 6b02          	ld	(OFST-2,sp),a
3252                     ; 1329   tmpccr2l = TIM3->CCR2L;
3254  0007 c65294        	ld	a,21140
3255  000a 6b01          	ld	(OFST-3,sp),a
3257                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3259  000c 5f            	clrw	x
3260  000d 97            	ld	xl,a
3261  000e 1f03          	ldw	(OFST-1,sp),x
3263                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3265  0010 5f            	clrw	x
3266  0011 7b02          	ld	a,(OFST-2,sp)
3267  0013 97            	ld	xl,a
3268  0014 7b04          	ld	a,(OFST+0,sp)
3269  0016 01            	rrwa	x,a
3270  0017 1a03          	or	a,(OFST-1,sp)
3271  0019 01            	rrwa	x,a
3273                     ; 1334   return ((uint16_t)tmpccr2);
3277  001a 5b04          	addw	sp,#4
3278  001c 87            	retf	
3320                     ; 1347 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3320                     ; 1348 {
3321                     .text:	section	.text,new
3322  0000               f_TIM3_SetIC1Prescaler:
3324  0000 88            	push	a
3325  0001 88            	push	a
3326       00000001      OFST:	set	1
3329                     ; 1349   uint8_t tmpccmr1 = 0;
3331                     ; 1352   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
3333                     ; 1354   tmpccmr1 = TIM3->CCMR1;
3335  0002 c65289        	ld	a,21129
3337                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3339  0005 a4f3          	and	a,#243
3341                     ; 1360   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
3343  0007 1a02          	or	a,(OFST+1,sp)
3345                     ; 1362   TIM3->CCMR1 = tmpccmr1;
3347  0009 c75289        	ld	21129,a
3348                     ; 1363 }
3351  000c 85            	popw	x
3352  000d 87            	retf	
3394                     ; 1375 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3394                     ; 1376 {
3395                     .text:	section	.text,new
3396  0000               f_TIM3_SetIC2Prescaler:
3398  0000 88            	push	a
3399  0001 88            	push	a
3400       00000001      OFST:	set	1
3403                     ; 1377   uint8_t tmpccmr2 = 0;
3405                     ; 1380   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
3407                     ; 1382   tmpccmr2 = TIM3->CCMR2;
3409  0002 c6528a        	ld	a,21130
3411                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3413  0005 a4f3          	and	a,#243
3415                     ; 1388   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
3417  0007 1a02          	or	a,(OFST+1,sp)
3419                     ; 1390   TIM3->CCMR2 = tmpccmr2;
3421  0009 c7528a        	ld	21130,a
3422                     ; 1391 }
3425  000c 85            	popw	x
3426  000d 87            	retf	
3511                     ; 1422 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
3511                     ; 1423 {
3512                     .text:	section	.text,new
3513  0000               f_TIM3_ITConfig:
3515  0000 89            	pushw	x
3516       00000000      OFST:	set	0
3519                     ; 1425   assert_param(IS_TIM3_IT(TIM3_IT));
3521                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3523                     ; 1428   if (NewState != DISABLE)
3525  0001 9f            	ld	a,xl
3526  0002 4d            	tnz	a
3527  0003 2706          	jreq	L5461
3528                     ; 1431     TIM3->IER |= (uint8_t)TIM3_IT;
3530  0005 9e            	ld	a,xh
3531  0006 ca5285        	or	a,21125
3533  0009 2006          	jra	L7461
3534  000b               L5461:
3535                     ; 1436     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
3537  000b 7b01          	ld	a,(OFST+1,sp)
3538  000d 43            	cpl	a
3539  000e c45285        	and	a,21125
3540  0011               L7461:
3541  0011 c75285        	ld	21125,a
3542                     ; 1438 }
3545  0014 85            	popw	x
3546  0015 87            	retf	
3626                     ; 1451 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3626                     ; 1452 {
3627                     .text:	section	.text,new
3628  0000               f_TIM3_GenerateEvent:
3632                     ; 1454   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3634                     ; 1457   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3636  0000 ca5288        	or	a,21128
3637  0003 c75288        	ld	21128,a
3638                     ; 1458 }
3641  0006 87            	retf	
3775                     ; 1473 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3775                     ; 1474 {
3776                     .text:	section	.text,new
3777  0000               f_TIM3_GetFlagStatus:
3779  0000 89            	pushw	x
3780  0001 89            	pushw	x
3781       00000002      OFST:	set	2
3784                     ; 1475   FlagStatus bitstatus = RESET;
3786                     ; 1476   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3790                     ; 1479   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
3792                     ; 1481   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
3794  0002 9f            	ld	a,xl
3795  0003 c45286        	and	a,21126
3796  0006 6b01          	ld	(OFST-1,sp),a
3798                     ; 1482   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
3800  0008 c65287        	ld	a,21127
3801  000b 1403          	and	a,(OFST+1,sp)
3802  000d 6b02          	ld	(OFST+0,sp),a
3804                     ; 1484   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
3806  000f 1a01          	or	a,(OFST-1,sp)
3807  0011 2702          	jreq	L5671
3808                     ; 1486     bitstatus = SET;
3810  0013 a601          	ld	a,#1
3813  0015               L5671:
3814                     ; 1490     bitstatus = RESET;
3817                     ; 1492   return ((FlagStatus)bitstatus);
3821  0015 5b04          	addw	sp,#4
3822  0017 87            	retf	
3856                     ; 1506 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3856                     ; 1507 {
3857                     .text:	section	.text,new
3858  0000               f_TIM3_ClearFlag:
3860  0000 89            	pushw	x
3861       00000000      OFST:	set	0
3864                     ; 1509   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
3866                     ; 1511   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
3868  0001 9f            	ld	a,xl
3869  0002 43            	cpl	a
3870  0003 c75286        	ld	21126,a
3871                     ; 1512   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
3873  0006 7b01          	ld	a,(OFST+1,sp)
3874  0008 43            	cpl	a
3875  0009 c75287        	ld	21127,a
3876                     ; 1513 }
3879  000c 85            	popw	x
3880  000d 87            	retf	
3939                     ; 1526 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3939                     ; 1527 {
3940                     .text:	section	.text,new
3941  0000               f_TIM3_GetITStatus:
3943  0000 88            	push	a
3944  0001 89            	pushw	x
3945       00000002      OFST:	set	2
3948                     ; 1528   ITStatus bitstatus = RESET;
3950                     ; 1530   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
3954                     ; 1533   assert_param(IS_TIM3_GET_IT(TIM3_IT));
3956                     ; 1535   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
3958  0002 c45286        	and	a,21126
3959  0005 6b01          	ld	(OFST-1,sp),a
3961                     ; 1537   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
3963  0007 c65285        	ld	a,21125
3964  000a 1403          	and	a,(OFST+1,sp)
3965  000c 6b02          	ld	(OFST+0,sp),a
3967                     ; 1539   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
3969  000e 7b01          	ld	a,(OFST-1,sp)
3970  0010 2708          	jreq	L5302
3972  0012 7b02          	ld	a,(OFST+0,sp)
3973  0014 2704          	jreq	L5302
3974                     ; 1541     bitstatus = (ITStatus)SET;
3976  0016 a601          	ld	a,#1
3979  0018 2001          	jra	L7302
3980  001a               L5302:
3981                     ; 1545     bitstatus = (ITStatus)RESET;
3983  001a 4f            	clr	a
3985  001b               L7302:
3986                     ; 1547   return ((ITStatus)bitstatus);
3990  001b 5b03          	addw	sp,#3
3991  001d 87            	retf	
4026                     ; 1561 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4026                     ; 1562 {
4027                     .text:	section	.text,new
4028  0000               f_TIM3_ClearITPendingBit:
4032                     ; 1564   assert_param(IS_TIM3_IT(TIM3_IT));
4034                     ; 1567   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
4036  0000 43            	cpl	a
4037  0001 c75286        	ld	21126,a
4038                     ; 1568 }
4041  0004 87            	retf	
4113                     ; 1581 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
4113                     ; 1582 {
4114                     .text:	section	.text,new
4115  0000               f_TIM3_DMACmd:
4117  0000 89            	pushw	x
4118       00000000      OFST:	set	0
4121                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4123                     ; 1585   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
4125                     ; 1587   if (NewState != DISABLE)
4127  0001 9f            	ld	a,xl
4128  0002 4d            	tnz	a
4129  0003 2706          	jreq	L3112
4130                     ; 1590     TIM3->DER |= TIM3_DMASource;
4132  0005 9e            	ld	a,xh
4133  0006 ca5284        	or	a,21124
4135  0009 2006          	jra	L5112
4136  000b               L3112:
4137                     ; 1595     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
4139  000b 7b01          	ld	a,(OFST+1,sp)
4140  000d 43            	cpl	a
4141  000e c45284        	and	a,21124
4142  0011               L5112:
4143  0011 c75284        	ld	21124,a
4144                     ; 1597 }
4147  0014 85            	popw	x
4148  0015 87            	retf	
4182                     ; 1605 void TIM3_SelectCCDMA(FunctionalState NewState)
4182                     ; 1606 {
4183                     .text:	section	.text,new
4184  0000               f_TIM3_SelectCCDMA:
4188                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4190                     ; 1610   if (NewState != DISABLE)
4192  0000 4d            	tnz	a
4193  0001 2705          	jreq	L5312
4194                     ; 1613     TIM3->CR2 |= TIM_CR2_CCDS;
4196  0003 72165281      	bset	21121,#3
4199  0007 87            	retf	
4200  0008               L5312:
4201                     ; 1618     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4203  0008 72175281      	bres	21121,#3
4204                     ; 1620 }
4207  000c 87            	retf	
4230                     ; 1644 void TIM3_InternalClockConfig(void)
4230                     ; 1645 {
4231                     .text:	section	.text,new
4232  0000               f_TIM3_InternalClockConfig:
4236                     ; 1647   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4238  0000 c65282        	ld	a,21122
4239  0003 a4f8          	and	a,#248
4240  0005 c75282        	ld	21122,a
4241                     ; 1648 }
4244  0008 87            	retf	
4330                     ; 1665 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
4330                     ; 1666                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
4330                     ; 1667                                  uint8_t ICFilter)
4330                     ; 1668 {
4331                     .text:	section	.text,new
4332  0000               f_TIM3_TIxExternalClockConfig:
4334  0000 89            	pushw	x
4335       00000000      OFST:	set	0
4338                     ; 1670   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
4340                     ; 1671   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
4342                     ; 1672   assert_param(IS_TIM3_IC_FILTER(ICFilter));
4344                     ; 1675   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
4346  0001 9e            	ld	a,xh
4347  0002 a160          	cp	a,#96
4348  0004 260e          	jrne	L7022
4349                     ; 1677     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4351  0006 7b06          	ld	a,(OFST+6,sp)
4352  0008 88            	push	a
4353  0009 9f            	ld	a,xl
4354  000a ae0001        	ldw	x,#1
4355  000d 95            	ld	xh,a
4356  000e 8d000000      	callf	L5f_TI2_Config
4359  0012 200d          	jra	L1122
4360  0014               L7022:
4361                     ; 1681     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4363  0014 7b06          	ld	a,(OFST+6,sp)
4364  0016 88            	push	a
4365  0017 7b03          	ld	a,(OFST+3,sp)
4366  0019 ae0001        	ldw	x,#1
4367  001c 95            	ld	xh,a
4368  001d 8d000000      	callf	L3f_TI1_Config
4370  0021               L1122:
4371  0021 84            	pop	a
4372                     ; 1685   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
4374  0022 7b01          	ld	a,(OFST+1,sp)
4375  0024 8d000000      	callf	f_TIM3_SelectInputTrigger
4377                     ; 1688   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4379  0028 c65282        	ld	a,21122
4380  002b aa07          	or	a,#7
4381  002d c75282        	ld	21122,a
4382                     ; 1689 }
4385  0030 85            	popw	x
4386  0031 87            	retf	
4500                     ; 1707 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4500                     ; 1708                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4500                     ; 1709                               uint8_t ExtTRGFilter)
4500                     ; 1710 {
4501                     .text:	section	.text,new
4502  0000               f_TIM3_ETRClockMode1Config:
4504  0000 89            	pushw	x
4505       00000000      OFST:	set	0
4508                     ; 1712   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4510  0001 7b06          	ld	a,(OFST+6,sp)
4511  0003 88            	push	a
4512  0004 7b02          	ld	a,(OFST+2,sp)
4513  0006 95            	ld	xh,a
4514  0007 8d000000      	callf	f_TIM3_ETRConfig
4516  000b 84            	pop	a
4517                     ; 1715   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4519  000c c65282        	ld	a,21122
4520  000f a4f8          	and	a,#248
4521  0011 c75282        	ld	21122,a
4522                     ; 1716   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4524  0014 c65282        	ld	a,21122
4525  0017 aa07          	or	a,#7
4526  0019 c75282        	ld	21122,a
4527                     ; 1719   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4529  001c c65282        	ld	a,21122
4530  001f a48f          	and	a,#143
4531  0021 c75282        	ld	21122,a
4532                     ; 1720   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
4534  0024 c65282        	ld	a,21122
4535  0027 aa70          	or	a,#112
4536  0029 c75282        	ld	21122,a
4537                     ; 1721 }
4540  002c 85            	popw	x
4541  002d 87            	retf	
4596                     ; 1739 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4596                     ; 1740                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4596                     ; 1741                               uint8_t ExtTRGFilter)
4596                     ; 1742 {
4597                     .text:	section	.text,new
4598  0000               f_TIM3_ETRClockMode2Config:
4600  0000 89            	pushw	x
4601       00000000      OFST:	set	0
4604                     ; 1744   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4606  0001 7b06          	ld	a,(OFST+6,sp)
4607  0003 88            	push	a
4608  0004 7b02          	ld	a,(OFST+2,sp)
4609  0006 95            	ld	xh,a
4610  0007 8d000000      	callf	f_TIM3_ETRConfig
4612  000b 721c5283      	bset	21123,#6
4613                     ; 1747   TIM3->ETR |= TIM_ETR_ECE ;
4615                     ; 1748 }
4618  000f 5b03          	addw	sp,#3
4619  0011 87            	retf	
4732                     ; 1799 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
4732                     ; 1800 {
4733                     .text:	section	.text,new
4734  0000               f_TIM3_SelectInputTrigger:
4736  0000 88            	push	a
4737  0001 88            	push	a
4738       00000001      OFST:	set	1
4741                     ; 1801   uint8_t tmpsmcr = 0;
4743                     ; 1804   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
4745                     ; 1806   tmpsmcr = TIM3->SMCR;
4747  0002 c65282        	ld	a,21122
4749                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4751  0005 a48f          	and	a,#143
4753                     ; 1810   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
4755  0007 1a02          	or	a,(OFST+1,sp)
4757                     ; 1812   TIM3->SMCR = (uint8_t)tmpsmcr;
4759  0009 c75282        	ld	21122,a
4760                     ; 1813 }
4763  000c 85            	popw	x
4764  000d 87            	retf	
4860                     ; 1827 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
4860                     ; 1828 {
4861                     .text:	section	.text,new
4862  0000               f_TIM3_SelectOutputTrigger:
4864  0000 88            	push	a
4865  0001 88            	push	a
4866       00000001      OFST:	set	1
4869                     ; 1829   uint8_t tmpcr2 = 0;
4871                     ; 1832   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
4873                     ; 1834   tmpcr2 = TIM3->CR2;
4875  0002 c65281        	ld	a,21121
4877                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4879  0005 a48f          	and	a,#143
4881                     ; 1840   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
4883  0007 1a02          	or	a,(OFST+1,sp)
4885                     ; 1842   TIM3->CR2 = tmpcr2;
4887  0009 c75281        	ld	21121,a
4888                     ; 1843 }
4891  000c 85            	popw	x
4892  000d 87            	retf	
4972                     ; 1855 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
4972                     ; 1856 {
4973                     .text:	section	.text,new
4974  0000               f_TIM3_SelectSlaveMode:
4976  0000 88            	push	a
4977  0001 88            	push	a
4978       00000001      OFST:	set	1
4981                     ; 1857   uint8_t tmpsmcr = 0;
4983                     ; 1860   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
4985                     ; 1862   tmpsmcr = TIM3->SMCR;
4987  0002 c65282        	ld	a,21122
4989                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4991  0005 a4f8          	and	a,#248
4993                     ; 1868   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
4995  0007 1a02          	or	a,(OFST+1,sp)
4997                     ; 1870   TIM3->SMCR = tmpsmcr;
4999  0009 c75282        	ld	21122,a
5000                     ; 1871 }
5003  000c 85            	popw	x
5004  000d 87            	retf	
5039                     ; 1879 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
5039                     ; 1880 {
5040                     .text:	section	.text,new
5041  0000               f_TIM3_SelectMasterSlaveMode:
5045                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5047                     ; 1885   if (NewState != DISABLE)
5049  0000 4d            	tnz	a
5050  0001 2705          	jreq	L5642
5051                     ; 1887     TIM3->SMCR |= TIM_SMCR_MSM;
5053  0003 721e5282      	bset	21122,#7
5056  0007 87            	retf	
5057  0008               L5642:
5058                     ; 1891     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5060  0008 721f5282      	bres	21122,#7
5061                     ; 1893 }
5064  000c 87            	retf	
5117                     ; 1911 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
5117                     ; 1912                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
5117                     ; 1913                     uint8_t ExtTRGFilter)
5117                     ; 1914 {
5118                     .text:	section	.text,new
5119  0000               f_TIM3_ETRConfig:
5121  0000 89            	pushw	x
5122       00000000      OFST:	set	0
5125                     ; 1916   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
5127                     ; 1917   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
5129                     ; 1918   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
5131                     ; 1921   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
5131                     ; 1922                          | (uint8_t)ExtTRGFilter);
5133  0001 9f            	ld	a,xl
5134  0002 1a01          	or	a,(OFST+1,sp)
5135  0004 1a06          	or	a,(OFST+6,sp)
5136  0006 ca5283        	or	a,21123
5137  0009 c75283        	ld	21123,a
5138                     ; 1923 }
5141  000c 85            	popw	x
5142  000d 87            	retf	
5248                     ; 1958 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
5248                     ; 1959                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
5248                     ; 1960                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
5248                     ; 1961 {
5249                     .text:	section	.text,new
5250  0000               f_TIM3_EncoderInterfaceConfig:
5252  0000 89            	pushw	x
5253  0001 5203          	subw	sp,#3
5254       00000003      OFST:	set	3
5257                     ; 1962   uint8_t tmpsmcr = 0;
5259                     ; 1963   uint8_t tmpccmr1 = 0;
5261                     ; 1964   uint8_t tmpccmr2 = 0;
5263                     ; 1967   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
5265                     ; 1968   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
5267                     ; 1969   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
5269                     ; 1971   tmpsmcr = TIM3->SMCR;
5271  0003 c65282        	ld	a,21122
5272  0006 6b01          	ld	(OFST-2,sp),a
5274                     ; 1972   tmpccmr1 = TIM3->CCMR1;
5276  0008 c65289        	ld	a,21129
5277  000b 6b02          	ld	(OFST-1,sp),a
5279                     ; 1973   tmpccmr2 = TIM3->CCMR2;
5281  000d c6528a        	ld	a,21130
5282  0010 6b03          	ld	(OFST+0,sp),a
5284                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5286  0012 7b01          	ld	a,(OFST-2,sp)
5287  0014 a4f0          	and	a,#240
5288  0016 6b01          	ld	(OFST-2,sp),a
5290                     ; 1977   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
5292  0018 9e            	ld	a,xh
5293  0019 1a01          	or	a,(OFST-2,sp)
5294  001b 6b01          	ld	(OFST-2,sp),a
5296                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5298  001d 7b02          	ld	a,(OFST-1,sp)
5299  001f a4fc          	and	a,#252
5300  0021 6b02          	ld	(OFST-1,sp),a
5302                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5304  0023 7b03          	ld	a,(OFST+0,sp)
5305  0025 a4fc          	and	a,#252
5306  0027 6b03          	ld	(OFST+0,sp),a
5308                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5310  0029 7b02          	ld	a,(OFST-1,sp)
5311  002b aa01          	or	a,#1
5312  002d 6b02          	ld	(OFST-1,sp),a
5314                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5316  002f 7b03          	ld	a,(OFST+0,sp)
5317  0031 aa01          	or	a,#1
5318  0033 6b03          	ld	(OFST+0,sp),a
5320                     ; 1986   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
5322  0035 9f            	ld	a,xl
5323  0036 4a            	dec	a
5324  0037 2606          	jrne	L3652
5325                     ; 1988     TIM3->CCER1 |= TIM_CCER1_CC1P ;
5327  0039 7212528b      	bset	21131,#1
5329  003d 2004          	jra	L5652
5330  003f               L3652:
5331                     ; 1992     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5333  003f 7213528b      	bres	21131,#1
5334  0043               L5652:
5335                     ; 1995   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
5337  0043 7b09          	ld	a,(OFST+6,sp)
5338  0045 4a            	dec	a
5339  0046 2606          	jrne	L7652
5340                     ; 1997     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5342  0048 721a528b      	bset	21131,#5
5344  004c 2004          	jra	L1752
5345  004e               L7652:
5346                     ; 2001     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5348  004e 721b528b      	bres	21131,#5
5349  0052               L1752:
5350                     ; 2004   TIM3->SMCR = tmpsmcr;
5352  0052 7b01          	ld	a,(OFST-2,sp)
5353  0054 c75282        	ld	21122,a
5354                     ; 2005   TIM3->CCMR1 = tmpccmr1;
5356  0057 7b02          	ld	a,(OFST-1,sp)
5357  0059 c75289        	ld	21129,a
5358                     ; 2006   TIM3->CCMR2 = tmpccmr2;
5360  005c 7b03          	ld	a,(OFST+0,sp)
5361  005e c7528a        	ld	21130,a
5362                     ; 2007 }
5365  0061 5b05          	addw	sp,#5
5366  0063 87            	retf	
5401                     ; 2015 void TIM3_SelectHallSensor(FunctionalState NewState)
5401                     ; 2016 {
5402                     .text:	section	.text,new
5403  0000               f_TIM3_SelectHallSensor:
5407                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5409                     ; 2021   if (NewState != DISABLE)
5411  0000 4d            	tnz	a
5412  0001 2705          	jreq	L1162
5413                     ; 2023     TIM3->CR2 |= TIM_CR2_TI1S;
5415  0003 721e5281      	bset	21121,#7
5418  0007 87            	retf	
5419  0008               L1162:
5420                     ; 2027     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5422  0008 721f5281      	bres	21121,#7
5423                     ; 2029 }
5426  000c 87            	retf	
5491                     ; 2050 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
5491                     ; 2051                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
5491                     ; 2052                        uint8_t TIM3_ICFilter)
5491                     ; 2053 {
5492                     .text:	section	.text,new
5493  0000               L3f_TI1_Config:
5495  0000 89            	pushw	x
5496  0001 89            	pushw	x
5497       00000002      OFST:	set	2
5500                     ; 2054   uint8_t tmpccmr1 = 0;
5502                     ; 2055   uint8_t tmpicpolarity = TIM3_ICPolarity;
5504  0002 9e            	ld	a,xh
5505  0003 6b01          	ld	(OFST-1,sp),a
5507                     ; 2056   tmpccmr1 = TIM3->CCMR1;
5509  0005 c65289        	ld	a,21129
5510  0008 6b02          	ld	(OFST+0,sp),a
5512                     ; 2059   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5514                     ; 2060   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5516                     ; 2061   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5518                     ; 2064   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5520  000a 7211528b      	bres	21131,#0
5521                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5523  000e a40c          	and	a,#12
5524  0010 6b02          	ld	(OFST+0,sp),a
5526                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5528  0012 7b08          	ld	a,(OFST+6,sp)
5529  0014 97            	ld	xl,a
5530  0015 a610          	ld	a,#16
5531  0017 42            	mul	x,a
5532  0018 9f            	ld	a,xl
5533  0019 1a04          	or	a,(OFST+2,sp)
5534  001b 1a02          	or	a,(OFST+0,sp)
5535  001d 6b02          	ld	(OFST+0,sp),a
5537                     ; 2070   TIM3->CCMR1 = tmpccmr1;
5539  001f c75289        	ld	21129,a
5540                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5542  0022 7b01          	ld	a,(OFST-1,sp)
5543  0024 4a            	dec	a
5544  0025 2606          	jrne	L5462
5545                     ; 2075     TIM3->CCER1 |= TIM_CCER1_CC1P;
5547  0027 7212528b      	bset	21131,#1
5549  002b 2004          	jra	L7462
5550  002d               L5462:
5551                     ; 2079     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5553  002d 7213528b      	bres	21131,#1
5554  0031               L7462:
5555                     ; 2083   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5557  0031 7210528b      	bset	21131,#0
5558                     ; 2084 }
5561  0035 5b04          	addw	sp,#4
5562  0037 87            	retf	
5627                     ; 2101 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5627                     ; 2102                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5627                     ; 2103                        uint8_t TIM3_ICFilter)
5627                     ; 2104 {
5628                     .text:	section	.text,new
5629  0000               L5f_TI2_Config:
5631  0000 89            	pushw	x
5632  0001 89            	pushw	x
5633       00000002      OFST:	set	2
5636                     ; 2105   uint8_t tmpccmr2 = 0;
5638                     ; 2106   uint8_t tmpicpolarity = TIM3_ICPolarity;
5640  0002 9e            	ld	a,xh
5641  0003 6b01          	ld	(OFST-1,sp),a
5643                     ; 2109   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5645                     ; 2110   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5647                     ; 2111   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5649                     ; 2113   tmpccmr2 = TIM3->CCMR2;
5651  0005 c6528a        	ld	a,21130
5652  0008 6b02          	ld	(OFST+0,sp),a
5654                     ; 2116   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5656  000a 7219528b      	bres	21131,#4
5657                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5659  000e a40c          	and	a,#12
5660  0010 6b02          	ld	(OFST+0,sp),a
5662                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5664  0012 7b08          	ld	a,(OFST+6,sp)
5665  0014 97            	ld	xl,a
5666  0015 a610          	ld	a,#16
5667  0017 42            	mul	x,a
5668  0018 9f            	ld	a,xl
5669  0019 1a04          	or	a,(OFST+2,sp)
5670  001b 1a02          	or	a,(OFST+0,sp)
5671  001d 6b02          	ld	(OFST+0,sp),a
5673                     ; 2122   TIM3->CCMR2 = tmpccmr2;
5675  001f c7528a        	ld	21130,a
5676                     ; 2125   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5678  0022 7b01          	ld	a,(OFST-1,sp)
5679  0024 4a            	dec	a
5680  0025 2606          	jrne	L1072
5681                     ; 2127     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5683  0027 721a528b      	bset	21131,#5
5685  002b 2004          	jra	L3072
5686  002d               L1072:
5687                     ; 2131     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5689  002d 721b528b      	bres	21131,#5
5690  0031               L3072:
5691                     ; 2135   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5693  0031 7218528b      	bset	21131,#4
5694                     ; 2136 }
5697  0035 5b04          	addw	sp,#4
5698  0037 87            	retf	
5710                     	xdef	f_TIM3_SelectHallSensor
5711                     	xdef	f_TIM3_EncoderInterfaceConfig
5712                     	xdef	f_TIM3_ETRConfig
5713                     	xdef	f_TIM3_SelectMasterSlaveMode
5714                     	xdef	f_TIM3_SelectSlaveMode
5715                     	xdef	f_TIM3_SelectOutputTrigger
5716                     	xdef	f_TIM3_SelectInputTrigger
5717                     	xdef	f_TIM3_ETRClockMode2Config
5718                     	xdef	f_TIM3_ETRClockMode1Config
5719                     	xdef	f_TIM3_TIxExternalClockConfig
5720                     	xdef	f_TIM3_InternalClockConfig
5721                     	xdef	f_TIM3_SelectCCDMA
5722                     	xdef	f_TIM3_DMACmd
5723                     	xdef	f_TIM3_ClearITPendingBit
5724                     	xdef	f_TIM3_GetITStatus
5725                     	xdef	f_TIM3_ClearFlag
5726                     	xdef	f_TIM3_GetFlagStatus
5727                     	xdef	f_TIM3_GenerateEvent
5728                     	xdef	f_TIM3_ITConfig
5729                     	xdef	f_TIM3_SetIC2Prescaler
5730                     	xdef	f_TIM3_SetIC1Prescaler
5731                     	xdef	f_TIM3_GetCapture2
5732                     	xdef	f_TIM3_GetCapture1
5733                     	xdef	f_TIM3_PWMIConfig
5734                     	xdef	f_TIM3_ICInit
5735                     	xdef	f_TIM3_CCxCmd
5736                     	xdef	f_TIM3_OC2PolarityConfig
5737                     	xdef	f_TIM3_OC1PolarityConfig
5738                     	xdef	f_TIM3_OC2FastConfig
5739                     	xdef	f_TIM3_OC1FastConfig
5740                     	xdef	f_TIM3_OC2PreloadConfig
5741                     	xdef	f_TIM3_OC1PreloadConfig
5742                     	xdef	f_TIM3_ForcedOC2Config
5743                     	xdef	f_TIM3_ForcedOC1Config
5744                     	xdef	f_TIM3_SetCompare2
5745                     	xdef	f_TIM3_SetCompare1
5746                     	xdef	f_TIM3_SelectOCxM
5747                     	xdef	f_TIM3_CtrlPWMOutputs
5748                     	xdef	f_TIM3_BKRConfig
5749                     	xdef	f_TIM3_OC2Init
5750                     	xdef	f_TIM3_OC1Init
5751                     	xdef	f_TIM3_Cmd
5752                     	xdef	f_TIM3_SelectOnePulseMode
5753                     	xdef	f_TIM3_ARRPreloadConfig
5754                     	xdef	f_TIM3_UpdateRequestConfig
5755                     	xdef	f_TIM3_UpdateDisableConfig
5756                     	xdef	f_TIM3_GetPrescaler
5757                     	xdef	f_TIM3_GetCounter
5758                     	xdef	f_TIM3_SetAutoreload
5759                     	xdef	f_TIM3_SetCounter
5760                     	xdef	f_TIM3_CounterModeConfig
5761                     	xdef	f_TIM3_PrescalerConfig
5762                     	xdef	f_TIM3_TimeBaseInit
5763                     	xdef	f_TIM3_DeInit
5782                     	end
