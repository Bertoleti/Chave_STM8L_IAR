   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 181                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 181                     ; 136 {
 182                     .text:	section	.text,new
 183  0000               f_ADC_DeInit:
 187                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 189  0000 7f            	clr	(x)
 190                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 192  0001 6f01          	clr	(1,x)
 193                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 195  0003 a61f          	ld	a,#31
 196  0005 e702          	ld	(2,x),a
 197                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 199  0007 a6ff          	ld	a,#255
 200  0009 e703          	ld	(3,x),a
 201                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 203  000b a60f          	ld	a,#15
 204  000d e706          	ld	(6,x),a
 205                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 207  000f a6ff          	ld	a,#255
 208  0011 e707          	ld	(7,x),a
 209                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 211  0013 6f08          	clr	(8,x)
 212                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 214  0015 6f09          	clr	(9,x)
 215                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 217  0017 6f0a          	clr	(10,x)
 218                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 220  0019 6f0b          	clr	(11,x)
 221                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 223  001b 6f0c          	clr	(12,x)
 224                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 226  001d 6f0d          	clr	(13,x)
 227                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 229  001f 6f0e          	clr	(14,x)
 230                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 232  0021 6f0f          	clr	(15,x)
 233                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 235  0023 6f10          	clr	(16,x)
 236                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 238  0025 6f11          	clr	(17,x)
 239                     ; 164 }
 242  0027 87            	retf	
 388                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 388                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 388                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 388                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 388                     ; 190 {
 389                     .text:	section	.text,new
 390  0000               f_ADC_Init:
 392       fffffffe      OFST: set -2
 395                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 397                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 399                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 401                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 403  0000 f6            	ld	a,(x)
 404  0001 a49b          	and	a,#155
 405  0003 f7            	ld	(x),a
 406                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 408  0004 7b04          	ld	a,(OFST+6,sp)
 409  0006 1a05          	or	a,(OFST+7,sp)
 410  0008 fa            	or	a,(x)
 411  0009 f7            	ld	(x),a
 412                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 414  000a e601          	ld	a,(1,x)
 415  000c a47f          	and	a,#127
 416  000e e701          	ld	(1,x),a
 417                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 419  0010 e601          	ld	a,(1,x)
 420  0012 1a06          	or	a,(OFST+8,sp)
 421  0014 e701          	ld	(1,x),a
 422                     ; 207 }
 425  0016 87            	retf	
 491                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 491                     ; 217              FunctionalState NewState)
 491                     ; 218 {
 492                     .text:	section	.text,new
 493  0000               f_ADC_Cmd:
 495       fffffffe      OFST: set -2
 498                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 500                     ; 222   if (NewState != DISABLE)
 502  0000 7b04          	ld	a,(OFST+6,sp)
 503  0002 2705          	jreq	L142
 504                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 506  0004 f6            	ld	a,(x)
 507  0005 aa01          	or	a,#1
 509  0007 2003          	jra	L342
 510  0009               L142:
 511                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 513  0009 f6            	ld	a,(x)
 514  000a a4fe          	and	a,#254
 515  000c               L342:
 516  000c f7            	ld	(x),a
 517                     ; 232 }
 520  000d 87            	retf	
 557                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 557                     ; 240 {
 558                     .text:	section	.text,new
 559  0000               f_ADC_SoftwareStartConv:
 563                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 565  0000 f6            	ld	a,(x)
 566  0001 aa02          	or	a,#2
 567  0003 f7            	ld	(x),a
 568                     ; 243 }
 571  0004 87            	retf	
 698                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 698                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 698                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 698                     ; 264 {
 699                     .text:	section	.text,new
 700  0000               f_ADC_ExternalTrigConfig:
 702       fffffffe      OFST: set -2
 705                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 707                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 709                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 711  0000 e601          	ld	a,(1,x)
 712  0002 a487          	and	a,#135
 713  0004 e701          	ld	(1,x),a
 714                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 714                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 716  0006 7b05          	ld	a,(OFST+7,sp)
 717  0008 1a04          	or	a,(OFST+6,sp)
 718  000a ea01          	or	a,(1,x)
 719  000c e701          	ld	(1,x),a
 720                     ; 276 }
 723  000e 87            	retf	
