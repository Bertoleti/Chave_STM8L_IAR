   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 140 void DMA_GlobalDeInit(void)
  50                     ; 141 {
  51                     .text:	section	.text,new
  52  0000               f_DMA_GlobalDeInit:
  56                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  58  0000 72115070      	bres	20592,#0
  59                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  61  0004 35fc5070      	mov	20592,#252
  62                     ; 147 }
  65  0008 87            	retf	
 180                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 180                     ; 156 {
 181                     .text:	section	.text,new
 182  0000               f_DMA_DeInit:
 184  0000 89            	pushw	x
 185       00000000      OFST:	set	0
 188                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 190                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 192  0001 f6            	ld	a,(x)
 193  0002 a4fe          	and	a,#254
 194  0004 f7            	ld	(x),a
 195                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 197  0005 7f            	clr	(x)
 198                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 200  0006 6f02          	clr	(2,x)
 201                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 203  0008 a35093        	cpw	x,#20627
 204  000b 2608          	jrne	L501
 205                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 207  000d a640          	ld	a,#64
 208  000f e703          	ld	(3,x),a
 209                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 211  0011 6f05          	clr	(5,x)
 213  0013 2004          	jra	L701
 214  0015               L501:
 215                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 217  0015 a652          	ld	a,#82
 218  0017 e703          	ld	(3,x),a
 219  0019               L701:
 220                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 222  0019 1e01          	ldw	x,(OFST+1,sp)
 223  001b 6f04          	clr	(4,x)
 224                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 226  001d 6f06          	clr	(6,x)
 227                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 229  001f 6f07          	clr	(7,x)
 230                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 232  0021 6f01          	clr	(1,x)
 233                     ; 187 }
 236  0023 85            	popw	x
 237  0024 87            	retf	
 476                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 476                     ; 225               uint32_t DMA_Memory0BaseAddr,
 476                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 476                     ; 227               uint8_t DMA_BufferSize,
 476                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 476                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 476                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 476                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 476                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 476                     ; 233 {
 477                     .text:	section	.text,new
 478  0000               f_DMA_Init:
 480       fffffffe      OFST: set -2
 483                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 485                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 487                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 489                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 491                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 493                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 495                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 497  0000 f6            	ld	a,(x)
 498  0001 a4fe          	and	a,#254
 499  0003 f7            	ld	(x),a
 500                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 502  0004 7f            	clr	(x)
 503                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 503                     ; 251                                            (uint8_t)DMA_Mode) | \
 503                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 505  0005 7b0b          	ld	a,(OFST+13,sp)
 506  0007 1a0c          	or	a,(OFST+14,sp)
 507  0009 1a0d          	or	a,(OFST+15,sp)
 508  000b fa            	or	a,(x)
 509  000c f7            	ld	(x),a
 510                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 512  000d e601          	ld	a,(1,x)
 513  000f a4c7          	and	a,#199
 514  0011 e701          	ld	(1,x),a
 515                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 515                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 517  0013 7b0e          	ld	a,(OFST+16,sp)
 518  0015 1a0f          	or	a,(OFST+17,sp)
 519  0017 ea01          	or	a,(1,x)
 520  0019 e701          	ld	(1,x),a
 521                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 523  001b 7b0a          	ld	a,(OFST+12,sp)
 524  001d e702          	ld	(2,x),a
 525                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 527  001f 7b08          	ld	a,(OFST+10,sp)
 528  0021 e703          	ld	(3,x),a
 529                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 531  0023 7b09          	ld	a,(OFST+11,sp)
 532  0025 e704          	ld	(4,x),a
 533                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 535  0027 a35093        	cpw	x,#20627
 536  002a 2604          	jrne	L142
 537                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 539  002c 7b05          	ld	a,(OFST+7,sp)
 540  002e e705          	ld	(5,x),a
 541  0030               L142:
 542                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 544  0030 7b06          	ld	a,(OFST+8,sp)
 545  0032 e706          	ld	(6,x),a
 546                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 548  0034 7b07          	ld	a,(OFST+9,sp)
 549  0036 e707          	ld	(7,x),a
 550                     ; 280 }
 553  0038 87            	retf	
 607                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 607                     ; 289 {
 608                     .text:	section	.text,new
 609  0000               f_DMA_GlobalCmd:
 613                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 615                     ; 293   if (NewState != DISABLE)
 617  0000 4d            	tnz	a
 618  0001 2705          	jreq	L172
 619                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 621  0003 72105070      	bset	20592,#0
 624  0007 87            	retf	
 625  0008               L172:
 626                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 628  0008 72115070      	bres	20592,#0
 629                     ; 303 }
 632  000c 87            	retf	
 678                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 678                     ; 315 {
 679                     .text:	section	.text,new
 680  0000               f_DMA_Cmd:
 682       fffffffe      OFST: set -2
 685                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 687                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 689                     ; 320   if (NewState != DISABLE)
 691  0000 7b04          	ld	a,(OFST+6,sp)
 692  0002 2705          	jreq	L123
 693                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 695  0004 f6            	ld	a,(x)
 696  0005 aa01          	or	a,#1
 698  0007 2003          	jra	L323
 699  0009               L123:
 700                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 702  0009 f6            	ld	a,(x)
 703  000a a4fe          	and	a,#254
 704  000c               L323:
 705  000c f7            	ld	(x),a
 706                     ; 330 }
 709  000d 87            	retf	
 740                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 740                     ; 343 {
 741                     .text:	section	.text,new
 742  0000               f_DMA_SetTimeOut:
 746                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 748                     ; 348   DMA1->GCSR = 0;
 750  0000 725f5070      	clr	20592
 751                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 753  0004 48            	sll	a
 754  0005 48            	sll	a
 755  0006 c75070        	ld	20592,a
 756                     ; 351 }
 759  0009 87            	retf	
 803                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 803                     ; 402 {
 804                     .text:	section	.text,new
 805  0000               f_DMA_SetCurrDataCounter:
 807       fffffffe      OFST: set -2
 810                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 812                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 814  0000 7b04          	ld	a,(OFST+6,sp)
 815  0002 e702          	ld	(2,x),a
 816                     ; 408 }
 819  0004 87            	retf	
 856                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 856                     ; 416 {
 857                     .text:	section	.text,new
 858  0000               f_DMA_GetCurrDataCounter:
 862                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 864                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 866  0000 e602          	ld	a,(2,x)
 869  0002 87            	retf	
 945                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 945                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 945                     ; 484                   FunctionalState NewState)
 945                     ; 485 {
 946                     .text:	section	.text,new
 947  0000               f_DMA_ITConfig:
 949       fffffffe      OFST: set -2
 952                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 954                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 956                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 958                     ; 491   if (NewState != DISABLE)
 960  0000 7b05          	ld	a,(OFST+7,sp)
 961  0002 2705          	jreq	L344
 962                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 964  0004 f6            	ld	a,(x)
 965  0005 1a04          	or	a,(OFST+6,sp)
 967  0007 2004          	jra	L544
 968  0009               L344:
 969                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 971  0009 7b04          	ld	a,(OFST+6,sp)
 972  000b 43            	cpl	a
 973  000c f4            	and	a,(x)
 974  000d               L544:
 975  000d f7            	ld	(x),a
 976                     ; 501 }
 979  000e 87            	retf	
