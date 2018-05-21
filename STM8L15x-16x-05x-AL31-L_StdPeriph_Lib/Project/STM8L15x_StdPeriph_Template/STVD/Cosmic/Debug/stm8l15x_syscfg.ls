   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 119 void SYSCFG_RIDeInit(void)
  50                     ; 120 {
  51                     .text:	section	.text,new
  52  0000               f_SYSCFG_RIDeInit:
  56                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  58  0000 725f5431      	clr	21553
  59                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  61  0004 725f5432      	clr	21554
  62                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  64  0008 725f5439      	clr	21561
  65                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  67  000c 725f543a      	clr	21562
  68                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  70  0010 725f543b      	clr	21563
  71                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  73  0014 725f5457      	clr	21591
  74                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  76  0018 725f543d      	clr	21565
  77                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  79  001c 725f543e      	clr	21566
  80                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  82  0020 725f543f      	clr	21567
  83                     ; 130 }
  86  0024 87            	retf	
 344                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 344                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 344                     ; 144 {
 345                     .text:	section	.text,new
 346  0000               f_SYSCFG_RITIMInputCaptureConfig:
 348  0000 89            	pushw	x
 349       00000000      OFST:	set	0
 352                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 354                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 356                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 358  0001 9e            	ld	a,xh
 359  0002 a102          	cp	a,#2
 360  0004 2606          	jrne	L531
 361                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 363  0006 9f            	ld	a,xl
 364  0007 c75431        	ld	21553,a
 366  000a 2005          	jra	L731
 367  000c               L531:
 368                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 370  000c 7b02          	ld	a,(OFST+2,sp)
 371  000e c75432        	ld	21554,a
 372  0011               L731:
 373                     ; 161 }
 376  0011 85            	popw	x
 377  0012 87            	retf	
 554                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 185                                  FunctionalState NewState)
 554                     ; 186 {
 555                     .text:	section	.text,new
 556  0000               f_SYSCFG_RIAnalogSwitchConfig:
 558  0000 89            	pushw	x
 559  0001 89            	pushw	x
 560       00000002      OFST:	set	2
 563                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 565                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 567                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 571  0002 9e            	ld	a,xh
 572  0003 a4f0          	and	a,#240
 573  0005 6b01          	ld	(OFST-1,sp),a
 575                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 577  0007 7b03          	ld	a,(OFST+1,sp)
 578  0009 a40f          	and	a,#15
 579  000b 6b02          	ld	(OFST+0,sp),a
 581                     ; 199   if (NewState != DISABLE)
 583  000d 7b04          	ld	a,(OFST+2,sp)
 584  000f 2728          	jreq	L532
 585                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 587  0011 7b01          	ld	a,(OFST-1,sp)
 588  0013 a110          	cp	a,#16
 589  0015 2611          	jrne	L732
 590                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 592  0017 7b02          	ld	a,(OFST+0,sp)
 593  0019 8d6a006a      	callf	LC003
 594  001d 2704          	jreq	L21
 595  001f               L41:
 596  001f 48            	sll	a
 597  0020 5a            	decw	x
 598  0021 26fc          	jrne	L41
 599  0023               L21:
 600  0023 ca543d        	or	a,21565
 602  0026 2027          	jpf	LC002
 603  0028               L732:
 604                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 606  0028 7b02          	ld	a,(OFST+0,sp)
 607  002a 8d6a006a      	callf	LC003
 608  002e 2704          	jreq	L61
 609  0030               L02:
 610  0030 48            	sll	a
 611  0031 5a            	decw	x
 612  0032 26fc          	jrne	L02
 613  0034               L61:
 614  0034 ca543e        	or	a,21566
 615  0037 202b          	jpf	LC001
 616  0039               L532:
 617                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 619  0039 7b01          	ld	a,(OFST-1,sp)
 620  003b a110          	cp	a,#16
 621  003d 2615          	jrne	L542
 622                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 624  003f 7b02          	ld	a,(OFST+0,sp)
 625  0041 8d6a006a      	callf	LC003
 626  0045 2704          	jreq	L22
 627  0047               L42:
 628  0047 48            	sll	a
 629  0048 5a            	decw	x
 630  0049 26fc          	jrne	L42
 631  004b               L22:
 632  004b 43            	cpl	a
 633  004c c4543d        	and	a,21565
 634  004f               LC002:
 635  004f c7543d        	ld	21565,a
 637  0052 2013          	jra	L342
 638  0054               L542:
 639                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 641  0054 7b02          	ld	a,(OFST+0,sp)
 642  0056 8d6a006a      	callf	LC003
 643  005a 2704          	jreq	L62
 644  005c               L03:
 645  005c 48            	sll	a
 646  005d 5a            	decw	x
 647  005e 26fc          	jrne	L03
 648  0060               L62:
 649  0060 43            	cpl	a
 650  0061 c4543e        	and	a,21566
 651  0064               LC001:
 652  0064 c7543e        	ld	21566,a
 653  0067               L342:
 654                     ; 225 }
 657  0067 5b04          	addw	sp,#4
 658  0069 87            	retf	
 659  006a               LC003:
 660  006a 5f            	clrw	x
 661  006b 97            	ld	xl,a
 662  006c a601          	ld	a,#1
 663  006e 5d            	tnzw	x
 664  006f 87            	retf	
 925                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 925                     ; 235                              FunctionalState NewState)
 925                     ; 236 {
 926                     .text:	section	.text,new
 927  0000               f_SYSCFG_RIIOSwitchConfig:
 929  0000 89            	pushw	x
 930  0001 89            	pushw	x
 931       00000002      OFST:	set	2
 934                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 936                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 938                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 940                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 942  0002 9e            	ld	a,xh
 943  0003 a40f          	and	a,#15
 944  0005 6b02          	ld	(OFST+0,sp),a
 946                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 948  0007 7b03          	ld	a,(OFST+1,sp)
 949  0009 a4f0          	and	a,#240
 950  000b 6b01          	ld	(OFST-1,sp),a
 952                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 954  000d a110          	cp	a,#16
 955  000f 2631          	jrne	L373
 956                     ; 252     if (NewState != DISABLE)
 958  0011 7b04          	ld	a,(OFST+2,sp)
 959  0013 2716          	jreq	L573
 960                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 962  0015 7b02          	ld	a,(OFST+0,sp)
 963  0017 8dcc00cc      	callf	LC006
 964  001b 2704          	jreq	L43
 965  001d               L63:
 966  001d 48            	sll	a
 967  001e 5a            	decw	x
 968  001f 26fc          	jrne	L63
 969  0021               L43:
 970  0021 ca5439        	or	a,21561
 971  0024 c75439        	ld	21561,a
 973  0027 acc900c9      	jra	L104
 974  002b               L573:
 975                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 977  002b 7b02          	ld	a,(OFST+0,sp)
 978  002d 8dcc00cc      	callf	LC006
 979  0031 2704          	jreq	L04
 980  0033               L24:
 981  0033 48            	sll	a
 982  0034 5a            	decw	x
 983  0035 26fc          	jrne	L24
 984  0037               L04:
 985  0037 43            	cpl	a
 986  0038 c45439        	and	a,21561
 987  003b c75439        	ld	21561,a
 988  003e acc900c9      	jra	L104
 989  0042               L373:
 990                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 992  0042 a120          	cp	a,#32
 993  0044 262d          	jrne	L304
 994                     ; 267     if (NewState != DISABLE)
 996  0046 7b04          	ld	a,(OFST+2,sp)
 997  0048 2714          	jreq	L504
 998                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1000  004a 7b02          	ld	a,(OFST+0,sp)
1001  004c 8dcc00cc      	callf	LC006
1002  0050 2704          	jreq	L44
1003  0052               L64:
1004  0052 48            	sll	a
1005  0053 5a            	decw	x
1006  0054 26fc          	jrne	L64
1007  0056               L44:
1008  0056 ca543a        	or	a,21562
1009  0059 c7543a        	ld	21562,a
1011  005c 206b          	jra	L104
1012  005e               L504:
1013                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1015  005e 7b02          	ld	a,(OFST+0,sp)
1016  0060 8dcc00cc      	callf	LC006
1017  0064 2704          	jreq	L05
1018  0066               L25:
1019  0066 48            	sll	a
1020  0067 5a            	decw	x
1021  0068 26fc          	jrne	L25
1022  006a               L05:
1023  006a 43            	cpl	a
1024  006b c4543a        	and	a,21562
1025  006e c7543a        	ld	21562,a
1026  0071 2056          	jra	L104
1027  0073               L304:
1028                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1030  0073 a130          	cp	a,#48
1031  0075 262a          	jrne	L314
1032                     ; 282     if (NewState != DISABLE)
1034  0077 7b04          	ld	a,(OFST+2,sp)
1035  0079 2711          	jreq	L514
1036                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1038  007b 7b02          	ld	a,(OFST+0,sp)
1039  007d 8dcc00cc      	callf	LC006
1040  0081 2704          	jreq	L45
1041  0083               L65:
1042  0083 48            	sll	a
1043  0084 5a            	decw	x
1044  0085 26fc          	jrne	L65
1045  0087               L45:
1046  0087 ca543b        	or	a,21563
1048  008a 2010          	jpf	LC005
1049  008c               L514:
1050                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1052  008c 7b02          	ld	a,(OFST+0,sp)
1053  008e 8dcc00cc      	callf	LC006
1054  0092 2704          	jreq	L06
1055  0094               L26:
1056  0094 48            	sll	a
1057  0095 5a            	decw	x
1058  0096 26fc          	jrne	L26
1059  0098               L06:
1060  0098 43            	cpl	a
1061  0099 c4543b        	and	a,21563
1062  009c               LC005:
1063  009c c7543b        	ld	21563,a
1064  009f 2028          	jra	L104
1065  00a1               L314:
1066                     ; 297     if (NewState != DISABLE)
1068  00a1 7b04          	ld	a,(OFST+2,sp)
1069  00a3 2711          	jreq	L324
1070                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1072  00a5 7b02          	ld	a,(OFST+0,sp)
1073  00a7 8dcc00cc      	callf	LC006
1074  00ab 2704          	jreq	L46
1075  00ad               L66:
1076  00ad 48            	sll	a
1077  00ae 5a            	decw	x
1078  00af 26fc          	jrne	L66
1079  00b1               L46:
1080  00b1 ca5457        	or	a,21591
1082  00b4 2010          	jpf	LC004
1083  00b6               L324:
1084                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1086  00b6 7b02          	ld	a,(OFST+0,sp)
1087  00b8 8dcc00cc      	callf	LC006
1088  00bc 2704          	jreq	L07
1089  00be               L27:
1090  00be 48            	sll	a
1091  00bf 5a            	decw	x
1092  00c0 26fc          	jrne	L27
1093  00c2               L07:
1094  00c2 43            	cpl	a
1095  00c3 c45457        	and	a,21591
1096  00c6               LC004:
1097  00c6 c75457        	ld	21591,a
1098  00c9               L104:
1099                     ; 308 }
1102  00c9 5b04          	addw	sp,#4
1103  00cb 87            	retf	
1104  00cc               LC006:
1105  00cc 5f            	clrw	x
1106  00cd 97            	ld	xl,a
1107  00ce a601          	ld	a,#1
1108  00d0 5d            	tnzw	x
1109  00d1 87            	retf	
1188                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1188                     ; 321 {
1189                     .text:	section	.text,new
1190  0000               f_SYSCFG_RIResistorConfig:
1192  0000 89            	pushw	x
1193       00000000      OFST:	set	0
1196                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1198                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1200                     ; 326   if (NewState != DISABLE)
1202  0001 9f            	ld	a,xl
1203  0002 4d            	tnz	a
1204  0003 2706          	jreq	L564
1205                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1207  0005 9e            	ld	a,xh
1208  0006 ca543f        	or	a,21567
1210  0009 2006          	jra	L764
1211  000b               L564:
1212                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1214  000b 7b01          	ld	a,(OFST+1,sp)
1215  000d 43            	cpl	a
1216  000e c4543f        	and	a,21567
1217  0011               L764:
1218  0011 c7543f        	ld	21567,a
1219                     ; 336 }
1222  0014 85            	popw	x
1223  0015 87            	retf	
1245                     ; 368 void SYSCFG_REMAPDeInit(void)
1245                     ; 369 {
1246                     .text:	section	.text,new
1247  0000               f_SYSCFG_REMAPDeInit:
1251                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1253  0000 350c509e      	mov	20638,#12
1254                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1256  0004 725f509f      	clr	20639
1257                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1259  0008 725f509d      	clr	20637
1260                     ; 378 }
1263  000c 87            	retf	
1478                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1478                     ; 412 {
1479                     .text:	section	.text,new
1480  0000               f_SYSCFG_REMAPPinConfig:
1482  0000 89            	pushw	x
1483  0001 88            	push	a
1484       00000001      OFST:	set	1
1487                     ; 413   uint8_t regindex = 0;
1489                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1491                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1493                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1495  0002 9e            	ld	a,xh
1496  0003 6b01          	ld	(OFST+0,sp),a
1498                     ; 422   if (regindex == 0x01)
1500  0005 a101          	cp	a,#1
1501  0007 261c          	jrne	L106
1502                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1504  0009 a610          	ld	a,#16
1505  000b 42            	mul	x,a
1506  000c 9f            	ld	a,xl
1507  000d aa0f          	or	a,#15
1508  000f c4509e        	and	a,20638
1509  0012 c7509e        	ld	20638,a
1510                     ; 425     if (NewState != DISABLE)
1512  0015 7b07          	ld	a,(OFST+6,sp)
1513  0017 273a          	jreq	L506
1514                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1516  0019 7b03          	ld	a,(OFST+2,sp)
1517  001b a4f0          	and	a,#240
1518  001d ca509e        	or	a,20638
1519  0020 c7509e        	ld	20638,a
1520  0023 202e          	jra	L506
1521  0025               L106:
1522                     ; 431   else if (regindex == 0x02)
1524  0025 a102          	cp	a,#2
1525  0027 2616          	jrne	L706
1526                     ; 433     if (NewState != DISABLE)
1528  0029 7b07          	ld	a,(OFST+6,sp)
1529  002b 2707          	jreq	L116
1530                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1532  002d c6509f        	ld	a,20639
1533  0030 1a03          	or	a,(OFST+2,sp)
1535  0032 2006          	jpf	LC008
1536  0034               L116:
1537                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1539  0034 7b03          	ld	a,(OFST+2,sp)
1540  0036 43            	cpl	a
1541  0037 c4509f        	and	a,20639
1542  003a               LC008:
1543  003a c7509f        	ld	20639,a
1544  003d 2014          	jra	L506
1545  003f               L706:
1546                     ; 445     if (NewState != DISABLE)
1548  003f 7b07          	ld	a,(OFST+6,sp)
1549  0041 2707          	jreq	L716
1550                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1552  0043 c6509d        	ld	a,20637
1553  0046 1a03          	or	a,(OFST+2,sp)
1555  0048 2006          	jpf	LC007
1556  004a               L716:
1557                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1559  004a 7b03          	ld	a,(OFST+2,sp)
1560  004c 43            	cpl	a
1561  004d c4509d        	and	a,20637
1562  0050               LC007:
1563  0050 c7509d        	ld	20637,a
1564  0053               L506:
1565                     ; 454 }
1568  0053 5b03          	addw	sp,#3
1569  0055 87            	retf	
1674                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1674                     ; 471 {
1675                     .text:	section	.text,new
1676  0000               f_SYSCFG_REMAPDMAChannelConfig:
1678  0000 88            	push	a
1679       00000000      OFST:	set	0
1682                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1684                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1686  0001 a5f0          	bcp	a,#240
1687  0003 2707          	jreq	L566
1688                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1690  0005 c6509e        	ld	a,20638
1691  0008 a4f3          	and	a,#243
1693  000a 2005          	jra	L766
1694  000c               L566:
1695                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1697  000c c6509e        	ld	a,20638
1698  000f a4fc          	and	a,#252
1699  0011               L766:
1700  0011 c7509e        	ld	20638,a
1701                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1703  0014 7b01          	ld	a,(OFST+1,sp)
1704  0016 a40f          	and	a,#15
1705  0018 ca509e        	or	a,20638
1706  001b c7509e        	ld	20638,a
1707                     ; 489 }
1710  001e 84            	pop	a
1711  001f 87            	retf	
1723                     	xdef	f_SYSCFG_REMAPDMAChannelConfig
1724                     	xdef	f_SYSCFG_REMAPPinConfig
1725                     	xdef	f_SYSCFG_REMAPDeInit
1726                     	xdef	f_SYSCFG_RIResistorConfig
1727                     	xdef	f_SYSCFG_RIIOSwitchConfig
1728                     	xdef	f_SYSCFG_RIAnalogSwitchConfig
1729                     	xdef	f_SYSCFG_RITIMInputCaptureConfig
1730                     	xdef	f_SYSCFG_RIDeInit
1749                     	end
