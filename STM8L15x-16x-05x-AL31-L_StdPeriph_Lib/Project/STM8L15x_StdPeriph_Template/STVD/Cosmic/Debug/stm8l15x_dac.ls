   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 142 void DAC_DeInit(void)
  50                     ; 143 {
  51                     .text:	section	.text,new
  52  0000               f_DAC_DeInit:
  56                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  58  0000 725f5380      	clr	21376
  59                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  61  0004 725f5381      	clr	21377
  62                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  64  0008 725f5382      	clr	21378
  65                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  67  000c 725f5383      	clr	21379
  68                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  70  0010 725f5384      	clr	21380
  71                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  73  0014 35ff5385      	mov	21381,#255
  74                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  76  0018 725f5388      	clr	21384
  77                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  79  001c 725f5389      	clr	21385
  80                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  82  0020 725f538c      	clr	21388
  83                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  85  0024 725f538d      	clr	21389
  86                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  88  0028 725f5390      	clr	21392
  89                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  91  002c 725f5394      	clr	21396
  92                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  94  0030 725f5395      	clr	21397
  95                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  97  0034 725f5398      	clr	21400
  98                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
 100  0038 725f5399      	clr	21401
 101                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
 103  003c 725f539c      	clr	21404
 104                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0040 725f53a0      	clr	21408
 107                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 109  0044 725f53a1      	clr	21409
 110                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 112  0048 725f53a2      	clr	21410
 113                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 115  004c 725f53a3      	clr	21411
 116                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0050 725f53a4      	clr	21412
 119                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 121  0054 725f53a5      	clr	21413
 122                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 124  0058 725f53a6      	clr	21414
 125                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 127  005c 725f53a7      	clr	21415
 128                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 130  0060 725f53a8      	clr	21416
 131                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 133  0064 725f53a9      	clr	21417
 134                     ; 187 }
 137  0068 87            	retf	
 291                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 291                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 291                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 291                     ; 211 {
 292                     .text:	section	.text,new
 293  0000               f_DAC_Init:
 295  0000 89            	pushw	x
 296  0001 5203          	subw	sp,#3
 297       00000003      OFST:	set	3
 300                     ; 212   uint8_t tmpreg = 0;
 302                     ; 213   uint16_t tmpreg2 = 0;
 304                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 306                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 308                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 310                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 312  0003 9e            	ld	a,xh
 313  0004 48            	sll	a
 314  0005 5f            	clrw	x
 315  0006 97            	ld	xl,a
 316  0007 1f01          	ldw	(OFST-2,sp),x
 318                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 320  0009 d65380        	ld	a,(21376,x)
 322                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 324  000c a4c1          	and	a,#193
 326                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 328  000e 1a09          	or	a,(OFST+6,sp)
 329  0010 6b03          	ld	(OFST+0,sp),a
 331                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 333  0012 7b05          	ld	a,(OFST+2,sp)
 334  0014 a130          	cp	a,#48
 335  0016 2706          	jreq	L111
 336                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 338  0018 aa04          	or	a,#4
 339  001a 1a03          	or	a,(OFST+0,sp)
 340  001c 6b03          	ld	(OFST+0,sp),a
 342  001e               L111:
 343                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 345  001e 7b03          	ld	a,(OFST+0,sp)
 346  0020 d75380        	ld	(21376,x),a
 347                     ; 240 }
 350  0023 5b05          	addw	sp,#5
 351  0025 87            	retf	
 422                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 422                     ; 255 {
 423                     .text:	section	.text,new
 424  0000               f_DAC_Cmd:
 426  0000 89            	pushw	x
 427  0001 89            	pushw	x
 428       00000002      OFST:	set	2
 431                     ; 256   uint16_t cr1addr = 0;
 433                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 435                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 437                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 439  0002 9e            	ld	a,xh
 440  0003 48            	sll	a
 441  0004 5f            	clrw	x
 442  0005 97            	ld	xl,a
 443  0006 1c5380        	addw	x,#21376
 444  0009 1f01          	ldw	(OFST-1,sp),x
 446                     ; 264   if (NewState != DISABLE)
 448  000b 7b04          	ld	a,(OFST+2,sp)
 449  000d 2705          	jreq	L741
 450                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 452  000f f6            	ld	a,(x)
 453  0010 aa01          	or	a,#1
 455  0012 2003          	jra	L151
 456  0014               L741:
 457                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 459  0014 f6            	ld	a,(x)
 460  0015 a4fe          	and	a,#254
 461  0017               L151:
 462  0017 f7            	ld	(x),a
 463                     ; 274 }
 466  0018 5b04          	addw	sp,#4
 467  001a 87            	retf	
 512                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 512                     ; 287 {
 513                     .text:	section	.text,new
 514  0000               f_DAC_SoftwareTriggerCmd:
 516  0000 89            	pushw	x
 517       00000000      OFST:	set	0
 520                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 522                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 524                     ; 292   if (NewState != DISABLE)
 526  0001 9f            	ld	a,xl
 527  0002 4d            	tnz	a
 528  0003 2711          	jreq	L571
 529                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 531  0005 9e            	ld	a,xh
 532  0006 5f            	clrw	x
 533  0007 97            	ld	xl,a
 534  0008 a601          	ld	a,#1
 535  000a 5d            	tnzw	x
 536  000b 2704          	jreq	L41
 537  000d               L61:
 538  000d 48            	sll	a
 539  000e 5a            	decw	x
 540  000f 26fc          	jrne	L61
 541  0011               L41:
 542  0011 ca5384        	or	a,21380
 544  0014 2011          	jra	L771
 545  0016               L571:
 546                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 548  0016 7b01          	ld	a,(OFST+1,sp)
 549  0018 5f            	clrw	x
 550  0019 97            	ld	xl,a
 551  001a a601          	ld	a,#1
 552  001c 5d            	tnzw	x
 553  001d 2704          	jreq	L02
 554  001f               L22:
 555  001f 48            	sll	a
 556  0020 5a            	decw	x
 557  0021 26fc          	jrne	L22
 558  0023               L02:
 559  0023 43            	cpl	a
 560  0024 c45384        	and	a,21380
 561  0027               L771:
 562  0027 c75384        	ld	21380,a
 563                     ; 302 }
 566  002a 85            	popw	x
 567  002b 87            	retf	
 602                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 602                     ; 312 {
 603                     .text:	section	.text,new
 604  0000               f_DAC_DualSoftwareTriggerCmd:
 608                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 610                     ; 316   if (NewState != DISABLE)
 612  0000 4d            	tnz	a
 613  0001 2707          	jreq	L712
 614                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 616  0003 c65384        	ld	a,21380
 617  0006 aa03          	or	a,#3
 619  0008 2005          	jra	L122
 620  000a               L712:
 621                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 623  000a c65384        	ld	a,21380
 624  000d a4fc          	and	a,#252
 625  000f               L122:
 626  000f c75384        	ld	21380,a
 627                     ; 326 }
 630  0012 87            	retf	
 712                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 712                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 712                     ; 344                            FunctionalState NewState)
 712                     ; 345 {
 713                     .text:	section	.text,new
 714  0000               f_DAC_WaveGenerationCmd:
 716  0000 89            	pushw	x
 717  0001 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 346   uint8_t tmpreg = 0;
 723                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 725                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 727                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 729                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 731  0002 9e            	ld	a,xh
 732  0003 48            	sll	a
 733  0004 5f            	clrw	x
 734  0005 97            	ld	xl,a
 735  0006 d65380        	ld	a,(21376,x)
 736  0009 a43f          	and	a,#63
 738                     ; 356   if (NewState != DISABLE)
 740  000b 0d07          	tnz	(OFST+6,sp)
 741  000d 2702          	jreq	L362
 742                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 744  000f 1a03          	or	a,(OFST+2,sp)
 746  0011               L362:
 747  0011 6b01          	ld	(OFST+0,sp),a
 748                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 750  0013 7b02          	ld	a,(OFST+1,sp)
 751  0015 48            	sll	a
 752  0016 5f            	clrw	x
 753  0017 97            	ld	xl,a
 754  0018 7b01          	ld	a,(OFST+0,sp)
 755  001a d75380        	ld	(21376,x),a
 756                     ; 364 }
 759  001d 5b03          	addw	sp,#3
 760  001f 87            	retf	
 921                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 921                     ; 389 {
 922                     .text:	section	.text,new
 923  0000               f_DAC_SetNoiseWaveLFSR:
 925  0000 89            	pushw	x
 926  0001 5203          	subw	sp,#3
 927       00000003      OFST:	set	3
 930                     ; 390   uint8_t tmpreg = 0;
 932                     ; 391   uint16_t cr2addr = 0;
 934                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 936                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 938                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 940  0003 9e            	ld	a,xh
 941  0004 48            	sll	a
 942  0005 5f            	clrw	x
 943  0006 97            	ld	xl,a
 944  0007 1c5381        	addw	x,#21377
 945  000a 1f02          	ldw	(OFST-1,sp),x
 947                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 949  000c f6            	ld	a,(x)
 950  000d a4f0          	and	a,#240
 951  000f 6b01          	ld	(OFST-2,sp),a
 953                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 955  0011 1a05          	or	a,(OFST+2,sp)
 956  0013 f7            	ld	(x),a
 957                     ; 403 }
 960  0014 5b05          	addw	sp,#5
 961  0016 87            	retf	
