   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 206                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 142 {
 207                     .text:	section	.text,new
 208  0000               f_I2C_DeInit:
 212                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 214  0000 7f            	clr	(x)
 215                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 217  0001 6f01          	clr	(1,x)
 218                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 220  0003 6f02          	clr	(2,x)
 221                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 223  0005 6f03          	clr	(3,x)
 224                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 226  0007 6f04          	clr	(4,x)
 227                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 229  0009 6f05          	clr	(5,x)
 230                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 232  000b 6f0a          	clr	(10,x)
 233                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 235  000d 6f0b          	clr	(11,x)
 236                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 238  000f 6f0c          	clr	(12,x)
 239                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 241  0011 a602          	ld	a,#2
 242  0013 e70d          	ld	(13,x),a
 243                     ; 153 }
 246  0015 87            	retf	
 457                     .const:	section	.text
 458  0000               L21:
 459  0000 000f4240      	dc.l	1000000
 460  0004               L41:
 461  0004 000186a1      	dc.l	100001
 462  0008               L61:
 463  0008 00000004      	dc.l	4
 464                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 464                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 464                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 464                     ; 187 {
 465                     .text:	section	.text,new
 466  0000               f_I2C_Init:
 468  0000 89            	pushw	x
 469  0001 520c          	subw	sp,#12
 470       0000000c      OFST:	set	12
 473                     ; 188   uint32_t result = 0x0004;
 475                     ; 189   uint16_t tmpval = 0;
 477                     ; 190   uint8_t tmpccrh = 0;
 479  0003 0f07          	clr	(OFST-5,sp)
 481                     ; 191   uint8_t input_clock = 0;
 483                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 485                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 487                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 489                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 491                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 493                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 495                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 497  0005 8d000000      	callf	f_CLK_GetClockFreq
 499  0009 ae0000        	ldw	x,#L21
 500  000c 8d000000      	callf	d_ludv
 502  0010 b603          	ld	a,c_lreg+3
 503  0012 6b08          	ld	(OFST-4,sp),a
 505                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 507  0014 1e0d          	ldw	x,(OFST+1,sp)
 508  0016 e602          	ld	a,(2,x)
 509  0018 a4c0          	and	a,#192
 510  001a e702          	ld	(2,x),a
 511                     ; 209   I2Cx->FREQR |= input_clock;
 513  001c e602          	ld	a,(2,x)
 514  001e 1a08          	or	a,(OFST-4,sp)
 515  0020 e702          	ld	(2,x),a
 516                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 518  0022 f6            	ld	a,(x)
 519  0023 a4fe          	and	a,#254
 520  0025 f7            	ld	(x),a
 521                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 523  0026 e60c          	ld	a,(12,x)
 524  0028 a430          	and	a,#48
 525  002a e70c          	ld	(12,x),a
 526                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 528  002c 6f0b          	clr	(11,x)
 529                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 531  002e 96            	ldw	x,sp
 532  002f 1c0012        	addw	x,#OFST+6
 533  0032 8d000000      	callf	d_ltor
 535  0036 ae0004        	ldw	x,#L41
 536  0039 8d000000      	callf	d_lcmp
 538  003d 2404acc700c7  	jrult	L742
 539                     ; 223     tmpccrh = I2C_CCRH_FS;
 541  0043 a680          	ld	a,#128
 542  0045 6b07          	ld	(OFST-5,sp),a
 544                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 546  0047 96            	ldw	x,sp
 547  0048 0d19          	tnz	(OFST+13,sp)
 548  004a 2629          	jrne	L152
 549                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 551  004c 1c0012        	addw	x,#OFST+6
 552  004f 8d000000      	callf	d_ltor
 554  0053 a603          	ld	a,#3
 555  0055 8d000000      	callf	d_smul
 557  0059 96            	ldw	x,sp
 558  005a 5c            	incw	x
 559  005b 8d000000      	callf	d_rtol
 562  005f 7b08          	ld	a,(OFST-4,sp)
 563  0061 8d4a014a      	callf	LC001
 565  0065 96            	ldw	x,sp
 566  0066 5c            	incw	x
 567  0067 8d000000      	callf	d_ludv
 569  006b 96            	ldw	x,sp
 570  006c 1c0009        	addw	x,#OFST-3
 571  006f 8d000000      	callf	d_rtol
 575  0073 202d          	jra	L352
 576  0075               L152:
 577                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 579  0075 1c0012        	addw	x,#OFST+6
 580  0078 8d000000      	callf	d_ltor
 582  007c a619          	ld	a,#25
 583  007e 8d000000      	callf	d_smul
 585  0082 96            	ldw	x,sp
 586  0083 5c            	incw	x
 587  0084 8d000000      	callf	d_rtol
 590  0088 7b08          	ld	a,(OFST-4,sp)
 591  008a 8d4a014a      	callf	LC001
 593  008e 96            	ldw	x,sp
 594  008f 5c            	incw	x
 595  0090 8d000000      	callf	d_ludv
 597  0094 96            	ldw	x,sp
 598  0095 1c0009        	addw	x,#OFST-3
 599  0098 8d000000      	callf	d_rtol
 602                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 604  009c 7b07          	ld	a,(OFST-5,sp)
 605  009e aa40          	or	a,#64
 606  00a0 6b07          	ld	(OFST-5,sp),a
 608  00a2               L352:
 609                     ; 239     if (result < (uint16_t)0x01)
 611  00a2 96            	ldw	x,sp
 612  00a3 1c0009        	addw	x,#OFST-3
 613  00a6 8d000000      	callf	d_lzmp
 615  00aa 2608          	jrne	L552
 616                     ; 242       result = (uint16_t)0x0001;
 618  00ac ae0001        	ldw	x,#1
 619  00af 1f0b          	ldw	(OFST-1,sp),x
 620  00b1 5f            	clrw	x
 621  00b2 1f09          	ldw	(OFST-3,sp),x
 623  00b4               L552:
 624                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 626  00b4 7b08          	ld	a,(OFST-4,sp)
 627  00b6 97            	ld	xl,a
 628  00b7 a603          	ld	a,#3
 629  00b9 42            	mul	x,a
 630  00ba a60a          	ld	a,#10
 631  00bc 8d000000      	callf	d_sdivx
 633  00c0 5c            	incw	x
 634  00c1 1f05          	ldw	(OFST-7,sp),x
 636                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 638  00c3 7b06          	ld	a,(OFST-6,sp)
 640  00c5 204f          	jra	L752
 641  00c7               L742:
 642                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 644  00c7 96            	ldw	x,sp
 645  00c8 1c0012        	addw	x,#OFST+6
 646  00cb 8d000000      	callf	d_ltor
 648  00cf 3803          	sll	c_lreg+3
 649  00d1 3902          	rlc	c_lreg+2
 650  00d3 3901          	rlc	c_lreg+1
 651  00d5 96            	ldw	x,sp
 652  00d6 3900          	rlc	c_lreg
 653  00d8 5c            	incw	x
 654  00d9 8d000000      	callf	d_rtol
 657  00dd 7b08          	ld	a,(OFST-4,sp)
 658  00df 8d4a014a      	callf	LC001
 660  00e3 96            	ldw	x,sp
 661  00e4 5c            	incw	x
 662  00e5 8d000000      	callf	d_ludv
 664  00e9 b602          	ld	a,c_lreg+2
 665  00eb 97            	ld	xl,a
 666  00ec b603          	ld	a,c_lreg+3
 667  00ee 8d000000      	callf	d_uitol
 669  00f2 96            	ldw	x,sp
 670  00f3 1c0009        	addw	x,#OFST-3
 671  00f6 8d000000      	callf	d_rtol
 674                     ; 259     if (result < (uint16_t)0x0004)
 676  00fa 96            	ldw	x,sp
 677  00fb 1c0009        	addw	x,#OFST-3
 678  00fe 8d000000      	callf	d_ltor
 680  0102 ae0008        	ldw	x,#L61
 681  0105 8d000000      	callf	d_lcmp
 683  0109 2408          	jruge	L162
 684                     ; 262       result = (uint16_t)0x0004;
 686  010b ae0004        	ldw	x,#4
 687  010e 1f0b          	ldw	(OFST-1,sp),x
 688  0110 5f            	clrw	x
 689  0111 1f09          	ldw	(OFST-3,sp),x
 691  0113               L162:
 692                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 694  0113 7b08          	ld	a,(OFST-4,sp)
 695  0115 4c            	inc	a
 696  0116               L752:
 697  0116 1e0d          	ldw	x,(OFST+1,sp)
 698  0118 e70d          	ld	(13,x),a
 699                     ; 273   I2Cx->CCRL = (uint8_t)result;
 701  011a 7b0c          	ld	a,(OFST+0,sp)
 702  011c e70b          	ld	(11,x),a
 703                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 705  011e 7b07          	ld	a,(OFST-5,sp)
 706  0120 e70c          	ld	(12,x),a
 707                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 709  0122 7b18          	ld	a,(OFST+12,sp)
 710  0124 aa01          	or	a,#1
 711  0126 fa            	or	a,(x)
 712  0127 f7            	ld	(x),a
 713                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 715  0128 e601          	ld	a,(1,x)
 716  012a 1a1a          	or	a,(OFST+14,sp)
 717  012c e701          	ld	(1,x),a
 718                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 720  012e 7b17          	ld	a,(OFST+11,sp)
 721  0130 e703          	ld	(3,x),a
 722                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 722                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 724  0132 1e16          	ldw	x,(OFST+10,sp)
 725  0134 4f            	clr	a
 726  0135 01            	rrwa	x,a
 727  0136 48            	sll	a
 728  0137 01            	rrwa	x,a
 729  0138 49            	rlc	a
 730  0139 a406          	and	a,#6
 731  013b 6b04          	ld	(OFST-8,sp),a
 733  013d 7b1b          	ld	a,(OFST+15,sp)
 734  013f aa40          	or	a,#64
 735  0141 1a04          	or	a,(OFST-8,sp)
 736  0143 1e0d          	ldw	x,(OFST+1,sp)
 737  0145 e704          	ld	(4,x),a
 738                     ; 286 }
 741  0147 5b0e          	addw	sp,#14
 742  0149 87            	retf	
 743  014a               LC001:
 744  014a b703          	ld	c_lreg+3,a
 745  014c 3f02          	clr	c_lreg+2
 746  014e 3f01          	clr	c_lreg+1
 747  0150 3f00          	clr	c_lreg
 748  0152 ae0000        	ldw	x,#L21
 749  0155 ac000000      	jpf	d_lmul
 815                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 815                     ; 296 {
 816                     .text:	section	.text,new
 817  0000               f_I2C_Cmd:
 819       fffffffe      OFST: set -2
 822                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 824                     ; 301   if (NewState != DISABLE)
 826  0000 7b04          	ld	a,(OFST+6,sp)
 827  0002 2705          	jreq	L713
 828                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 830  0004 f6            	ld	a,(x)
 831  0005 aa01          	or	a,#1
 833  0007 2003          	jra	L123
 834  0009               L713:
 835                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 837  0009 f6            	ld	a,(x)
 838  000a a4fe          	and	a,#254
 839  000c               L123:
 840  000c f7            	ld	(x),a
 841                     ; 311 }
 844  000d 87            	retf	
 890                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 890                     ; 321 {
 891                     .text:	section	.text,new
 892  0000               f_I2C_GeneralCallCmd:
 894       fffffffe      OFST: set -2
 897                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 899                     ; 326   if (NewState != DISABLE)
 901  0000 7b04          	ld	a,(OFST+6,sp)
 902  0002 2705          	jreq	L743
 903                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 905  0004 f6            	ld	a,(x)
 906  0005 aa40          	or	a,#64
 908  0007 2003          	jra	L153
 909  0009               L743:
 910                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 912  0009 f6            	ld	a,(x)
 913  000a a4bf          	and	a,#191
 914  000c               L153:
 915  000c f7            	ld	(x),a
 916                     ; 336 }
 919  000d 87            	retf	
 965                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 965                     ; 348 {
 966                     .text:	section	.text,new
 967  0000               f_I2C_GenerateSTART:
 969       fffffffe      OFST: set -2
 972                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 974                     ; 353   if (NewState != DISABLE)
 976  0000 7b04          	ld	a,(OFST+6,sp)
 977  0002 2706          	jreq	L773
 978                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 980  0004 e601          	ld	a,(1,x)
 981  0006 aa01          	or	a,#1
 983  0008 2004          	jra	L104
 984  000a               L773:
 985                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 987  000a e601          	ld	a,(1,x)
 988  000c a4fe          	and	a,#254
 989  000e               L104:
 990  000e e701          	ld	(1,x),a
 991                     ; 363 }
 994  0010 87            	retf	
