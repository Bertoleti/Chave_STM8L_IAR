   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 123 void EXTI_DeInit(void)
  50                     ; 124 {
  51                     .text:	section	.text,new
  52  0000               f_EXTI_DeInit:
  56                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  64  0008 725f50a2      	clr	20642
  65                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  67  000c 725f50aa      	clr	20650
  68                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  70  0010 35ff50a3      	mov	20643,#255
  71                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  73  0014 35ff50a4      	mov	20644,#255
  74                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  76  0018 725f50a5      	clr	20645
  77                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  79  001c 725f50ab      	clr	20651
  80                     ; 133 }
  83  0020 87            	retf	
 228                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 228                     ; 161 {
 229                     .text:	section	.text,new
 230  0000               f_EXTI_SetPinSensitivity:
 232  0000 89            	pushw	x
 233       00000000      OFST:	set	0
 236                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 238                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 240                     ; 168   switch (EXTI_Pin)
 242  0001 9e            	ld	a,xh
 244                     ; 202     default:
 244                     ; 203       break;
 245  0002 4d            	tnz	a
 246  0003 2730          	jreq	L12
 247  0005 a002          	sub	a,#2
 248  0007 2743          	jreq	L32
 249  0009 a002          	sub	a,#2
 250  000b 2756          	jreq	L52
 251  000d a002          	sub	a,#2
 252  000f 2769          	jreq	L72
 253  0011 a00a          	sub	a,#10
 254  0013 2604ac970097  	jreq	L13
 255  0019 a002          	sub	a,#2
 256  001b 2604acb000b0  	jreq	L33
 257  0021 a002          	sub	a,#2
 258  0023 2604acc900c9  	jreq	L53
 259  0029 a002          	sub	a,#2
 260  002b 2604ace200e2  	jreq	L73
 261  0031 acff00ff      	jra	L721
 262  0035               L12:
 263                     ; 170     case EXTI_Pin_0:
 263                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 265  0035 c650a0        	ld	a,20640
 266  0038 a4fc          	and	a,#252
 267  003a c750a0        	ld	20640,a
 268                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 270  003d 7b01          	ld	a,(OFST+1,sp)
 271  003f 5f            	clrw	x
 272  0040 97            	ld	xl,a
 273  0041 7b02          	ld	a,(OFST+2,sp)
 274  0043 5d            	tnzw	x
 275  0044 2749          	jreq	L42
 276  0046               L21:
 277  0046 48            	sll	a
 278  0047 5a            	decw	x
 279  0048 26fc          	jrne	L21
 280                     ; 173       break;
 282  004a 2043          	jpf	L42
 283  004c               L32:
 284                     ; 174     case EXTI_Pin_1:
 284                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 286  004c c650a0        	ld	a,20640
 287  004f a4f3          	and	a,#243
 288  0051 c750a0        	ld	20640,a
 289                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 291  0054 7b01          	ld	a,(OFST+1,sp)
 292  0056 5f            	clrw	x
 293  0057 97            	ld	xl,a
 294  0058 7b02          	ld	a,(OFST+2,sp)
 295  005a 5d            	tnzw	x
 296  005b 2732          	jreq	L42
 297  005d               L61:
 298  005d 48            	sll	a
 299  005e 5a            	decw	x
 300  005f 26fc          	jrne	L61
 301                     ; 177       break;
 303  0061 202c          	jpf	L42
 304  0063               L52:
 305                     ; 178     case EXTI_Pin_2:
 305                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 307  0063 c650a0        	ld	a,20640
 308  0066 a4cf          	and	a,#207
 309  0068 c750a0        	ld	20640,a
 310                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 312  006b 7b01          	ld	a,(OFST+1,sp)
 313  006d 5f            	clrw	x
 314  006e 97            	ld	xl,a
 315  006f 7b02          	ld	a,(OFST+2,sp)
 316  0071 5d            	tnzw	x
 317  0072 271b          	jreq	L42
 318  0074               L22:
 319  0074 48            	sll	a
 320  0075 5a            	decw	x
 321  0076 26fc          	jrne	L22
 322                     ; 181       break;
 324  0078 2015          	jpf	L42
 325  007a               L72:
 326                     ; 182     case EXTI_Pin_3:
 326                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 328  007a c650a0        	ld	a,20640
 329  007d a43f          	and	a,#63
 330  007f c750a0        	ld	20640,a
 331                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 333  0082 7b01          	ld	a,(OFST+1,sp)
 334  0084 5f            	clrw	x
 335  0085 97            	ld	xl,a
 336  0086 7b02          	ld	a,(OFST+2,sp)
 337  0088 5d            	tnzw	x
 338  0089 2704          	jreq	L42
 339  008b               L62:
 340  008b 48            	sll	a
 341  008c 5a            	decw	x
 342  008d 26fc          	jrne	L62
 343  008f               L42:
 344  008f ca50a0        	or	a,20640
 345  0092 c750a0        	ld	20640,a
 346                     ; 185       break;
 348  0095 2068          	jra	L721
 349  0097               L13:
 350                     ; 186     case EXTI_Pin_4:
 350                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 352  0097 c650a1        	ld	a,20641
 353  009a a4fc          	and	a,#252
 354  009c c750a1        	ld	20641,a
 355                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 357  009f 7b01          	ld	a,(OFST+1,sp)
 358  00a1 a4ef          	and	a,#239
 359  00a3 5f            	clrw	x
 360  00a4 97            	ld	xl,a
 361  00a5 7b02          	ld	a,(OFST+2,sp)
 362  00a7 5d            	tnzw	x
 363  00a8 274f          	jreq	L44
 364  00aa               L23:
 365  00aa 48            	sll	a
 366  00ab 5a            	decw	x
 367  00ac 26fc          	jrne	L23
 368                     ; 189       break;
 370  00ae 2049          	jpf	L44
 371  00b0               L33:
 372                     ; 190     case EXTI_Pin_5:
 372                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 374  00b0 c650a1        	ld	a,20641
 375  00b3 a4f3          	and	a,#243
 376  00b5 c750a1        	ld	20641,a
 377                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 379  00b8 7b01          	ld	a,(OFST+1,sp)
 380  00ba a4ef          	and	a,#239
 381  00bc 5f            	clrw	x
 382  00bd 97            	ld	xl,a
 383  00be 7b02          	ld	a,(OFST+2,sp)
 384  00c0 5d            	tnzw	x
 385  00c1 2736          	jreq	L44
 386  00c3               L63:
 387  00c3 48            	sll	a
 388  00c4 5a            	decw	x
 389  00c5 26fc          	jrne	L63
 390                     ; 193       break;
 392  00c7 2030          	jpf	L44
 393  00c9               L53:
 394                     ; 194     case EXTI_Pin_6:
 394                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 396  00c9 c650a1        	ld	a,20641
 397  00cc a4cf          	and	a,#207
 398  00ce c750a1        	ld	20641,a
 399                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 401  00d1 7b01          	ld	a,(OFST+1,sp)
 402  00d3 a4ef          	and	a,#239
 403  00d5 5f            	clrw	x
 404  00d6 97            	ld	xl,a
 405  00d7 7b02          	ld	a,(OFST+2,sp)
 406  00d9 5d            	tnzw	x
 407  00da 271d          	jreq	L44
 408  00dc               L24:
 409  00dc 48            	sll	a
 410  00dd 5a            	decw	x
 411  00de 26fc          	jrne	L24
 412                     ; 197       break;
 414  00e0 2017          	jpf	L44
 415  00e2               L73:
 416                     ; 198     case EXTI_Pin_7:
 416                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 418  00e2 c650a1        	ld	a,20641
 419  00e5 a43f          	and	a,#63
 420  00e7 c750a1        	ld	20641,a
 421                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 423  00ea 7b01          	ld	a,(OFST+1,sp)
 424  00ec a4ef          	and	a,#239
 425  00ee 5f            	clrw	x
 426  00ef 97            	ld	xl,a
 427  00f0 7b02          	ld	a,(OFST+2,sp)
 428  00f2 5d            	tnzw	x
 429  00f3 2704          	jreq	L44
 430  00f5               L64:
 431  00f5 48            	sll	a
 432  00f6 5a            	decw	x
 433  00f7 26fc          	jrne	L64
 434  00f9               L44:
 435  00f9 ca50a1        	or	a,20641
 436  00fc c750a1        	ld	20641,a
 437                     ; 201       break;
 439                     ; 202     default:
 439                     ; 203       break;
 441  00ff               L721:
 442                     ; 205 }
 445  00ff 85            	popw	x
 446  0100 87            	retf	
 528                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 528                     ; 220 {
 529                     .text:	section	.text,new
 530  0000               f_EXTI_SelectPort:
 532       00000000      OFST:	set	0
 535                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 537                     ; 224   if (EXTI_Port == EXTI_Port_B)
 539  0000 4d            	tnz	a
 540  0001 2605          	jrne	L761
 541                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 543  0003 721b50ab      	bres	20651,#5
 546  0007 87            	retf	
 547  0008               L761:
 548                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 550  0008 a102          	cp	a,#2
 551  000a 2605          	jrne	L371
 552                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 554  000c 721d50ab      	bres	20651,#6
 557  0010 87            	retf	
 558  0011               L371:
 559                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 561  0011 a104          	cp	a,#4
 562  0013 2605          	jrne	L771
 563                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 565  0015 721f50a5      	bres	20645,#7
 568  0019 87            	retf	
 569  001a               L771:
 570                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 572  001a a106          	cp	a,#6
 573  001c 2605          	jrne	L302
 574                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 576  001e 721e50a5      	bset	20645,#7
 579  0022 87            	retf	
 580  0023               L302:
 581                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 583  0023 a110          	cp	a,#16
 584  0025 2605          	jrne	L702
 585                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 587  0027 721a50ab      	bset	20651,#5
 590  002b 87            	retf	
 591  002c               L702:
 592                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 594  002c 721c50ab      	bset	20651,#6
 595                     ; 254 }
 598  0030 87            	retf	
 765                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 765                     ; 281                                FunctionalState NewState)
 765                     ; 282 {
 766                     .text:	section	.text,new
 767  0000               f_EXTI_SetHalfPortSelection:
 769  0000 89            	pushw	x
 770       00000000      OFST:	set	0
 773                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 775                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 777                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 779  0001 9e            	ld	a,xh
 780  0002 a580          	bcp	a,#128
 781  0004 2616          	jrne	L103
 782                     ; 289     if (NewState != DISABLE)
 784  0006 7b02          	ld	a,(OFST+2,sp)
 785  0008 2707          	jreq	L303
 786                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 788  000a c650a5        	ld	a,20645
 789  000d 1a01          	or	a,(OFST+1,sp)
 791  000f 2006          	jpf	LC004
 792  0011               L303:
 793                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 795  0011 7b01          	ld	a,(OFST+1,sp)
 796  0013 43            	cpl	a
 797  0014 c450a5        	and	a,20645
 798  0017               LC004:
 799  0017 c750a5        	ld	20645,a
 800  001a 2018          	jra	L703
 801  001c               L103:
 802                     ; 302     if (NewState != DISABLE)
 804  001c 7b02          	ld	a,(OFST+2,sp)
 805  001e 2709          	jreq	L113
 806                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 808  0020 7b01          	ld	a,(OFST+1,sp)
 809  0022 a47f          	and	a,#127
 810  0024 ca50ab        	or	a,20651
 812  0027 2008          	jpf	LC003
 813  0029               L113:
 814                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 816  0029 7b01          	ld	a,(OFST+1,sp)
 817  002b a47f          	and	a,#127
 818  002d 43            	cpl	a
 819  002e c450ab        	and	a,20651
 820  0031               LC003:
 821  0031 c750ab        	ld	20651,a
 822  0034               L703:
 823                     ; 313 }
 826  0034 85            	popw	x
 827  0035 87            	retf	
 872                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 872                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 872                     ; 340 {
 873                     .text:	section	.text,new
 874  0000               f_EXTI_SetPortSensitivity:
 876  0000 89            	pushw	x
 877       00000000      OFST:	set	0
 880                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 882                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 884                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 886  0001 9e            	ld	a,xh
 887  0002 a5f0          	bcp	a,#240
 888  0004 2629          	jrne	L733
 889                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 891  0006 7b01          	ld	a,(OFST+1,sp)
 892  0008 5f            	clrw	x
 893  0009 97            	ld	xl,a
 894  000a a603          	ld	a,#3
 895  000c 5d            	tnzw	x
 896  000d 2704          	jreq	L65
 897  000f               L06:
 898  000f 48            	sll	a
 899  0010 5a            	decw	x
 900  0011 26fc          	jrne	L06
 901  0013               L65:
 902  0013 43            	cpl	a
 903  0014 c450a2        	and	a,20642
 904  0017 c750a2        	ld	20642,a
 905                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 907  001a 7b01          	ld	a,(OFST+1,sp)
 908  001c 5f            	clrw	x
 909  001d 97            	ld	xl,a
 910  001e 7b02          	ld	a,(OFST+2,sp)
 911  0020 5d            	tnzw	x
 912  0021 2704          	jreq	L26
 913  0023               L46:
 914  0023 48            	sll	a
 915  0024 5a            	decw	x
 916  0025 26fc          	jrne	L46
 917  0027               L26:
 918  0027 ca50a2        	or	a,20642
 919  002a c750a2        	ld	20642,a
 921  002d 202b          	jra	L143
 922  002f               L733:
 923                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 925  002f 7b01          	ld	a,(OFST+1,sp)
 926  0031 a40f          	and	a,#15
 927  0033 5f            	clrw	x
 928  0034 97            	ld	xl,a
 929  0035 a603          	ld	a,#3
 930  0037 5d            	tnzw	x
 931  0038 2704          	jreq	L66
 932  003a               L07:
 933  003a 48            	sll	a
 934  003b 5a            	decw	x
 935  003c 26fc          	jrne	L07
 936  003e               L66:
 937  003e 43            	cpl	a
 938  003f c450aa        	and	a,20650
 939  0042 c750aa        	ld	20650,a
 940                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 942  0045 7b01          	ld	a,(OFST+1,sp)
 943  0047 a40f          	and	a,#15
 944  0049 5f            	clrw	x
 945  004a 97            	ld	xl,a
 946  004b 7b02          	ld	a,(OFST+2,sp)
 947  004d 5d            	tnzw	x
 948  004e 2704          	jreq	L27
 949  0050               L47:
 950  0050 48            	sll	a
 951  0051 5a            	decw	x
 952  0052 26fc          	jrne	L47
 953  0054               L27:
 954  0054 ca50aa        	or	a,20650
 955  0057 c750aa        	ld	20650,a
 956  005a               L143:
 957                     ; 360 }
 960  005a 85            	popw	x
 961  005b 87            	retf	
