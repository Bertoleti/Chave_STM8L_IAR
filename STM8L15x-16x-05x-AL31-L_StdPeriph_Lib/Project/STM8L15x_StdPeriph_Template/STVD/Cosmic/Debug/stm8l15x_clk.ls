   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  22                     .const:	section	.text
  23  0000               _SYSDivFactor:
  24  0000 01            	dc.b	1
  25  0001 02            	dc.b	2
  26  0002 04            	dc.b	4
  27  0003 08            	dc.b	8
  28  0004 10            	dc.b	16
  57                     ; 120 void CLK_DeInit(void)
  57                     ; 121 {
  58                     .text:	section	.text,new
  59  0000               f_CLK_DeInit:
  63                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  65  0000 351150c2      	mov	20674,#17
  66                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  68  0004 725f50c6      	clr	20678
  69                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  71  0008 725f50c1      	clr	20673
  72                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  74  000c 725f50cb      	clr	20683
  75                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0010 350150c8      	mov	20680,#1
  78                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  0014 725f50c9      	clr	20681
  81                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0018 350350c0      	mov	20672,#3
  84                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  001c 725f50c3      	clr	20675
  87                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0020 358050c4      	mov	20676,#128
  90                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  92  0024 725f50d0      	clr	20688
  93                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  95  0028 725f50ca      	clr	20682
  96                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  98  002c 725f50c5      	clr	20677
  99                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 101  0030 725f50cd      	clr	20685
 102                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 104  0034 725f50cc      	clr	20684
 105                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 107  0038 725f50ce      	clr	20686
 108                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 110  003c 35b950cf      	mov	20687,#185
 111                     ; 138 }
 114  0040 87            	retf	
 168                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 168                     ; 161 {
 169                     .text:	section	.text,new
 170  0000               f_CLK_HSICmd:
 174                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 176                     ; 165   if (NewState != DISABLE)
 178  0000 4d            	tnz	a
 179  0001 2705          	jreq	L74
 180                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 182  0003 721050c2      	bset	20674,#0
 185  0007 87            	retf	
 186  0008               L74:
 187                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 189  0008 721150c2      	bres	20674,#0
 190                     ; 175 }
 193  000c 87            	retf	
 226                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 226                     ; 189 {
 227                     .text:	section	.text,new
 228  0000               f_CLK_AdjustHSICalibrationValue:
 232                     ; 191   CLK->HSIUNLCKR = 0xAC;
 234  0000 35ac50ce      	mov	20686,#172
 235                     ; 192   CLK->HSIUNLCKR = 0x35;
 237  0004 353550ce      	mov	20686,#53
 238                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 240  0008 c750cd        	ld	20685,a
 241                     ; 196 }
 244  000b 87            	retf	
 278                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 278                     ; 213 {
 279                     .text:	section	.text,new
 280  0000               f_CLK_LSICmd:
 284                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 286                     ; 218   if (NewState != DISABLE)
 288  0000 4d            	tnz	a
 289  0001 2705          	jreq	L501
 290                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 292  0003 721450c2      	bset	20674,#2
 295  0007 87            	retf	
 296  0008               L501:
 297                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 299  0008 721550c2      	bres	20674,#2
 300                     ; 228 }
 303  000c 87            	retf	
 364                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 250 {
 365                     .text:	section	.text,new
 366  0000               f_CLK_HSEConfig:
 370                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0000 721150c6      	bres	20678,#0
 375                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  0004 721950c6      	bres	20678,#4
 378                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0008 ca50c6        	or	a,20678
 381  000b c750c6        	ld	20678,a
 382                     ; 263 }
 385  000e 87            	retf	
 446                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 446                     ; 281 {
 447                     .text:	section	.text,new
 448  0000               f_CLK_LSEConfig:
 452                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 454                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 456  0000 721550c6      	bres	20678,#2
 457                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 459  0004 721b50c6      	bres	20678,#5
 460                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 462  0008 ca50c6        	or	a,20678
 463  000b c750c6        	ld	20678,a
 464                     ; 295 }
 467  000e 87            	retf	
 490                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 490                     ; 307 {
 491                     .text:	section	.text,new
 492  0000               f_CLK_ClockSecuritySystemEnable:
 496                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 498  0000 721050ca      	bset	20682,#0
 499                     ; 310 }
 502  0004 87            	retf	
 537                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 537                     ; 318 {
 538                     .text:	section	.text,new
 539  0000               f_CLK_ClockSecuritySytemDeglitchCmd:
 543                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 545                     ; 322   if (NewState != DISABLE)
 547  0000 4d            	tnz	a
 548  0001 2705          	jreq	L712
 549                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 551  0003 721850ca      	bset	20682,#4
 554  0007 87            	retf	
 555  0008               L712:
 556                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 558  0008 721950ca      	bres	20682,#4
 559                     ; 332 }
 562  000c 87            	retf	
 702                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 702                     ; 357 {
 703                     .text:	section	.text,new
 704  0000               f_CLK_CCOConfig:
 706  0000 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 712                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 714                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 716  0001 9f            	ld	a,xl
 717  0002 1a01          	or	a,(OFST+1,sp)
 718  0004 c750c5        	ld	20677,a
 719                     ; 364 }
 722  0007 85            	popw	x
 723  0008 87            	retf	
 796                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 796                     ; 417 {
 797                     .text:	section	.text,new
 798  0000               f_CLK_SYSCLKSourceConfig:
 802                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 804                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 806  0000 c750c8        	ld	20680,a
 807                     ; 423 }
 810  0003 87            	retf	
 834                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 834                     ; 436 {
 835                     .text:	section	.text,new
 836  0000               f_CLK_GetSYSCLKSource:
 840                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 842  0000 c650c7        	ld	a,20679
 845  0003 87            	retf	
 908                     ; 478 uint32_t CLK_GetClockFreq(void)
 908                     ; 479 {
 909                     .text:	section	.text,new
 910  0000               f_CLK_GetClockFreq:
 912  0000 5209          	subw	sp,#9
 913       00000009      OFST:	set	9
 916                     ; 480   uint32_t clockfrequency = 0;
 918                     ; 481   uint32_t sourcefrequency = 0;
 920  0002 5f            	clrw	x
 921  0003 1f07          	ldw	(OFST-2,sp),x
 922  0005 1f05          	ldw	(OFST-4,sp),x
 924                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 926                     ; 483   uint8_t tmp = 0, presc = 0;
 930                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 932  0007 c650c7        	ld	a,20679
 933  000a 6b09          	ld	(OFST+0,sp),a
 935                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 937  000c a101          	cp	a,#1
 938                     ; 490     sourcefrequency = HSI_VALUE;
 940  000e 2710          	jreq	LC002
 941                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 943  0010 a102          	cp	a,#2
 944  0012 2608          	jrne	L104
 945                     ; 494     sourcefrequency = LSI_VALUE;
 947  0014 ae9470        	ldw	x,#38000
 948  0017 1f07          	ldw	(OFST-2,sp),x
 949  0019 5f            	clrw	x
 951  001a 200c          	jpf	LC001
 952  001c               L104:
 953                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 955  001c a104          	cp	a,#4
 956  001e 260a          	jrne	L504
 957                     ; 498     sourcefrequency = HSE_VALUE;
 959  0020               LC002:
 961  0020 ae2400        	ldw	x,#9216
 962  0023 1f07          	ldw	(OFST-2,sp),x
 963  0025 ae00f4        	ldw	x,#244
 964  0028               LC001:
 965  0028 1f05          	ldw	(OFST-4,sp),x
 968  002a               L504:
 969                     ; 502     clockfrequency = LSE_VALUE;
 971                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 973  002a c650c0        	ld	a,20672
 974  002d a407          	and	a,#7
 976                     ; 507   presc = SYSDivFactor[tmp];
 978  002f 5f            	clrw	x
 979  0030 97            	ld	xl,a
 980  0031 d60000        	ld	a,(_SYSDivFactor,x)
 981  0034 6b09          	ld	(OFST+0,sp),a
 983                     ; 510   clockfrequency = sourcefrequency / presc;
 985  0036 b703          	ld	c_lreg+3,a
 986  0038 3f02          	clr	c_lreg+2
 987  003a 3f01          	clr	c_lreg+1
 988  003c 3f00          	clr	c_lreg
 989  003e 96            	ldw	x,sp
 990  003f 5c            	incw	x
 991  0040 8d000000      	callf	d_rtol
 994  0044 96            	ldw	x,sp
 995  0045 1c0005        	addw	x,#OFST-4
 996  0048 8d000000      	callf	d_ltor
 998  004c 96            	ldw	x,sp
 999  004d 5c            	incw	x
1000  004e 8d000000      	callf	d_ludv
1002  0052 96            	ldw	x,sp
1003  0053 1c0005        	addw	x,#OFST-4
1004  0056 8d000000      	callf	d_rtol
1007                     ; 512   return((uint32_t)clockfrequency);
1009  005a 96            	ldw	x,sp
1010  005b 1c0005        	addw	x,#OFST-4
1011  005e 8d000000      	callf	d_ltor
1015  0062 5b09          	addw	sp,#9
1016  0064 87            	retf	
1113                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1113                     ; 529 {
1114                     .text:	section	.text,new
1115  0000               f_CLK_SYSCLKDivConfig:
1119                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1121                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1123  0000 c750c0        	ld	20672,a
1124                     ; 534 }
1127  0003 87            	retf	
1162                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1162                     ; 542 {
1163                     .text:	section	.text,new
1164  0000               f_CLK_SYSCLKSourceSwitchCmd:
1168                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1170                     ; 546   if (NewState != DISABLE)
1172  0000 4d            	tnz	a
1173  0001 2705          	jreq	L174
1174                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1176  0003 721250c9      	bset	20681,#1
1179  0007 87            	retf	
1180  0008               L174:
1181                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1183  0008 721350c9      	bres	20681,#1
1184                     ; 556 }
1187  000c 87            	retf	
1332                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1332                     ; 617 {
1333                     .text:	section	.text,new
1334  0000               f_CLK_RTCClockConfig:
1336  0000 89            	pushw	x
1337       00000000      OFST:	set	0
1340                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1342                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1344                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1346  0001 9f            	ld	a,xl
1347  0002 1a01          	or	a,(OFST+1,sp)
1348  0004 c750c1        	ld	20673,a
1349                     ; 624 }
1352  0007 85            	popw	x
1353  0008 87            	retf	
1418                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1418                     ; 636 {
1419                     .text:	section	.text,new
1420  0000               f_CLK_BEEPClockConfig:
1424                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1426                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1428  0000 c750cb        	ld	20683,a
1429                     ; 643 }
1432  0003 87            	retf	
1654                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1654                     ; 678 {
1655                     .text:	section	.text,new
1656  0000               f_CLK_PeripheralClockConfig:
1658  0000 89            	pushw	x
1659  0001 88            	push	a
1660       00000001      OFST:	set	1
1663                     ; 679   uint8_t reg = 0;
1665                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1667                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1669                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1671  0002 9e            	ld	a,xh
1672  0003 a4f0          	and	a,#240
1673  0005 6b01          	ld	(OFST+0,sp),a
1675                     ; 688   if ( reg == 0x00)
1677  0007 262d          	jrne	L117
1678                     ; 690     if (NewState != DISABLE)
1680  0009 7b03          	ld	a,(OFST+2,sp)
1681  000b 2714          	jreq	L317
1682                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1684  000d 7b02          	ld	a,(OFST+1,sp)
1685  000f 8d8f008f      	callf	LC005
1686  0013 2704          	jreq	L64
1687  0015               L05:
1688  0015 48            	sll	a
1689  0016 5a            	decw	x
1690  0017 26fc          	jrne	L05
1691  0019               L64:
1692  0019 ca50c3        	or	a,20675
1693  001c c750c3        	ld	20675,a
1695  001f 206b          	jra	L717
1696  0021               L317:
1697                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1699  0021 7b02          	ld	a,(OFST+1,sp)
1700  0023 8d8f008f      	callf	LC005
1701  0027 2704          	jreq	L25
1702  0029               L45:
1703  0029 48            	sll	a
1704  002a 5a            	decw	x
1705  002b 26fc          	jrne	L45
1706  002d               L25:
1707  002d 43            	cpl	a
1708  002e c450c3        	and	a,20675
1709  0031 c750c3        	ld	20675,a
1710  0034 2056          	jra	L717
1711  0036               L117:
1712                     ; 701   else if (reg == 0x10)
1714  0036 a110          	cp	a,#16
1715  0038 262a          	jrne	L127
1716                     ; 703     if (NewState != DISABLE)
1718  003a 7b03          	ld	a,(OFST+2,sp)
1719  003c 2711          	jreq	L327
1720                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1722  003e 7b02          	ld	a,(OFST+1,sp)
1723  0040 8d8f008f      	callf	LC005
1724  0044 2704          	jreq	L65
1725  0046               L06:
1726  0046 48            	sll	a
1727  0047 5a            	decw	x
1728  0048 26fc          	jrne	L06
1729  004a               L65:
1730  004a ca50c4        	or	a,20676
1732  004d 2010          	jpf	LC004
1733  004f               L327:
1734                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1736  004f 7b02          	ld	a,(OFST+1,sp)
1737  0051 8d8f008f      	callf	LC005
1738  0055 2704          	jreq	L26
1739  0057               L46:
1740  0057 48            	sll	a
1741  0058 5a            	decw	x
1742  0059 26fc          	jrne	L46
1743  005b               L26:
1744  005b 43            	cpl	a
1745  005c c450c4        	and	a,20676
1746  005f               LC004:
1747  005f c750c4        	ld	20676,a
1748  0062 2028          	jra	L717
1749  0064               L127:
1750                     ; 716     if (NewState != DISABLE)
1752  0064 7b03          	ld	a,(OFST+2,sp)
1753  0066 2711          	jreq	L137
1754                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1756  0068 7b02          	ld	a,(OFST+1,sp)
1757  006a 8d8f008f      	callf	LC005
1758  006e 2704          	jreq	L66
1759  0070               L07:
1760  0070 48            	sll	a
1761  0071 5a            	decw	x
1762  0072 26fc          	jrne	L07
1763  0074               L66:
1764  0074 ca50d0        	or	a,20688
1766  0077 2010          	jpf	LC003
1767  0079               L137:
1768                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1770  0079 7b02          	ld	a,(OFST+1,sp)
1771  007b 8d8f008f      	callf	LC005
1772  007f 2704          	jreq	L27
1773  0081               L47:
1774  0081 48            	sll	a
1775  0082 5a            	decw	x
1776  0083 26fc          	jrne	L47
1777  0085               L27:
1778  0085 43            	cpl	a
1779  0086 c450d0        	and	a,20688
1780  0089               LC003:
1781  0089 c750d0        	ld	20688,a
1782  008c               L717:
1783                     ; 727 }
1786  008c 5b03          	addw	sp,#3
1787  008e 87            	retf	
1788  008f               LC005:
1789  008f a40f          	and	a,#15
1790  0091 5f            	clrw	x
1791  0092 97            	ld	xl,a
1792  0093 a601          	ld	a,#1
1793  0095 5d            	tnzw	x
1794  0096 87            	retf	
1817                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1817                     ; 766 {
1818                     .text:	section	.text,new
1819  0000               f_CLK_LSEClockSecuritySystemEnable:
1823                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1825  0000 72105190      	bset	20880,#0
1826                     ; 769 }
1829  0004 87            	retf	
1852                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1852                     ; 778 {
1853                     .text:	section	.text,new
1854  0000               f_CLK_RTCCLKSwitchOnLSEFailureEnable:
1858                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1860  0000 72125190      	bset	20880,#1
1861                     ; 781 }
1864  0004 87            	retf	
1938                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1938                     ; 808 {
1939                     .text:	section	.text,new
1940  0000               f_CLK_HaltConfig:
1942  0000 89            	pushw	x
1943       00000000      OFST:	set	0
1946                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1948                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1950                     ; 813   if (NewState != DISABLE)
1952  0001 9f            	ld	a,xl
1953  0002 4d            	tnz	a
1954  0003 2706          	jreq	L1101
1955                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1957  0005 9e            	ld	a,xh
1958  0006 ca50c2        	or	a,20674
1960  0009 2006          	jra	L3101
1961  000b               L1101:
1962                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1964  000b 7b01          	ld	a,(OFST+1,sp)
1965  000d 43            	cpl	a
1966  000e c450c2        	and	a,20674
1967  0011               L3101:
1968  0011 c750c2        	ld	20674,a
1969                     ; 821 }
1972  0014 85            	popw	x
1973  0015 87            	retf	
2008                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2008                     ; 832 {
2009                     .text:	section	.text,new
2010  0000               f_CLK_MainRegulatorCmd:
2014                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2016                     ; 836   if (NewState != DISABLE)
2018  0000 4d            	tnz	a
2019  0001 2705          	jreq	L3301
2020                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2022  0003 721350cf      	bres	20687,#1
2025  0007 87            	retf	
2026  0008               L3301:
2027                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2029  0008 721250cf      	bset	20687,#1
2030                     ; 846 }
2033  000c 87            	retf	
2104                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2104                     ; 876 {
2105                     .text:	section	.text,new
2106  0000               f_CLK_ITConfig:
2108  0000 89            	pushw	x
2109       00000000      OFST:	set	0
2112                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2114                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2116                     ; 882   if (NewState != DISABLE)
2118  0001 9f            	ld	a,xl
2119  0002 4d            	tnz	a
2120  0003 271d          	jreq	L3701
2121                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2123  0005 9e            	ld	a,xh
2124  0006 a11c          	cp	a,#28
2125  0008 2606          	jrne	L5701
2126                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2128  000a 721450c9      	bset	20681,#2
2130  000e 202c          	jra	L5011
2131  0010               L5701:
2132                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2134  0010 7b01          	ld	a,(OFST+1,sp)
2135  0012 a12c          	cp	a,#44
2136  0014 2606          	jrne	L1011
2137                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2139  0016 72145190      	bset	20880,#2
2141  001a 2020          	jra	L5011
2142  001c               L1011:
2143                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2145  001c 721450ca      	bset	20682,#2
2146  0020 201a          	jra	L5011
2147  0022               L3701:
2148                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2150  0022 7b01          	ld	a,(OFST+1,sp)
2151  0024 a11c          	cp	a,#28
2152  0026 2606          	jrne	L7011
2153                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2155  0028 721550c9      	bres	20681,#2
2157  002c 200e          	jra	L5011
2158  002e               L7011:
2159                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2161  002e a12c          	cp	a,#44
2162  0030 2606          	jrne	L3111
2163                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2165  0032 72155190      	bres	20880,#2
2167  0036 2004          	jra	L5011
2168  0038               L3111:
2169                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2171  0038 721550ca      	bres	20682,#2
2172  003c               L5011:
2173                     ; 918 }
2176  003c 85            	popw	x
2177  003d 87            	retf	
2395                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2395                     ; 946 {
2396                     .text:	section	.text,new
2397  0000               f_CLK_GetFlagStatus:
2399  0000 88            	push	a
2400  0001 89            	pushw	x
2401       00000002      OFST:	set	2
2404                     ; 947   uint8_t reg = 0;
2406                     ; 948   uint8_t pos = 0;
2408                     ; 949   FlagStatus bitstatus = RESET;
2410                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2412                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2414  0002 a4f0          	and	a,#240
2415  0004 6b02          	ld	(OFST+0,sp),a
2417                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2419  0006 7b03          	ld	a,(OFST+1,sp)
2420  0008 a40f          	and	a,#15
2421  000a 6b01          	ld	(OFST-1,sp),a
2423                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2425  000c 7b02          	ld	a,(OFST+0,sp)
2426  000e 2605          	jrne	L7221
2427                     ; 962     reg = CLK->CRTCR;
2429  0010 c650c1        	ld	a,20673
2431  0013 2042          	jra	L1321
2432  0015               L7221:
2433                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2435  0015 a110          	cp	a,#16
2436  0017 2605          	jrne	L3321
2437                     ; 966     reg = CLK->ICKCR;
2439  0019 c650c2        	ld	a,20674
2441  001c 2039          	jra	L1321
2442  001e               L3321:
2443                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2445  001e a120          	cp	a,#32
2446  0020 2605          	jrne	L7321
2447                     ; 970     reg = CLK->CCOR;
2449  0022 c650c5        	ld	a,20677
2451  0025 2030          	jra	L1321
2452  0027               L7321:
2453                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2455  0027 a130          	cp	a,#48
2456  0029 2605          	jrne	L3421
2457                     ; 974     reg = CLK->ECKCR;
2459  002b c650c6        	ld	a,20678
2461  002e 2027          	jra	L1321
2462  0030               L3421:
2463                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2465  0030 a140          	cp	a,#64
2466  0032 2605          	jrne	L7421
2467                     ; 978     reg = CLK->SWCR;
2469  0034 c650c9        	ld	a,20681
2471  0037 201e          	jra	L1321
2472  0039               L7421:
2473                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2475  0039 a150          	cp	a,#80
2476  003b 2605          	jrne	L3521
2477                     ; 982     reg = CLK->CSSR;
2479  003d c650ca        	ld	a,20682
2481  0040 2015          	jra	L1321
2482  0042               L3521:
2483                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2485  0042 a170          	cp	a,#112
2486  0044 2605          	jrne	L7521
2487                     ; 986     reg = CLK->REGCSR;
2489  0046 c650cf        	ld	a,20687
2491  0049 200c          	jra	L1321
2492  004b               L7521:
2493                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2495  004b a180          	cp	a,#128
2496  004d 2605          	jrne	L3621
2497                     ; 990     reg = CSSLSE->CSR;
2499  004f c65190        	ld	a,20880
2501  0052 2003          	jra	L1321
2502  0054               L3621:
2503                     ; 994     reg = CLK->CBEEPR;
2505  0054 c650cb        	ld	a,20683
2506  0057               L1321:
2507  0057 6b02          	ld	(OFST+0,sp),a
2509                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2511  0059 5f            	clrw	x
2512  005a 7b01          	ld	a,(OFST-1,sp)
2513  005c 97            	ld	xl,a
2514  005d a601          	ld	a,#1
2515  005f 5d            	tnzw	x
2516  0060 2704          	jreq	L211
2517  0062               L411:
2518  0062 48            	sll	a
2519  0063 5a            	decw	x
2520  0064 26fc          	jrne	L411
2521  0066               L211:
2522  0066 1402          	and	a,(OFST+0,sp)
2523  0068 2702          	jreq	L7621
2524                     ; 1000     bitstatus = SET;
2526  006a a601          	ld	a,#1
2529  006c               L7621:
2530                     ; 1004     bitstatus = RESET;
2533                     ; 1008   return((FlagStatus)bitstatus);
2537  006c 5b03          	addw	sp,#3
2538  006e 87            	retf	
2560                     ; 1016 void CLK_ClearFlag(void)
2560                     ; 1017 {
2561                     .text:	section	.text,new
2562  0000               f_CLK_ClearFlag:
2566                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2568  0000 72175190      	bres	20880,#3
2569                     ; 1021 }
2572  0004 87            	retf	
2617                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2617                     ; 1033 {
2618                     .text:	section	.text,new
2619  0000               f_CLK_GetITStatus:
2621  0000 88            	push	a
2622  0001 88            	push	a
2623       00000001      OFST:	set	1
2626                     ; 1035   ITStatus bitstatus = RESET;
2628                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2630                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2632  0002 a11c          	cp	a,#28
2633  0004 2605          	jrne	L5231
2634                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2636  0006 c450c9        	and	a,20681
2637                     ; 1045       bitstatus = SET;
2639  0009 2009          	jpf	LC008
2640                     ; 1049       bitstatus = RESET;
2641  000b               L5231:
2642                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2644  000b a12c          	cp	a,#44
2645  000d 260d          	jrne	L5331
2646                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2648  000f c65190        	ld	a,20880
2649  0012 1402          	and	a,(OFST+1,sp)
2650  0014               LC008:
2651  0014 a10c          	cp	a,#12
2652  0016 260d          	jrne	L5431
2653                     ; 1057       bitstatus = SET;
2655  0018               LC007:
2658  0018 a601          	ld	a,#1
2661  001a 200a          	jra	L3331
2662                     ; 1061       bitstatus = RESET;
2663  001c               L5331:
2664                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2666  001c c650ca        	ld	a,20682
2667  001f 1402          	and	a,(OFST+1,sp)
2668  0021 a10c          	cp	a,#12
2669                     ; 1069       bitstatus = SET;
2671  0023 27f3          	jreq	LC007
2672  0025               L5431:
2673                     ; 1073       bitstatus = RESET;
2677  0025 4f            	clr	a
2679  0026               L3331:
2680                     ; 1078   return bitstatus;
2684  0026 85            	popw	x
2685  0027 87            	retf	
2720                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2720                     ; 1090 {
2721                     .text:	section	.text,new
2722  0000               f_CLK_ClearITPendingBit:
2726                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2728                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2730  0000 a4f0          	and	a,#240
2731  0002 a120          	cp	a,#32
2732  0004 2605          	jrne	L7631
2733                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2735  0006 72175190      	bres	20880,#3
2738  000a 87            	retf	
2739  000b               L7631:
2740                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2742  000b 721750c9      	bres	20681,#3
2743                     ; 1105 }
2746  000f 87            	retf	
2770                     	xdef	_SYSDivFactor
2771                     	xdef	f_CLK_ClearITPendingBit
2772                     	xdef	f_CLK_GetITStatus
2773                     	xdef	f_CLK_ClearFlag
2774                     	xdef	f_CLK_GetFlagStatus
2775                     	xdef	f_CLK_ITConfig
2776                     	xdef	f_CLK_MainRegulatorCmd
2777                     	xdef	f_CLK_HaltConfig
2778                     	xdef	f_CLK_RTCCLKSwitchOnLSEFailureEnable
2779                     	xdef	f_CLK_LSEClockSecuritySystemEnable
2780                     	xdef	f_CLK_PeripheralClockConfig
2781                     	xdef	f_CLK_BEEPClockConfig
2782                     	xdef	f_CLK_RTCClockConfig
2783                     	xdef	f_CLK_SYSCLKSourceSwitchCmd
2784                     	xdef	f_CLK_SYSCLKDivConfig
2785                     	xdef	f_CLK_GetClockFreq
2786                     	xdef	f_CLK_GetSYSCLKSource
2787                     	xdef	f_CLK_SYSCLKSourceConfig
2788                     	xdef	f_CLK_CCOConfig
2789                     	xdef	f_CLK_ClockSecuritySytemDeglitchCmd
2790                     	xdef	f_CLK_ClockSecuritySystemEnable
2791                     	xdef	f_CLK_LSEConfig
2792                     	xdef	f_CLK_HSEConfig
2793                     	xdef	f_CLK_LSICmd
2794                     	xdef	f_CLK_AdjustHSICalibrationValue
2795                     	xdef	f_CLK_HSICmd
2796                     	xdef	f_CLK_DeInit
2797                     	xref.b	c_lreg
2798                     	xref.b	c_x
2817                     	xref	d_ludv
2818                     	xref	d_rtol
2819                     	xref	d_ltor
2820                     	end