1040                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1040                     ; 373 {
1041                     .text:	section	.text,new
1042  0000               f_I2C_GenerateSTOP:
1044       fffffffe      OFST: set -2
1047                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1049                     ; 378   if (NewState != DISABLE)
1051  0000 7b04          	ld	a,(OFST+6,sp)
1052  0002 2706          	jreq	L724
1053                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1055  0004 e601          	ld	a,(1,x)
1056  0006 aa02          	or	a,#2
1058  0008 2004          	jra	L134
1059  000a               L724:
1060                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1062  000a e601          	ld	a,(1,x)
1063  000c a4fd          	and	a,#253
1064  000e               L134:
1065  000e e701          	ld	(1,x),a
1066                     ; 388 }
1069  0010 87            	retf	
1116                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1116                     ; 398 {
1117                     .text:	section	.text,new
1118  0000               f_I2C_SoftwareResetCmd:
1120       fffffffe      OFST: set -2
1123                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1125                     ; 402   if (NewState != DISABLE)
1127  0000 7b04          	ld	a,(OFST+6,sp)
1128  0002 2706          	jreq	L754
1129                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1131  0004 e601          	ld	a,(1,x)
1132  0006 aa80          	or	a,#128
1134  0008 2004          	jra	L164
1135  000a               L754:
1136                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1138  000a e601          	ld	a,(1,x)
1139  000c a47f          	and	a,#127
1140  000e               L164:
1141  000e e701          	ld	(1,x),a
1142                     ; 412 }
1145  0010 87            	retf	
1192                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1192                     ; 422 {
1193                     .text:	section	.text,new
1194  0000               f_I2C_StretchClockCmd:
1196       fffffffe      OFST: set -2
1199                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1201                     ; 426   if (NewState != DISABLE)
1203  0000 7b04          	ld	a,(OFST+6,sp)
1204  0002 2705          	jreq	L705
1205                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1207  0004 f6            	ld	a,(x)
1208  0005 a47f          	and	a,#127
1210  0007 2003          	jra	L115
1211  0009               L705:
1212                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1214  0009 f6            	ld	a,(x)
1215  000a aa80          	or	a,#128
1216  000c               L115:
1217  000c f7            	ld	(x),a
1218                     ; 437 }
1221  000d 87            	retf	
1267                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1267                     ; 447 {
1268                     .text:	section	.text,new
1269  0000               f_I2C_ARPCmd:
1271       fffffffe      OFST: set -2
1274                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1276                     ; 451   if (NewState != DISABLE)
1278  0000 7b04          	ld	a,(OFST+6,sp)
1279  0002 2705          	jreq	L735
1280                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1282  0004 f6            	ld	a,(x)
1283  0005 aa10          	or	a,#16
1285  0007 2003          	jra	L145
1286  0009               L735:
1287                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1289  0009 f6            	ld	a,(x)
1290  000a a4ef          	and	a,#239
1291  000c               L145:
1292  000c f7            	ld	(x),a
1293                     ; 462 }
1296  000d 87            	retf	
1343                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1343                     ; 472 {
1344                     .text:	section	.text,new
1345  0000               f_I2C_AcknowledgeConfig:
1347       fffffffe      OFST: set -2
1350                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1352                     ; 476   if (NewState != DISABLE)
1354  0000 7b04          	ld	a,(OFST+6,sp)
1355  0002 2706          	jreq	L765
1356                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1358  0004 e601          	ld	a,(1,x)
1359  0006 aa04          	or	a,#4
1361  0008 2004          	jra	L175
1362  000a               L765:
1363                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1365  000a e601          	ld	a,(1,x)
1366  000c a4fb          	and	a,#251
1367  000e               L175:
1368  000e e701          	ld	(1,x),a
1369                     ; 486 }
1372  0010 87            	retf	
1423                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1423                     ; 495 {
1424                     .text:	section	.text,new
1425  0000               f_I2C_OwnAddress2Config:
1427  0000 89            	pushw	x
1428  0001 88            	push	a
1429       00000001      OFST:	set	1
1432                     ; 496   uint8_t tmpreg = 0;
1434                     ; 499   tmpreg = I2Cx->OAR2;
1436  0002 e605          	ld	a,(5,x)
1438                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1440  0004 a401          	and	a,#1
1441  0006 6b01          	ld	(OFST+0,sp),a
1443                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1445  0008 7b07          	ld	a,(OFST+6,sp)
1446  000a a4fe          	and	a,#254
1447  000c 1a01          	or	a,(OFST+0,sp)
1448  000e 6b01          	ld	(OFST+0,sp),a
1450                     ; 508   I2Cx->OAR2 = tmpreg;
1452  0010 1e02          	ldw	x,(OFST+1,sp)
1453  0012 e705          	ld	(5,x),a
1454                     ; 509 }
1457  0014 5b03          	addw	sp,#3
1458  0016 87            	retf	
1504                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1504                     ; 519 {
1505                     .text:	section	.text,new
1506  0000               f_I2C_DualAddressCmd:
1508       fffffffe      OFST: set -2
1511                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1513                     ; 523   if (NewState != DISABLE)
1515  0000 7b04          	ld	a,(OFST+6,sp)
1516  0002 2706          	jreq	L346
1517                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1519  0004 e605          	ld	a,(5,x)
1520  0006 aa01          	or	a,#1
1522  0008 2004          	jra	L546
1523  000a               L346:
1524                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1526  000a e605          	ld	a,(5,x)
1527  000c a4fe          	and	a,#254
1528  000e               L546:
1529  000e e705          	ld	(5,x),a
1530                     ; 533 }
1533  0010 87            	retf	
1602                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1602                     ; 546 {
1603                     .text:	section	.text,new
1604  0000               f_I2C_AckPositionConfig:
1606       fffffffe      OFST: set -2
1609                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1611                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1613  0000 e601          	ld	a,(1,x)
1614  0002 a4f7          	and	a,#247
1615  0004 e701          	ld	(1,x),a
1616                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1618  0006 e601          	ld	a,(1,x)
1619  0008 1a04          	or	a,(OFST+6,sp)
1620  000a e701          	ld	(1,x),a
1621                     ; 554 }
1624  000c 87            	retf	
1692                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1692                     ; 566 {
1693                     .text:	section	.text,new
1694  0000               f_I2C_SMBusAlertConfig:
1696       fffffffe      OFST: set -2
1699                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1701                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1703  0000 7b04          	ld	a,(OFST+6,sp)
1704  0002 2706          	jreq	L737
1705                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1707  0004 e601          	ld	a,(1,x)
1708  0006 aa20          	or	a,#32
1710  0008 2004          	jra	L147
1711  000a               L737:
1712                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1714  000a e601          	ld	a,(1,x)
1715  000c a4df          	and	a,#223
1716  000e               L147:
1717  000e e701          	ld	(1,x),a
1718                     ; 581 }
1721  0010 87            	retf	
1768                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1768                     ; 593 {
1769                     .text:	section	.text,new
1770  0000               f_I2C_FastModeDutyCycleConfig:
1772       fffffffe      OFST: set -2
1775                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1777                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1779  0000 7b04          	ld	a,(OFST+6,sp)
1780  0002 a140          	cp	a,#64
1781  0004 2606          	jrne	L767
1782                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1784  0006 e60c          	ld	a,(12,x)
1785  0008 aa40          	or	a,#64
1787  000a 2004          	jra	L177
1788  000c               L767:
1789                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1791  000c e60c          	ld	a,(12,x)
1792  000e a4bf          	and	a,#191
1793  0010               L177:
1794  0010 e70c          	ld	(12,x),a
1795                     ; 608 }
1798  0012 87            	retf	
1874                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1874                     ; 622 {
1875                     .text:	section	.text,new
1876  0000               f_I2C_Send7bitAddress:
1878  0000 89            	pushw	x
1879       00000000      OFST:	set	0
1882                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1884                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1886                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1888  0001 7b07          	ld	a,(OFST+7,sp)
1889  0003 2706          	jreq	L1301
1890                     ; 631     Address |= OAR1_ADD0_Set;
1892  0005 7b06          	ld	a,(OFST+6,sp)
1893  0007 aa01          	or	a,#1
1895  0009 2004          	jra	L3301
1896  000b               L1301:
1897                     ; 636     Address &= OAR1_ADD0_Reset;
1899  000b 7b06          	ld	a,(OFST+6,sp)
1900  000d a4fe          	and	a,#254
1901  000f               L3301:
1902  000f 6b06          	ld	(OFST+6,sp),a
1903                     ; 639   I2Cx->DR = Address;
1905  0011 1e01          	ldw	x,(OFST+1,sp)
1906  0013 e706          	ld	(6,x),a
1907                     ; 640 }
1910  0015 85            	popw	x
1911  0016 87            	retf	
1954                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1954                     ; 665 {
1955                     .text:	section	.text,new
1956  0000               f_I2C_SendData:
1958       fffffffe      OFST: set -2
1961                     ; 667   I2Cx->DR = Data;
1963  0000 7b04          	ld	a,(OFST+6,sp)
1964  0002 e706          	ld	(6,x),a
1965                     ; 668 }
1968  0004 87            	retf	
2004                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2004                     ; 677 {
2005                     .text:	section	.text,new
2006  0000               f_I2C_ReceiveData:
2010                     ; 679   return ((uint8_t)I2Cx->DR);
2012  0000 e606          	ld	a,(6,x)
2015  0002 87            	retf	
2061                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2061                     ; 706 {
2062                     .text:	section	.text,new
2063  0000               f_I2C_TransmitPEC:
2065       fffffffe      OFST: set -2
2068                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2070                     ; 710   if (NewState != DISABLE)
2072  0000 7b04          	ld	a,(OFST+6,sp)
2073  0002 2706          	jreq	L3211
2074                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2076  0004 e601          	ld	a,(1,x)
2077  0006 aa10          	or	a,#16
2079  0008 2004          	jra	L5211
2080  000a               L3211:
2081                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2083  000a e601          	ld	a,(1,x)
2084  000c a4ef          	and	a,#239
2085  000e               L5211:
2086  000e e701          	ld	(1,x),a
2087                     ; 720 }
2090  0010 87            	retf	
2136                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2136                     ; 730 {
2137                     .text:	section	.text,new
2138  0000               f_I2C_CalculatePEC:
2140       fffffffe      OFST: set -2
2143                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2145                     ; 734   if (NewState != DISABLE)
2147  0000 7b04          	ld	a,(OFST+6,sp)
2148  0002 2705          	jreq	L3511
2149                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2151  0004 f6            	ld	a,(x)
2152  0005 aa20          	or	a,#32
2154  0007 2003          	jra	L5511
2155  0009               L3511:
2156                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2158  0009 f6            	ld	a,(x)
2159  000a a4df          	and	a,#223
2160  000c               L5511:
2161  000c f7            	ld	(x),a
2162                     ; 744 }
2165  000d 87            	retf	
2234                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2234                     ; 756 {
2235                     .text:	section	.text,new
2236  0000               f_I2C_PECPositionConfig:
2238       fffffffe      OFST: set -2
2241                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2243                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2245  0000 e601          	ld	a,(1,x)
2246  0002 a4f7          	and	a,#247
2247  0004 e701          	ld	(1,x),a
2248                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2250  0006 e601          	ld	a,(1,x)
2251  0008 1a04          	or	a,(OFST+6,sp)
2252  000a e701          	ld	(1,x),a
2253                     ; 764 }
2256  000c 87            	retf	
2292                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2292                     ; 773 {
2293                     .text:	section	.text,new
2294  0000               f_I2C_GetPEC:
2298                     ; 775   return (I2Cx->PECR);
2300  0000 e60e          	ld	a,(14,x)
2303  0002 87            	retf	
2349                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2349                     ; 804 {
2350                     .text:	section	.text,new
2351  0000               f_I2C_DMACmd:
2353       fffffffe      OFST: set -2
2356                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2358                     ; 808   if (NewState != DISABLE)
2360  0000 7b04          	ld	a,(OFST+6,sp)
2361  0002 2706          	jreq	L7521
2362                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2364  0004 e60a          	ld	a,(10,x)
2365  0006 aa08          	or	a,#8
2367  0008 2004          	jra	L1621
2368  000a               L7521:
2369                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2371  000a e60a          	ld	a,(10,x)
2372  000c a4f7          	and	a,#247
2373  000e               L1621:
2374  000e e70a          	ld	(10,x),a
2375                     ; 818 }
2378  0010 87            	retf	
2425                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2425                     ; 828 {
2426                     .text:	section	.text,new
2427  0000               f_I2C_DMALastTransferCmd:
2429       fffffffe      OFST: set -2
2432                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2434                     ; 832   if (NewState != DISABLE)
2436  0000 7b04          	ld	a,(OFST+6,sp)
2437  0002 2706          	jreq	L7031
2438                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2440  0004 e60a          	ld	a,(10,x)
2441  0006 aa10          	or	a,#16
2443  0008 2004          	jra	L1131
2444  000a               L7031:
2445                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2447  000a e60a          	ld	a,(10,x)
2448  000c a4ef          	and	a,#239
2449  000e               L1131:
2450  000e e70a          	ld	(10,x),a
2451                     ; 842 }
2454  0010 87            	retf	
2642                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2642                     ; 955 {
2643                     .text:	section	.text,new
2644  0000               f_I2C_ITConfig:
2646       fffffffe      OFST: set -2
2649                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2651                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2653                     ; 960   if (NewState != DISABLE)
2655  0000 7b06          	ld	a,(OFST+8,sp)
2656  0002 2706          	jreq	L3141
2657                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2659  0004 e60a          	ld	a,(10,x)
2660  0006 1a05          	or	a,(OFST+7,sp)
2662  0008 2005          	jra	L5141
2663  000a               L3141:
2664                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2666  000a 7b05          	ld	a,(OFST+7,sp)
2667  000c 43            	cpl	a
2668  000d e40a          	and	a,(10,x)
2669  000f               L5141:
2670  000f e70a          	ld	(10,x),a
2671                     ; 970 }
2674  0011 87            	retf	
2834                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2834                     ; 995 {
2835                     .text:	section	.text,new
2836  0000               f_I2C_ReadRegister:
2838  0000 89            	pushw	x
2839  0001 5204          	subw	sp,#4
2840       00000004      OFST:	set	4
2843                     ; 996   __IO uint16_t tmp = 0;
2845  0003 5f            	clrw	x
2846  0004 1f03          	ldw	(OFST-1,sp),x
2848                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2850                     ; 1000   tmp = (uint16_t) I2Cx;
2852  0006 1e05          	ldw	x,(OFST+1,sp)
2853  0008 1f03          	ldw	(OFST-1,sp),x
2855                     ; 1001   tmp += I2C_Register;
2857  000a 7b0a          	ld	a,(OFST+6,sp)
2858  000c 5f            	clrw	x
2859  000d 97            	ld	xl,a
2860  000e 1f01          	ldw	(OFST-3,sp),x
2862  0010 72fb03        	addw	x,(OFST-1,sp)
2863  0013 1f03          	ldw	(OFST-1,sp),x
2865                     ; 1004   return (*(__IO uint8_t *) tmp);
2867  0015 1e03          	ldw	x,(OFST-1,sp)
2868  0017 f6            	ld	a,(x)
2871  0018 5b06          	addw	sp,#6
2872  001a 87            	retf	
3121                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3121                     ; 1045 {
3122                     .text:	section	.text,new
3123  0000               f_I2C_CheckEvent:
3125  0000 89            	pushw	x
3126  0001 5206          	subw	sp,#6
3127       00000006      OFST:	set	6
3130                     ; 1046   __IO uint16_t lastevent = 0x00;
3132  0003 5f            	clrw	x
3133  0004 1f04          	ldw	(OFST-2,sp),x
3135                     ; 1047   uint8_t flag1 = 0x00 ;
3137                     ; 1048   uint8_t flag2 = 0x00;
3139                     ; 1049   ErrorStatus status = ERROR;
3141                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3143                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3145  0006 1e0c          	ldw	x,(OFST+6,sp)
3146  0008 a30004        	cpw	x,#4
3147  000b 260a          	jrne	L5261
3148                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3150  000d 1e07          	ldw	x,(OFST+1,sp)
3151  000f e608          	ld	a,(8,x)
3152  0011 a404          	and	a,#4
3153  0013 5f            	clrw	x
3154  0014 97            	ld	xl,a
3156  0015 201a          	jra	L7261
3157  0017               L5261:
3158                     ; 1060     flag1 = I2Cx->SR1;
3160  0017 1e07          	ldw	x,(OFST+1,sp)
3161  0019 e607          	ld	a,(7,x)
3162  001b 6b03          	ld	(OFST-3,sp),a
3164                     ; 1061     flag2 = I2Cx->SR3;
3166  001d e609          	ld	a,(9,x)
3167  001f 6b06          	ld	(OFST+0,sp),a
3169                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3171  0021 5f            	clrw	x
3172  0022 7b03          	ld	a,(OFST-3,sp)
3173  0024 97            	ld	xl,a
3174  0025 1f01          	ldw	(OFST-5,sp),x
3176  0027 5f            	clrw	x
3177  0028 7b06          	ld	a,(OFST+0,sp)
3178  002a 97            	ld	xl,a
3179  002b 7b02          	ld	a,(OFST-4,sp)
3180  002d 01            	rrwa	x,a
3181  002e 1a01          	or	a,(OFST-5,sp)
3182  0030 01            	rrwa	x,a
3183  0031               L7261:
3184  0031 1f04          	ldw	(OFST-2,sp),x
3186                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3188  0033 1e04          	ldw	x,(OFST-2,sp)
3189  0035 01            	rrwa	x,a
3190  0036 140d          	and	a,(OFST+7,sp)
3191  0038 01            	rrwa	x,a
3192  0039 140c          	and	a,(OFST+6,sp)
3193  003b 01            	rrwa	x,a
3194  003c 130c          	cpw	x,(OFST+6,sp)
3195  003e 2604          	jrne	L1361
3196                     ; 1068     status = SUCCESS;
3198  0040 a601          	ld	a,#1
3201  0042 2001          	jra	L3361
3202  0044               L1361:
3203                     ; 1073     status = ERROR;
3205  0044 4f            	clr	a
3207  0045               L3361:
3208                     ; 1077   return status;
3212  0045 5b08          	addw	sp,#8
3213  0047 87            	retf	
3273                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3273                     ; 1096 {
3274                     .text:	section	.text,new
3275  0000               f_I2C_GetLastEvent:
3277  0000 89            	pushw	x
3278  0001 5206          	subw	sp,#6
3279       00000006      OFST:	set	6
3282                     ; 1097   __IO uint16_t lastevent = 0;
3284  0003 5f            	clrw	x
3285  0004 1f05          	ldw	(OFST-1,sp),x
3287                     ; 1098   uint16_t flag1 = 0;
3289                     ; 1099   uint16_t flag2 = 0;
3291                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3293  0006 1e07          	ldw	x,(OFST+1,sp)
3294  0008 e608          	ld	a,(8,x)
3295  000a a504          	bcp	a,#4
3296  000c 2705          	jreq	L5661
3297                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3299  000e ae0004        	ldw	x,#4
3301  0011 2014          	jra	L7661
3302  0013               L5661:
3303                     ; 1108     flag1 = I2Cx->SR1;
3305  0013 e607          	ld	a,(7,x)
3306  0015 5f            	clrw	x
3307  0016 97            	ld	xl,a
3308  0017 1f01          	ldw	(OFST-5,sp),x
3310                     ; 1109     flag2 = I2Cx->SR3;
3312  0019 1e07          	ldw	x,(OFST+1,sp)
3313  001b e609          	ld	a,(9,x)
3314  001d 5f            	clrw	x
3315  001e 97            	ld	xl,a
3316  001f 1f03          	ldw	(OFST-3,sp),x
3318                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3320  0021 7b02          	ld	a,(OFST-4,sp)
3321  0023 01            	rrwa	x,a
3322  0024 1a01          	or	a,(OFST-5,sp)
3323  0026 01            	rrwa	x,a
3324  0027               L7661:
3325  0027 1f05          	ldw	(OFST-1,sp),x
3327                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3329  0029 1e05          	ldw	x,(OFST-1,sp)
3332  002b 5b08          	addw	sp,#8
3333  002d 87            	retf	
3585                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3585                     ; 1153 {
3586                     .text:	section	.text,new
3587  0000               f_I2C_GetFlagStatus:
3589  0000 89            	pushw	x
3590  0001 89            	pushw	x
3591       00000002      OFST:	set	2
3594                     ; 1154   uint8_t tempreg = 0;
3596  0002 0f02          	clr	(OFST+0,sp)
3598                     ; 1155   uint8_t regindex = 0;
3600                     ; 1156   FlagStatus bitstatus = RESET;
3602                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3604                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3606  0004 7b08          	ld	a,(OFST+6,sp)
3607  0006 6b01          	ld	(OFST-1,sp),a
3609                     ; 1164   switch (regindex)
3612                     ; 1181     default:
3612                     ; 1182       break;
3613  0008 4a            	dec	a
3614  0009 2708          	jreq	L1761
3615  000b 4a            	dec	a
3616  000c 270b          	jreq	L3761
3617  000e 4a            	dec	a
3618  000f 270e          	jreq	L5761
3619  0011 2012          	jra	L7202
3620  0013               L1761:
3621                     ; 1167     case 0x01:
3621                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3623  0013 1e03          	ldw	x,(OFST+1,sp)
3624  0015 e607          	ld	a,(7,x)
3625                     ; 1169       break;
3627  0017 200a          	jpf	LC002
3628  0019               L3761:
3629                     ; 1172     case 0x02:
3629                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3631  0019 1e03          	ldw	x,(OFST+1,sp)
3632  001b e608          	ld	a,(8,x)
3633                     ; 1174       break;
3635  001d 2004          	jpf	LC002
3636  001f               L5761:
3637                     ; 1177     case 0x03:
3637                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3639  001f 1e03          	ldw	x,(OFST+1,sp)
3640  0021 e609          	ld	a,(9,x)
3641  0023               LC002:
3642  0023 6b02          	ld	(OFST+0,sp),a
3644                     ; 1179       break;
3646                     ; 1181     default:
3646                     ; 1182       break;
3648  0025               L7202:
3649                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3651  0025 7b09          	ld	a,(OFST+7,sp)
3652  0027 1502          	bcp	a,(OFST+0,sp)
3653  0029 2704          	jreq	L1302
3654                     ; 1189     bitstatus = SET;
3656  002b a601          	ld	a,#1
3659  002d 2001          	jra	L3302
3660  002f               L1302:
3661                     ; 1194     bitstatus = RESET;
3663  002f 4f            	clr	a
3665  0030               L3302:
3666                     ; 1197   return bitstatus;
3670  0030 5b04          	addw	sp,#4
3671  0032 87            	retf	
3724                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3724                     ; 1230 {
3725                     .text:	section	.text,new
3726  0000               f_I2C_ClearFlag:
3728  0000 89            	pushw	x
3729  0001 89            	pushw	x
3730       00000002      OFST:	set	2
3733                     ; 1231   uint16_t flagpos = 0;
3735                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3737                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3739  0002 7b09          	ld	a,(OFST+7,sp)
3740  0004 5f            	clrw	x
3741  0005 02            	rlwa	x,a
3742  0006 1f01          	ldw	(OFST-1,sp),x
3744                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3746  0008 7b02          	ld	a,(OFST+0,sp)
3747  000a 43            	cpl	a
3748  000b 1e03          	ldw	x,(OFST+1,sp)
3749  000d e708          	ld	(8,x),a
3750                     ; 1239 }
3753  000f 5b04          	addw	sp,#4
3754  0011 87            	retf	
3827                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3827                     ; 1265 {
3828                     .text:	section	.text,new
3829  0000               f_I2C_GetITStatus:
3831  0000 89            	pushw	x
3832  0001 5204          	subw	sp,#4
3833       00000004      OFST:	set	4
3836                     ; 1266   ITStatus bitstatus = RESET;
3838                     ; 1267   __IO uint8_t enablestatus = 0;
3840  0003 0f03          	clr	(OFST-1,sp)
3842                     ; 1268   uint16_t tempregister = 0;
3844                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3846                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3848  0005 7b0a          	ld	a,(OFST+6,sp)
3849  0007 a407          	and	a,#7
3850  0009 5f            	clrw	x
3851  000a 97            	ld	xl,a
3852  000b 1f01          	ldw	(OFST-3,sp),x
3854                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3856  000d 1e05          	ldw	x,(OFST+1,sp)
3857  000f e60a          	ld	a,(10,x)
3858  0011 1402          	and	a,(OFST-2,sp)
3859  0013 6b03          	ld	(OFST-1,sp),a
3861                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3863  0015 7b0a          	ld	a,(OFST+6,sp)
3864  0017 a430          	and	a,#48
3865  0019 97            	ld	xl,a
3866  001a 4f            	clr	a
3867  001b 02            	rlwa	x,a
3868  001c a30100        	cpw	x,#256
3869  001f 260e          	jrne	L1212
3870                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3872  0021 1e05          	ldw	x,(OFST+1,sp)
3873  0023 e607          	ld	a,(7,x)
3874  0025 150b          	bcp	a,(OFST+7,sp)
3875  0027 2716          	jreq	L1312
3877  0029 0d03          	tnz	(OFST-1,sp)
3878  002b 2712          	jreq	L1312
3879                     ; 1284       bitstatus = SET;
3881  002d 200c          	jpf	LC004
3882                     ; 1289       bitstatus = RESET;
3883  002f               L1212:
3884                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3886  002f 1e05          	ldw	x,(OFST+1,sp)
3887  0031 e608          	ld	a,(8,x)
3888  0033 150b          	bcp	a,(OFST+7,sp)
3889  0035 2708          	jreq	L1312
3891  0037 0d03          	tnz	(OFST-1,sp)
3892  0039 2704          	jreq	L1312
3893                     ; 1298       bitstatus = SET;
3895  003b               LC004:
3897  003b a601          	ld	a,#1
3900  003d 2001          	jra	L7212
3901  003f               L1312:
3902                     ; 1303       bitstatus = RESET;
3905  003f 4f            	clr	a
3907  0040               L7212:
3908                     ; 1307   return  bitstatus;
3912  0040 5b06          	addw	sp,#6
3913  0042 87            	retf	
3967                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3967                     ; 1341 {
3968                     .text:	section	.text,new
3969  0000               f_I2C_ClearITPendingBit:
3971  0000 89            	pushw	x
3972  0001 89            	pushw	x
3973       00000002      OFST:	set	2
3976                     ; 1342   uint16_t flagpos = 0;
3978                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
3980                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
3982  0002 7b09          	ld	a,(OFST+7,sp)
3983  0004 5f            	clrw	x
3984  0005 02            	rlwa	x,a
3985  0006 1f01          	ldw	(OFST-1,sp),x
3987                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
3989  0008 7b02          	ld	a,(OFST+0,sp)
3990  000a 43            	cpl	a
3991  000b 1e03          	ldw	x,(OFST+1,sp)
3992  000d e708          	ld	(8,x),a
3993                     ; 1352 }
3996  000f 5b04          	addw	sp,#4
3997  0011 87            	retf	
4009                     	xdef	f_I2C_ClearITPendingBit
4010                     	xdef	f_I2C_GetITStatus
4011                     	xdef	f_I2C_ClearFlag
4012                     	xdef	f_I2C_GetFlagStatus
4013                     	xdef	f_I2C_GetLastEvent
4014                     	xdef	f_I2C_CheckEvent
4015                     	xdef	f_I2C_ReadRegister
4016                     	xdef	f_I2C_ITConfig
4017                     	xdef	f_I2C_DMALastTransferCmd
4018                     	xdef	f_I2C_DMACmd
4019                     	xdef	f_I2C_CalculatePEC
4020                     	xdef	f_I2C_TransmitPEC
4021                     	xdef	f_I2C_GetPEC
4022                     	xdef	f_I2C_PECPositionConfig
4023                     	xdef	f_I2C_ReceiveData
4024                     	xdef	f_I2C_SendData
4025                     	xdef	f_I2C_Send7bitAddress
4026                     	xdef	f_I2C_SMBusAlertConfig
4027                     	xdef	f_I2C_FastModeDutyCycleConfig
4028                     	xdef	f_I2C_AckPositionConfig
4029                     	xdef	f_I2C_DualAddressCmd
4030                     	xdef	f_I2C_OwnAddress2Config
4031                     	xdef	f_I2C_AcknowledgeConfig
4032                     	xdef	f_I2C_GenerateSTOP
4033                     	xdef	f_I2C_GenerateSTART
4034                     	xdef	f_I2C_ARPCmd
4035                     	xdef	f_I2C_StretchClockCmd
4036                     	xdef	f_I2C_SoftwareResetCmd
4037                     	xdef	f_I2C_GeneralCallCmd
4038                     	xdef	f_I2C_Cmd
4039                     	xdef	f_I2C_Init
4040                     	xdef	f_I2C_DeInit
4041                     	xref	f_CLK_GetClockFreq
4042                     	xref.b	c_lreg
4043                     	xref.b	c_x
4062                     	xref	d_uitol
4063                     	xref	d_sdivx
4064                     	xref	d_lzmp
4065                     	xref	d_rtol
4066                     	xref	d_smul
4067                     	xref	d_lmul
4068                     	xref	d_lcmp
4069                     	xref	d_ltor
4070                     	xref	d_ludv
4071                     	end
