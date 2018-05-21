   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 111 void COMP_DeInit(void)
  50                     ; 112 {
  51                     .text:	section	.text,new
  52  0000               f_COMP_DeInit:
  56                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  58  0000 725f5440      	clr	21568
  59                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  61  0004 725f5441      	clr	21569
  62                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  64  0008 35c05442      	mov	21570,#192
  65                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  67  000c 725f5443      	clr	21571
  68                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  70  0010 725f5444      	clr	21572
  71                     ; 127 }
  74  0014 87            	retf	
 249                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 249                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 249                     ; 155 {
 250                     .text:	section	.text,new
 251  0000               f_COMP_Init:
 253       fffffffe      OFST: set -2
 256                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 258                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 260                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 262                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 264  0000 c65442        	ld	a,21570
 265  0003 a4c7          	and	a,#199
 266  0005 c75442        	ld	21570,a
 267                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 269  0008 9e            	ld	a,xh
 270  0009 ca5442        	or	a,21570
 271  000c c75442        	ld	21570,a
 272                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 274  000f c65442        	ld	a,21570
 275  0012 a43f          	and	a,#63
 276  0014 c75442        	ld	21570,a
 277                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 279  0017 9f            	ld	a,xl
 280  0018 ca5442        	or	a,21570
 281  001b c75442        	ld	21570,a
 282                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 284  001e 72155441      	bres	21569,#2
 285                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 287  0022 c65441        	ld	a,21569
 288  0025 1a04          	or	a,(OFST+6,sp)
 289  0027 c75441        	ld	21569,a
 290                     ; 175 }
 293  002a 87            	retf	
 348                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 348                     ; 184 {
 349                     .text:	section	.text,new
 350  0000               f_COMP_VrefintToCOMP1Connect:
 354                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 356                     ; 188   if (NewState != DISABLE)
 358  0000 4d            	tnz	a
 359  0001 2705          	jreq	L341
 360                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 362  0003 72145442      	bset	21570,#2
 365  0007 87            	retf	
 366  0008               L341:
 367                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 369  0008 72155442      	bres	21570,#2
 370                     ; 198 }
 373  000c 87            	retf	
 467                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 467                     ; 213 {
 468                     .text:	section	.text,new
 469  0000               f_COMP_EdgeConfig:
 471  0000 89            	pushw	x
 472       00000000      OFST:	set	0
 475                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 477                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 479                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 481  0001 9e            	ld	a,xh
 482  0002 4a            	dec	a
 483  0003 2611          	jrne	L312
 484                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 486  0005 c65440        	ld	a,21568
 487  0008 a4fc          	and	a,#252
 488  000a c75440        	ld	21568,a
 489                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 491  000d 9f            	ld	a,xl
 492  000e ca5440        	or	a,21568
 493  0011 c75440        	ld	21568,a
 495  0014 2010          	jra	L512
 496  0016               L312:
 497                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 499  0016 c65441        	ld	a,21569
 500  0019 a4fc          	and	a,#252
 501  001b c75441        	ld	21569,a
 502                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 504  001e c65441        	ld	a,21569
 505  0021 1a02          	or	a,(OFST+2,sp)
 506  0023 c75441        	ld	21569,a
 507  0026               L512:
 508                     ; 236 }
 511  0026 85            	popw	x
 512  0027 87            	retf	
 577                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 577                     ; 252 {
 578                     .text:	section	.text,new
 579  0000               f_COMP_GetOutputLevel:
 581       00000001      OFST:	set	1
 584                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 586                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 588  0000 4a            	dec	a
 589  0001 2609          	jrne	L742
 590                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 592  0003 7207544002    	btjf	21568,#3,L152
 593                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 595  0008 2007          	jpf	LC002
 596  000a               L152:
 597                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 598  000a 2008          	jpf	L752
 599  000c               L742:
 600                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 602  000c 7207544103    	btjf	21569,#3,L752
 603                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 605  0011               LC002:
 607  0011 a601          	ld	a,#1
 611  0013 87            	retf	
 612  0014               L752:
 613                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 616  0014 4f            	clr	a
 618                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 622  0015 87            	retf	
 656                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 656                     ; 325 {
 657                     .text:	section	.text,new
 658  0000               f_COMP_WindowCmd:
 662                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 664                     ; 329   if (NewState != DISABLE)
 666  0000 4d            	tnz	a
 667  0001 2705          	jreq	L103
 668                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 670  0003 72125442      	bset	21570,#1
 673  0007 87            	retf	
 674  0008               L103:
 675                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 677  0008 72135442      	bres	21570,#1
 678                     ; 339 }
 681  000c 87            	retf	
 716                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 716                     ; 363 {
 717                     .text:	section	.text,new
 718  0000               f_COMP_VrefintOutputCmd:
 722                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 724                     ; 367   if (NewState != DISABLE)
 726  0000 4d            	tnz	a
 727  0001 2705          	jreq	L323
 728                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 730  0003 72105442      	bset	21570,#0
 733  0007 87            	retf	
 734  0008               L323:
 735                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 737  0008 72115442      	bres	21570,#0
 738                     ; 377 }
 741  000c 87            	retf	
 776                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 776                     ; 402 {
 777                     .text:	section	.text,new
 778  0000               f_COMP_SchmittTriggerCmd:
 782                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 784                     ; 406   if (NewState != DISABLE)
 786  0000 4d            	tnz	a
 787  0001 2705          	jreq	L543
 788                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 790  0003 72145440      	bset	21568,#2
 793  0007 87            	retf	
 794  0008               L543:
 795                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 797  0008 72155440      	bres	21568,#2
 798                     ; 416 }
 801  000c 87            	retf	
 920                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 920                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 920                     ; 437                         FunctionalState NewState)
 920                     ; 438 {
 921                     .text:	section	.text,new
 922  0000               f_COMP_TriggerConfig:
 924  0000 89            	pushw	x
 925       00000000      OFST:	set	0
 928                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 930                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 932                     ; 443   switch (COMP_TriggerGroup)
 934  0001 9e            	ld	a,xh
 936                     ; 490     default:
 936                     ; 491       break;
 937  0002 4a            	dec	a
 938  0003 270b          	jreq	L153
 939  0005 4a            	dec	a
 940  0006 2717          	jreq	L353
 941  0008 4a            	dec	a
 942  0009 2730          	jreq	L553
 943  000b 4a            	dec	a
 944  000c 2740          	jreq	L753
 945  000e 2058          	jra	L144
 946  0010               L153:
 947                     ; 445     case COMP_TriggerGroup_InvertingInput:
 947                     ; 446 
 947                     ; 447       if (NewState != DISABLE)
 949  0010 7b06          	ld	a,(OFST+6,sp)
 950  0012 2704          	jreq	L344
 951                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 953  0014 7b02          	ld	a,(OFST+2,sp)
 955  0016 2010          	jpf	LC005
 956  0018               L344:
 957                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 959  0018 c65443        	ld	a,21571
 960  001b 1a02          	or	a,(OFST+2,sp)
 961  001d 2017          	jpf	LC004
 962  001f               L353:
 963                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 963                     ; 458       if (NewState != DISABLE)
 965  001f 7b06          	ld	a,(OFST+6,sp)
 966  0021 270b          	jreq	L744
 967                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 969  0023 7b02          	ld	a,(OFST+2,sp)
 970  0025 48            	sll	a
 971  0026 48            	sll	a
 972  0027 48            	sll	a
 973  0028               LC005:
 974  0028 43            	cpl	a
 975  0029 c45443        	and	a,21571
 977  002c 2008          	jpf	LC004
 978  002e               L744:
 979                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 981  002e 7b02          	ld	a,(OFST+2,sp)
 982  0030 48            	sll	a
 983  0031 48            	sll	a
 984  0032 48            	sll	a
 985  0033 ca5443        	or	a,21571
 986  0036               LC004:
 987  0036 c75443        	ld	21571,a
 988  0039 202d          	jra	L144
 989  003b               L553:
 990                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
 990                     ; 469       if (NewState != DISABLE)
 992  003b 7b06          	ld	a,(OFST+6,sp)
 993  003d 2708          	jreq	L354
 994                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 996  003f 7b02          	ld	a,(OFST+2,sp)
 997  0041 43            	cpl	a
 998  0042 c45444        	and	a,21572
1000  0045 201e          	jpf	LC003
1001  0047               L354:
1002                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1004  0047 c65444        	ld	a,21572
1005  004a 1a02          	or	a,(OFST+2,sp)
1006  004c 2017          	jpf	LC003
1007  004e               L753:
1008                     ; 479     case COMP_TriggerGroup_DACOutput:
1008                     ; 480       if (NewState != DISABLE)
1010  004e 7b06          	ld	a,(OFST+6,sp)
1011  0050 270b          	jreq	L754
1012                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1014  0052 7b02          	ld	a,(OFST+2,sp)
1015  0054 48            	sll	a
1016  0055 48            	sll	a
1017  0056 48            	sll	a
1018  0057 43            	cpl	a
1019  0058 c45444        	and	a,21572
1021  005b 2008          	jpf	LC003
1022  005d               L754:
1023                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1025  005d 7b02          	ld	a,(OFST+2,sp)
1026  005f 48            	sll	a
1027  0060 48            	sll	a
1028  0061 48            	sll	a
1029  0062 ca5444        	or	a,21572
1030  0065               LC003:
1031  0065 c75444        	ld	21572,a
1032                     ; 490     default:
1032                     ; 491       break;
1034  0068               L144:
1035                     ; 493 }
1038  0068 85            	popw	x
1039  0069 87            	retf	
1083                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1083                     ; 522 {
1084                     .text:	section	.text,new
1085  0000               f_COMP_ITConfig:
1087  0000 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1093                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1095                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1097  0001 9e            	ld	a,xh
1098  0002 4a            	dec	a
1099  0003 2610          	jrne	L505
1100                     ; 530     if (NewState != DISABLE)
1102  0005 9f            	ld	a,xl
1103  0006 4d            	tnz	a
1104  0007 2706          	jreq	L705
1105                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1107  0009 721a5440      	bset	21568,#5
1109  000d 2014          	jra	L315
1110  000f               L705:
1111                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1113  000f 721b5440      	bres	21568,#5
1114  0013 200e          	jra	L315
1115  0015               L505:
1116                     ; 543     if (NewState != DISABLE)
1118  0015 7b02          	ld	a,(OFST+2,sp)
1119  0017 2706          	jreq	L515
1120                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1122  0019 721a5441      	bset	21569,#5
1124  001d 2004          	jra	L315
1125  001f               L515:
1126                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1128  001f 721b5441      	bres	21569,#5
1129  0023               L315:
1130                     ; 554 }
1133  0023 85            	popw	x
1134  0024 87            	retf	
1199                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1199                     ; 565 {
1200                     .text:	section	.text,new
1201  0000               f_COMP_GetFlagStatus:
1203       00000001      OFST:	set	1
1206                     ; 566   FlagStatus bitstatus = RESET;
1208                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1210                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1212  0000 4a            	dec	a
1213  0001 2609          	jrne	L355
1214                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1216  0003 7209544002    	btjf	21568,#4,L555
1217                     ; 577       bitstatus = SET;
1219  0008 2007          	jpf	LC007
1220  000a               L555:
1221                     ; 582       bitstatus = RESET;
1222  000a 2008          	jpf	L365
1223  000c               L355:
1224                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1226  000c 7209544103    	btjf	21569,#4,L365
1227                     ; 590       bitstatus = SET;
1229  0011               LC007:
1231  0011 a601          	ld	a,#1
1235  0013 87            	retf	
1236  0014               L365:
1237                     ; 595       bitstatus = RESET;
1240  0014 4f            	clr	a
1242                     ; 600   return (FlagStatus)(bitstatus);
1246  0015 87            	retf	
1280                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1280                     ; 612 {
1281                     .text:	section	.text,new
1282  0000               f_COMP_ClearFlag:
1286                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1288                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1290  0000 4a            	dec	a
1291  0001 2605          	jrne	L506
1292                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1294  0003 72195440      	bres	21568,#4
1297  0007 87            	retf	
1298  0008               L506:
1299                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1301  0008 72195441      	bres	21569,#4
1302                     ; 626 }
1305  000c 87            	retf	
1364                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1364                     ; 637 {
1365                     .text:	section	.text,new
1366  0000               f_COMP_GetITStatus:
1368  0000 89            	pushw	x
1369       00000002      OFST:	set	2
1372                     ; 638   ITStatus bitstatus = RESET;
1374                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1378                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1380                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1382  0001 4a            	dec	a
1383  0002 2618          	jrne	L736
1384                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1386  0004 c65440        	ld	a,21568
1387  0007 a410          	and	a,#16
1388  0009 6b01          	ld	(OFST-1,sp),a
1390                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1392  000b c65440        	ld	a,21568
1393  000e a420          	and	a,#32
1394  0010 6b02          	ld	(OFST+0,sp),a
1396                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1398  0012 7b01          	ld	a,(OFST-1,sp)
1399  0014 2720          	jreq	L746
1401  0016 7b02          	ld	a,(OFST+0,sp)
1402  0018 271c          	jreq	L746
1403                     ; 655       bitstatus = SET;
1405  001a 2016          	jpf	LC009
1406                     ; 660       bitstatus = RESET;
1407  001c               L736:
1408                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1410  001c c65441        	ld	a,21569
1411  001f a410          	and	a,#16
1412  0021 6b01          	ld	(OFST-1,sp),a
1414                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1416  0023 c65441        	ld	a,21569
1417  0026 a420          	and	a,#32
1418  0028 6b02          	ld	(OFST+0,sp),a
1420                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1422  002a 7b01          	ld	a,(OFST-1,sp)
1423  002c 2708          	jreq	L746
1425  002e 7b02          	ld	a,(OFST+0,sp)
1426  0030 2704          	jreq	L746
1427                     ; 674       bitstatus = SET;
1429  0032               LC009:
1431  0032 a601          	ld	a,#1
1434  0034 2001          	jra	L546
1435  0036               L746:
1436                     ; 679       bitstatus = RESET;
1439  0036 4f            	clr	a
1441  0037               L546:
1442                     ; 684   return (ITStatus) bitstatus;
1446  0037 85            	popw	x
1447  0038 87            	retf	
1482                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1482                     ; 696 {
1483                     .text:	section	.text,new
1484  0000               f_COMP_ClearITPendingBit:
1488                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1490                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1492  0000 4a            	dec	a
1493  0001 2605          	jrne	L176
1494                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1496  0003 72195440      	bres	21568,#4
1499  0007 87            	retf	
1500  0008               L176:
1501                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1503  0008 72195441      	bres	21569,#4
1504                     ; 710 }
1507  000c 87            	retf	
1519                     	xdef	f_COMP_ClearITPendingBit
1520                     	xdef	f_COMP_GetITStatus
1521                     	xdef	f_COMP_ClearFlag
1522                     	xdef	f_COMP_GetFlagStatus
1523                     	xdef	f_COMP_ITConfig
1524                     	xdef	f_COMP_TriggerConfig
1525                     	xdef	f_COMP_SchmittTriggerCmd
1526                     	xdef	f_COMP_VrefintOutputCmd
1527                     	xdef	f_COMP_WindowCmd
1528                     	xdef	f_COMP_GetOutputLevel
1529                     	xdef	f_COMP_EdgeConfig
1530                     	xdef	f_COMP_VrefintToCOMP1Connect
1531                     	xdef	f_COMP_Init
1532                     	xdef	f_COMP_DeInit
1551                     	end
