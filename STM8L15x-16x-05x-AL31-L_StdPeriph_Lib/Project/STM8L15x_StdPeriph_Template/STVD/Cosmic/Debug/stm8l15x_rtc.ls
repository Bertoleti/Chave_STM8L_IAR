   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  99                     ; 232 ErrorStatus RTC_DeInit(void)
  99                     ; 233 {
 100                     .text:	section	.text,new
 101  0000               f_RTC_DeInit:
 103  0000 5205          	subw	sp,#5
 104       00000005      OFST:	set	5
 107                     ; 234   ErrorStatus status = ERROR;
 109                     ; 235   uint16_t wutwfcount = 0;
 111  0002 5f            	clrw	x
 112  0003 1f02          	ldw	(OFST-3,sp),x
 114                     ; 236   uint16_t recalpfcount = 0;
 116  0005 1f04          	ldw	(OFST-1,sp),x
 118                     ; 239   RTC->WPR = 0xCA;
 120  0007 35ca5159      	mov	20825,#202
 121                     ; 240   RTC->WPR = 0x53;
 123  000b 35535159      	mov	20825,#83
 124                     ; 243   if (RTC_EnterInitMode() == ERROR)
 126  000f 8d000000      	callf	f_RTC_EnterInitMode
 128  0013 4d            	tnz	a
 129  0014 260b          	jrne	L74
 130                     ; 245     status = ERROR;
 132  0016               LC002:
 134  0016 6b01          	ld	(OFST-4,sp),a
 136                     ; 247     RTC->WPR = 0xFF; 
 139  0018               L15:
 142  0018 35ff5159      	mov	20825,#255
 143                     ; 343   return (ErrorStatus)status;
 145  001c 7b01          	ld	a,(OFST-4,sp)
 148  001e 5b05          	addw	sp,#5
 149  0020 87            	retf	
 150  0021               L74:
 151                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 153  0021 725f5140      	clr	20800
 154                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 156  0025 725f5141      	clr	20801
 157                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 159  0029 725f5142      	clr	20802
 160                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 162  002d 35015144      	mov	20804,#1
 163                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 165  0031 35215145      	mov	20805,#33
 166                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 168  0035 725f5146      	clr	20806
 169                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 171  0039 725f5150      	clr	20816
 172                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 174  003d 35ff5151      	mov	20817,#255
 175                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 177  0041 357f5152      	mov	20818,#127
 178                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 180  0045 725f516c      	clr	20844
 181                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 183  0049 725f516d      	clr	20845
 184                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 186  004d 725f5148      	clr	20808
 187                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 189  0051 725f5149      	clr	20809
 190                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 192  0055 725f514a      	clr	20810
 194  0059 2007          	jra	L75
 195  005b               L35:
 196                     ; 278       wutwfcount++;
 198  005b 5c            	incw	x
 199  005c 1f02          	ldw	(OFST-3,sp),x
 201                     ; 279       RTC->ISR1 = 0;
 203  005e 725f514c      	clr	20812
 204  0062               L75:
 205                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 207  0062 7204514c07    	btjt	20812,#2,L36
 209  0067 1e02          	ldw	x,(OFST-3,sp)
 210  0069 a3ffff        	cpw	x,#65535
 211  006c 26ed          	jrne	L35
 212  006e               L36:
 213                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 215  006e 7204514c02    	btjt	20812,#2,L56
 216                     ; 284       status = ERROR;
 217                     ; 286       RTC->WPR = 0xFF; 
 219  0073 2064          	jpf	L301
 220  0075               L56:
 221                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 223  0075 725f5148      	clr	20808
 224                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 226  0079 35ff5154      	mov	20820,#255
 227                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 229  007d 35ff5155      	mov	20821,#255
 230                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 232  0081 725f515c      	clr	20828
 233                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 235  0085 725f515d      	clr	20829
 236                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 238  0089 725f515e      	clr	20830
 239                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 241  008d 725f515f      	clr	20831
 242                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 244  0091 725f5164      	clr	20836
 245                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 247  0095 725f5165      	clr	20837
 248                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 250  0099 725f5166      	clr	20838
 251                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 253  009d 725f514c      	clr	20812
 254                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 256  00a1 725f514d      	clr	20813
 257                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 259  00a5 7203514c11    	btjf	20812,#1,L17
 261  00aa 2003          	jra	L57
 262  00ac               L37:
 263                     ; 315           recalpfcount++;
 265  00ac 5c            	incw	x
 266  00ad 1f04          	ldw	(OFST-1,sp),x
 268  00af               L57:
 269                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 271  00af 7203514c07    	btjf	20812,#1,L17
 273  00b4 1e04          	ldw	x,(OFST-1,sp)
 274  00b6 a3ffff        	cpw	x,#65535
 275  00b9 26f1          	jrne	L37
 276  00bb               L17:
 277                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 279  00bb 7202514c19    	btjt	20812,#1,L301
 280                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 282  00c0 725f516a      	clr	20842
 283                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 285  00c4 725f516b      	clr	20843
 286                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 288  00c8 8d000000      	callf	f_RTC_WaitForSynchro
 290  00cc 4d            	tnz	a
 291                     ; 325           status = ERROR;
 293  00cd 2604ac160016  	jreq	LC002
 294                     ; 329           status = SUCCESS;
 296  00d3 a601          	ld	a,#1
 297  00d5 ac160016      	jpf	LC002
 298  00d9               L301:
 299                     ; 334         status = ERROR;
 302  00d9 0f01          	clr	(OFST-4,sp)
 304                     ; 338       RTC->WPR = 0xFF; 
 305  00db ac180018      	jra	L15
 404                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 404                     ; 360 {
 405                     .text:	section	.text,new
 406  0000               f_RTC_Init:
 408  0000 89            	pushw	x
 409  0001 88            	push	a
 410       00000001      OFST:	set	1
 413                     ; 361   ErrorStatus status = ERROR;
 415                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 417                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 419                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 421                     ; 369   RTC->WPR = 0xCA;
 423  0002 35ca5159      	mov	20825,#202
 424                     ; 370   RTC->WPR = 0x53;
 426  0006 35535159      	mov	20825,#83
 427                     ; 373   if (RTC_EnterInitMode() == ERROR)
 429  000a 8d000000      	callf	f_RTC_EnterInitMode
 431  000e 4d            	tnz	a
 432                     ; 375     status = ERROR;
 436  000f 2727          	jreq	L561
 437                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 439  0011 721d5148      	bres	20808,#6
 440                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 442  0015 1e02          	ldw	x,(OFST+1,sp)
 443  0017 c65148        	ld	a,20808
 444  001a fa            	or	a,(x)
 445  001b c75148        	ld	20808,a
 446                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 448  001e ee02          	ldw	x,(2,x)
 449  0020 4f            	clr	a
 450  0021 01            	rrwa	x,a
 451  0022 9f            	ld	a,xl
 452  0023 c75150        	ld	20816,a
 453                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 455  0026 1e02          	ldw	x,(OFST+1,sp)
 456  0028 e603          	ld	a,(3,x)
 457  002a c75151        	ld	20817,a
 458                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 460  002d e601          	ld	a,(1,x)
 461  002f c75152        	ld	20818,a
 462                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 464  0032 721f514c      	bres	20812,#7
 465                     ; 393     status = SUCCESS;
 467  0036 a601          	ld	a,#1
 469  0038               L561:
 470                     ; 397   RTC->WPR = 0xFF; 
 472  0038 35ff5159      	mov	20825,#255
 473                     ; 400   return (ErrorStatus)(status);
 477  003c 5b03          	addw	sp,#3
 478  003e 87            	retf	
 514                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 514                     ; 411 {
 515                     .text:	section	.text,new
 516  0000               f_RTC_StructInit:
 520                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 522  0000 7f            	clr	(x)
 523                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 525  0001 a67f          	ld	a,#127
 526  0003 e701          	ld	(1,x),a
 527                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 529  0005 90ae00ff      	ldw	y,#255
 530  0009 ef02          	ldw	(2,x),y
 531                     ; 420 }
 534  000b 87            	retf	
 589                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 589                     ; 431 {
 590                     .text:	section	.text,new
 591  0000               f_RTC_WriteProtectionCmd:
 595                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 597                     ; 435   if (NewState != DISABLE)
 599  0000 4d            	tnz	a
 600  0001 2705          	jreq	L532
 601                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 603  0003 35ff5159      	mov	20825,#255
 606  0007 87            	retf	
 607  0008               L532:
 608                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 610  0008 35ca5159      	mov	20825,#202
 611                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 613  000c 35535159      	mov	20825,#83
 614                     ; 446 }
 617  0010 87            	retf	
 659                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 659                     ; 459 {
 660                     .text:	section	.text,new
 661  0000               f_RTC_EnterInitMode:
 663       00000003      OFST:	set	3
 666                     ; 460   ErrorStatus status = ERROR;
 668                     ; 461   uint16_t initfcount = 0;
 670  0000 5f            	clrw	x
 672                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 674  0001 720c514c11    	btjt	20812,#6,L162
 675                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 677  0006 3580514c      	mov	20812,#128
 679  000a 2001          	jra	L762
 680  000c               L362:
 681                     ; 472       initfcount++;
 683  000c 5c            	incw	x
 685  000d               L762:
 686                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 688  000d 720c514c05    	btjt	20812,#6,L162
 690  0012 a3ffff        	cpw	x,#65535
 691  0015 26f5          	jrne	L362
 692  0017               L162:
 693                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 695  0017 720c514c02    	btjt	20812,#6,L572
 696                     ; 478     status = ERROR;
 698  001c 4f            	clr	a
 702  001d 87            	retf	
 703  001e               L572:
 704                     ; 482     status = SUCCESS;
 706  001e a601          	ld	a,#1
 708                     ; 485   return (ErrorStatus)status;
 712  0020 87            	retf	
 734                     ; 498 void RTC_ExitInitMode(void)
 734                     ; 499 {
 735                     .text:	section	.text,new
 736  0000               f_RTC_ExitInitMode:
 740                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 742  0000 721f514c      	bres	20812,#7
 743                     ; 502 }
 746  0004 87            	retf	
 788                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 788                     ; 528 {
 789                     .text:	section	.text,new
 790  0000               f_RTC_WaitForSynchro:
 792  0000 5203          	subw	sp,#3
 793       00000003      OFST:	set	3
 796                     ; 529   uint16_t rsfcount = 0;
 798  0002 5f            	clrw	x
 799  0003 1f02          	ldw	(OFST-1,sp),x
 801                     ; 530   ErrorStatus status = ERROR;
 803                     ; 533   RTC->WPR = 0xCA;
 805  0005 35ca5159      	mov	20825,#202
 806                     ; 534   RTC->WPR = 0x53;
 808  0009 35535159      	mov	20825,#83
 809                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 811  000d c6514c        	ld	a,20812
 812  0010 a45f          	and	a,#95
 813  0012 c7514c        	ld	20812,a
 815  0015 2003          	jra	L333
 816  0017               L133:
 817                     ; 542     rsfcount++;
 819  0017 5c            	incw	x
 820  0018 1f02          	ldw	(OFST-1,sp),x
 822  001a               L333:
 823                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 825  001a 720a514c05    	btjt	20812,#5,L733
 827  001f a3ffff        	cpw	x,#65535
 828  0022 26f3          	jrne	L133
 829  0024               L733:
 830                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 832  0024 720b514c06    	btjf	20812,#5,L143
 833                     ; 548     status = SUCCESS;
 835  0029 a601          	ld	a,#1
 836  002b 6b01          	ld	(OFST-2,sp),a
 839  002d 2002          	jra	L343
 840  002f               L143:
 841                     ; 552     status = ERROR;
 843  002f 0f01          	clr	(OFST-2,sp)
 845  0031               L343:
 846                     ; 556   RTC->WPR = 0xFF; 
 848  0031 35ff5159      	mov	20825,#255
 849                     ; 558   return (ErrorStatus)status;
 851  0035 7b01          	ld	a,(OFST-2,sp)
 854  0037 5b03          	addw	sp,#3
 855  0039 87            	retf	
 889                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 889                     ; 569 {
 890                     .text:	section	.text,new
 891  0000               f_RTC_RatioCmd:
 895                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 897                     ; 574   RTC->WPR = 0xCA;
 899  0000 35ca5159      	mov	20825,#202
 900                     ; 575   RTC->WPR = 0x53;
 902  0004 35535159      	mov	20825,#83
 903                     ; 577   if (NewState != DISABLE)
 905  0008 4d            	tnz	a
 906  0009 2706          	jreq	L363
 907                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 909  000b 721a5148      	bset	20808,#5
 911  000f 2004          	jra	L563
 912  0011               L363:
 913                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 915  0011 721b5148      	bres	20808,#5
 916  0015               L563:
 917                     ; 589   RTC->WPR = 0xFF; 
 919  0015 35ff5159      	mov	20825,#255
 920                     ; 590 }
 923  0019 87            	retf	
 958                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 958                     ; 599 {
 959                     .text:	section	.text,new
 960  0000               f_RTC_BypassShadowCmd:
 964                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 966                     ; 604   RTC->WPR = 0xCA;
 968  0000 35ca5159      	mov	20825,#202
 969                     ; 605   RTC->WPR = 0x53;
 971  0004 35535159      	mov	20825,#83
 972                     ; 607   if (NewState != DISABLE)
 974  0008 4d            	tnz	a
 975  0009 2706          	jreq	L504
 976                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 978  000b 72185148      	bset	20808,#4
 980  000f 2004          	jra	L704
 981  0011               L504:
 982                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 984  0011 72195148      	bres	20808,#4
 985  0015               L704:
 986                     ; 619   RTC->WPR = 0xFF; 
 988  0015 35ff5159      	mov	20825,#255
 989                     ; 620 }
 992  0019 87            	retf	
1137                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1137                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1137                     ; 661 {
1138                     .text:	section	.text,new
1139  0000               f_RTC_SetTime:
1141  0000 88            	push	a
1142  0001 88            	push	a
1143       00000001      OFST:	set	1
1146                     ; 662   ErrorStatus status = ERROR;
1148                     ; 663   uint8_t temp = 0;
1150                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1152                     ; 668   if (RTC_Format == RTC_Format_BIN)
1154                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1155                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1157                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1160                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1162                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1164                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1167                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1169                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1171                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1175  0002 c65148        	ld	a,20808
1176                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1178                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1180                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1182                     ; 701   RTC->WPR = 0xCA;
1184  0005 35ca5159      	mov	20825,#202
1185                     ; 702   RTC->WPR = 0x53;
1187  0009 35535159      	mov	20825,#83
1188                     ; 705   if (RTC_EnterInitMode() == ERROR)
1190  000d 8d000000      	callf	f_RTC_EnterInitMode
1192  0011 4d            	tnz	a
1193  0012 2606          	jrne	L515
1194                     ; 707     status = ERROR;
1197                     ; 709     RTC->WPR = 0xFF; 
1199  0014 35ff5159      	mov	20825,#255
1201  0018 205d          	jra	L715
1202  001a               L515:
1203                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1205  001a 720d514808    	btjf	20808,#6,L125
1206                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1208                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1210  001f 1e06          	ldw	x,(OFST+5,sp)
1211  0021 e603          	ld	a,(3,x)
1212  0023 6b01          	ld	(OFST+0,sp),a
1215  0025 2002          	jra	L325
1216  0027               L125:
1217                     ; 721       temp = 0;
1219  0027 0f01          	clr	(OFST+0,sp)
1221  0029               L325:
1222                     ; 724     if (RTC_Format != RTC_Format_BIN)
1224  0029 7b02          	ld	a,(OFST+1,sp)
1225  002b 270f          	jreq	L525
1226                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1228  002d 1e06          	ldw	x,(OFST+5,sp)
1229  002f e602          	ld	a,(2,x)
1230  0031 c75140        	ld	20800,a
1231                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1233  0034 e601          	ld	a,(1,x)
1234  0036 c75141        	ld	20801,a
1235                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1237  0039 f6            	ld	a,(x)
1239  003a 201d          	jra	L725
1240  003c               L525:
1241                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1243  003c 1e06          	ldw	x,(OFST+5,sp)
1244  003e e602          	ld	a,(2,x)
1245  0040 8d000000      	callf	L3f_ByteToBcd2
1247  0044 c75140        	ld	20800,a
1248                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1250  0047 1e06          	ldw	x,(OFST+5,sp)
1251  0049 e601          	ld	a,(1,x)
1252  004b 8d000000      	callf	L3f_ByteToBcd2
1254  004f c75141        	ld	20801,a
1255                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1257  0052 1e06          	ldw	x,(OFST+5,sp)
1258  0054 f6            	ld	a,(x)
1259  0055 8d000000      	callf	L3f_ByteToBcd2
1261  0059               L725:
1262  0059 1a01          	or	a,(OFST+0,sp)
1263  005b c75142        	ld	20802,a
1264                     ; 737     (void)(RTC->DR3);
1266  005e c65146        	ld	a,20806
1267                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1269  0061 721f514c      	bres	20812,#7
1270                     ; 743     RTC->WPR = 0xFF; 
1272  0065 35ff5159      	mov	20825,#255
1273                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1275  0069 7208514807    	btjt	20808,#4,L135
1276                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1278  006e 8d000000      	callf	f_RTC_WaitForSynchro
1280  0072 4d            	tnz	a
1281                     ; 750         status = ERROR;
1285  0073 2702          	jreq	L715
1286                     ; 754         status = SUCCESS;
1287  0075               L135:
1288                     ; 759       status = SUCCESS;
1291  0075 a601          	ld	a,#1
1293  0077               L715:
1294                     ; 763   return (ErrorStatus)status;
1298  0077 85            	popw	x
1299  0078 87            	retf	
1335                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1335                     ; 776 {
1336                     .text:	section	.text,new
1337  0000               f_RTC_TimeStructInit:
1341                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1343  0000 6f03          	clr	(3,x)
1344                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1346  0002 7f            	clr	(x)
1347                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1349  0003 6f01          	clr	(1,x)
1350                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1352  0005 6f02          	clr	(2,x)
1353                     ; 782 }
1356  0007 87            	retf	
1410                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1410                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1410                     ; 800 {
1411                     .text:	section	.text,new
1412  0000               f_RTC_GetTime:
1414  0000 88            	push	a
1415  0001 88            	push	a
1416       00000001      OFST:	set	1
1419                     ; 801   uint8_t  tmpreg = 0;
1421                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1423                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1425  0002 1e06          	ldw	x,(OFST+5,sp)
1426  0004 c65140        	ld	a,20800
1427  0007 e702          	ld	(2,x),a
1428                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1430  0009 c65141        	ld	a,20801
1431  000c e701          	ld	(1,x),a
1432                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1434  000e c65142        	ld	a,20802
1435  0011 6b01          	ld	(OFST+0,sp),a
1437                     ; 817   (void) (RTC->DR3) ;
1439  0013 c65146        	ld	a,20806
1440                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1442  0016 7b01          	ld	a,(OFST+0,sp)
1443  0018 a4bf          	and	a,#191
1444  001a f7            	ld	(x),a
1445                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1447  001b 7b01          	ld	a,(OFST+0,sp)
1448  001d a440          	and	a,#64
1449  001f e703          	ld	(3,x),a
1450                     ; 827   if (RTC_Format == RTC_Format_BIN)
1452  0021 7b02          	ld	a,(OFST+1,sp)
1453  0023 261c          	jrne	L706
1454                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1456  0025 f6            	ld	a,(x)
1457  0026 8d000000      	callf	L5f_Bcd2ToByte
1459  002a 1e06          	ldw	x,(OFST+5,sp)
1460  002c f7            	ld	(x),a
1461                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1463  002d e601          	ld	a,(1,x)
1464  002f 8d000000      	callf	L5f_Bcd2ToByte
1466  0033 1e06          	ldw	x,(OFST+5,sp)
1467  0035 e701          	ld	(1,x),a
1468                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1470  0037 e602          	ld	a,(2,x)
1471  0039 8d000000      	callf	L5f_Bcd2ToByte
1473  003d 1e06          	ldw	x,(OFST+5,sp)
1474  003f e702          	ld	(2,x),a
1475  0041               L706:
1476                     ; 834 }
1479  0041 85            	popw	x
1480  0042 87            	retf	
1525                     ; 845 uint16_t RTC_GetSubSecond(void)
1525                     ; 846 {
1526                     .text:	section	.text,new
1527  0000               f_RTC_GetSubSecond:
1529  0000 5206          	subw	sp,#6
1530       00000006      OFST:	set	6
1533                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1537                     ; 848   uint16_t ssrreg = 0;
1539                     ; 851   ssrhreg = RTC->SSRH;
1541  0002 c65157        	ld	a,20823
1542  0005 6b03          	ld	(OFST-3,sp),a
1544                     ; 852   ssrlreg = RTC->SSRL;
1546  0007 c65158        	ld	a,20824
1547  000a 6b04          	ld	(OFST-2,sp),a
1549                     ; 855   (void) (RTC->DR3);
1551  000c c65146        	ld	a,20806
1552                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1554  000f 7b04          	ld	a,(OFST-2,sp)
1555  0011 5f            	clrw	x
1556  0012 97            	ld	xl,a
1557  0013 1f01          	ldw	(OFST-5,sp),x
1559  0015 5f            	clrw	x
1560  0016 7b03          	ld	a,(OFST-3,sp)
1561  0018 97            	ld	xl,a
1562  0019 7b02          	ld	a,(OFST-4,sp)
1563  001b 01            	rrwa	x,a
1564  001c 1a01          	or	a,(OFST-5,sp)
1565  001e 01            	rrwa	x,a
1567                     ; 859   return (uint16_t)(ssrreg);
1571  001f 5b06          	addw	sp,#6
1572  0021 87            	retf	
1823                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1823                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1823                     ; 878 {
1824                     .text:	section	.text,new
1825  0000               f_RTC_SetDate:
1827  0000 88            	push	a
1828  0001 89            	pushw	x
1829       00000002      OFST:	set	2
1832                     ; 879   ErrorStatus status = ERROR;
1834                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1836  0002 4d            	tnz	a
1837  0003 2610          	jrne	L757
1839  0005 1e07          	ldw	x,(OFST+5,sp)
1840  0007 e601          	ld	a,(1,x)
1841  0009 a410          	and	a,#16
1842  000b 2708          	jreq	L757
1843                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1845  000d e601          	ld	a,(1,x)
1846  000f a4ef          	and	a,#239
1847  0011 ab0a          	add	a,#10
1848  0013 e701          	ld	(1,x),a
1849  0015               L757:
1850                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1852                     ; 888   if (RTC_Format == RTC_Format_BIN)
1854                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1856                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1858                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1860                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1862                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1865                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1867                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1869                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1871                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1873                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1875                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1877                     ; 907   RTC->WPR = 0xCA;
1879  0015 35ca5159      	mov	20825,#202
1880                     ; 908   RTC->WPR = 0x53;
1882  0019 35535159      	mov	20825,#83
1883                     ; 911   if (RTC_EnterInitMode() == ERROR)
1885  001d 8d000000      	callf	f_RTC_EnterInitMode
1887  0021 4d            	tnz	a
1888  0022 2606          	jrne	L567
1889                     ; 913     status = ERROR;
1892                     ; 915     RTC->WPR = 0xFF; 
1894  0024 35ff5159      	mov	20825,#255
1896  0028 2062          	jra	L767
1897  002a               L567:
1898                     ; 919     (void)(RTC->TR1);
1900  002a c65140        	ld	a,20800
1901                     ; 922     if (RTC_Format != RTC_Format_BIN)
1903  002d 7b03          	ld	a,(OFST+1,sp)
1904  002f 2718          	jreq	L177
1905                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1907  0031 1e07          	ldw	x,(OFST+5,sp)
1908  0033 e602          	ld	a,(2,x)
1909  0035 c75144        	ld	20804,a
1910                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1912  0038 f6            	ld	a,(x)
1913  0039 97            	ld	xl,a
1914  003a a620          	ld	a,#32
1915  003c 42            	mul	x,a
1916  003d 9f            	ld	a,xl
1917  003e 1e07          	ldw	x,(OFST+5,sp)
1918  0040 ea01          	or	a,(1,x)
1919  0042 c75145        	ld	20805,a
1920                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1922  0045 e603          	ld	a,(3,x)
1924  0047 202a          	jra	L377
1925  0049               L177:
1926                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1928  0049 1e07          	ldw	x,(OFST+5,sp)
1929  004b e602          	ld	a,(2,x)
1930  004d 8d000000      	callf	L3f_ByteToBcd2
1932  0051 c75144        	ld	20804,a
1933                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1935  0054 1e07          	ldw	x,(OFST+5,sp)
1936  0056 f6            	ld	a,(x)
1937  0057 97            	ld	xl,a
1938  0058 a620          	ld	a,#32
1939  005a 42            	mul	x,a
1940  005b 9f            	ld	a,xl
1941  005c 6b01          	ld	(OFST-1,sp),a
1943  005e 1e07          	ldw	x,(OFST+5,sp)
1944  0060 e601          	ld	a,(1,x)
1945  0062 8d000000      	callf	L3f_ByteToBcd2
1947  0066 1a01          	or	a,(OFST-1,sp)
1948  0068 c75145        	ld	20805,a
1949                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1951  006b 1e07          	ldw	x,(OFST+5,sp)
1952  006d e603          	ld	a,(3,x)
1953  006f 8d000000      	callf	L3f_ByteToBcd2
1955  0073               L377:
1956  0073 c75146        	ld	20806,a
1957                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1959  0076 721f514c      	bres	20812,#7
1960                     ; 939     RTC->WPR = 0xFF; 
1962  007a 35ff5159      	mov	20825,#255
1963                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1965  007e 7208514807    	btjt	20808,#4,L577
1966                     ; 944       if (RTC_WaitForSynchro() == ERROR)
1968  0083 8d000000      	callf	f_RTC_WaitForSynchro
1970  0087 4d            	tnz	a
1971                     ; 946         status = ERROR;
1975  0088 2702          	jreq	L767
1976                     ; 950         status = SUCCESS;
1977  008a               L577:
1978                     ; 955       status = SUCCESS;
1981  008a a601          	ld	a,#1
1983  008c               L767:
1984                     ; 959   return (ErrorStatus)status;
1988  008c 5b03          	addw	sp,#3
1989  008e 87            	retf	
2025                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2025                     ; 969 {
2026                     .text:	section	.text,new
2027  0000               f_RTC_DateStructInit:
2031                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2033  0000 a601          	ld	a,#1
2034  0002 f7            	ld	(x),a
2035                     ; 972   RTC_DateStruct->RTC_Date = 1;
2037  0003 e702          	ld	(2,x),a
2038                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2040  0005 e701          	ld	(1,x),a
2041                     ; 974   RTC_DateStruct->RTC_Year = 0;
2043  0007 6f03          	clr	(3,x)
2044                     ; 975 }
2047  0009 87            	retf	
2101                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2101                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2101                     ; 990 {
2102                     .text:	section	.text,new
2103  0000               f_RTC_GetDate:
2105  0000 88            	push	a
2106  0001 88            	push	a
2107       00000001      OFST:	set	1
2110                     ; 991   uint8_t tmpreg = 0;
2112                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2114                     ; 997   (void) (RTC->TR1) ;
2116  0002 c65140        	ld	a,20800
2117                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2119  0005 1e06          	ldw	x,(OFST+5,sp)
2120  0007 c65144        	ld	a,20804
2121  000a e702          	ld	(2,x),a
2122                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2124  000c c65145        	ld	a,20805
2125  000f 6b01          	ld	(OFST+0,sp),a
2127                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2129  0011 c65146        	ld	a,20806
2130  0014 e703          	ld	(3,x),a
2131                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2133  0016 7b01          	ld	a,(OFST+0,sp)
2134  0018 a41f          	and	a,#31
2135  001a e701          	ld	(1,x),a
2136                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2138  001c 7b01          	ld	a,(OFST+0,sp)
2139  001e 4e            	swap	a
2140  001f a40e          	and	a,#14
2141  0021 44            	srl	a
2142  0022 f7            	ld	(x),a
2143                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2145  0023 7b02          	ld	a,(OFST+1,sp)
2146  0025 261e          	jrne	L3501
2147                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2149  0027 e603          	ld	a,(3,x)
2150  0029 8d000000      	callf	L5f_Bcd2ToByte
2152  002d 1e06          	ldw	x,(OFST+5,sp)
2153  002f e703          	ld	(3,x),a
2154                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2156  0031 e601          	ld	a,(1,x)
2157  0033 8d000000      	callf	L5f_Bcd2ToByte
2159  0037 1e06          	ldw	x,(OFST+5,sp)
2160  0039 e701          	ld	(1,x),a
2161                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2163  003b e602          	ld	a,(2,x)
2164  003d 8d000000      	callf	L5f_Bcd2ToByte
2166  0041 1e06          	ldw	x,(OFST+5,sp)
2167  0043 e702          	ld	(2,x),a
2168  0045               L3501:
2169                     ; 1014 }
2172  0045 85            	popw	x
2173  0046 87            	retf	
2313                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2313                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2313                     ; 1046 {
2314                     .text:	section	.text,new
2315  0000               f_RTC_SetAlarm:
2317  0000 88            	push	a
2318  0001 5205          	subw	sp,#5
2319       00000005      OFST:	set	5
2322                     ; 1047   uint8_t tmpreg1 = 0;
2324                     ; 1048   uint8_t tmpreg2 = 0;
2326                     ; 1049   uint8_t tmpreg3 = 0;
2328                     ; 1050   uint8_t tmpreg4 = 0;
2330                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2332                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2334                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2336                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2338                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2340                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2341                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2343                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2346                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2348                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2350                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2353                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2355                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2357                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2361  0003 c65148        	ld	a,20808
2362                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2364                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2366                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2368                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2370                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2372                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2375                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2377                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2379                     ; 1108   RTC->WPR = 0xCA;
2381  0006 35ca5159      	mov	20825,#202
2382                     ; 1109   RTC->WPR = 0x53;
2384  000a 35535159      	mov	20825,#83
2385                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2387  000e 7b06          	ld	a,(OFST+1,sp)
2388  0010 2731          	jreq	L3611
2389                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2389                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2391  0012 1e0a          	ldw	x,(OFST+5,sp)
2392  0014 e604          	ld	a,(4,x)
2393  0016 a480          	and	a,#128
2394  0018 ea02          	or	a,(2,x)
2395  001a 6b02          	ld	(OFST-3,sp),a
2397                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2397                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2399  001c e604          	ld	a,(4,x)
2400  001e 48            	sll	a
2401  001f a480          	and	a,#128
2402  0021 ea01          	or	a,(1,x)
2403  0023 6b03          	ld	(OFST-2,sp),a
2405                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2405                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2405                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2407  0025 e604          	ld	a,(4,x)
2408  0027 48            	sll	a
2409  0028 48            	sll	a
2410  0029 a480          	and	a,#128
2411  002b 6b01          	ld	(OFST-4,sp),a
2413  002d e603          	ld	a,(3,x)
2414  002f fa            	or	a,(x)
2415  0030 1a01          	or	a,(OFST-4,sp)
2416  0032 6b04          	ld	(OFST-1,sp),a
2418                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2418                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2418                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2420  0034 e604          	ld	a,(4,x)
2421  0036 48            	sll	a
2422  0037 48            	sll	a
2423  0038 48            	sll	a
2424  0039 a480          	and	a,#128
2425  003b 6b01          	ld	(OFST-4,sp),a
2427  003d e605          	ld	a,(5,x)
2428  003f ea06          	or	a,(6,x)
2430  0041 204f          	jra	L5611
2431  0043               L3611:
2432                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2432                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2434  0043 1e0a          	ldw	x,(OFST+5,sp)
2435  0045 e604          	ld	a,(4,x)
2436  0047 a480          	and	a,#128
2437  0049 6b01          	ld	(OFST-4,sp),a
2439  004b e602          	ld	a,(2,x)
2440  004d 8d000000      	callf	L3f_ByteToBcd2
2442  0051 1a01          	or	a,(OFST-4,sp)
2443  0053 6b02          	ld	(OFST-3,sp),a
2445                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2445                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2447  0055 1e0a          	ldw	x,(OFST+5,sp)
2448  0057 e604          	ld	a,(4,x)
2449  0059 48            	sll	a
2450  005a a480          	and	a,#128
2451  005c 6b01          	ld	(OFST-4,sp),a
2453  005e e601          	ld	a,(1,x)
2454  0060 8d000000      	callf	L3f_ByteToBcd2
2456  0064 1a01          	or	a,(OFST-4,sp)
2457  0066 6b03          	ld	(OFST-2,sp),a
2459                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2459                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2459                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2461  0068 1e0a          	ldw	x,(OFST+5,sp)
2462  006a e604          	ld	a,(4,x)
2463  006c 48            	sll	a
2464  006d 48            	sll	a
2465  006e a480          	and	a,#128
2466  0070 6b01          	ld	(OFST-4,sp),a
2468  0072 f6            	ld	a,(x)
2469  0073 8d000000      	callf	L3f_ByteToBcd2
2471  0077 1e0a          	ldw	x,(OFST+5,sp)
2472  0079 ea03          	or	a,(3,x)
2473  007b 1a01          	or	a,(OFST-4,sp)
2474  007d 6b04          	ld	(OFST-1,sp),a
2476                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2476                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2476                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2478  007f e604          	ld	a,(4,x)
2479  0081 48            	sll	a
2480  0082 48            	sll	a
2481  0083 48            	sll	a
2482  0084 a480          	and	a,#128
2483  0086 6b01          	ld	(OFST-4,sp),a
2485  0088 e606          	ld	a,(6,x)
2486  008a 8d000000      	callf	L3f_ByteToBcd2
2488  008e 1e0a          	ldw	x,(OFST+5,sp)
2489  0090 ea05          	or	a,(5,x)
2490  0092               L5611:
2491  0092 1a01          	or	a,(OFST-4,sp)
2492  0094 6b05          	ld	(OFST+0,sp),a
2494                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2496  0096 7b02          	ld	a,(OFST-3,sp)
2497  0098 c7515c        	ld	20828,a
2498                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2500  009b 7b03          	ld	a,(OFST-2,sp)
2501  009d c7515d        	ld	20829,a
2502                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2504  00a0 7b04          	ld	a,(OFST-1,sp)
2505  00a2 c7515e        	ld	20830,a
2506                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2508  00a5 7b05          	ld	a,(OFST+0,sp)
2509  00a7 c7515f        	ld	20831,a
2510                     ; 1154   RTC->WPR = 0xFF; 
2512  00aa 35ff5159      	mov	20825,#255
2513                     ; 1155 }
2516  00ae 5b06          	addw	sp,#6
2517  00b0 87            	retf	
2554                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2554                     ; 1166 {
2555                     .text:	section	.text,new
2556  0000               f_RTC_AlarmStructInit:
2560                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2562  0000 6f03          	clr	(3,x)
2563                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2565  0002 7f            	clr	(x)
2566                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2568  0003 6f01          	clr	(1,x)
2569                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2571  0005 6f02          	clr	(2,x)
2572                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2574  0007 6f05          	clr	(5,x)
2575                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2577  0009 a601          	ld	a,#1
2578  000b e706          	ld	(6,x),a
2579                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2581  000d a6f0          	ld	a,#240
2582  000f e704          	ld	(4,x),a
2583                     ; 1179 }
2586  0011 87            	retf	
2668                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2668                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2668                     ; 1190 {
2669                     .text:	section	.text,new
2670  0000               f_RTC_GetAlarm:
2672  0000 88            	push	a
2673  0001 5204          	subw	sp,#4
2674       00000004      OFST:	set	4
2677                     ; 1191   uint8_t tmpreg1 = 0;
2679                     ; 1192   uint8_t tmpreg2 = 0;
2681                     ; 1193   uint8_t tmpreg3 = 0;
2683                     ; 1194   uint8_t tmpreg4 = 0;
2685                     ; 1195   uint8_t alarmmask = 0;
2687                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2689                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2691  0003 c6515c        	ld	a,20828
2692  0006 6b04          	ld	(OFST+0,sp),a
2694                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2696  0008 c6515d        	ld	a,20829
2697  000b 6b01          	ld	(OFST-3,sp),a
2699                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2701  000d c6515e        	ld	a,20830
2702  0010 6b02          	ld	(OFST-2,sp),a
2704                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2706  0012 c6515f        	ld	a,20831
2707  0015 6b03          	ld	(OFST-1,sp),a
2709                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2711  0017 7b04          	ld	a,(OFST+0,sp)
2712  0019 1e09          	ldw	x,(OFST+5,sp)
2713  001b a47f          	and	a,#127
2714  001d e702          	ld	(2,x),a
2715                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2717  001f 7b04          	ld	a,(OFST+0,sp)
2718  0021 a480          	and	a,#128
2719  0023 6b04          	ld	(OFST+0,sp),a
2721                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2723  0025 7b01          	ld	a,(OFST-3,sp)
2724  0027 a47f          	and	a,#127
2725  0029 e701          	ld	(1,x),a
2726                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2728  002b 7b01          	ld	a,(OFST-3,sp)
2729  002d a480          	and	a,#128
2730  002f 44            	srl	a
2731  0030 1a04          	or	a,(OFST+0,sp)
2732  0032 6b04          	ld	(OFST+0,sp),a
2734                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2736  0034 7b02          	ld	a,(OFST-2,sp)
2737  0036 a43f          	and	a,#63
2738  0038 f7            	ld	(x),a
2739                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2741  0039 7b02          	ld	a,(OFST-2,sp)
2742  003b a440          	and	a,#64
2743  003d e703          	ld	(3,x),a
2744                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2746  003f 7b02          	ld	a,(OFST-2,sp)
2747  0041 a480          	and	a,#128
2748  0043 44            	srl	a
2749  0044 44            	srl	a
2750  0045 1a04          	or	a,(OFST+0,sp)
2751  0047 6b04          	ld	(OFST+0,sp),a
2753                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2755  0049 7b03          	ld	a,(OFST-1,sp)
2756  004b a43f          	and	a,#63
2757  004d e706          	ld	(6,x),a
2758                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2760  004f 7b03          	ld	a,(OFST-1,sp)
2761  0051 a440          	and	a,#64
2762  0053 e705          	ld	(5,x),a
2763                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2765  0055 7b03          	ld	a,(OFST-1,sp)
2766  0057 a480          	and	a,#128
2767  0059 44            	srl	a
2768  005a 44            	srl	a
2769  005b 44            	srl	a
2770  005c 1a04          	or	a,(OFST+0,sp)
2771  005e 6b04          	ld	(OFST+0,sp),a
2773                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2775  0060 e704          	ld	(4,x),a
2776                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2778  0062 7b05          	ld	a,(OFST+1,sp)
2779  0064 2626          	jrne	L5421
2780                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2782  0066 f6            	ld	a,(x)
2783  0067 8d000000      	callf	L5f_Bcd2ToByte
2785  006b 1e09          	ldw	x,(OFST+5,sp)
2786  006d f7            	ld	(x),a
2787                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2789  006e e601          	ld	a,(1,x)
2790  0070 8d000000      	callf	L5f_Bcd2ToByte
2792  0074 1e09          	ldw	x,(OFST+5,sp)
2793  0076 e701          	ld	(1,x),a
2794                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2796  0078 e602          	ld	a,(2,x)
2797  007a 8d000000      	callf	L5f_Bcd2ToByte
2799  007e 1e09          	ldw	x,(OFST+5,sp)
2800  0080 e702          	ld	(2,x),a
2801                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2803  0082 e606          	ld	a,(6,x)
2804  0084 8d000000      	callf	L5f_Bcd2ToByte
2806  0088 1e09          	ldw	x,(OFST+5,sp)
2807  008a e706          	ld	(6,x),a
2808  008c               L5421:
2809                     ; 1233 }
2812  008c 5b05          	addw	sp,#5
2813  008e 87            	retf	
2874                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2874                     ; 1243 {
2875                     .text:	section	.text,new
2876  0000               f_RTC_AlarmCmd:
2878  0000 5203          	subw	sp,#3
2879       00000003      OFST:	set	3
2882                     ; 1244   __IO uint16_t alrawfcount = 0;
2884  0002 5f            	clrw	x
2885  0003 1f01          	ldw	(OFST-2,sp),x
2887                     ; 1245   ErrorStatus status = ERROR;
2889                     ; 1246   uint8_t temp1 = 0;
2891                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
2893                     ; 1252   RTC->WPR = 0xCA;
2895  0005 35ca5159      	mov	20825,#202
2896                     ; 1253   RTC->WPR = 0x53;
2898  0009 35535159      	mov	20825,#83
2899                     ; 1256   if (NewState != DISABLE)
2901  000d 4d            	tnz	a
2902  000e 2711          	jreq	L7721
2903                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2905  0010 72105149      	bset	20809,#0
2906                     ; 1259     status = SUCCESS;
2908  0014               LC006:
2910  0014 a601          	ld	a,#1
2911  0016 6b03          	ld	(OFST+0,sp),a
2914  0018               L1031:
2915                     ; 1283   RTC->WPR = 0xFF; 
2917  0018 35ff5159      	mov	20825,#255
2918                     ; 1286   return (ErrorStatus)status;
2920  001c 7b03          	ld	a,(OFST+0,sp)
2923  001e 5b03          	addw	sp,#3
2924  0020 87            	retf	
2925  0021               L7721:
2926                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2928  0021 72115149      	bres	20809,#0
2929                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2931  0025 c6514c        	ld	a,20812
2932  0028 a401          	and	a,#1
2933  002a 6b03          	ld	(OFST+0,sp),a
2936  002c 2005          	jra	L7031
2937  002e               L3031:
2938                     ; 1269       alrawfcount++;
2940  002e 1e01          	ldw	x,(OFST-2,sp)
2941  0030 5c            	incw	x
2942  0031 1f01          	ldw	(OFST-2,sp),x
2944  0033               L7031:
2945                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2947  0033 1e01          	ldw	x,(OFST-2,sp)
2948  0035 5c            	incw	x
2949  0036 2704          	jreq	L3131
2951  0038 7b03          	ld	a,(OFST+0,sp)
2952  003a 27f2          	jreq	L3031
2953  003c               L3131:
2954                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2956  003c 7200514c04    	btjt	20812,#0,L5131
2957                     ; 1274       status = ERROR;
2959  0041 0f03          	clr	(OFST+0,sp)
2962  0043 20d3          	jra	L1031
2963  0045               L5131:
2964                     ; 1278       status = SUCCESS;
2965  0045 20cd          	jpf	LC006
3161                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3161                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3161                     ; 1300 {
3162                     .text:	section	.text,new
3163  0000               f_RTC_AlarmSubSecondConfig:
3165  0000 89            	pushw	x
3166  0001 88            	push	a
3167       00000001      OFST:	set	1
3170                     ; 1301   uint8_t alarmstatus = 0;
3172                     ; 1302   ErrorStatus status = ERROR;
3174                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3176                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3178                     ; 1309   RTC->WPR = 0xCA;
3180  0002 35ca5159      	mov	20825,#202
3181                     ; 1310   RTC->WPR = 0x53;
3183  0006 35535159      	mov	20825,#83
3184                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3186  000a 720c514c26    	btjt	20812,#6,L3141
3187                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3189  000f c65149        	ld	a,20809
3190  0012 aa01          	or	a,#1
3191  0014 6b01          	ld	(OFST+0,sp),a
3193                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3195  0016 72115149      	bres	20809,#0
3196                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3198  001a 9e            	ld	a,xh
3199  001b c75164        	ld	20836,a
3200                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3202  001e 9f            	ld	a,xl
3203  001f c75165        	ld	20837,a
3204                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3206  0022 7b07          	ld	a,(OFST+6,sp)
3207  0024 c75166        	ld	20838,a
3208                     ; 1327     RTC->CR2 |= alarmstatus;
3210  0027 c65149        	ld	a,20809
3211  002a 1a01          	or	a,(OFST+0,sp)
3212  002c c75149        	ld	20809,a
3213                     ; 1329     status = SUCCESS;
3215  002f a601          	ld	a,#1
3216  0031 6b01          	ld	(OFST+0,sp),a
3219  0033 2002          	jra	L5141
3220  0035               L3141:
3221                     ; 1333     status = ERROR;
3223  0035 0f01          	clr	(OFST+0,sp)
3225  0037               L5141:
3226                     ; 1337   RTC->WPR = 0xFF; 
3228  0037 35ff5159      	mov	20825,#255
3229                     ; 1339   return (ErrorStatus)status;
3231  003b 7b01          	ld	a,(OFST+0,sp)
3234  003d 5b03          	addw	sp,#3
3235  003f 87            	retf	
3324                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3324                     ; 1370 {
3325                     .text:	section	.text,new
3326  0000               f_RTC_WakeUpClockConfig:
3328  0000 88            	push	a
3329       00000000      OFST:	set	0
3332                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3334                     ; 1376   RTC->WPR = 0xCA;
3336  0001 35ca5159      	mov	20825,#202
3337                     ; 1377   RTC->WPR = 0x53;
3339  0005 35535159      	mov	20825,#83
3340                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3342  0009 72155149      	bres	20809,#2
3343                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3345  000d c65148        	ld	a,20808
3346  0010 a4f8          	and	a,#248
3347  0012 c75148        	ld	20808,a
3348                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3350  0015 c65148        	ld	a,20808
3351  0018 1a01          	or	a,(OFST+1,sp)
3352  001a c75148        	ld	20808,a
3353                     ; 1389   RTC->WPR = 0xFF; 
3355  001d 35ff5159      	mov	20825,#255
3356                     ; 1390 }
3359  0021 84            	pop	a
3360  0022 87            	retf	
3392                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3392                     ; 1401 {
3393                     .text:	section	.text,new
3394  0000               f_RTC_SetWakeUpCounter:
3398                     ; 1403   RTC->WPR = 0xCA;
3400  0000 35ca5159      	mov	20825,#202
3401                     ; 1404   RTC->WPR = 0x53;
3403  0004 35535159      	mov	20825,#83
3404                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3406  0008 9e            	ld	a,xh
3407  0009 c75154        	ld	20820,a
3408                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3410  000c 9f            	ld	a,xl
3411  000d c75155        	ld	20821,a
3412                     ; 1412   RTC->WPR = 0xFF; 
3414  0010 35ff5159      	mov	20825,#255
3415                     ; 1413 }
3418  0014 87            	retf	
3450                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3450                     ; 1421 {
3451                     .text:	section	.text,new
3452  0000               f_RTC_GetWakeUpCounter:
3454  0000 89            	pushw	x
3455       00000002      OFST:	set	2
3458                     ; 1422   uint16_t tmpreg = 0;
3460                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3462  0001 c65154        	ld	a,20820
3463  0004 97            	ld	xl,a
3464  0005 4f            	clr	a
3465  0006 02            	rlwa	x,a
3466  0007 1f01          	ldw	(OFST-1,sp),x
3468                     ; 1426   tmpreg |= RTC->WUTRL;
3470  0009 c65155        	ld	a,20821
3471  000c 5f            	clrw	x
3472  000d 97            	ld	xl,a
3473  000e 01            	rrwa	x,a
3474  000f 1a02          	or	a,(OFST+0,sp)
3475  0011 01            	rrwa	x,a
3476  0012 1a01          	or	a,(OFST-1,sp)
3477  0014 01            	rrwa	x,a
3479                     ; 1429   return (uint16_t)tmpreg;
3483  0015 5b02          	addw	sp,#2
3484  0017 87            	retf	
3536                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3536                     ; 1441 {
3537                     .text:	section	.text,new
3538  0000               f_RTC_WakeUpCmd:
3540  0000 5203          	subw	sp,#3
3541       00000003      OFST:	set	3
3544                     ; 1442   ErrorStatus status = ERROR;
3546                     ; 1443   uint16_t wutwfcount = 0;
3548  0002 5f            	clrw	x
3549  0003 1f02          	ldw	(OFST-1,sp),x
3551                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3553                     ; 1449   RTC->WPR = 0xCA;
3555  0005 35ca5159      	mov	20825,#202
3556                     ; 1450   RTC->WPR = 0x53;
3558  0009 35535159      	mov	20825,#83
3559                     ; 1452   if (NewState != DISABLE)
3561  000d 4d            	tnz	a
3562  000e 2711          	jreq	L1351
3563                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3565  0010 72145149      	bset	20809,#2
3566                     ; 1457     status = SUCCESS;
3568  0014               LC007:
3570  0014 a601          	ld	a,#1
3571  0016 6b01          	ld	(OFST-2,sp),a
3574  0018               L3351:
3575                     ; 1482   RTC->WPR = 0xFF; 
3577  0018 35ff5159      	mov	20825,#255
3578                     ; 1485   return (ErrorStatus)status;
3580  001c 7b01          	ld	a,(OFST-2,sp)
3583  001e 5b03          	addw	sp,#3
3584  0020 87            	retf	
3585  0021               L1351:
3586                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3588  0021 72155149      	bres	20809,#2
3590  0025 2003          	jra	L7351
3591  0027               L5351:
3592                     ; 1467       wutwfcount++;
3594  0027 5c            	incw	x
3595  0028 1f02          	ldw	(OFST-1,sp),x
3597  002a               L7351:
3598                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3600  002a 7204514c05    	btjt	20812,#2,L3451
3602  002f a3ffff        	cpw	x,#65535
3603  0032 26f3          	jrne	L5351
3604  0034               L3451:
3605                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3607  0034 7204514c04    	btjt	20812,#2,L5451
3608                     ; 1473       status = ERROR;
3610  0039 0f01          	clr	(OFST-2,sp)
3613  003b 20db          	jra	L3351
3614  003d               L5451:
3615                     ; 1477       status = SUCCESS;
3616  003d 20d5          	jpf	LC007
3705                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3705                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3705                     ; 1524 {
3706                     .text:	section	.text,new
3707  0000               f_RTC_DayLightSavingConfig:
3709  0000 89            	pushw	x
3710       00000000      OFST:	set	0
3713                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3715                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3717                     ; 1530   RTC->WPR = 0xCA;
3719  0001 35ca5159      	mov	20825,#202
3720                     ; 1531   RTC->WPR = 0x53;
3722  0005 35535159      	mov	20825,#83
3723                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3725  0009 7215514a      	bres	20810,#2
3726                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3728  000d 9f            	ld	a,xl
3729  000e 1a01          	or	a,(OFST+1,sp)
3730  0010 ca514a        	or	a,20810
3731  0013 c7514a        	ld	20810,a
3732                     ; 1540   RTC->WPR = 0xFF; 
3734  0016 35ff5159      	mov	20825,#255
3735                     ; 1541 }
3738  001a 85            	popw	x
3739  001b 87            	retf	
3763                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3763                     ; 1550 {
3764                     .text:	section	.text,new
3765  0000               f_RTC_GetStoreOperation:
3769                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3771  0000 c6514a        	ld	a,20810
3772  0003 a404          	and	a,#4
3775  0005 87            	retf	
3868                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3868                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3868                     ; 1589 {
3869                     .text:	section	.text,new
3870  0000               f_RTC_OutputConfig:
3872  0000 89            	pushw	x
3873       00000000      OFST:	set	0
3876                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3878                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3880                     ; 1595   RTC->WPR = 0xCA;
3882  0001 35ca5159      	mov	20825,#202
3883                     ; 1596   RTC->WPR = 0x53;
3885  0005 35535159      	mov	20825,#83
3886                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3888  0009 c6514a        	ld	a,20810
3889  000c a48f          	and	a,#143
3890  000e c7514a        	ld	20810,a
3891                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3893  0011 9f            	ld	a,xl
3894  0012 1a01          	or	a,(OFST+1,sp)
3895  0014 ca514a        	or	a,20810
3896  0017 c7514a        	ld	20810,a
3897                     ; 1605   RTC->WPR = 0xFF; 
3899  001a 35ff5159      	mov	20825,#255
3900                     ; 1606 }
3903  001e 85            	popw	x
3904  001f 87            	retf	
3992                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
3992                     ; 1640                                    uint16_t RTC_ShiftSubFS)
3992                     ; 1641 {
3993                     .text:	section	.text,new
3994  0000               f_RTC_SynchroShiftConfig:
3996  0000 88            	push	a
3997  0001 5203          	subw	sp,#3
3998       00000003      OFST:	set	3
4001                     ; 1642   uint8_t shiftrhreg = 0;
4003                     ; 1643   ErrorStatus status = ERROR;
4005                     ; 1644   uint16_t shpfcount = 0;
4007  0003 5f            	clrw	x
4008  0004 1f02          	ldw	(OFST-1,sp),x
4010                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4012                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4014                     ; 1651   RTC->WPR = 0xCA;
4016  0006 35ca5159      	mov	20825,#202
4017                     ; 1652   RTC->WPR = 0x53;
4019  000a 35535159      	mov	20825,#83
4020                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4022  000e 7207514c0f    	btjf	20812,#3,L7271
4024  0013 2003          	jra	L3371
4025  0015               L1371:
4026                     ; 1660       shpfcount++;
4028  0015 5c            	incw	x
4029  0016 1f02          	ldw	(OFST-1,sp),x
4031  0018               L3371:
4032                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4034  0018 7207514c05    	btjf	20812,#3,L7271
4036  001d a3ffff        	cpw	x,#65535
4037  0020 26f3          	jrne	L1371
4038  0022               L7271:
4039                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4041  0022 7206514c12    	btjt	20812,#3,L1471
4042                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4044  0027 7b08          	ld	a,(OFST+5,sp)
4045  0029 1a04          	or	a,(OFST+1,sp)
4047                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4049  002b c7515a        	ld	20826,a
4050                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4052  002e 7b09          	ld	a,(OFST+6,sp)
4053  0030 c7515b        	ld	20827,a
4054                     ; 1672     status = SUCCESS;
4056  0033 a601          	ld	a,#1
4057  0035 6b01          	ld	(OFST-2,sp),a
4060  0037 2002          	jra	L3471
4061  0039               L1471:
4062                     ; 1676     status = ERROR;
4064  0039 0f01          	clr	(OFST-2,sp)
4066  003b               L3471:
4067                     ; 1680   RTC->WPR = 0xFF; 
4069  003b 35ff5159      	mov	20825,#255
4070                     ; 1682   return (ErrorStatus)(status);
4072  003f 7b01          	ld	a,(OFST-2,sp)
4075  0041 5b04          	addw	sp,#4
4076  0043 87            	retf	
4201                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4201                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4201                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4201                     ; 1721 {
4202                     .text:	section	.text,new
4203  0000               f_RTC_SmoothCalibConfig:
4205  0000 89            	pushw	x
4206  0001 5203          	subw	sp,#3
4207       00000003      OFST:	set	3
4210                     ; 1722   ErrorStatus status = ERROR;
4212                     ; 1723   uint16_t recalpfcount = 0;
4214  0003 5f            	clrw	x
4215  0004 1f02          	ldw	(OFST-1,sp),x
4217                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4219                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4221                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4223                     ; 1731   RTC->WPR = 0xCA;
4225  0006 35ca5159      	mov	20825,#202
4226                     ; 1732   RTC->WPR = 0x53;
4228  000a 35535159      	mov	20825,#83
4229                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4231  000e 7203514c0f    	btjf	20812,#1,L1202
4233  0013 2003          	jra	L5202
4234  0015               L3202:
4235                     ; 1740       recalpfcount++;
4237  0015 5c            	incw	x
4238  0016 1f02          	ldw	(OFST-1,sp),x
4240  0018               L5202:
4241                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4243  0018 7203514c05    	btjf	20812,#1,L1202
4245  001d a3ffff        	cpw	x,#65535
4246  0020 26f3          	jrne	L3202
4247  0022               L1202:
4248                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4250  0022 7202514c14    	btjt	20812,#1,L3302
4251                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4251                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4251                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4253  0027 7b04          	ld	a,(OFST+1,sp)
4254  0029 1a05          	or	a,(OFST+2,sp)
4255  002b 1a09          	or	a,(OFST+6,sp)
4256  002d c7516a        	ld	20842,a
4257                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4259  0030 7b0a          	ld	a,(OFST+7,sp)
4260  0032 c7516b        	ld	20843,a
4261                     ; 1754     status = SUCCESS;
4263  0035 a601          	ld	a,#1
4264  0037 6b01          	ld	(OFST-2,sp),a
4267  0039 2002          	jra	L5302
4268  003b               L3302:
4269                     ; 1758     status = ERROR;
4271  003b 0f01          	clr	(OFST-2,sp)
4273  003d               L5302:
4274                     ; 1762   RTC->WPR = 0xFF; 
4276  003d 35ff5159      	mov	20825,#255
4277                     ; 1764   return (ErrorStatus)(status);
4279  0041 7b01          	ld	a,(OFST-2,sp)
4282  0043 5b05          	addw	sp,#5
4283  0045 87            	retf	
4340                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4340                     ; 1791 {
4341                     .text:	section	.text,new
4342  0000               f_RTC_CalibOutputConfig:
4346                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4348                     ; 1796   RTC->WPR = 0xCA;
4350  0000 35ca5159      	mov	20825,#202
4351                     ; 1797   RTC->WPR = 0x53;
4353  0004 35535159      	mov	20825,#83
4354                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4356  0008 4d            	tnz	a
4357  0009 2706          	jreq	L5602
4358                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4360  000b 7216514a      	bset	20810,#3
4362  000f 2004          	jra	L7602
4363  0011               L5602:
4364                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4366  0011 7217514a      	bres	20810,#3
4367  0015               L7602:
4368                     ; 1811   RTC->WPR = 0xFF; 
4370  0015 35ff5159      	mov	20825,#255
4371                     ; 1812 }
4374  0019 87            	retf	
4408                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4408                     ; 1821 {
4409                     .text:	section	.text,new
4410  0000               f_RTC_CalibOutputCmd:
4414                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4416                     ; 1826   RTC->WPR = 0xCA;
4418  0000 35ca5159      	mov	20825,#202
4419                     ; 1827   RTC->WPR = 0x53;
4421  0004 35535159      	mov	20825,#83
4422                     ; 1829   if (NewState != DISABLE)
4424  0008 4d            	tnz	a
4425  0009 2706          	jreq	L7012
4426                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4428  000b 721e514a      	bset	20810,#7
4430  000f 2004          	jra	L1112
4431  0011               L7012:
4432                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4434  0011 721f514a      	bres	20810,#7
4435  0015               L1112:
4436                     ; 1841   RTC->WPR = 0xFF; 
4438  0015 35ff5159      	mov	20825,#255
4439                     ; 1842 }
4442  0019 87            	retf	
4536                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4536                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4536                     ; 1873 {
4537                     .text:	section	.text,new
4538  0000               f_RTC_TamperLevelConfig:
4540  0000 89            	pushw	x
4541       00000000      OFST:	set	0
4544                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4546                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4548                     ; 1879   RTC->WPR = 0xCA;
4550  0001 35ca5159      	mov	20825,#202
4551                     ; 1880   RTC->WPR = 0x53;
4553  0005 35535159      	mov	20825,#83
4554                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4556  0009 9f            	ld	a,xl
4557  000a 4d            	tnz	a
4558  000b 2707          	jreq	L7512
4559                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4561  000d 9e            	ld	a,xh
4562  000e 48            	sll	a
4563  000f ca516c        	or	a,20844
4565  0012 2007          	jra	L1612
4566  0014               L7512:
4567                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4569  0014 7b01          	ld	a,(OFST+1,sp)
4570  0016 48            	sll	a
4571  0017 43            	cpl	a
4572  0018 c4516c        	and	a,20844
4573  001b               L1612:
4574  001b c7516c        	ld	20844,a
4575                     ; 1894   RTC->WPR = 0xFF; 
4577  001e 35ff5159      	mov	20825,#255
4578                     ; 1895 }
4581  0022 85            	popw	x
4582  0023 87            	retf	
4655                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4655                     ; 1904 {
4656                     .text:	section	.text,new
4657  0000               f_RTC_TamperFilterConfig:
4659  0000 88            	push	a
4660       00000000      OFST:	set	0
4663                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4665                     ; 1910   RTC->WPR = 0xCA;
4667  0001 35ca5159      	mov	20825,#202
4668                     ; 1911   RTC->WPR = 0x53;
4670  0005 35535159      	mov	20825,#83
4671                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4673  0009 c6516d        	ld	a,20845
4674  000c a4e7          	and	a,#231
4675  000e c7516d        	ld	20845,a
4676                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4678  0011 c6516d        	ld	a,20845
4679  0014 1a01          	or	a,(OFST+1,sp)
4680  0016 c7516d        	ld	20845,a
4681                     ; 1920   RTC->WPR = 0xFF; 
4683  0019 35ff5159      	mov	20825,#255
4684                     ; 1922 }
4687  001d 84            	pop	a
4688  001e 87            	retf	
4800                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4800                     ; 1932 {
4801                     .text:	section	.text,new
4802  0000               f_RTC_TamperSamplingFreqConfig:
4804  0000 88            	push	a
4805       00000000      OFST:	set	0
4808                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4810                     ; 1937   RTC->WPR = 0xCA;
4812  0001 35ca5159      	mov	20825,#202
4813                     ; 1938   RTC->WPR = 0x53;
4815  0005 35535159      	mov	20825,#83
4816                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4818  0009 c6516d        	ld	a,20845
4819  000c a4f8          	and	a,#248
4820  000e c7516d        	ld	20845,a
4821                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4823  0011 c6516d        	ld	a,20845
4824  0014 1a01          	or	a,(OFST+1,sp)
4825  0016 c7516d        	ld	20845,a
4826                     ; 1947   RTC->WPR = 0xFF; 
4828  0019 35ff5159      	mov	20825,#255
4829                     ; 1948 }
4832  001d 84            	pop	a
4833  001e 87            	retf	
4915                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4915                     ; 1959 {
4916                     .text:	section	.text,new
4917  0000               f_RTC_TamperPinsPrechargeDuration:
4919  0000 88            	push	a
4920       00000000      OFST:	set	0
4923                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4925                     ; 1964   RTC->WPR = 0xCA;
4927  0001 35ca5159      	mov	20825,#202
4928                     ; 1965   RTC->WPR = 0x53;
4930  0005 35535159      	mov	20825,#83
4931                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4933  0009 c6516d        	ld	a,20845
4934  000c a41f          	and	a,#31
4935  000e c7516d        	ld	20845,a
4936                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4938  0011 c6516d        	ld	a,20845
4939  0014 1a01          	or	a,(OFST+1,sp)
4940  0016 c7516d        	ld	20845,a
4941                     ; 1974   RTC->WPR = 0xFF; 
4943  0019 35ff5159      	mov	20825,#255
4944                     ; 1975 }
4947  001d 84            	pop	a
4948  001e 87            	retf	
4992                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4992                     ; 1988                    FunctionalState NewState)
4992                     ; 1989 {
4993                     .text:	section	.text,new
4994  0000               f_RTC_TamperCmd:
4996  0000 89            	pushw	x
4997       00000000      OFST:	set	0
5000                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5002                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5004                     ; 1996   RTC->WPR = 0xCA;
5006  0001 35ca5159      	mov	20825,#202
5007                     ; 1997   RTC->WPR = 0x53;
5009  0005 35535159      	mov	20825,#83
5010                     ; 2000   if (NewState != DISABLE)
5012  0009 9f            	ld	a,xl
5013  000a 4d            	tnz	a
5014  000b 2706          	jreq	L5332
5015                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5017  000d 9e            	ld	a,xh
5018  000e ca516c        	or	a,20844
5020  0011 2006          	jra	L7332
5021  0013               L5332:
5022                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5024  0013 7b01          	ld	a,(OFST+1,sp)
5025  0015 43            	cpl	a
5026  0016 c4516c        	and	a,20844
5027  0019               L7332:
5028  0019 c7516c        	ld	20844,a
5029                     ; 2013   RTC->WPR = 0xFF; 
5031  001c 35ff5159      	mov	20825,#255
5032                     ; 2014 }
5035  0020 85            	popw	x
5036  0021 87            	retf	
5107                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5107                     ; 2059 {
5108                     .text:	section	.text,new
5109  0000               f_RTC_ITConfig:
5111  0000 89            	pushw	x
5112       00000000      OFST:	set	0
5115                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5117                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5119                     ; 2065   RTC->WPR = 0xCA;
5121  0001 35ca5159      	mov	20825,#202
5122                     ; 2066   RTC->WPR = 0x53;
5124  0005 35535159      	mov	20825,#83
5125                     ; 2068   if (NewState != DISABLE)
5127  0009 7b06          	ld	a,(OFST+6,sp)
5128  000b 2712          	jreq	L5732
5129                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5131  000d 9f            	ld	a,xl
5132  000e a4f0          	and	a,#240
5133  0010 ca5149        	or	a,20809
5134  0013 c75149        	ld	20809,a
5135                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5137  0016 7b02          	ld	a,(OFST+2,sp)
5138  0018 a401          	and	a,#1
5139  001a ca516c        	or	a,20844
5141  001d 2013          	jra	L7732
5142  001f               L5732:
5143                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5145  001f 7b02          	ld	a,(OFST+2,sp)
5146  0021 a4f0          	and	a,#240
5147  0023 43            	cpl	a
5148  0024 c45149        	and	a,20809
5149  0027 c75149        	ld	20809,a
5150                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5152  002a 7b02          	ld	a,(OFST+2,sp)
5153  002c a401          	and	a,#1
5154  002e 43            	cpl	a
5155  002f c4516c        	and	a,20844
5156  0032               L7732:
5157  0032 c7516c        	ld	20844,a
5158                     ; 2082   RTC->WPR = 0xFF; 
5160  0035 35ff5159      	mov	20825,#255
5161                     ; 2083 }
5164  0039 85            	popw	x
5165  003a 87            	retf	
5334                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5334                     ; 2091 {
5335                     .text:	section	.text,new
5336  0000               f_RTC_GetFlagStatus:
5338  0000 89            	pushw	x
5339  0001 5203          	subw	sp,#3
5340       00000003      OFST:	set	3
5343                     ; 2092   FlagStatus flagstatus = RESET;
5345                     ; 2093   uint16_t tmpreg1 = 0;
5347                     ; 2094   uint16_t tmpreg2 = 0;
5349                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5351                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5353  0003 c6514c        	ld	a,20812
5354  0006 97            	ld	xl,a
5355  0007 4f            	clr	a
5356  0008 02            	rlwa	x,a
5357  0009 1f02          	ldw	(OFST-1,sp),x
5359                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5361  000b c6514d        	ld	a,20813
5362  000e 5f            	clrw	x
5363  000f 97            	ld	xl,a
5364  0010 01            	rrwa	x,a
5365  0011 1a03          	or	a,(OFST+0,sp)
5366  0013 01            	rrwa	x,a
5367  0014 1a02          	or	a,(OFST-1,sp)
5368  0016 01            	rrwa	x,a
5369  0017 1f02          	ldw	(OFST-1,sp),x
5371                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5373  0019 01            	rrwa	x,a
5374  001a 1405          	and	a,(OFST+2,sp)
5375  001c 01            	rrwa	x,a
5376  001d 1404          	and	a,(OFST+1,sp)
5377  001f 01            	rrwa	x,a
5378  0020 5d            	tnzw	x
5379  0021 2704          	jreq	L3742
5380                     ; 2106     flagstatus = SET;
5382  0023 a601          	ld	a,#1
5385  0025 2001          	jra	L5742
5386  0027               L3742:
5387                     ; 2110     flagstatus = RESET;
5389  0027 4f            	clr	a
5391  0028               L5742:
5392                     ; 2112   return (FlagStatus)flagstatus;
5396  0028 5b05          	addw	sp,#5
5397  002a 87            	retf	
5431                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5431                     ; 2123 {
5432                     .text:	section	.text,new
5433  0000               f_RTC_ClearFlag:
5435  0000 89            	pushw	x
5436       00000000      OFST:	set	0
5439                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5441                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5443  0001 9f            	ld	a,xl
5444  0002 43            	cpl	a
5445  0003 c7514d        	ld	20813,a
5446                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5448  0006 7b01          	ld	a,(OFST+1,sp)
5449  0008 43            	cpl	a
5450  0009 a47f          	and	a,#127
5451  000b c7514c        	ld	20812,a
5452                     ; 2130 }
5455  000e 85            	popw	x
5456  000f 87            	retf	
5515                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5515                     ; 2139 {
5516                     .text:	section	.text,new
5517  0000               f_RTC_GetITStatus:
5519  0000 89            	pushw	x
5520  0001 89            	pushw	x
5521       00000002      OFST:	set	2
5524                     ; 2140   ITStatus itstatus = RESET;
5526                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5530                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5532                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5534  0002 9f            	ld	a,xl
5535  0003 c45149        	and	a,20809
5536  0006 6b01          	ld	(OFST-1,sp),a
5538                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5540  0008 1e03          	ldw	x,(OFST+1,sp)
5541  000a 54            	srlw	x
5542  000b 54            	srlw	x
5543  000c 54            	srlw	x
5544  000d 54            	srlw	x
5545  000e 9f            	ld	a,xl
5546  000f c4514d        	and	a,20813
5547  0012 6b02          	ld	(OFST+0,sp),a
5549                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5551  0014 7b01          	ld	a,(OFST-1,sp)
5552  0016 2708          	jreq	L3452
5554  0018 7b02          	ld	a,(OFST+0,sp)
5555  001a 2704          	jreq	L3452
5556                     ; 2155     itstatus = SET;
5558  001c a601          	ld	a,#1
5561  001e 2001          	jra	L5452
5562  0020               L3452:
5563                     ; 2159     itstatus = RESET;
5565  0020 4f            	clr	a
5567  0021               L5452:
5568                     ; 2162   return (ITStatus)itstatus;
5572  0021 5b04          	addw	sp,#4
5573  0023 87            	retf	
5608                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5608                     ; 2173 {
5609                     .text:	section	.text,new
5610  0000               f_RTC_ClearITPendingBit:
5614                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5616                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5618  0000 54            	srlw	x
5619  0001 54            	srlw	x
5620  0002 54            	srlw	x
5621  0003 54            	srlw	x
5622  0004 9f            	ld	a,xl
5623  0005 43            	cpl	a
5624  0006 c7514d        	ld	20813,a
5625                     ; 2179 }
5628  0009 87            	retf	
5666                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5666                     ; 2203 {
5667                     .text:	section	.text,new
5668  0000               L3f_ByteToBcd2:
5670  0000 88            	push	a
5671  0001 88            	push	a
5672       00000001      OFST:	set	1
5675                     ; 2204   uint8_t bcdhigh = 0;
5677  0002 0f01          	clr	(OFST+0,sp)
5680  0004 7b02          	ld	a,(OFST+1,sp)
5681  0006 2006          	jra	L7062
5682  0008               L3062:
5683                     ; 2208     bcdhigh++;
5685  0008 0c01          	inc	(OFST+0,sp)
5687                     ; 2209     Value -= 10;
5689  000a a00a          	sub	a,#10
5690  000c 6b02          	ld	(OFST+1,sp),a
5691  000e               L7062:
5692                     ; 2206   while (Value >= 10)
5694  000e a10a          	cp	a,#10
5695  0010 24f6          	jruge	L3062
5696                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5698  0012 7b01          	ld	a,(OFST+0,sp)
5699  0014 97            	ld	xl,a
5700  0015 a610          	ld	a,#16
5701  0017 42            	mul	x,a
5702  0018 9f            	ld	a,xl
5703  0019 1a02          	or	a,(OFST+1,sp)
5706  001b 85            	popw	x
5707  001c 87            	retf	
5745                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5745                     ; 2221 {
5746                     .text:	section	.text,new
5747  0000               L5f_Bcd2ToByte:
5749  0000 88            	push	a
5750  0001 88            	push	a
5751       00000001      OFST:	set	1
5754                     ; 2222   uint8_t tmp = 0;
5756                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5758  0002 4e            	swap	a
5759  0003 a40f          	and	a,#15
5760  0005 97            	ld	xl,a
5761  0006 a60a          	ld	a,#10
5762  0008 42            	mul	x,a
5763  0009 9f            	ld	a,xl
5764  000a 6b01          	ld	(OFST+0,sp),a
5766                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5768  000c 7b02          	ld	a,(OFST+1,sp)
5769  000e a40f          	and	a,#15
5770  0010 1b01          	add	a,(OFST+0,sp)
5773  0012 85            	popw	x
5774  0013 87            	retf	
5786                     	xdef	f_RTC_ClearITPendingBit
5787                     	xdef	f_RTC_GetITStatus
5788                     	xdef	f_RTC_ClearFlag
5789                     	xdef	f_RTC_GetFlagStatus
5790                     	xdef	f_RTC_ITConfig
5791                     	xdef	f_RTC_TamperCmd
5792                     	xdef	f_RTC_TamperPinsPrechargeDuration
5793                     	xdef	f_RTC_TamperSamplingFreqConfig
5794                     	xdef	f_RTC_TamperFilterConfig
5795                     	xdef	f_RTC_TamperLevelConfig
5796                     	xdef	f_RTC_CalibOutputCmd
5797                     	xdef	f_RTC_CalibOutputConfig
5798                     	xdef	f_RTC_SmoothCalibConfig
5799                     	xdef	f_RTC_SynchroShiftConfig
5800                     	xdef	f_RTC_OutputConfig
5801                     	xdef	f_RTC_GetStoreOperation
5802                     	xdef	f_RTC_DayLightSavingConfig
5803                     	xdef	f_RTC_WakeUpCmd
5804                     	xdef	f_RTC_GetWakeUpCounter
5805                     	xdef	f_RTC_SetWakeUpCounter
5806                     	xdef	f_RTC_WakeUpClockConfig
5807                     	xdef	f_RTC_AlarmSubSecondConfig
5808                     	xdef	f_RTC_AlarmCmd
5809                     	xdef	f_RTC_GetAlarm
5810                     	xdef	f_RTC_AlarmStructInit
5811                     	xdef	f_RTC_SetAlarm
5812                     	xdef	f_RTC_GetDate
5813                     	xdef	f_RTC_DateStructInit
5814                     	xdef	f_RTC_SetDate
5815                     	xdef	f_RTC_GetSubSecond
5816                     	xdef	f_RTC_GetTime
5817                     	xdef	f_RTC_TimeStructInit
5818                     	xdef	f_RTC_SetTime
5819                     	xdef	f_RTC_BypassShadowCmd
5820                     	xdef	f_RTC_RatioCmd
5821                     	xdef	f_RTC_WaitForSynchro
5822                     	xdef	f_RTC_ExitInitMode
5823                     	xdef	f_RTC_EnterInitMode
5824                     	xdef	f_RTC_WriteProtectionCmd
5825                     	xdef	f_RTC_StructInit
5826                     	xdef	f_RTC_Init
5827                     	xdef	f_RTC_DeInit
5846                     	end