1123                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1123                     ; 428 {
1124                     .text:	section	.text,new
1125  0000               f_DAC_SetTriangleWaveAmplitude:
1127  0000 89            	pushw	x
1128  0001 5203          	subw	sp,#3
1129       00000003      OFST:	set	3
1132                     ; 429   uint8_t tmpreg = 0;
1134                     ; 430   uint16_t cr2addr = 0;
1136                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1138                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1140                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1142  0003 9e            	ld	a,xh
1143  0004 48            	sll	a
1144  0005 5f            	clrw	x
1145  0006 97            	ld	xl,a
1146  0007 1c5381        	addw	x,#21377
1147  000a 1f02          	ldw	(OFST-1,sp),x
1149                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1151  000c f6            	ld	a,(x)
1152  000d a4f0          	and	a,#240
1153  000f 6b01          	ld	(OFST-2,sp),a
1155                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1157  0011 1a05          	or	a,(OFST+2,sp)
1158  0013 f7            	ld	(x),a
1159                     ; 443 }
1162  0014 5b05          	addw	sp,#5
1163  0016 87            	retf	
1232                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1232                     ; 456 {
1233                     .text:	section	.text,new
1234  0000               f_DAC_SetChannel1Data:
1236  0000 88            	push	a
1237       00000000      OFST:	set	0
1240                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1242                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1244  0001 a108          	cp	a,#8
1245  0003 2712          	jreq	L364
1246                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1248  0005 5f            	clrw	x
1249  0006 97            	ld	xl,a
1250  0007 7b05          	ld	a,(OFST+5,sp)
1251  0009 d75388        	ld	(21384,x),a
1252                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1254  000c 5f            	clrw	x
1255  000d 7b01          	ld	a,(OFST+1,sp)
1256  000f 97            	ld	xl,a
1257  0010 7b06          	ld	a,(OFST+6,sp)
1258  0012 d75389        	ld	(21385,x),a
1260  0015 2005          	jra	L564
1261  0017               L364:
1262                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1264                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1266  0017 7b06          	ld	a,(OFST+6,sp)
1267  0019 c75390        	ld	21392,a
1268  001c               L564:
1269                     ; 474 }
1272  001c 84            	pop	a
1273  001d 87            	retf	
1315                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1315                     ; 487 {
1316                     .text:	section	.text,new
1317  0000               f_DAC_SetChannel2Data:
1319  0000 88            	push	a
1320       00000000      OFST:	set	0
1323                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1325                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1327  0001 a108          	cp	a,#8
1328  0003 2712          	jreq	L705
1329                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1331  0005 5f            	clrw	x
1332  0006 97            	ld	xl,a
1333  0007 7b05          	ld	a,(OFST+5,sp)
1334  0009 d75394        	ld	(21396,x),a
1335                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1337  000c 5f            	clrw	x
1338  000d 7b01          	ld	a,(OFST+1,sp)
1339  000f 97            	ld	xl,a
1340  0010 7b06          	ld	a,(OFST+6,sp)
1341  0012 d75395        	ld	(21397,x),a
1343  0015 2005          	jra	L115
1344  0017               L705:
1345                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1347                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1349  0017 7b06          	ld	a,(OFST+6,sp)
1350  0019 c7539c        	ld	21404,a
1351  001c               L115:
1352                     ; 505 }
1355  001c 84            	pop	a
1356  001d 87            	retf	
1412                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1412                     ; 523 {
1413                     .text:	section	.text,new
1414  0000               f_DAC_SetDualChannelData:
1416  0000 88            	push	a
1417  0001 89            	pushw	x
1418       00000002      OFST:	set	2
1421                     ; 524   uint16_t dchxrdhrhaddr = 0;
1423                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1425                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1427  0002 a108          	cp	a,#8
1428  0004 271e          	jreq	L735
1429                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1431  0006 a653          	ld	a,#83
1432  0008 97            	ld	xl,a
1433  0009 a6a0          	ld	a,#160
1434  000b 1b03          	add	a,(OFST+1,sp)
1435  000d 2401          	jrnc	L24
1436  000f 5c            	incw	x
1437  0010               L24:
1438  0010 02            	rlwa	x,a
1439  0011 1f01          	ldw	(OFST-1,sp),x
1441                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1443  0013 7b09          	ld	a,(OFST+7,sp)
1444  0015 f7            	ld	(x),a
1445                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1447  0016 7b0a          	ld	a,(OFST+8,sp)
1448  0018 e701          	ld	(1,x),a
1449                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1451  001a 7b07          	ld	a,(OFST+5,sp)
1452  001c e702          	ld	(2,x),a
1453                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1455  001e 7b08          	ld	a,(OFST+6,sp)
1456  0020 e703          	ld	(3,x),a
1458  0022 200a          	jra	L145
1459  0024               L735:
1460                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1462                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1464  0024 7b0a          	ld	a,(OFST+8,sp)
1465  0026 c753a8        	ld	21416,a
1466                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1468  0029 7b08          	ld	a,(OFST+6,sp)
1469  002b c753a9        	ld	21417,a
1470  002e               L145:
1471                     ; 549 }
1474  002e 5b03          	addw	sp,#3
1475  0030 87            	retf	
1524                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1524                     ; 560 {
1525                     .text:	section	.text,new
1526  0000               f_DAC_GetDataOutputValue:
1528  0000 89            	pushw	x
1529       00000002      OFST:	set	2
1532                     ; 561   uint16_t outputdata = 0;
1534                     ; 562   uint16_t tmp = 0;
1536                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1538                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1540  0001 4d            	tnz	a
1541  0002 260d          	jrne	L565
1542                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1544  0004 c653ac        	ld	a,21420
1545  0007 97            	ld	xl,a
1546  0008 4f            	clr	a
1547  0009 02            	rlwa	x,a
1548  000a 1f01          	ldw	(OFST-1,sp),x
1550                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1552  000c c653ad        	ld	a,21421
1554  000f 200b          	jra	L765
1555  0011               L565:
1556                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1558  0011 c653b0        	ld	a,21424
1559  0014 97            	ld	xl,a
1560  0015 4f            	clr	a
1561  0016 02            	rlwa	x,a
1562  0017 1f01          	ldw	(OFST-1,sp),x
1564                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1566  0019 c653b1        	ld	a,21425
1567  001c               L765:
1568  001c 5f            	clrw	x
1569  001d 97            	ld	xl,a
1570  001e 01            	rrwa	x,a
1571  001f 1a02          	or	a,(OFST+0,sp)
1572  0021 01            	rrwa	x,a
1573  0022 1a01          	or	a,(OFST-1,sp)
1574  0024 01            	rrwa	x,a
1576                     ; 581   return (uint16_t)outputdata;
1580  0025 5b02          	addw	sp,#2
1581  0027 87            	retf	
1632                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1632                     ; 614 {
1633                     .text:	section	.text,new
1634  0000               f_DAC_DMACmd:
1636  0000 89            	pushw	x
1637  0001 89            	pushw	x
1638       00000002      OFST:	set	2
1641                     ; 615   uint16_t cr2addr = 0;
1643                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1645                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1647                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1649  0002 9e            	ld	a,xh
1650  0003 48            	sll	a
1651  0004 5f            	clrw	x
1652  0005 97            	ld	xl,a
1653  0006 1c5381        	addw	x,#21377
1654  0009 1f01          	ldw	(OFST-1,sp),x
1656                     ; 624   if (NewState != DISABLE)
1658  000b 7b04          	ld	a,(OFST+2,sp)
1659  000d 2705          	jreq	L516
1660                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1662  000f f6            	ld	a,(x)
1663  0010 aa10          	or	a,#16
1665  0012 2003          	jra	L716
1666  0014               L516:
1667                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1669  0014 f6            	ld	a,(x)
1670  0015 a4ef          	and	a,#239
1671  0017               L716:
1672  0017 f7            	ld	(x),a
1673                     ; 634 }
1676  0018 5b04          	addw	sp,#4
1677  001a 87            	retf	
1751                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1751                     ; 668 {
1752                     .text:	section	.text,new
1753  0000               f_DAC_ITConfig:
1755  0000 89            	pushw	x
1756  0001 89            	pushw	x
1757       00000002      OFST:	set	2
1760                     ; 669   uint16_t cr2addr = 0;
1762                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1764                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1766                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1768                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1770  0002 9e            	ld	a,xh
1771  0003 48            	sll	a
1772  0004 5f            	clrw	x
1773  0005 97            	ld	xl,a
1774  0006 1c5381        	addw	x,#21377
1775  0009 1f01          	ldw	(OFST-1,sp),x
1777                     ; 679   if (NewState != DISABLE)
1779  000b 7b08          	ld	a,(OFST+6,sp)
1780  000d 2705          	jreq	L756
1781                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1783  000f f6            	ld	a,(x)
1784  0010 1a04          	or	a,(OFST+2,sp)
1786  0012 2004          	jra	L166
1787  0014               L756:
1788                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1790  0014 7b04          	ld	a,(OFST+2,sp)
1791  0016 43            	cpl	a
1792  0017 f4            	and	a,(x)
1793  0018               L166:
1794  0018 f7            	ld	(x),a
1795                     ; 689 }
1798  0019 5b04          	addw	sp,#4
1799  001b 87            	retf	
1894                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1894                     ; 705 {
1895                     .text:	section	.text,new
1896  0000               f_DAC_GetFlagStatus:
1898  0000 89            	pushw	x
1899  0001 88            	push	a
1900       00000001      OFST:	set	1
1903                     ; 706   FlagStatus flagstatus = RESET;
1905                     ; 707   uint8_t flag = 0;
1907                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1909                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1911                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1913  0002 9e            	ld	a,xh
1914  0003 5f            	clrw	x
1915  0004 97            	ld	xl,a
1916  0005 7b03          	ld	a,(OFST+2,sp)
1917  0007 5d            	tnzw	x
1918  0008 2704          	jreq	L45
1919  000a               L65:
1920  000a 48            	sll	a
1921  000b 5a            	decw	x
1922  000c 26fc          	jrne	L65
1923  000e               L45:
1924  000e 6b01          	ld	(OFST+0,sp),a
1926                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1928  0010 c65385        	ld	a,21381
1929  0013 1501          	bcp	a,(OFST+0,sp)
1930  0015 2704          	jreq	L137
1931                     ; 719     flagstatus = SET;
1933  0017 a601          	ld	a,#1
1936  0019 2001          	jra	L337
1937  001b               L137:
1938                     ; 724     flagstatus = RESET;
1940  001b 4f            	clr	a
1942  001c               L337:
1943                     ; 728   return  flagstatus;
1947  001c 5b03          	addw	sp,#3
1948  001e 87            	retf	
1999                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1999                     ; 743 {
2000                     .text:	section	.text,new
2001  0000               f_DAC_ClearFlag:
2003  0000 89            	pushw	x
2004  0001 88            	push	a
2005       00000001      OFST:	set	1
2008                     ; 744   uint8_t flag = 0;
2010                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2012                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2014                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2016  0002 9e            	ld	a,xh
2017  0003 5f            	clrw	x
2018  0004 97            	ld	xl,a
2019  0005 7b03          	ld	a,(OFST+2,sp)
2020  0007 5d            	tnzw	x
2021  0008 2704          	jreq	L26
2022  000a               L46:
2023  000a 48            	sll	a
2024  000b 5a            	decw	x
2025  000c 26fc          	jrne	L46
2026  000e               L26:
2028                     ; 754   DAC->SR = (uint8_t)(~flag);
2030  000e 43            	cpl	a
2031  000f c75385        	ld	21381,a
2032                     ; 755 }
2035  0012 5b03          	addw	sp,#3
2036  0014 87            	retf	
2112                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2112                     ; 771 {
2113                     .text:	section	.text,new
2114  0000               f_DAC_GetITStatus:
2116  0000 89            	pushw	x
2117  0001 89            	pushw	x
2118       00000002      OFST:	set	2
2121                     ; 772   ITStatus itstatus = RESET;
2123                     ; 773   uint8_t enablestatus = 0;
2125                     ; 774   uint8_t flagstatus = 0;
2127                     ; 775   uint8_t tempreg = 0;
2129                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2131                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2133                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2135  0002 9e            	ld	a,xh
2136  0003 48            	sll	a
2137  0004 48            	sll	a
2138  0005 5f            	clrw	x
2139  0006 97            	ld	xl,a
2140  0007 d65381        	ld	a,(21377,x)
2141  000a 6b02          	ld	(OFST+0,sp),a
2143                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2145  000c 5f            	clrw	x
2146  000d 7b03          	ld	a,(OFST+1,sp)
2147  000f 97            	ld	xl,a
2148  0010 7b04          	ld	a,(OFST+2,sp)
2149  0012 5d            	tnzw	x
2150  0013 2704          	jreq	L07
2151  0015               L27:
2152  0015 48            	sll	a
2153  0016 5a            	decw	x
2154  0017 26fc          	jrne	L27
2155  0019               L07:
2156  0019 1402          	and	a,(OFST+0,sp)
2157  001b 6b01          	ld	(OFST-1,sp),a
2159                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2161  001d a605          	ld	a,#5
2162  001f 1003          	sub	a,(OFST+1,sp)
2163  0021 5f            	clrw	x
2164  0022 97            	ld	xl,a
2165  0023 7b04          	ld	a,(OFST+2,sp)
2166  0025 5d            	tnzw	x
2167  0026 2704          	jreq	L47
2168  0028               L67:
2169  0028 44            	srl	a
2170  0029 5a            	decw	x
2171  002a 26fc          	jrne	L67
2172  002c               L47:
2173  002c c45385        	and	a,21381
2174  002f 6b02          	ld	(OFST+0,sp),a
2176                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2178  0031 2708          	jreq	L5101
2180  0033 7b01          	ld	a,(OFST-1,sp)
2181  0035 2704          	jreq	L5101
2182                     ; 790     itstatus = SET;
2184  0037 a601          	ld	a,#1
2187  0039 2001          	jra	L7101
2188  003b               L5101:
2189                     ; 795     itstatus = RESET;
2191  003b 4f            	clr	a
2193  003c               L7101:
2194                     ; 799   return  itstatus;
2198  003c 5b04          	addw	sp,#4
2199  003e 87            	retf	
2244                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2244                     ; 814 {
2245                     .text:	section	.text,new
2246  0000               f_DAC_ClearITPendingBit:
2248  0000 89            	pushw	x
2249       00000000      OFST:	set	0
2252                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2254                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2256                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2258  0001 9e            	ld	a,xh
2259  0002 a005          	sub	a,#5
2260  0004 40            	neg	a
2261  0005 5f            	clrw	x
2262  0006 97            	ld	xl,a
2263  0007 7b02          	ld	a,(OFST+2,sp)
2264  0009 5d            	tnzw	x
2265  000a 2704          	jreq	L201
2266  000c               L401:
2267  000c 44            	srl	a
2268  000d 5a            	decw	x
2269  000e 26fc          	jrne	L401
2270  0010               L201:
2271  0010 43            	cpl	a
2272  0011 c75385        	ld	21381,a
2273                     ; 821 }
2276  0014 85            	popw	x
2277  0015 87            	retf	
2289                     	xdef	f_DAC_ClearITPendingBit
2290                     	xdef	f_DAC_GetITStatus
2291                     	xdef	f_DAC_ClearFlag
2292                     	xdef	f_DAC_GetFlagStatus
2293                     	xdef	f_DAC_ITConfig
2294                     	xdef	f_DAC_DMACmd
2295                     	xdef	f_DAC_GetDataOutputValue
2296                     	xdef	f_DAC_SetDualChannelData
2297                     	xdef	f_DAC_SetChannel2Data
2298                     	xdef	f_DAC_SetChannel1Data
2299                     	xdef	f_DAC_SetTriangleWaveAmplitude
2300                     	xdef	f_DAC_SetNoiseWaveLFSR
2301                     	xdef	f_DAC_WaveGenerationCmd
2302                     	xdef	f_DAC_DualSoftwareTriggerCmd
2303                     	xdef	f_DAC_SoftwareTriggerCmd
2304                     	xdef	f_DAC_Cmd
2305                     	xdef	f_DAC_Init
2306                     	xdef	f_DAC_DeInit
2325                     	end
