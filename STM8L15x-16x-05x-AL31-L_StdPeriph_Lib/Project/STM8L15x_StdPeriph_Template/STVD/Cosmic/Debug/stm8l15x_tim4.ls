   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 130 void TIM4_DeInit(void)
  50                     ; 131 {
  51                     .text:	section	.text,new
  52  0000               f_TIM4_DeInit:
  56                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  58  0000 725f52e0      	clr	21216
  59                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  61  0004 725f52e1      	clr	21217
  62                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  64  0008 725f52e2      	clr	21218
  65                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  67  000c 725f52e4      	clr	21220
  68                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  70  0010 725f52e7      	clr	21223
  71                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  73  0014 725f52e8      	clr	21224
  74                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  76  0018 35ff52e9      	mov	21225,#255
  77                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  79  001c 725f52e5      	clr	21221
  80                     ; 140 }
  83  0020 87            	retf	
 248                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 248                     ; 166                        uint8_t TIM4_Period)
 248                     ; 167 {
 249                     .text:	section	.text,new
 250  0000               f_TIM4_TimeBaseInit:
 254                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 256                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 258  0000 9f            	ld	a,xl
 259  0001 c752e9        	ld	21225,a
 260                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 262  0004 9e            	ld	a,xh
 263  0005 c752e8        	ld	21224,a
 264                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 266  0008 350152e6      	mov	21222,#1
 267                     ; 177 }
 270  000c 87            	retf	
 337                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 337                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 337                     ; 207 {
 338                     .text:	section	.text,new
 339  0000               f_TIM4_PrescalerConfig:
 343                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 345                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 347                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 349  0000 9e            	ld	a,xh
 350  0001 c752e8        	ld	21224,a
 351                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 353  0004 9f            	ld	a,xl
 354  0005 4a            	dec	a
 355  0006 2605          	jrne	L731
 356                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 358  0008 721052e6      	bset	21222,#0
 361  000c 87            	retf	
 362  000d               L731:
 363                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 365  000d 721152e6      	bres	21222,#0
 366                     ; 224 }
 369  0011 87            	retf	
 400                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 400                     ; 233 {
 401                     .text:	section	.text,new
 402  0000               f_TIM4_SetCounter:
 406                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 408  0000 c752e7        	ld	21223,a
 409                     ; 236 }
 412  0003 87            	retf	
 443                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 443                     ; 245 {
 444                     .text:	section	.text,new
 445  0000               f_TIM4_SetAutoreload:
 449                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 451  0000 c752e9        	ld	21225,a
 452                     ; 248 }
 455  0003 87            	retf	
 486                     ; 255 uint8_t TIM4_GetCounter(void)
 486                     ; 256 {
 487                     .text:	section	.text,new
 488  0000               f_TIM4_GetCounter:
 490       00000001      OFST:	set	1
 493                     ; 257   uint8_t tmpcntr = 0;
 495                     ; 258   tmpcntr = TIM4->CNTR;
 497  0000 c652e7        	ld	a,21223
 499                     ; 260   return ((uint8_t)tmpcntr);
 503  0003 87            	retf	
 526                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 526                     ; 285 {
 527                     .text:	section	.text,new
 528  0000               f_TIM4_GetPrescaler:
 532                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 534  0000 c652e8        	ld	a,21224
 537  0003 87            	retf	
 592                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 592                     ; 297 {
 593                     .text:	section	.text,new
 594  0000               f_TIM4_UpdateDisableConfig:
 598                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 600                     ; 302   if (NewState != DISABLE)
 602  0000 4d            	tnz	a
 603  0001 2705          	jreq	L542
 604                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 606  0003 721252e0      	bset	21216,#1
 609  0007 87            	retf	
 610  0008               L542:
 611                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 613  0008 721352e0      	bres	21216,#1
 614                     ; 310 }
 617  000c 87            	retf	
 674                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 674                     ; 321 {
 675                     .text:	section	.text,new
 676  0000               f_TIM4_UpdateRequestConfig:
 680                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 682                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 684  0000 4a            	dec	a
 685  0001 2605          	jrne	L772
 686                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 688  0003 721452e0      	bset	21216,#2
 691  0007 87            	retf	
 692  0008               L772:
 693                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 695  0008 721552e0      	bres	21216,#2
 696                     ; 334 }
 699  000c 87            	retf	
 734                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 734                     ; 343 {
 735                     .text:	section	.text,new
 736  0000               f_TIM4_ARRPreloadConfig:
 740                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 742                     ; 348   if (NewState != DISABLE)
 744  0000 4d            	tnz	a
 745  0001 2705          	jreq	L123
 746                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 748  0003 721e52e0      	bset	21216,#7
 751  0007 87            	retf	
 752  0008               L123:
 753                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 755  0008 721f52e0      	bres	21216,#7
 756                     ; 356 }
 759  000c 87            	retf	
 815                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 815                     ; 367 {
 816                     .text:	section	.text,new
 817  0000               f_TIM4_SelectOnePulseMode:
 821                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 823                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 825  0000 4a            	dec	a
 826  0001 2605          	jrne	L353
 827                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 829  0003 721652e0      	bset	21216,#3
 832  0007 87            	retf	
 833  0008               L353:
 834                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 836  0008 721752e0      	bres	21216,#3
 837                     ; 380 }
 840  000c 87            	retf	
 874                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 874                     ; 389 {
 875                     .text:	section	.text,new
 876  0000               f_TIM4_Cmd:
 880                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 882                     ; 394   if (NewState != DISABLE)
 884  0000 4d            	tnz	a
 885  0001 2705          	jreq	L573
 886                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 888  0003 721052e0      	bset	21216,#0
 891  0007 87            	retf	
 892  0008               L573:
 893                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 895  0008 721152e0      	bres	21216,#0
 896                     ; 402 }
 899  000c 87            	retf	
 963                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 963                     ; 431 {
 964                     .text:	section	.text,new
 965  0000               f_TIM4_ITConfig:
 967  0000 89            	pushw	x
 968       00000000      OFST:	set	0
 971                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 973                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 975                     ; 436   if (NewState != DISABLE)
 977  0001 9f            	ld	a,xl
 978  0002 4d            	tnz	a
 979  0003 2706          	jreq	L334
 980                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 982  0005 9e            	ld	a,xh
 983  0006 ca52e4        	or	a,21220
 985  0009 2006          	jra	L534
 986  000b               L334:
 987                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 989  000b 7b01          	ld	a,(OFST+1,sp)
 990  000d 43            	cpl	a
 991  000e c452e4        	and	a,21220
 992  0011               L534:
 993  0011 c752e4        	ld	21220,a
 994                     ; 446 }
 997  0014 85            	popw	x
 998  0015 87            	retf	
1054                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1054                     ; 457 {
1055                     .text:	section	.text,new
1056  0000               f_TIM4_GenerateEvent:
1060                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1062                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1064  0000 ca52e6        	or	a,21222
1065  0003 c752e6        	ld	21222,a
1066                     ; 463 }
1069  0006 87            	retf	
1154                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1154                     ; 475 {
1155                     .text:	section	.text,new
1156  0000               f_TIM4_GetFlagStatus:
1158       00000001      OFST:	set	1
1161                     ; 476   FlagStatus bitstatus = RESET;
1163                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1165                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1167  0000 c452e5        	and	a,21221
1168  0003 2702          	jreq	L725
1169                     ; 483     bitstatus = SET;
1171  0005 a601          	ld	a,#1
1174  0007               L725:
1175                     ; 487     bitstatus = RESET;
1178                     ; 489   return ((FlagStatus)bitstatus);
1182  0007 87            	retf	
1216                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1216                     ; 501 {
1217                     .text:	section	.text,new
1218  0000               f_TIM4_ClearFlag:
1222                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1224                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1226  0000 43            	cpl	a
1227  0001 c752e5        	ld	21221,a
1228                     ; 506 }
1231  0004 87            	retf	
1290                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1290                     ; 519 {
1291                     .text:	section	.text,new
1292  0000               f_TIM4_GetITStatus:
1294  0000 88            	push	a
1295  0001 89            	pushw	x
1296       00000002      OFST:	set	2
1299                     ; 520   ITStatus bitstatus = RESET;
1301                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1305                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1307                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1309  0002 c452e5        	and	a,21221
1310  0005 6b01          	ld	(OFST-1,sp),a
1312                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1314  0007 c652e4        	ld	a,21220
1315  000a 1403          	and	a,(OFST+1,sp)
1316  000c 6b02          	ld	(OFST+0,sp),a
1318                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1320  000e 7b01          	ld	a,(OFST-1,sp)
1321  0010 2708          	jreq	L775
1323  0012 7b02          	ld	a,(OFST+0,sp)
1324  0014 2704          	jreq	L775
1325                     ; 533     bitstatus = (ITStatus)SET;
1327  0016 a601          	ld	a,#1
1330  0018 2001          	jra	L106
1331  001a               L775:
1332                     ; 537     bitstatus = (ITStatus)RESET;
1334  001a 4f            	clr	a
1336  001b               L106:
1337                     ; 539   return ((ITStatus)bitstatus);
1341  001b 5b03          	addw	sp,#3
1342  001d 87            	retf	
1377                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1377                     ; 551 {
1378                     .text:	section	.text,new
1379  0000               f_TIM4_ClearITPendingBit:
1383                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1385                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1387  0000 43            	cpl	a
1388  0001 c752e5        	ld	21221,a
1389                     ; 557 }
1392  0004 87            	retf	
1450                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1450                     ; 569 {
1451                     .text:	section	.text,new
1452  0000               f_TIM4_DMACmd:
1454  0000 89            	pushw	x
1455       00000000      OFST:	set	0
1458                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1460                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1462                     ; 574   if (NewState != DISABLE)
1464  0001 9f            	ld	a,xl
1465  0002 4d            	tnz	a
1466  0003 2706          	jreq	L156
1467                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1469  0005 9e            	ld	a,xh
1470  0006 ca52e3        	or	a,21219
1472  0009 2006          	jra	L356
1473  000b               L156:
1474                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1476  000b 7b01          	ld	a,(OFST+1,sp)
1477  000d 43            	cpl	a
1478  000e c452e3        	and	a,21219
1479  0011               L356:
1480  0011 c752e3        	ld	21219,a
1481                     ; 584 }
1484  0014 85            	popw	x
1485  0015 87            	retf	
1508                     ; 607 void TIM4_InternalClockConfig(void)
1508                     ; 608 {
1509                     .text:	section	.text,new
1510  0000               f_TIM4_InternalClockConfig:
1514                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1516  0000 c652e2        	ld	a,21218
1517  0003 a4f8          	and	a,#248
1518  0005 c752e2        	ld	21218,a
1519                     ; 611 }
1522  0008 87            	retf	
1603                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1603                     ; 652 {
1604                     .text:	section	.text,new
1605  0000               f_TIM4_SelectInputTrigger:
1607  0000 88            	push	a
1608  0001 88            	push	a
1609       00000001      OFST:	set	1
1612                     ; 653   uint8_t tmpsmcr = 0;
1614                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1616                     ; 658   tmpsmcr = TIM4->SMCR;
1618  0002 c652e2        	ld	a,21218
1620                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1622  0005 a48f          	and	a,#143
1624                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1626  0007 1a02          	or	a,(OFST+1,sp)
1628                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1630  0009 c752e2        	ld	21218,a
1631                     ; 665 }
1634  000c 85            	popw	x
1635  000d 87            	retf	
1707                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1707                     ; 677 {
1708                     .text:	section	.text,new
1709  0000               f_TIM4_SelectOutputTrigger:
1711  0000 88            	push	a
1712  0001 88            	push	a
1713       00000001      OFST:	set	1
1716                     ; 678   uint8_t tmpcr2 = 0;
1718                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1720                     ; 683   tmpcr2 = TIM4->CR2;
1722  0002 c652e1        	ld	a,21217
1724                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1726  0005 a48f          	and	a,#143
1728                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1730  0007 1a02          	or	a,(OFST+1,sp)
1732                     ; 691   TIM4->CR2 = tmpcr2;
1734  0009 c752e1        	ld	21217,a
1735                     ; 692 }
1738  000c 85            	popw	x
1739  000d 87            	retf	
1827                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1827                     ; 707 {
1828                     .text:	section	.text,new
1829  0000               f_TIM4_SelectSlaveMode:
1831  0000 88            	push	a
1832  0001 88            	push	a
1833       00000001      OFST:	set	1
1836                     ; 708   uint8_t tmpsmcr = 0;
1838                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1840                     ; 713   tmpsmcr = TIM4->SMCR;
1842  0002 c652e2        	ld	a,21218
1844                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1846  0005 a4f8          	and	a,#248
1848                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1850  0007 1a02          	or	a,(OFST+1,sp)
1852                     ; 721   TIM4->SMCR = tmpsmcr;
1854  0009 c752e2        	ld	21218,a
1855                     ; 722 }
1858  000c 85            	popw	x
1859  000d 87            	retf	
1894                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1894                     ; 731 {
1895                     .text:	section	.text,new
1896  0000               f_TIM4_SelectMasterSlaveMode:
1900                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1902                     ; 736   if (NewState != DISABLE)
1904  0000 4d            	tnz	a
1905  0001 2705          	jreq	L7201
1906                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1908  0003 721e52e2      	bset	21218,#7
1911  0007 87            	retf	
1912  0008               L7201:
1913                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1915  0008 721f52e2      	bres	21218,#7
1916                     ; 744 }
1919  000c 87            	retf	
1931                     	xdef	f_TIM4_SelectMasterSlaveMode
1932                     	xdef	f_TIM4_SelectSlaveMode
1933                     	xdef	f_TIM4_SelectOutputTrigger
1934                     	xdef	f_TIM4_SelectInputTrigger
1935                     	xdef	f_TIM4_InternalClockConfig
1936                     	xdef	f_TIM4_DMACmd
1937                     	xdef	f_TIM4_ClearITPendingBit
1938                     	xdef	f_TIM4_GetITStatus
1939                     	xdef	f_TIM4_ClearFlag
1940                     	xdef	f_TIM4_GetFlagStatus
1941                     	xdef	f_TIM4_GenerateEvent
1942                     	xdef	f_TIM4_ITConfig
1943                     	xdef	f_TIM4_Cmd
1944                     	xdef	f_TIM4_SelectOnePulseMode
1945                     	xdef	f_TIM4_ARRPreloadConfig
1946                     	xdef	f_TIM4_UpdateRequestConfig
1947                     	xdef	f_TIM4_UpdateDisableConfig
1948                     	xdef	f_TIM4_GetPrescaler
1949                     	xdef	f_TIM4_GetCounter
1950                     	xdef	f_TIM4_SetAutoreload
1951                     	xdef	f_TIM4_SetCounter
1952                     	xdef	f_TIM4_PrescalerConfig
1953                     	xdef	f_TIM4_TimeBaseInit
1954                     	xdef	f_TIM4_DeInit
1973                     	end
