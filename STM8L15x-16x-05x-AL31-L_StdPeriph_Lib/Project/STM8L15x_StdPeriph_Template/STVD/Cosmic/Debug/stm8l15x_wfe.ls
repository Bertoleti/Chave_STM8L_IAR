   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 95 void WFE_DeInit(void)
  50                     ; 96 {
  51                     .text:	section	.text,new
  52  0000               f_WFE_DeInit:
  56                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  58  0000 725f50a6      	clr	20646
  59                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  61  0004 725f50a7      	clr	20647
  62                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  64  0008 725f50a8      	clr	20648
  65                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  67  000c 725f50a9      	clr	20649
  68                     ; 101 }
  71  0010 87            	retf	
 392                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 392                     ; 142 {
 393                     .text:	section	.text,new
 394  0000               f_WFE_WakeUpSourceEventCmd:
 396  0000 89            	pushw	x
 397  0001 88            	push	a
 398       00000001      OFST:	set	1
 401                     ; 143   uint8_t register_index = 0;
 403                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 405                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 407                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 409  0002 9e            	ld	a,xh
 410  0003 6b01          	ld	(OFST+0,sp),a
 412                     ; 151   if (NewState != DISABLE)
 414  0005 0d07          	tnz	(OFST+6,sp)
 415  0007 2730          	jreq	L302
 416                     ; 153     switch (register_index)
 419                     ; 171       default:
 419                     ; 172         break;
 420  0009 4a            	dec	a
 421  000a 270b          	jreq	L12
 422  000c 4a            	dec	a
 423  000d 270f          	jreq	L32
 424  000f 4a            	dec	a
 425  0010 2716          	jreq	L52
 426  0012 4a            	dec	a
 427  0013 271d          	jreq	L72
 428  0015 2039          	jra	L112
 429  0017               L12:
 430                     ; 155       case 1:
 430                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 432  0017 c650a6        	ld	a,20646
 433  001a 1a03          	or	a,(OFST+2,sp)
 434                     ; 157         break;
 436  001c 202f          	jpf	LC001
 437  001e               L32:
 438                     ; 159       case 2:
 438                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 440  001e c650a7        	ld	a,20647
 441  0021 1a03          	or	a,(OFST+2,sp)
 442  0023 c750a7        	ld	20647,a
 443                     ; 161         break;
 445  0026 2028          	jra	L112
 446  0028               L52:
 447                     ; 163       case 3:
 447                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 449  0028 c650a8        	ld	a,20648
 450  002b 1a03          	or	a,(OFST+2,sp)
 451  002d c750a8        	ld	20648,a
 452                     ; 165         break;
 454  0030 201e          	jra	L112
 455  0032               L72:
 456                     ; 167       case 4:
 456                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 458  0032 c650a9        	ld	a,20649
 459  0035 1a03          	or	a,(OFST+2,sp)
 460                     ; 169         break;
 462  0037 2036          	jpf	LC002
 463                     ; 171       default:
 463                     ; 172         break;
 466  0039               L302:
 467                     ; 177     switch (register_index)
 470                     ; 195       default:
 470                     ; 196         break;
 471  0039 4a            	dec	a
 472  003a 270b          	jreq	L33
 473  003c 4a            	dec	a
 474  003d 2714          	jreq	L53
 475  003f 4a            	dec	a
 476  0040 271c          	jreq	L73
 477  0042 4a            	dec	a
 478  0043 2724          	jreq	L14
 479  0045 2009          	jra	L112
 480  0047               L33:
 481                     ; 179       case 1:
 481                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 483  0047 7b03          	ld	a,(OFST+2,sp)
 484  0049 43            	cpl	a
 485  004a c450a6        	and	a,20646
 486  004d               LC001:
 487  004d c750a6        	ld	20646,a
 488                     ; 181         break;
 489  0050               L112:
 490                     ; 199 }
 493  0050 5b03          	addw	sp,#3
 494  0052 87            	retf	
 495  0053               L53:
 496                     ; 183       case 2:
 496                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 498  0053 7b03          	ld	a,(OFST+2,sp)
 499  0055 43            	cpl	a
 500  0056 c450a7        	and	a,20647
 501  0059 c750a7        	ld	20647,a
 502                     ; 185         break;
 504  005c 20f2          	jra	L112
 505  005e               L73:
 506                     ; 187       case 3:
 506                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 508  005e 7b03          	ld	a,(OFST+2,sp)
 509  0060 43            	cpl	a
 510  0061 c450a8        	and	a,20648
 511  0064 c750a8        	ld	20648,a
 512                     ; 189         break;
 514  0067 20e7          	jra	L112
 515  0069               L14:
 516                     ; 191       case 4:
 516                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 518  0069 7b03          	ld	a,(OFST+2,sp)
 519  006b 43            	cpl	a
 520  006c c450a9        	and	a,20649
 521  006f               LC002:
 522  006f c750a9        	ld	20649,a
 523                     ; 193         break;
 525  0072 20dc          	jra	L112
 526                     ; 195       default:
 526                     ; 196         break;
 573                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 573                     ; 238 {
 574                     .text:	section	.text,new
 575  0000               f_WFE_GetWakeUpSourceEventStatus:
 577  0000 89            	pushw	x
 578  0001 88            	push	a
 579       00000001      OFST:	set	1
 582                     ; 239   FunctionalState status = DISABLE;
 584  0002 0f01          	clr	(OFST+0,sp)
 586                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 588                     ; 243   switch (WFE_Source)
 591                     ; 326     default:
 591                     ; 327       break;
 592  0004 1d0101        	subw	x,#257
 593  0007 2604ac9d009d  	jreq	L712
 594  000d 5a            	decw	x
 595  000e 27f9          	jreq	L712
 596  0010 1d0002        	subw	x,#2
 597  0013 27f4          	jreq	L712
 598  0015 1d0004        	subw	x,#4
 599  0018 27ef          	jreq	L712
 600  001a 1d0008        	subw	x,#8
 601  001d 277e          	jreq	L712
 602  001f 1d0010        	subw	x,#16
 603  0022 2779          	jreq	L712
 604  0024 1d0020        	subw	x,#32
 605  0027 2774          	jreq	L712
 606  0029 1d0040        	subw	x,#64
 607  002c 276f          	jreq	L712
 608  002e 1d0081        	subw	x,#129
 609  0031 276f          	jreq	L122
 610  0033 5a            	decw	x
 611  0034 276c          	jreq	L122
 612  0036 1d0002        	subw	x,#2
 613  0039 2767          	jreq	L122
 614  003b 1d0004        	subw	x,#4
 615  003e 2762          	jreq	L122
 616  0040 1d0008        	subw	x,#8
 617  0043 275d          	jreq	L122
 618  0045 1d0010        	subw	x,#16
 619  0048 2758          	jreq	L122
 620  004a 1d0020        	subw	x,#32
 621  004d 2753          	jreq	L122
 622  004f 1d0040        	subw	x,#64
 623  0052 274e          	jreq	L122
 624  0054 1d0081        	subw	x,#129
 625  0057 274e          	jreq	L322
 626  0059 5a            	decw	x
 627  005a 274b          	jreq	L322
 628  005c 1d0002        	subw	x,#2
 629  005f 2746          	jreq	L322
 630  0061 1d0004        	subw	x,#4
 631  0064 2741          	jreq	L322
 632  0066 1d0008        	subw	x,#8
 633  0069 273c          	jreq	L322
 634  006b 1d0010        	subw	x,#16
 635  006e 2737          	jreq	L322
 636  0070 1d0020        	subw	x,#32
 637  0073 2732          	jreq	L322
 638  0075 1d0040        	subw	x,#64
 639  0078 272d          	jreq	L322
 640  007a 1d0081        	subw	x,#129
 641  007d 2735          	jreq	L522
 642  007f 5a            	decw	x
 643  0080 2732          	jreq	L522
 644  0082 1d0002        	subw	x,#2
 645  0085 272d          	jreq	L522
 646  0087 1d0004        	subw	x,#4
 647  008a 2728          	jreq	L522
 648  008c 1d0008        	subw	x,#8
 649  008f 2723          	jreq	L522
 650  0091 1d0010        	subw	x,#16
 651  0094 271e          	jreq	L522
 652  0096 1d0020        	subw	x,#32
 653  0099 2719          	jreq	L522
 654  009b 2020          	jra	L552
 655  009d               L712:
 656                     ; 245     case WFE_Source_TIM2_EV0:
 656                     ; 246     case WFE_Source_TIM2_EV1:
 656                     ; 247     case WFE_Source_TIM1_EV0:
 656                     ; 248     case WFE_Source_TIM1_EV1:
 656                     ; 249     case WFE_Source_EXTI_EV0:
 656                     ; 250     case WFE_Source_EXTI_EV1:
 656                     ; 251     case WFE_Source_EXTI_EV2:
 656                     ; 252     case WFE_Source_EXTI_EV3:
 656                     ; 253 
 656                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 658  009d c650a6        	ld	a,20646
 659                     ; 257         status = ENABLE;
 661  00a0 2008          	jpf	LC005
 662                     ; 262         status = DISABLE;
 663  00a2               L122:
 664                     ; 266     case WFE_Source_EXTI_EV4:
 664                     ; 267     case WFE_Source_EXTI_EV5:
 664                     ; 268     case WFE_Source_EXTI_EV6:
 664                     ; 269     case WFE_Source_EXTI_EV7:
 664                     ; 270     case WFE_Source_EXTI_EVB_G:
 664                     ; 271     case WFE_Source_EXTI_EVD_H:
 664                     ; 272     case WFE_Source_EXTI_EVE_F:
 664                     ; 273     case WFE_Source_ADC1_COMP_EV:
 664                     ; 274 
 664                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 666  00a2 c650a7        	ld	a,20647
 667                     ; 278         status = ENABLE;
 669  00a5 2003          	jpf	LC005
 670                     ; 283         status = DISABLE;
 671  00a7               L322:
 672                     ; 286     case WFE_Source_TIM3_EV0:
 672                     ; 287     case WFE_Source_TIM3_EV1:
 672                     ; 288     case WFE_Source_TIM4_EV:
 672                     ; 289     case WFE_Source_SPI1_EV:
 672                     ; 290     case WFE_Source_I2C1_EV:
 672                     ; 291     case WFE_Source_USART1_EV:
 672                     ; 292     case WFE_Source_DMA1CH01_EV:
 672                     ; 293     case WFE_Source_DMA1CH23_EV:
 672                     ; 294 
 672                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 674  00a7 c650a8        	ld	a,20648
 675  00aa               LC005:
 676  00aa 1503          	bcp	a,(OFST+2,sp)
 677  00ac 270d          	jreq	L372
 678                     ; 298         status = ENABLE;
 680  00ae               LC004:
 684  00ae a601          	ld	a,#1
 685  00b0 6b01          	ld	(OFST+0,sp),a
 688  00b2 2009          	jra	L552
 689                     ; 303         status = DISABLE;
 690  00b4               L522:
 691                     ; 307     case WFE_Source_TIM5_EV0:
 691                     ; 308     case WFE_Source_TIM5_EV1:
 691                     ; 309     case WFE_Source_AES_EV:
 691                     ; 310     case WFE_Source_SPI2_EV:
 691                     ; 311     case WFE_Source_USART2_EV:
 691                     ; 312     case WFE_Source_USART3_EV:
 691                     ; 313     case WFE_Source_RTC_CSS_EV:
 691                     ; 314 
 691                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 693  00b4 c650a9        	ld	a,20649
 694  00b7 1503          	bcp	a,(OFST+2,sp)
 695                     ; 318         status = ENABLE;
 697  00b9 26f3          	jrne	LC004
 698  00bb               L372:
 699                     ; 323         status = DISABLE;
 704  00bb 0f01          	clr	(OFST+0,sp)
 706                     ; 326     default:
 706                     ; 327       break;
 708  00bd               L552:
 709                     ; 329   return status;
 711  00bd 7b01          	ld	a,(OFST+0,sp)
 714  00bf 5b03          	addw	sp,#3
 715  00c1 87            	retf	
 727                     	xdef	f_WFE_GetWakeUpSourceEventStatus
 728                     	xdef	f_WFE_WakeUpSourceEventCmd
 729                     	xdef	f_WFE_DeInit
 748                     	end
