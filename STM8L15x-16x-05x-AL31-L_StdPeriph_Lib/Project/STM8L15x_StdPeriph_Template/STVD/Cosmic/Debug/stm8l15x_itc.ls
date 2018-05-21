   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 56 uint8_t ITC_GetCPUCC(void)
  50                     ; 57 {
  51                     .text:	section	.text,new
  52  0000               f_ITC_GetCPUCC:
  56                     ; 59   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 60   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 87            	retf	
  91                     ; 87 void ITC_DeInit(void)
  91                     ; 88 {
  92                     .text:	section	.text,new
  93  0000               f_ITC_DeInit:
  97                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  99  0000 35ff7f70      	mov	32624,#255
 100                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 102  0004 35ff7f71      	mov	32625,#255
 103                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 105  0008 35ff7f72      	mov	32626,#255
 106                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 108  000c 35ff7f73      	mov	32627,#255
 109                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 111  0010 35ff7f74      	mov	32628,#255
 112                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 114  0014 35ff7f75      	mov	32629,#255
 115                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 117  0018 35ff7f76      	mov	32630,#255
 118                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 120  001c 35ff7f77      	mov	32631,#255
 121                     ; 97 }
 124  0020 87            	retf	
 148                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 105 {
 149                     .text:	section	.text,new
 150  0000               f_ITC_GetSoftIntStatus:
 154                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 156  0000 8d000000      	callf	f_ITC_GetCPUCC
 158  0004 a428          	and	a,#40
 161  0006 87            	retf	
 469                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 469                     ; 115 {
 470                     .text:	section	.text,new
 471  0000               f_ITC_GetSoftwarePriority:
 473  0000 88            	push	a
 474  0001 89            	pushw	x
 475       00000002      OFST:	set	2
 478                     ; 116   uint8_t Value = 0;
 480  0002 0f02          	clr	(OFST+0,sp)
 482                     ; 117   uint8_t Mask = 0;
 484                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 486                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 488  0004 a403          	and	a,#3
 489  0006 48            	sll	a
 490  0007 5f            	clrw	x
 491  0008 97            	ld	xl,a
 492  0009 a603          	ld	a,#3
 493  000b 5d            	tnzw	x
 494  000c 2704          	jreq	L61
 495  000e               L02:
 496  000e 48            	sll	a
 497  000f 5a            	decw	x
 498  0010 26fc          	jrne	L02
 499  0012               L61:
 500  0012 6b01          	ld	(OFST-1,sp),a
 502                     ; 125   switch (IRQn)
 504  0014 7b03          	ld	a,(OFST+1,sp)
 506                     ; 223     default:
 506                     ; 224       break;
 507  0016 4a            	dec	a
 508  0017 a11d          	cp	a,#29
 509  0019 246a          	jruge	L122
 510  001b 8d000000      	callf	d_jctab
 512  001f               L42:
 513  001f 003c          	dc.w	L14-L42
 514  0021 003c          	dc.w	L14-L42
 515  0023 003c          	dc.w	L14-L42
 516  0025 0041          	dc.w	L34-L42
 517  0027 0041          	dc.w	L34-L42
 518  0029 0041          	dc.w	L34-L42
 519  002b 0041          	dc.w	L34-L42
 520  002d 0046          	dc.w	L54-L42
 521  002f 0046          	dc.w	L54-L42
 522  0031 0046          	dc.w	L54-L42
 523  0033 0046          	dc.w	L54-L42
 524  0035 004b          	dc.w	L74-L42
 525  0037 004b          	dc.w	L74-L42
 526  0039 004b          	dc.w	L74-L42
 527  003b 004b          	dc.w	L74-L42
 528  003d 0050          	dc.w	L15-L42
 529  003f 0050          	dc.w	L15-L42
 530  0041 0050          	dc.w	L15-L42
 531  0043 0050          	dc.w	L15-L42
 532  0045 0055          	dc.w	L35-L42
 533  0047 0055          	dc.w	L35-L42
 534  0049 0055          	dc.w	L35-L42
 535  004b 0055          	dc.w	L35-L42
 536  004d 005a          	dc.w	L55-L42
 537  004f 005a          	dc.w	L55-L42
 538  0051 005a          	dc.w	L55-L42
 539  0053 005a          	dc.w	L55-L42
 540  0055 005f          	dc.w	L75-L42
 541  0057 005f          	dc.w	L75-L42
 542  0059 202a          	jra	L122
 543  005b               L14:
 544                     ; 127     case FLASH_IRQn:
 544                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  005b c67f70        	ld	a,32624
 547                     ; 131       break;
 549  005e 2021          	jpf	LC001
 550  0060               L34:
 551                     ; 133     case EXTIE_F_PVD_IRQn:
 551                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 551                     ; 135     case RTC_IRQn:
 551                     ; 136     case EXTIB_IRQn:
 551                     ; 137     case EXTID_IRQn:
 551                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 551                     ; 139     case RTC_CSSLSE_IRQn:
 551                     ; 140     case EXTIB_IRQn:
 551                     ; 141     case EXTID_IRQn:
 551                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 551                     ; 143     case RTC_CSSLSE_IRQn:
 551                     ; 144     case EXTIB_G_IRQn:
 551                     ; 145     case EXTID_H_IRQn:
 551                     ; 146 #endif  /* STM8L15X_MD */
 551                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 553  0060 c67f71        	ld	a,32625
 554                     ; 148       break;
 556  0063 201c          	jpf	LC001
 557  0065               L54:
 558                     ; 150     case EXTI0_IRQn:
 558                     ; 151     case EXTI1_IRQn:
 558                     ; 152     case EXTI2_IRQn:
 558                     ; 153     case EXTI3_IRQn:
 558                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 560  0065 c67f72        	ld	a,32626
 561                     ; 155       break;
 563  0068 2017          	jpf	LC001
 564  006a               L74:
 565                     ; 157     case EXTI4_IRQn:
 565                     ; 158     case EXTI5_IRQn:
 565                     ; 159     case EXTI6_IRQn:
 565                     ; 160     case EXTI7_IRQn:
 565                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 567  006a c67f73        	ld	a,32627
 568                     ; 162       break;
 570  006d 2012          	jpf	LC001
 571  006f               L15:
 572                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 572                     ; 168 #endif /* STM8L15X_LD */		
 572                     ; 169     case ADC1_COMP_IRQn:
 572                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 572                     ; 171     case LCD_IRQn:
 572                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 572                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 572                     ; 176     case LCD_AES_IRQn:
 572                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 572                     ; 178 #endif  /* STM8L15X_MD */
 572                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 574  006f c67f74        	ld	a,32628
 575                     ; 180       break;
 577  0072 200d          	jpf	LC001
 578  0074               L35:
 579                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 579                     ; 184 #endif /* STM8L15X_LD */		
 579                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 579                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 579                     ; 187     case TIM2_CC_IRQn:
 579                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 579                     ; 189     case TIM3_CC_IRQn:
 579                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 579                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 579                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 579                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 579                     ; 194 #endif  /* STM8L15X_MD */
 579                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 581  0074 c67f75        	ld	a,32629
 582                     ; 196       break;
 584  0077 2008          	jpf	LC001
 585  0079               L55:
 586                     ; 199     case TIM1_CC_IRQn:
 586                     ; 200 #endif /* STM8L15X_LD */	
 586                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 586                     ; 202     case SPI1_IRQn:
 586                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 586                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 586                     ; 205     case USART1_TX_IRQn:
 586                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 586                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 586                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 586                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 588  0079 c67f76        	ld	a,32630
 589                     ; 210       break;
 591  007c 2003          	jpf	LC001
 592  007e               L75:
 593                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 593                     ; 218     case I2C1_SPI2_IRQn:
 593                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 593                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 595  007e c67f77        	ld	a,32631
 596  0081               LC001:
 597  0081 1401          	and	a,(OFST-1,sp)
 598  0083 6b02          	ld	(OFST+0,sp),a
 600                     ; 221       break;
 602                     ; 223     default:
 602                     ; 224       break;
 604  0085               L122:
 605                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 607  0085 7b03          	ld	a,(OFST+1,sp)
 608  0087 a403          	and	a,#3
 609  0089 48            	sll	a
 610  008a 5f            	clrw	x
 611  008b 97            	ld	xl,a
 612  008c 7b02          	ld	a,(OFST+0,sp)
 613  008e 5d            	tnzw	x
 614  008f 2704          	jreq	L62
 615  0091               L03:
 616  0091 44            	srl	a
 617  0092 5a            	decw	x
 618  0093 26fc          	jrne	L03
 619  0095               L62:
 621                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 625  0095 5b03          	addw	sp,#3
 626  0097 87            	retf	
 685                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 685                     ; 251 {
 686                     .text:	section	.text,new
 687  0000               f_ITC_SetSoftwarePriority:
 689  0000 89            	pushw	x
 690  0001 89            	pushw	x
 691       00000002      OFST:	set	2
 694                     ; 252   uint8_t Mask = 0;
 696                     ; 253   uint8_t NewPriority = 0;
 698                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 700                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 702                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 704                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 706  0002 9e            	ld	a,xh
 707  0003 a403          	and	a,#3
 708  0005 48            	sll	a
 709  0006 5f            	clrw	x
 710  0007 97            	ld	xl,a
 711  0008 a603          	ld	a,#3
 712  000a 5d            	tnzw	x
 713  000b 2704          	jreq	L43
 714  000d               L63:
 715  000d 48            	sll	a
 716  000e 5a            	decw	x
 717  000f 26fc          	jrne	L63
 718  0011               L43:
 719  0011 43            	cpl	a
 720  0012 6b01          	ld	(OFST-1,sp),a
 722                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 724  0014 7b03          	ld	a,(OFST+1,sp)
 725  0016 a403          	and	a,#3
 726  0018 48            	sll	a
 727  0019 5f            	clrw	x
 728  001a 97            	ld	xl,a
 729  001b 7b04          	ld	a,(OFST+2,sp)
 730  001d 5d            	tnzw	x
 731  001e 2704          	jreq	L04
 732  0020               L24:
 733  0020 48            	sll	a
 734  0021 5a            	decw	x
 735  0022 26fc          	jrne	L24
 736  0024               L04:
 737  0024 6b02          	ld	(OFST+0,sp),a
 739                     ; 268   switch (IRQn)
 741  0026 7b03          	ld	a,(OFST+1,sp)
 743                     ; 372     default:
 743                     ; 373       break;
 744  0028 4a            	dec	a
 745  0029 a11d          	cp	a,#29
 746  002b 2504ac010101  	jruge	L572
 747  0031 8d000000      	callf	d_jctab
 749  0035               L64:
 750  0035 003e          	dc.w	L322-L64
 751  0037 003e          	dc.w	L322-L64
 752  0039 003e          	dc.w	L322-L64
 753  003b 0050          	dc.w	L522-L64
 754  003d 0050          	dc.w	L522-L64
 755  003f 0050          	dc.w	L522-L64
 756  0041 0050          	dc.w	L522-L64
 757  0043 0062          	dc.w	L722-L64
 758  0045 0062          	dc.w	L722-L64
 759  0047 0062          	dc.w	L722-L64
 760  0049 0062          	dc.w	L722-L64
 761  004b 0074          	dc.w	L132-L64
 762  004d 0074          	dc.w	L132-L64
 763  004f 0074          	dc.w	L132-L64
 764  0051 0074          	dc.w	L132-L64
 765  0053 0086          	dc.w	L332-L64
 766  0055 0086          	dc.w	L332-L64
 767  0057 0086          	dc.w	L332-L64
 768  0059 0086          	dc.w	L332-L64
 769  005b 0098          	dc.w	L532-L64
 770  005d 0098          	dc.w	L532-L64
 771  005f 0098          	dc.w	L532-L64
 772  0061 0098          	dc.w	L532-L64
 773  0063 00aa          	dc.w	L732-L64
 774  0065 00aa          	dc.w	L732-L64
 775  0067 00aa          	dc.w	L732-L64
 776  0069 00aa          	dc.w	L732-L64
 777  006b 00bc          	dc.w	L142-L64
 778  006d 00bc          	dc.w	L142-L64
 779  006f ac010101      	jra	L572
 780  0073               L322:
 781                     ; 270     case FLASH_IRQn:
 781                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 781                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 781                     ; 273       ITC->ISPR1 &= Mask;
 783  0073 c67f70        	ld	a,32624
 784  0076 1401          	and	a,(OFST-1,sp)
 785  0078 c77f70        	ld	32624,a
 786                     ; 274       ITC->ISPR1 |= NewPriority;
 788  007b c67f70        	ld	a,32624
 789  007e 1a02          	or	a,(OFST+0,sp)
 790  0080 c77f70        	ld	32624,a
 791                     ; 275       break;
 793  0083 207c          	jra	L572
 794  0085               L522:
 795                     ; 277     case EXTIE_F_PVD_IRQn:
 795                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 795                     ; 279     case RTC_IRQn:
 795                     ; 280     case EXTIB_IRQn:
 795                     ; 281     case EXTID_IRQn:
 795                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 795                     ; 283     case RTC_CSSLSE_IRQn:
 795                     ; 284     case EXTIB_IRQn:
 795                     ; 285     case EXTID_IRQn:
 795                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 795                     ; 287     case RTC_CSSLSE_IRQn:
 795                     ; 288     case EXTIB_G_IRQn:
 795                     ; 289     case EXTID_H_IRQn:
 795                     ; 290 #endif  /* STM8L15X_MD */
 795                     ; 291       ITC->ISPR2 &= Mask;
 797  0085 c67f71        	ld	a,32625
 798  0088 1401          	and	a,(OFST-1,sp)
 799  008a c77f71        	ld	32625,a
 800                     ; 292       ITC->ISPR2 |= NewPriority;
 802  008d c67f71        	ld	a,32625
 803  0090 1a02          	or	a,(OFST+0,sp)
 804  0092 c77f71        	ld	32625,a
 805                     ; 293       break;
 807  0095 206a          	jra	L572
 808  0097               L722:
 809                     ; 295     case EXTI0_IRQn:
 809                     ; 296     case EXTI1_IRQn:
 809                     ; 297     case EXTI2_IRQn:
 809                     ; 298     case EXTI3_IRQn:
 809                     ; 299       ITC->ISPR3 &= Mask;
 811  0097 c67f72        	ld	a,32626
 812  009a 1401          	and	a,(OFST-1,sp)
 813  009c c77f72        	ld	32626,a
 814                     ; 300       ITC->ISPR3 |= NewPriority;
 816  009f c67f72        	ld	a,32626
 817  00a2 1a02          	or	a,(OFST+0,sp)
 818  00a4 c77f72        	ld	32626,a
 819                     ; 301       break;
 821  00a7 2058          	jra	L572
 822  00a9               L132:
 823                     ; 303     case EXTI4_IRQn:
 823                     ; 304     case EXTI5_IRQn:
 823                     ; 305     case EXTI6_IRQn:
 823                     ; 306     case EXTI7_IRQn:
 823                     ; 307       ITC->ISPR4 &= Mask;
 825  00a9 c67f73        	ld	a,32627
 826  00ac 1401          	and	a,(OFST-1,sp)
 827  00ae c77f73        	ld	32627,a
 828                     ; 308       ITC->ISPR4 |= NewPriority;
 830  00b1 c67f73        	ld	a,32627
 831  00b4 1a02          	or	a,(OFST+0,sp)
 832  00b6 c77f73        	ld	32627,a
 833                     ; 309       break;
 835  00b9 2046          	jra	L572
 836  00bb               L332:
 837                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 837                     ; 312 #else
 837                     ; 313     case SWITCH_CSS_IRQn:
 837                     ; 314 #endif /*	STM8L15X_LD	*/
 837                     ; 315     case ADC1_COMP_IRQn:
 837                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 837                     ; 317     case LCD_IRQn:
 837                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 837                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 837                     ; 322     case LCD_AES_IRQn:
 837                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 837                     ; 324 #endif  /* STM8L15X_MD */
 837                     ; 325       ITC->ISPR5 &= Mask;
 839  00bb c67f74        	ld	a,32628
 840  00be 1401          	and	a,(OFST-1,sp)
 841  00c0 c77f74        	ld	32628,a
 842                     ; 326       ITC->ISPR5 |= NewPriority;
 844  00c3 c67f74        	ld	a,32628
 845  00c6 1a02          	or	a,(OFST+0,sp)
 846  00c8 c77f74        	ld	32628,a
 847                     ; 327       break;
 849  00cb 2034          	jra	L572
 850  00cd               L532:
 851                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 851                     ; 330 #endif  /* STM8L15X_LD */
 851                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 851                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 851                     ; 333     case TIM2_CC_IRQn:
 851                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 851                     ; 335     case TIM3_CC_IRQn:
 851                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 851                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 851                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 851                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 851                     ; 340 #endif  /* STM8L15X_MD */
 851                     ; 341       ITC->ISPR6 &= Mask;
 853  00cd c67f75        	ld	a,32629
 854  00d0 1401          	and	a,(OFST-1,sp)
 855  00d2 c77f75        	ld	32629,a
 856                     ; 342       ITC->ISPR6 |= NewPriority;
 858  00d5 c67f75        	ld	a,32629
 859  00d8 1a02          	or	a,(OFST+0,sp)
 860  00da c77f75        	ld	32629,a
 861                     ; 343       break;
 863  00dd 2022          	jra	L572
 864  00df               L732:
 865                     ; 346     case TIM1_CC_IRQn:
 865                     ; 347 #endif  /* STM8L15X_LD */
 865                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 865                     ; 349     case SPI1_IRQn:
 865                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 865                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 865                     ; 352     case USART1_TX_IRQn:
 865                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 865                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 865                     ; 355 #endif  /* STM8L15X_MD */
 865                     ; 356       ITC->ISPR7 &= Mask;
 867  00df c67f76        	ld	a,32630
 868  00e2 1401          	and	a,(OFST-1,sp)
 869  00e4 c77f76        	ld	32630,a
 870                     ; 357       ITC->ISPR7 |= NewPriority;
 872  00e7 c67f76        	ld	a,32630
 873  00ea 1a02          	or	a,(OFST+0,sp)
 874  00ec c77f76        	ld	32630,a
 875                     ; 358       break;
 877  00ef 2010          	jra	L572
 878  00f1               L142:
 879                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 879                     ; 366     case I2C1_SPI2_IRQn:
 879                     ; 367 #endif  /* STM8L15X_MD */
 879                     ; 368       ITC->ISPR8 &= Mask;
 881  00f1 c67f77        	ld	a,32631
 882  00f4 1401          	and	a,(OFST-1,sp)
 883  00f6 c77f77        	ld	32631,a
 884                     ; 369       ITC->ISPR8 |= NewPriority;
 886  00f9 c67f77        	ld	a,32631
 887  00fc 1a02          	or	a,(OFST+0,sp)
 888  00fe c77f77        	ld	32631,a
 889                     ; 370       break;
 891                     ; 372     default:
 891                     ; 373       break;
 893  0101               L572:
 894                     ; 375 }
 897  0101 5b04          	addw	sp,#4
 898  0103 87            	retf	
 910                     	xdef	f_ITC_GetSoftwarePriority
 911                     	xdef	f_ITC_SetSoftwarePriority
 912                     	xdef	f_ITC_GetSoftIntStatus
 913                     	xdef	f_ITC_GetCPUCC
 914                     	xdef	f_ITC_DeInit
 915                     	xref.b	c_x
 934                     	xref	d_jctab
 935                     	end
