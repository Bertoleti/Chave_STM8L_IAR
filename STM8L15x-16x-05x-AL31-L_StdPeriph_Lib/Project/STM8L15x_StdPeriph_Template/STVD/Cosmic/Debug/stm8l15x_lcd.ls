   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  59                     ; 121 void LCD_DeInit(void)
  59                     ; 122 {
  60                     .text:	section	.text,new
  61  0000               f_LCD_DeInit:
  63  0000 88            	push	a
  64       00000001      OFST:	set	1
  67                     ; 123   uint8_t counter = 0;
  69                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  71  0001 725f5400      	clr	21504
  72                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  74  0005 725f5401      	clr	21505
  75                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  77  0009 725f5402      	clr	21506
  78                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  80  000d 725f5403      	clr	21507
  81                     ; 130   for (counter = 0;counter < 0x05; counter++)
  83  0011 4f            	clr	a
  84  0012 6b01          	ld	(OFST+0,sp),a
  86  0014               L52:
  87                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  89  0014 5f            	clrw	x
  90  0015 97            	ld	xl,a
  91  0016 724f5404      	clr	(21508,x)
  92                     ; 130   for (counter = 0;counter < 0x05; counter++)
  94  001a 0c01          	inc	(OFST+0,sp)
  98  001c 7b01          	ld	a,(OFST+0,sp)
  99  001e a105          	cp	a,#5
 100  0020 25f2          	jrult	L52
 101                     ; 135   for (counter = 0;counter < 0x16; counter++)
 103  0022 4f            	clr	a
 104  0023 6b01          	ld	(OFST+0,sp),a
 106  0025               L33:
 107                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 109  0025 5f            	clrw	x
 110  0026 97            	ld	xl,a
 111  0027 724f540c      	clr	(21516,x)
 112                     ; 135   for (counter = 0;counter < 0x16; counter++)
 114  002b 0c01          	inc	(OFST+0,sp)
 118  002d 7b01          	ld	a,(OFST+0,sp)
 119  002f a116          	cp	a,#22
 120  0031 25f2          	jrult	L33
 121                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 123  0033 725f542f      	clr	21551
 124                     ; 142 }
 127  0037 84            	pop	a
 128  0038 87            	retf	
 530                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 530                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 530                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 530                     ; 203 {
 531                     .text:	section	.text,new
 532  0000               f_LCD_Init:
 534       fffffffe      OFST: set -2
 537                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 539                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 541                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 543                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 545                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 547                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 549  0000 c65403        	ld	a,21507
 550  0003 a40f          	and	a,#15
 551  0005 c75403        	ld	21507,a
 552                     ; 212   LCD->FRQ |= LCD_Prescaler;
 554  0008 9e            	ld	a,xh
 555  0009 ca5403        	or	a,21507
 556  000c c75403        	ld	21507,a
 557                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 559  000f c65403        	ld	a,21507
 560  0012 a4f0          	and	a,#240
 561  0014 c75403        	ld	21507,a
 562                     ; 215   LCD->FRQ |= LCD_Divider;
 564  0017 9f            	ld	a,xl
 565  0018 ca5403        	or	a,21507
 566  001b c75403        	ld	21507,a
 567                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 569  001e c65400        	ld	a,21504
 570  0021 a4f9          	and	a,#249
 571  0023 c75400        	ld	21504,a
 572                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 574  0026 7213542f      	bres	21551,#1
 575                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 577  002a 7b04          	ld	a,(OFST+6,sp)
 578  002c a120          	cp	a,#32
 579  002e 260b          	jrne	L742
 580                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 582  0030 4e            	swap	a
 583  0031 a40f          	and	a,#15
 584  0033 ca542f        	or	a,21551
 585  0036 c7542f        	ld	21551,a
 587  0039 2004          	jra	L152
 588  003b               L742:
 589                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 591  003b 8d6f006f      	callf	LC001
 592  003f               L152:
 593                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 595  003f 72115400      	bres	21504,#0
 596                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 598  0043 7211542f      	bres	21551,#0
 599                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 601  0047 7b05          	ld	a,(OFST+7,sp)
 602  0049 a110          	cp	a,#16
 603  004b 2611          	jrne	L352
 604                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 606  004d 8d6f006f      	callf	LC001
 607                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 609  0051 7b05          	ld	a,(OFST+7,sp)
 610  0053 4e            	swap	a
 611  0054 a40f          	and	a,#15
 612  0056 ca542f        	or	a,21551
 613  0059 c7542f        	ld	21551,a
 615  005c 2004          	jra	L552
 616  005e               L352:
 617                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 619  005e 8d6f006f      	callf	LC001
 620  0062               L552:
 621                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 623  0062 72115401      	bres	21505,#0
 624                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 626  0066 c65401        	ld	a,21505
 627  0069 1a06          	or	a,(OFST+8,sp)
 628  006b c75401        	ld	21505,a
 629                     ; 247 }
 632  006e 87            	retf	
 633  006f               LC001:
 634  006f a40f          	and	a,#15
 635  0071 ca5400        	or	a,21504
 636  0074 c75400        	ld	21504,a
 637  0077 87            	retf	
 733                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 733                     ; 263 {
 734                     .text:	section	.text,new
 735  0000               f_LCD_PortMaskConfig:
 737  0000 89            	pushw	x
 738       00000000      OFST:	set	0
 741                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 743                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 745  0001 9e            	ld	a,xh
 746  0002 5f            	clrw	x
 747  0003 97            	ld	xl,a
 748  0004 7b02          	ld	a,(OFST+2,sp)
 749  0006 d75404        	ld	(21508,x),a
 750                     ; 270 }
 753  0009 85            	popw	x
 754  000a 87            	retf	
 808                     ; 279 void LCD_Cmd(FunctionalState NewState)
 808                     ; 280 {
 809                     .text:	section	.text,new
 810  0000               f_LCD_Cmd:
 814                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 816                     ; 284   if (NewState != DISABLE)
 818  0000 4d            	tnz	a
 819  0001 2705          	jreq	L543
 820                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 822  0003 721c5402      	bset	21506,#6
 825  0007 87            	retf	
 826  0008               L543:
 827                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 829  0008 721d5402      	bres	21506,#6
 830                     ; 292 }
 833  000c 87            	retf	
 867                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 867                     ; 306 {
 868                     .text:	section	.text,new
 869  0000               f_LCD_HighDriveCmd:
 873                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 875                     ; 310   if (NewState != DISABLE)
 877  0000 4d            	tnz	a
 878  0001 2705          	jreq	L763
 879                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 881  0003 72185401      	bset	21505,#4
 884  0007 87            	retf	
 885  0008               L763:
 886                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 888  0008 72195401      	bres	21505,#4
 889                     ; 318 }
 892  000c 87            	retf	
 998                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 998                     ; 336 {
 999                     .text:	section	.text,new
1000  0000               f_LCD_PulseOnDurationConfig:
1002  0000 88            	push	a
1003       00000000      OFST:	set	0
1006                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1008                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1010  0001 c65401        	ld	a,21505
1011  0004 a41f          	and	a,#31
1012  0006 c75401        	ld	21505,a
1013                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1015  0009 c65401        	ld	a,21505
1016  000c 1a01          	or	a,(OFST+1,sp)
1017  000e c75401        	ld	21505,a
1018                     ; 342 }
1021  0011 84            	pop	a
1022  0012 87            	retf	
1118                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1118                     ; 359 {
1119                     .text:	section	.text,new
1120  0000               f_LCD_DeadTimeConfig:
1122  0000 88            	push	a
1123       00000000      OFST:	set	0
1126                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1128                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1130  0001 c65402        	ld	a,21506
1131  0004 a4f8          	and	a,#248
1132  0006 c75402        	ld	21506,a
1133                     ; 365   LCD->CR3 |= LCD_DeadTime;
1135  0009 c65402        	ld	a,21506
1136  000c 1a01          	or	a,(OFST+1,sp)
1137  000e c75402        	ld	21506,a
1138                     ; 367 }
1141  0011 84            	pop	a
1142  0012 87            	retf	
1293                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1293                     ; 392 {
1294                     .text:	section	.text,new
1295  0000               f_LCD_BlinkConfig:
1299                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1301                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1303                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1305  0000 c65400        	ld	a,21504
1306  0003 a43f          	and	a,#63
1307  0005 c75400        	ld	21504,a
1308                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1310  0008 9e            	ld	a,xh
1311  0009 ca5400        	or	a,21504
1312  000c c75400        	ld	21504,a
1313                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1315  000f c65400        	ld	a,21504
1316  0012 a4c7          	and	a,#199
1317  0014 c75400        	ld	21504,a
1318                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1320  0017 9f            	ld	a,xl
1321  0018 ca5400        	or	a,21504
1322  001b c75400        	ld	21504,a
1323                     ; 403 }
1326  001e 87            	retf	
1430                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1430                     ; 420 {
1431                     .text:	section	.text,new
1432  0000               f_LCD_ContrastConfig:
1434  0000 88            	push	a
1435       00000000      OFST:	set	0
1438                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1440                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1442  0001 c65401        	ld	a,21505
1443  0004 a4f1          	and	a,#241
1444  0006 c75401        	ld	21505,a
1445                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1447  0009 c65401        	ld	a,21505
1448  000c 1a01          	or	a,(OFST+1,sp)
1449  000e c75401        	ld	21505,a
1450                     ; 427 }
1453  0011 84            	pop	a
1454  0012 87            	retf	
1655                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1655                     ; 475 {
1656                     .text:	section	.text,new
1657  0000               f_LCD_WriteRAM:
1659  0000 89            	pushw	x
1660       00000000      OFST:	set	0
1663                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1665                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1667  0001 9e            	ld	a,xh
1668  0002 5f            	clrw	x
1669  0003 97            	ld	xl,a
1670  0004 7b02          	ld	a,(OFST+2,sp)
1671  0006 d7540c        	ld	(21516,x),a
1672                     ; 482 }
1675  0009 85            	popw	x
1676  000a 87            	retf	
1732                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1732                     ; 493 {
1733                     .text:	section	.text,new
1734  0000               f_LCD_PageSelect:
1738                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1740                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1742  0000 7215542f      	bres	21551,#2
1743                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1745  0004 ca542f        	or	a,21551
1746  0007 c7542f        	ld	21551,a
1747                     ; 500 }
1750  000a 87            	retf	
1784                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1784                     ; 526 {
1785                     .text:	section	.text,new
1786  0000               f_LCD_ITConfig:
1790                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1792                     ; 530   if (NewState != DISABLE)
1794  0000 4d            	tnz	a
1795  0001 2705          	jreq	L767
1796                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1798  0003 721a5402      	bset	21506,#5
1801  0007 87            	retf	
1802  0008               L767:
1803                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1805  0008 721b5402      	bres	21506,#5
1806                     ; 539 }
1809  000c 87            	retf	
1864                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1864                     ; 547 {
1865                     .text:	section	.text,new
1866  0000               f_LCD_GetFlagStatus:
1868       00000001      OFST:	set	1
1871                     ; 548   FlagStatus status = RESET;
1873                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1875  0000 7209540203    	btjf	21506,#4,L1201
1876                     ; 553     status = SET; /* Flag is set */
1878  0005 a601          	ld	a,#1
1882  0007 87            	retf	
1883  0008               L1201:
1884                     ; 557     status = RESET; /* Flag is reset*/
1886  0008 4f            	clr	a
1888                     ; 560   return status;
1892  0009 87            	retf	
1914                     ; 569 void LCD_ClearFlag(void)
1914                     ; 570 {
1915                     .text:	section	.text,new
1916  0000               f_LCD_ClearFlag:
1920                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1922  0000 72165402      	bset	21506,#3
1923                     ; 574 }
1926  0004 87            	retf	
1968                     ; 582 ITStatus LCD_GetITStatus(void)
1968                     ; 583 {
1969                     .text:	section	.text,new
1970  0000               f_LCD_GetITStatus:
1972       00000001      OFST:	set	1
1975                     ; 584   ITStatus pendingbitstatus = RESET;
1977                     ; 585   uint8_t enablestatus = 0;
1979                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1981  0000 c65402        	ld	a,21506
1982  0003 a420          	and	a,#32
1984                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
1986  0005 7209540205    	btjf	21506,#4,L5501
1988  000a 2703          	jreq	L5501
1989                     ; 592     pendingbitstatus = SET;
1991  000c a601          	ld	a,#1
1995  000e 87            	retf	
1996  000f               L5501:
1997                     ; 597     pendingbitstatus = RESET;
1999  000f 4f            	clr	a
2001                     ; 600   return  pendingbitstatus;
2005  0010 87            	retf	
2028                     ; 609 void LCD_ClearITPendingBit(void)
2028                     ; 610 {
2029                     .text:	section	.text,new
2030  0000               f_LCD_ClearITPendingBit:
2034                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2036  0000 72165402      	bset	21506,#3
2037                     ; 614 }
2040  0004 87            	retf	
2052                     	xdef	f_LCD_ClearITPendingBit
2053                     	xdef	f_LCD_GetITStatus
2054                     	xdef	f_LCD_ClearFlag
2055                     	xdef	f_LCD_GetFlagStatus
2056                     	xdef	f_LCD_ITConfig
2057                     	xdef	f_LCD_PageSelect
2058                     	xdef	f_LCD_WriteRAM
2059                     	xdef	f_LCD_ContrastConfig
2060                     	xdef	f_LCD_BlinkConfig
2061                     	xdef	f_LCD_DeadTimeConfig
2062                     	xdef	f_LCD_PulseOnDurationConfig
2063                     	xdef	f_LCD_HighDriveCmd
2064                     	xdef	f_LCD_Cmd
2065                     	xdef	f_LCD_PortMaskConfig
2066                     	xdef	f_LCD_Init
2067                     	xdef	f_LCD_DeInit
2086                     	end