1223                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1223                     ; 531 {
1224                     .text:	section	.text,new
1225  0000               f_DMA_GetFlagStatus:
1227  0000 89            	pushw	x
1228  0001 5204          	subw	sp,#4
1229       00000004      OFST:	set	4
1232                     ; 532   FlagStatus flagstatus = RESET;
1234                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1236                     ; 534   uint8_t tmpgir1 = 0;
1238                     ; 535   uint8_t tmpgcsr = 0;
1240                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1242                     ; 541   tmpgcsr = DMA1->GCSR;
1244  0003 c65070        	ld	a,20592
1245  0006 6b04          	ld	(OFST+0,sp),a
1247                     ; 542   tmpgir1 = DMA1->GIR1;
1249  0008 c65071        	ld	a,20593
1250  000b 6b01          	ld	(OFST-3,sp),a
1252                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1254  000d 01            	rrwa	x,a
1255  000e 9f            	ld	a,xl
1256  000f a40f          	and	a,#15
1257  0011 97            	ld	xl,a
1258  0012 4f            	clr	a
1259  0013 02            	rlwa	x,a
1260  0014 5d            	tnzw	x
1261  0015 2728          	jreq	L175
1262                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1264  0017 7b05          	ld	a,(OFST+1,sp)
1265  0019 a501          	bcp	a,#1
1266  001b 2705          	jreq	L375
1267                     ; 549       DMA_Channelx = DMA1_Channel0;
1269  001d ae5075        	ldw	x,#20597
1271  0020 2015          	jra	L575
1272  0022               L375:
1273                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1275  0022 a502          	bcp	a,#2
1276  0024 2705          	jreq	L775
1277                     ; 553       DMA_Channelx = DMA1_Channel1;
1279  0026 ae507f        	ldw	x,#20607
1281  0029 200c          	jra	L575
1282  002b               L775:
1283                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1285  002b a504          	bcp	a,#4
1286  002d 2705          	jreq	L306
1287                     ; 557       DMA_Channelx = DMA1_Channel2;
1289  002f ae5089        	ldw	x,#20617
1291  0032 2003          	jra	L575
1292  0034               L306:
1293                     ; 561       DMA_Channelx = DMA1_Channel3;
1295  0034 ae5093        	ldw	x,#20627
1296  0037               L575:
1297  0037 1f02          	ldw	(OFST-2,sp),x
1299                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1301  0039 e601          	ld	a,(1,x)
1302  003b 1406          	and	a,(OFST+2,sp)
1305  003d 2010          	jra	L706
1306  003f               L175:
1307                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1309  003f 7b05          	ld	a,(OFST+1,sp)
1310  0041 a510          	bcp	a,#16
1311  0043 2706          	jreq	L116
1312                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1314  0045 7b06          	ld	a,(OFST+2,sp)
1315  0047 1401          	and	a,(OFST-3,sp)
1318  0049 2004          	jra	L706
1319  004b               L116:
1320                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1322  004b 7b04          	ld	a,(OFST+0,sp)
1323  004d a402          	and	a,#2
1325  004f               L706:
1326                     ; 579   return (flagstatus);
1330  004f 5b06          	addw	sp,#6
1331  0051 87            	retf	
1377                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1377                     ; 598 {
1378                     .text:	section	.text,new
1379  0000               f_DMA_ClearFlag:
1381  0000 89            	pushw	x
1382  0001 89            	pushw	x
1383       00000002      OFST:	set	2
1386                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1388                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1390                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1392  0002 01            	rrwa	x,a
1393  0003 9f            	ld	a,xl
1394  0004 a401          	and	a,#1
1395  0006 97            	ld	xl,a
1396  0007 4f            	clr	a
1397  0008 02            	rlwa	x,a
1398  0009 5d            	tnzw	x
1399  000a 2705          	jreq	L146
1400                     ; 607     DMA_Channelx = DMA1_Channel0;
1402  000c ae5075        	ldw	x,#20597
1404  000f 2017          	jra	L346
1405  0011               L146:
1406                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1408  0011 7b03          	ld	a,(OFST+1,sp)
1409  0013 a502          	bcp	a,#2
1410  0015 2705          	jreq	L546
1411                     ; 613       DMA_Channelx = DMA1_Channel1;
1413  0017 ae507f        	ldw	x,#20607
1415  001a 200c          	jra	L346
1416  001c               L546:
1417                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1419  001c a504          	bcp	a,#4
1420  001e 2705          	jreq	L156
1421                     ; 619         DMA_Channelx = DMA1_Channel2;
1423  0020 ae5089        	ldw	x,#20617
1425  0023 2003          	jra	L346
1426  0025               L156:
1427                     ; 623         DMA_Channelx = DMA1_Channel3;
1429  0025 ae5093        	ldw	x,#20627
1430  0028               L346:
1431  0028 1f01          	ldw	(OFST-1,sp),x
1433                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1435  002a 7b04          	ld	a,(OFST+2,sp)
1436  002c a406          	and	a,#6
1437  002e 43            	cpl	a
1438  002f e401          	and	a,(1,x)
1439  0031 e701          	ld	(1,x),a
1440                     ; 630 }
1443  0033 5b04          	addw	sp,#4
1444  0035 87            	retf	
1577                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1577                     ; 647 {
1578                     .text:	section	.text,new
1579  0000               f_DMA_GetITStatus:
1581  0000 88            	push	a
1582  0001 5204          	subw	sp,#4
1583       00000004      OFST:	set	4
1586                     ; 648   ITStatus itstatus = RESET;
1588                     ; 649   uint8_t tmpreg = 0;
1590                     ; 650   uint8_t tmp2 = 0;
1592                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1594                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1596                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1598  0003 a510          	bcp	a,#16
1599  0005 2705          	jreq	L537
1600                     ; 659     DMA_Channelx = DMA1_Channel0;
1602  0007 ae5075        	ldw	x,#20597
1604  000a 2015          	jra	L737
1605  000c               L537:
1606                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1608  000c a520          	bcp	a,#32
1609  000e 2705          	jreq	L147
1610                     ; 665       DMA_Channelx = DMA1_Channel1;
1612  0010 ae507f        	ldw	x,#20607
1614  0013 200c          	jra	L737
1615  0015               L147:
1616                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1618  0015 a540          	bcp	a,#64
1619  0017 2705          	jreq	L547
1620                     ; 671         DMA_Channelx = DMA1_Channel2;
1622  0019 ae5089        	ldw	x,#20617
1624  001c 2003          	jra	L737
1625  001e               L547:
1626                     ; 675         DMA_Channelx = DMA1_Channel3;
1628  001e ae5093        	ldw	x,#20627
1629  0021               L737:
1630  0021 1f03          	ldw	(OFST-1,sp),x
1632                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1634  0023 e601          	ld	a,(1,x)
1636                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1638  0025 f4            	and	a,(x)
1639  0026 6b01          	ld	(OFST-3,sp),a
1641                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1643  0028 7b05          	ld	a,(OFST+1,sp)
1644  002a a406          	and	a,#6
1646                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1648  002c 1401          	and	a,(OFST-3,sp)
1650                     ; 686   return (itstatus);
1654  002e 5b05          	addw	sp,#5
1655  0030 87            	retf	
1702                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1702                     ; 705 {
1703                     .text:	section	.text,new
1704  0000               f_DMA_ClearITPendingBit:
1706  0000 88            	push	a
1707  0001 89            	pushw	x
1708       00000002      OFST:	set	2
1711                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1713                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1715                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1717  0002 a510          	bcp	a,#16
1718  0004 2705          	jreq	L577
1719                     ; 713     DMA_Channelx = DMA1_Channel0;
1721  0006 ae5075        	ldw	x,#20597
1723  0009 2015          	jra	L777
1724  000b               L577:
1725                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1727  000b a520          	bcp	a,#32
1728  000d 2705          	jreq	L1001
1729                     ; 719       DMA_Channelx = DMA1_Channel1;
1731  000f ae507f        	ldw	x,#20607
1733  0012 200c          	jra	L777
1734  0014               L1001:
1735                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1737  0014 a540          	bcp	a,#64
1738  0016 2705          	jreq	L5001
1739                     ; 725         DMA_Channelx = DMA1_Channel2;
1741  0018 ae5089        	ldw	x,#20617
1743  001b 2003          	jra	L777
1744  001d               L5001:
1745                     ; 729         DMA_Channelx = DMA1_Channel3;
1747  001d ae5093        	ldw	x,#20627
1748  0020               L777:
1749  0020 1f01          	ldw	(OFST-1,sp),x
1751                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1753  0022 7b03          	ld	a,(OFST+1,sp)
1754  0024 a406          	and	a,#6
1755  0026 43            	cpl	a
1756  0027 e401          	and	a,(1,x)
1757  0029 e701          	ld	(1,x),a
1758                     ; 735 }
1761  002b 5b03          	addw	sp,#3
1762  002d 87            	retf	
1774                     	xdef	f_DMA_ClearITPendingBit
1775                     	xdef	f_DMA_GetITStatus
1776                     	xdef	f_DMA_ClearFlag
1777                     	xdef	f_DMA_GetFlagStatus
1778                     	xdef	f_DMA_ITConfig
1779                     	xdef	f_DMA_GetCurrDataCounter
1780                     	xdef	f_DMA_SetCurrDataCounter
1781                     	xdef	f_DMA_SetTimeOut
1782                     	xdef	f_DMA_Cmd
1783                     	xdef	f_DMA_GlobalCmd
1784                     	xdef	f_DMA_Init
1785                     	xdef	f_DMA_DeInit
1786                     	xdef	f_DMA_GlobalDeInit
1805                     	end