1004                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1004                     ; 377 {
1005                     .text:	section	.text,new
1006  0000               f_EXTI_GetPinSensitivity:
1008  0000 88            	push	a
1009       00000001      OFST:	set	1
1012                     ; 378   uint8_t value = 0;
1014  0001 0f01          	clr	(OFST+0,sp)
1016                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1018                     ; 383   switch (EXTI_Pin)
1021                     ; 409     default:
1021                     ; 410       break;
1022  0003 4d            	tnz	a
1023  0004 2720          	jreq	L343
1024  0006 a002          	sub	a,#2
1025  0008 2721          	jreq	L543
1026  000a a002          	sub	a,#2
1027  000c 2722          	jreq	L743
1028  000e a002          	sub	a,#2
1029  0010 2724          	jreq	L153
1030  0012 a00a          	sub	a,#10
1031  0014 2725          	jreq	L353
1032  0016 a002          	sub	a,#2
1033  0018 2726          	jreq	L553
1034  001a a002          	sub	a,#2
1035  001c 272b          	jreq	L753
1036  001e a002          	sub	a,#2
1037  0020 272d          	jreq	L163
1038  0022 7b01          	ld	a,(OFST+0,sp)
1039  0024 2033          	jra	LC005
1040  0026               L343:
1041                     ; 385     case EXTI_Pin_0:
1041                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1043  0026 c650a0        	ld	a,20640
1044                     ; 387       break;
1046  0029 202c          	jpf	LC006
1047  002b               L543:
1048                     ; 388     case EXTI_Pin_1:
1048                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1050  002b c650a0        	ld	a,20640
1051                     ; 390       break;
1053  002e 2013          	jpf	LC008
1054  0030               L743:
1055                     ; 391     case EXTI_Pin_2:
1055                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1057  0030 c650a0        	ld	a,20640
1058  0033 4e            	swap	a
1059                     ; 393       break;
1061  0034 2021          	jpf	LC006
1062  0036               L153:
1063                     ; 394     case EXTI_Pin_3:
1063                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1065  0036 c650a0        	ld	a,20640
1066                     ; 396       break;
1068  0039 2017          	jpf	LC007
1069  003b               L353:
1070                     ; 397     case EXTI_Pin_4:
1070                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1072  003b c650a1        	ld	a,20641
1073                     ; 399       break;
1075  003e 2017          	jpf	LC006
1076  0040               L553:
1077                     ; 400     case EXTI_Pin_5:
1077                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1079  0040 c650a1        	ld	a,20641
1080  0043               LC008:
1081  0043 a40c          	and	a,#12
1082  0045 44            	srl	a
1083  0046 44            	srl	a
1084                     ; 402       break;
1086  0047 2010          	jpf	LC005
1087  0049               L753:
1088                     ; 403     case EXTI_Pin_6:
1088                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1090  0049 c650a1        	ld	a,20641
1091  004c 4e            	swap	a
1092                     ; 405       break;
1094  004d 2008          	jpf	LC006
1095  004f               L163:
1096                     ; 406     case EXTI_Pin_7:
1096                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1098  004f c650a1        	ld	a,20641
1099  0052               LC007:
1100  0052 4e            	swap	a
1101  0053 a40c          	and	a,#12
1102  0055 44            	srl	a
1103  0056 44            	srl	a
1104  0057               LC006:
1105  0057 a403          	and	a,#3
1106  0059               LC005:
1108                     ; 408       break;
1110                     ; 409     default:
1110                     ; 410       break;
1112                     ; 412   return((EXTI_Trigger_TypeDef)value);
1116  0059 5b01          	addw	sp,#1
1117  005b 87            	retf	
1160                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1160                     ; 428 {
1161                     .text:	section	.text,new
1162  0000               f_EXTI_GetPortSensitivity:
1164       00000001      OFST:	set	1
1167                     ; 429   uint8_t portsensitivity = 0;
1169                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1171                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1173  0000 a5f0          	bcp	a,#240
1174  0002 260e          	jrne	L134
1175                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1177  0004 5f            	clrw	x
1178  0005 97            	ld	xl,a
1179  0006 c650a2        	ld	a,20642
1180  0009 5d            	tnzw	x
1181  000a 2714          	jreq	L601
1182  000c               L401:
1183  000c 44            	srl	a
1184  000d 5a            	decw	x
1185  000e 26fc          	jrne	L401
1187  0010 200e          	jra	L601
1188  0012               L134:
1189                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1191  0012 a40f          	and	a,#15
1192  0014 5f            	clrw	x
1193  0015 97            	ld	xl,a
1194  0016 c650aa        	ld	a,20650
1195  0019 5d            	tnzw	x
1196  001a 2704          	jreq	L601
1197  001c               L011:
1198  001c 44            	srl	a
1199  001d 5a            	decw	x
1200  001e 26fc          	jrne	L011
1201  0020               L601:
1202  0020 a403          	and	a,#3
1204                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1208  0022 87            	retf	
1377                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1377                     ; 488 {
1378                     .text:	section	.text,new
1379  0000               f_EXTI_GetITStatus:
1381  0000 89            	pushw	x
1382  0001 88            	push	a
1383       00000001      OFST:	set	1
1386                     ; 489   ITStatus status = RESET;
1388                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1390                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1392  0002 01            	rrwa	x,a
1393  0003 4f            	clr	a
1394  0004 02            	rlwa	x,a
1395  0005 a30100        	cpw	x,#256
1396  0008 2607          	jrne	L725
1397                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1399  000a 7b03          	ld	a,(OFST+2,sp)
1400  000c c450a4        	and	a,20644
1403  000f 2005          	jra	L135
1404  0011               L725:
1405                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1407  0011 7b03          	ld	a,(OFST+2,sp)
1408  0013 c450a3        	and	a,20643
1410  0016               L135:
1411                     ; 501   return((ITStatus)status);
1415  0016 5b03          	addw	sp,#3
1416  0018 87            	retf	
1458                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1458                     ; 525 {
1459                     .text:	section	.text,new
1460  0000               f_EXTI_ClearITPendingBit:
1462  0000 89            	pushw	x
1463  0001 89            	pushw	x
1464       00000002      OFST:	set	2
1467                     ; 526   uint16_t tempvalue = 0;
1469                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1471                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1473  0002 01            	rrwa	x,a
1474  0003 4f            	clr	a
1475  0004 02            	rlwa	x,a
1476  0005 1f01          	ldw	(OFST-1,sp),x
1478                     ; 533   if ( tempvalue == 0x0100)
1480  0007 a30100        	cpw	x,#256
1481  000a 2607          	jrne	L355
1482                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1484  000c 7b04          	ld	a,(OFST+2,sp)
1485  000e c750a4        	ld	20644,a
1487  0011 2005          	jra	L555
1488  0013               L355:
1489                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1491  0013 7b04          	ld	a,(OFST+2,sp)
1492  0015 c750a3        	ld	20643,a
1493  0018               L555:
1494                     ; 541 }
1497  0018 5b04          	addw	sp,#4
1498  001a 87            	retf	
1510                     	xdef	f_EXTI_ClearITPendingBit
1511                     	xdef	f_EXTI_GetITStatus
1512                     	xdef	f_EXTI_GetPortSensitivity
1513                     	xdef	f_EXTI_GetPinSensitivity
1514                     	xdef	f_EXTI_SetPortSensitivity
1515                     	xdef	f_EXTI_SetHalfPortSelection
1516                     	xdef	f_EXTI_SelectPort
1517                     	xdef	f_EXTI_SetPinSensitivity
1518                     	xdef	f_EXTI_DeInit
1537                     	end