1036                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1036                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1036                     ; 341 {
1037                     .text:	section	.text,new
1038  0000               f_ADC_AnalogWatchdogChannelSelect:
1040       fffffffe      OFST: set -2
1043                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1045                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1047  0000 e602          	ld	a,(2,x)
1048  0002 a4e0          	and	a,#224
1049  0004 e702          	ld	(2,x),a
1050                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1052  0006 e602          	ld	a,(2,x)
1053  0008 1a04          	or	a,(OFST+6,sp)
1054  000a e702          	ld	(2,x),a
1055                     ; 350 }
1058  000c 87            	retf	
1109                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1109                     ; 362 {
1110                     .text:	section	.text,new
1111  0000               f_ADC_AnalogWatchdogThresholdsConfig:
1113       fffffffe      OFST: set -2
1116                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1118                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1120                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1122  0000 7b04          	ld	a,(OFST+6,sp)
1123  0002 e706          	ld	(6,x),a
1124                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1126  0004 7b05          	ld	a,(OFST+7,sp)
1127  0006 e707          	ld	(7,x),a
1128                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1130  0008 7b06          	ld	a,(OFST+8,sp)
1131  000a e708          	ld	(8,x),a
1132                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1134  000c 7b07          	ld	a,(OFST+9,sp)
1135  000e e709          	ld	(9,x),a
1136                     ; 374 }
1139  0010 87            	retf	
1201                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1201                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1201                     ; 414                               uint16_t HighThreshold,
1201                     ; 415                               uint16_t LowThreshold)
1201                     ; 416 {
1202                     .text:	section	.text,new
1203  0000               f_ADC_AnalogWatchdogConfig:
1205       fffffffe      OFST: set -2
1208                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1210                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1212                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1214                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1216  0000 e602          	ld	a,(2,x)
1217  0002 a4e0          	and	a,#224
1218  0004 e702          	ld	(2,x),a
1219                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1221  0006 e602          	ld	a,(2,x)
1222  0008 1a04          	or	a,(OFST+6,sp)
1223  000a e702          	ld	(2,x),a
1224                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1226  000c 7b05          	ld	a,(OFST+7,sp)
1227  000e e706          	ld	(6,x),a
1228                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1230  0010 7b06          	ld	a,(OFST+8,sp)
1231  0012 e707          	ld	(7,x),a
1232                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1234  0014 7b07          	ld	a,(OFST+9,sp)
1235  0016 e708          	ld	(8,x),a
1236                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1238  0018 7b08          	ld	a,(OFST+10,sp)
1239  001a e709          	ld	(9,x),a
1240                     ; 435 }
1243  001c 87            	retf	
1277                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1277                     ; 475 {
1278                     .text:	section	.text,new
1279  0000               f_ADC_TempSensorCmd:
1283                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1285                     ; 479   if (NewState != DISABLE)
1287  0000 4d            	tnz	a
1288  0001 2705          	jreq	L165
1289                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1291  0003 721a534e      	bset	21326,#5
1294  0007 87            	retf	
1295  0008               L165:
1296                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1298  0008 721b534e      	bres	21326,#5
1299                     ; 489 }
1302  000c 87            	retf	
1336                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1336                     ; 498 {
1337                     .text:	section	.text,new
1338  0000               f_ADC_VrefintCmd:
1342                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1344                     ; 502   if (NewState != DISABLE)
1346  0000 4d            	tnz	a
1347  0001 2705          	jreq	L306
1348                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1350  0003 7218534e      	bset	21326,#4
1353  0007 87            	retf	
1354  0008               L306:
1355                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1357  0008 7219534e      	bres	21326,#4
1358                     ; 512 }
1361  000c 87            	retf	
1670                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1670                     ; 584 {
1671                     .text:	section	.text,new
1672  0000               f_ADC_ChannelCmd:
1674  0000 89            	pushw	x
1675  0001 88            	push	a
1676       00000001      OFST:	set	1
1679                     ; 585   uint8_t regindex = 0;
1681                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1683                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1685  0002 7b07          	ld	a,(OFST+6,sp)
1686  0004 6b01          	ld	(OFST+0,sp),a
1688                     ; 591   if (NewState != DISABLE)
1690  0006 0d09          	tnz	(OFST+8,sp)
1691  0008 270d          	jreq	L157
1692                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1694  000a 01            	rrwa	x,a
1695  000b 1b01          	add	a,(OFST+0,sp)
1696  000d 2401          	jrnc	L23
1697  000f 5c            	incw	x
1698  0010               L23:
1699  0010 02            	rlwa	x,a
1700  0011 e60a          	ld	a,(10,x)
1701  0013 1a08          	or	a,(OFST+7,sp)
1703  0015 2010          	jra	L357
1704  0017               L157:
1705                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1707  0017 7b02          	ld	a,(OFST+1,sp)
1708  0019 97            	ld	xl,a
1709  001a 7b03          	ld	a,(OFST+2,sp)
1710  001c 1b01          	add	a,(OFST+0,sp)
1711  001e 2401          	jrnc	L43
1712  0020 5c            	incw	x
1713  0021               L43:
1714  0021 02            	rlwa	x,a
1715  0022 7b08          	ld	a,(OFST+7,sp)
1716  0024 43            	cpl	a
1717  0025 e40a          	and	a,(10,x)
1718  0027               L357:
1719  0027 e70a          	ld	(10,x),a
1720                     ; 601 }
1723  0029 5b03          	addw	sp,#3
1724  002b 87            	retf	
1873                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1873                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1873                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1873                     ; 628 {
1874                     .text:	section	.text,new
1875  0000               f_ADC_SamplingTimeConfig:
1877       fffffffe      OFST: set -2
1880                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1882                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1884                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1886  0000 7b04          	ld	a,(OFST+6,sp)
1887  0002 2711          	jreq	L1401
1888                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1890  0004 e602          	ld	a,(2,x)
1891  0006 a41f          	and	a,#31
1892  0008 e702          	ld	(2,x),a
1893                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1895  000a 7b05          	ld	a,(OFST+7,sp)
1896  000c 4e            	swap	a
1897  000d 48            	sll	a
1898  000e a4e0          	and	a,#224
1899  0010 ea02          	or	a,(2,x)
1900  0012 e702          	ld	(2,x),a
1903  0014 87            	retf	
1904  0015               L1401:
1905                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1907  0015 e601          	ld	a,(1,x)
1908  0017 a4f8          	and	a,#248
1909  0019 e701          	ld	(1,x),a
1910                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1912  001b e601          	ld	a,(1,x)
1913  001d 1a05          	or	a,(OFST+7,sp)
1914  001f e701          	ld	(1,x),a
1915                     ; 645 }
1918  0021 87            	retf	
1982                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
1982                     ; 692                               FunctionalState NewState)
1982                     ; 693 {
1983                     .text:	section	.text,new
1984  0000               f_ADC_SchmittTriggerConfig:
1986  0000 89            	pushw	x
1987  0001 88            	push	a
1988       00000001      OFST:	set	1
1991                     ; 694   uint8_t regindex = 0;
1993                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
1995                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1997  0002 7b07          	ld	a,(OFST+6,sp)
1998  0004 6b01          	ld	(OFST+0,sp),a
2000                     ; 700   if (NewState != DISABLE)
2002  0006 0d09          	tnz	(OFST+8,sp)
2003  0008 270e          	jreq	L7701
2004                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2006  000a 01            	rrwa	x,a
2007  000b 1b01          	add	a,(OFST+0,sp)
2008  000d 2401          	jrnc	L24
2009  000f 5c            	incw	x
2010  0010               L24:
2011  0010 02            	rlwa	x,a
2012  0011 7b08          	ld	a,(OFST+7,sp)
2013  0013 43            	cpl	a
2014  0014 e40e          	and	a,(14,x)
2016  0016 200f          	jra	L1011
2017  0018               L7701:
2018                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2020  0018 7b02          	ld	a,(OFST+1,sp)
2021  001a 97            	ld	xl,a
2022  001b 7b03          	ld	a,(OFST+2,sp)
2023  001d 1b01          	add	a,(OFST+0,sp)
2024  001f 2401          	jrnc	L44
2025  0021 5c            	incw	x
2026  0022               L44:
2027  0022 02            	rlwa	x,a
2028  0023 e60e          	ld	a,(14,x)
2029  0025 1a08          	or	a,(OFST+7,sp)
2030  0027               L1011:
2031  0027 e70e          	ld	(14,x),a
2032                     ; 710 }
2035  0029 5b03          	addw	sp,#3
2036  002b 87            	retf	
2080                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2080                     ; 718 {
2081                     .text:	section	.text,new
2082  0000               f_ADC_GetConversionValue:
2084  0000 89            	pushw	x
2085  0001 89            	pushw	x
2086       00000002      OFST:	set	2
2089                     ; 719   uint16_t tmpreg = 0;
2091                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2093  0002 e604          	ld	a,(4,x)
2094  0004 97            	ld	xl,a
2096                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2098  0005 1603          	ldw	y,(OFST+1,sp)
2099  0007 90e605        	ld	a,(5,y)
2100  000a 02            	rlwa	x,a
2102                     ; 726   return (uint16_t)(tmpreg) ;
2106  000b 5b04          	addw	sp,#4
2107  000d 87            	retf	
2153                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2153                     ; 761 {
2154                     .text:	section	.text,new
2155  0000               f_ADC_DMACmd:
2157       fffffffe      OFST: set -2
2160                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2162                     ; 765   if (NewState != DISABLE)
2164  0000 7b04          	ld	a,(OFST+6,sp)
2165  0002 2706          	jreq	L1511
2166                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2168  0004 e60a          	ld	a,(10,x)
2169  0006 a47f          	and	a,#127
2171  0008 2004          	jra	L3511
2172  000a               L1511:
2173                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2175  000a e60a          	ld	a,(10,x)
2176  000c aa80          	or	a,#128
2177  000e               L3511:
2178  000e e70a          	ld	(10,x),a
2179                     ; 775 }
2182  0010 87            	retf	
2265                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2265                     ; 832 {
2266                     .text:	section	.text,new
2267  0000               f_ADC_ITConfig:
2269       fffffffe      OFST: set -2
2272                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2274                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2276                     ; 837   if (NewState != DISABLE)
2278  0000 7b05          	ld	a,(OFST+7,sp)
2279  0002 2705          	jreq	L7121
2280                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2282  0004 f6            	ld	a,(x)
2283  0005 1a04          	or	a,(OFST+6,sp)
2285  0007 2004          	jra	L1221
2286  0009               L7121:
2287                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2289  0009 7b04          	ld	a,(OFST+6,sp)
2290  000b 43            	cpl	a
2291  000c f4            	and	a,(x)
2292  000d               L1221:
2293  000d f7            	ld	(x),a
2294                     ; 847 }
2297  000e 87            	retf	
2401                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2401                     ; 860 {
2402                     .text:	section	.text,new
2403  0000               f_ADC_GetFlagStatus:
2405       fffffffe      OFST: set -2
2408                     ; 861   FlagStatus flagstatus = RESET;
2410                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2412                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2414  0000 e603          	ld	a,(3,x)
2415  0002 1504          	bcp	a,(OFST+6,sp)
2416  0004 2703          	jreq	L5721
2417                     ; 870     flagstatus = SET;
2419  0006 a601          	ld	a,#1
2423  0008 87            	retf	
2424  0009               L5721:
2425                     ; 875     flagstatus = RESET;
2427  0009 4f            	clr	a
2429                     ; 879   return  flagstatus;
2433  000a 87            	retf	
2479                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2479                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2479                     ; 894 {
2480                     .text:	section	.text,new
2481  0000               f_ADC_ClearFlag:
2483       fffffffe      OFST: set -2
2486                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2488                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2490  0000 7b04          	ld	a,(OFST+6,sp)
2491  0002 43            	cpl	a
2492  0003 e703          	ld	(3,x),a
2493                     ; 900 }
2496  0005 87            	retf	
2567                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2567                     ; 913                          ADC_IT_TypeDef ADC_IT)
2567                     ; 914 {
2568                     .text:	section	.text,new
2569  0000               f_ADC_GetITStatus:
2571  0000 89            	pushw	x
2572  0001 5203          	subw	sp,#3
2573       00000003      OFST:	set	3
2576                     ; 915   ITStatus itstatus = RESET;
2578                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2582                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2584                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2586  0003 7b09          	ld	a,(OFST+6,sp)
2587  0005 44            	srl	a
2588  0006 44            	srl	a
2589  0007 44            	srl	a
2590  0008 6b03          	ld	(OFST+0,sp),a
2592                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2592                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2594  000a a403          	and	a,#3
2595  000c 6b01          	ld	(OFST-2,sp),a
2597  000e 7b03          	ld	a,(OFST+0,sp)
2598  0010 a410          	and	a,#16
2599  0012 44            	srl	a
2600  0013 44            	srl	a
2601  0014 1a01          	or	a,(OFST-2,sp)
2602  0016 6b03          	ld	(OFST+0,sp),a
2604                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2606  0018 f6            	ld	a,(x)
2607  0019 1409          	and	a,(OFST+6,sp)
2608  001b 6b02          	ld	(OFST-1,sp),a
2610                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2612  001d e603          	ld	a,(3,x)
2613  001f 1503          	bcp	a,(OFST+0,sp)
2614  0021 2708          	jreq	L1631
2616  0023 7b02          	ld	a,(OFST-1,sp)
2617  0025 2704          	jreq	L1631
2618                     ; 933     itstatus = SET;
2620  0027 a601          	ld	a,#1
2623  0029 2001          	jra	L3631
2624  002b               L1631:
2625                     ; 938     itstatus = RESET;
2627  002b 4f            	clr	a
2629  002c               L3631:
2630                     ; 942   return  itstatus;
2634  002c 5b05          	addw	sp,#5
2635  002e 87            	retf	
2689                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2689                     ; 956                            ADC_IT_TypeDef ADC_IT)
2689                     ; 957 {
2690                     .text:	section	.text,new
2691  0000               f_ADC_ClearITPendingBit:
2693  0000 89            	pushw	x
2694  0001 89            	pushw	x
2695       00000002      OFST:	set	2
2698                     ; 958   uint8_t itmask = 0;
2700                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2702                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2704  0002 7b08          	ld	a,(OFST+6,sp)
2705  0004 44            	srl	a
2706  0005 44            	srl	a
2707  0006 44            	srl	a
2708  0007 6b02          	ld	(OFST+0,sp),a
2710                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2710                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2712  0009 a403          	and	a,#3
2713  000b 6b01          	ld	(OFST-1,sp),a
2715  000d 7b02          	ld	a,(OFST+0,sp)
2716  000f a410          	and	a,#16
2717  0011 44            	srl	a
2718  0012 44            	srl	a
2719  0013 1a01          	or	a,(OFST-1,sp)
2720  0015 6b02          	ld	(OFST+0,sp),a
2722                     ; 969   ADCx->SR = (uint8_t)~itmask;
2724  0017 43            	cpl	a
2725  0018 1e03          	ldw	x,(OFST+1,sp)
2726  001a e703          	ld	(3,x),a
2727                     ; 970 }
2730  001c 5b04          	addw	sp,#4
2731  001e 87            	retf	
2743                     	xdef	f_ADC_ClearITPendingBit
2744                     	xdef	f_ADC_GetITStatus
2745                     	xdef	f_ADC_ClearFlag
2746                     	xdef	f_ADC_GetFlagStatus
2747                     	xdef	f_ADC_ITConfig
2748                     	xdef	f_ADC_DMACmd
2749                     	xdef	f_ADC_GetConversionValue
2750                     	xdef	f_ADC_SchmittTriggerConfig
2751                     	xdef	f_ADC_SamplingTimeConfig
2752                     	xdef	f_ADC_ChannelCmd
2753                     	xdef	f_ADC_VrefintCmd
2754                     	xdef	f_ADC_TempSensorCmd
2755                     	xdef	f_ADC_AnalogWatchdogConfig
2756                     	xdef	f_ADC_AnalogWatchdogThresholdsConfig
2757                     	xdef	f_ADC_AnalogWatchdogChannelSelect
2758                     	xdef	f_ADC_ExternalTrigConfig
2759                     	xdef	f_ADC_SoftwareStartConv
2760                     	xdef	f_ADC_Cmd
2761                     	xdef	f_ADC_Init
2762                     	xdef	f_ADC_DeInit
2781                     	end
