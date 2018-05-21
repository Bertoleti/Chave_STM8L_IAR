   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 143                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 143                     ; 129 {
 144                     .text:	section	.text,new
 145  0000               f_SPI_DeInit:
 149                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 151  0000 7f            	clr	(x)
 152                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 154  0001 6f01          	clr	(1,x)
 155                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 157  0003 6f02          	clr	(2,x)
 158                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 160  0005 a602          	ld	a,#2
 161  0007 e703          	ld	(3,x),a
 162                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 164  0009 a607          	ld	a,#7
 165  000b e705          	ld	(5,x),a
 166                     ; 135 }
 169  000d 87            	retf	
 492                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 492                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 492                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 492                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 492                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 492                     ; 182 {
 493                     .text:	section	.text,new
 494  0000               f_SPI_Init:
 496  0000 89            	pushw	x
 497  0001 88            	push	a
 498       00000001      OFST:	set	1
 501                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 503                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 505                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 507                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 509                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 511                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 513                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 515                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 517                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 517                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 517                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 517                     ; 197                                   SPI_CPHA));
 519  0002 7b0a          	ld	a,(OFST+9,sp)
 520  0004 1a0b          	or	a,(OFST+10,sp)
 521  0006 6b01          	ld	(OFST+0,sp),a
 523  0008 7b07          	ld	a,(OFST+6,sp)
 524  000a 1a08          	or	a,(OFST+7,sp)
 525  000c 1a01          	or	a,(OFST+0,sp)
 526  000e 1e02          	ldw	x,(OFST+1,sp)
 527  0010 f7            	ld	(x),a
 528                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 530  0011 7b0c          	ld	a,(OFST+11,sp)
 531  0013 1a0d          	or	a,(OFST+12,sp)
 532  0015 e701          	ld	(1,x),a
 533                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 535  0017 7b09          	ld	a,(OFST+8,sp)
 536  0019 a104          	cp	a,#4
 537  001b 2606          	jrne	L362
 538                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 540  001d e601          	ld	a,(1,x)
 541  001f aa01          	or	a,#1
 543  0021 2004          	jra	L562
 544  0023               L362:
 545                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0023 e601          	ld	a,(1,x)
 548  0025 a4fe          	and	a,#254
 549  0027               L562:
 550  0027 e701          	ld	(1,x),a
 551                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 553  0029 f6            	ld	a,(x)
 554  002a 1a09          	or	a,(OFST+8,sp)
 555  002c f7            	ld	(x),a
 556                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 558  002d 7b0e          	ld	a,(OFST+13,sp)
 559  002f e705          	ld	(5,x),a
 560                     ; 216 }
 563  0031 5b03          	addw	sp,#3
 564  0033 87            	retf	
 630                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 630                     ; 226 {
 631                     .text:	section	.text,new
 632  0000               f_SPI_Cmd:
 634       fffffffe      OFST: set -2
 637                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 639                     ; 230   if (NewState != DISABLE)
 641  0000 7b04          	ld	a,(OFST+6,sp)
 642  0002 2705          	jreq	L323
 643                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 645  0004 f6            	ld	a,(x)
 646  0005 aa40          	or	a,#64
 648  0007 2003          	jra	L523
 649  0009               L323:
 650                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 652  0009 f6            	ld	a,(x)
 653  000a a4bf          	and	a,#191
 654  000c               L523:
 655  000c f7            	ld	(x),a
 656                     ; 238 }
 659  000d 87            	retf	
 706                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 706                     ; 248 {
 707                     .text:	section	.text,new
 708  0000               f_SPI_NSSInternalSoftwareCmd:
 710       fffffffe      OFST: set -2
 713                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 715                     ; 252   if (NewState != DISABLE)
 717  0000 7b04          	ld	a,(OFST+6,sp)
 718  0002 2706          	jreq	L353
 719                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 721  0004 e601          	ld	a,(1,x)
 722  0006 aa01          	or	a,#1
 724  0008 2004          	jra	L553
 725  000a               L353:
 726                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 728  000a e601          	ld	a,(1,x)
 729  000c a4fe          	and	a,#254
 730  000e               L553:
 731  000e e701          	ld	(1,x),a
 732                     ; 260 }
 735  0010 87            	retf	
 802                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 802                     ; 272 {
 803                     .text:	section	.text,new
 804  0000               f_SPI_BiDirectionalLineConfig:
 806       fffffffe      OFST: set -2
 809                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 811                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 813  0000 7b04          	ld	a,(OFST+6,sp)
 814  0002 2706          	jreq	L314
 815                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 817  0004 e601          	ld	a,(1,x)
 818  0006 aa40          	or	a,#64
 820  0008 2004          	jra	L514
 821  000a               L314:
 822                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 824  000a e601          	ld	a,(1,x)
 825  000c a4bf          	and	a,#191
 826  000e               L514:
 827  000e e701          	ld	(1,x),a
 828                     ; 284 }
 831  0010 87            	retf	
 874                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 874                     ; 320 {
 875                     .text:	section	.text,new
 876  0000               f_SPI_SendData:
 878       fffffffe      OFST: set -2
 881                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 883  0000 7b04          	ld	a,(OFST+6,sp)
 884  0002 e704          	ld	(4,x),a
 885                     ; 322 }
 888  0004 87            	retf	
 924                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 924                     ; 330 {
 925                     .text:	section	.text,new
 926  0000               f_SPI_ReceiveData:
 930                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 932  0000 e604          	ld	a,(4,x)
 935  0002 87            	retf	
 971                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 971                     ; 415 {
 972                     .text:	section	.text,new
 973  0000               f_SPI_TransmitCRC:
 977                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 979  0000 e601          	ld	a,(1,x)
 980  0002 aa10          	or	a,#16
 981  0004 e701          	ld	(1,x),a
 982                     ; 417 }
 985  0006 87            	retf	
1033                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1033                     ; 427 {
1034                     .text:	section	.text,new
1035  0000               f_SPI_CalculateCRCCmd:
1037  0000 89            	pushw	x
1038       00000000      OFST:	set	0
1041                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1043                     ; 432   SPI_Cmd(SPI1, DISABLE);
1045  0001 4b00          	push	#0
1046  0003 ae5200        	ldw	x,#20992
1047  0006 8d000000      	callf	f_SPI_Cmd
1049  000a 84            	pop	a
1050                     ; 434   if (NewState != DISABLE)
1052  000b 7b06          	ld	a,(OFST+6,sp)
1053  000d 2708          	jreq	L525
1054                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1056  000f 1e01          	ldw	x,(OFST+1,sp)
1057  0011 e601          	ld	a,(1,x)
1058  0013 aa20          	or	a,#32
1060  0015 2006          	jra	L725
1061  0017               L525:
1062                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1064  0017 1e01          	ldw	x,(OFST+1,sp)
1065  0019 e601          	ld	a,(1,x)
1066  001b a4df          	and	a,#223
1067  001d               L725:
1068  001d e701          	ld	(1,x),a
1069                     ; 442 }
1072  001f 85            	popw	x
1073  0020 87            	retf	
1146                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1146                     ; 454 {
1147                     .text:	section	.text,new
1148  0000               f_SPI_GetCRC:
1150       fffffffe      OFST: set -2
1153                     ; 455   uint8_t crcreg = 0;
1155                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1157                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1159  0000 7b04          	ld	a,(OFST+6,sp)
1160  0002 2703          	jreq	L765
1161                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1163  0004 e607          	ld	a,(7,x)
1167  0006 87            	retf	
1168  0007               L765:
1169                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1171  0007 e606          	ld	a,(6,x)
1173                     ; 470   return crcreg;
1177  0009 87            	retf	
1215                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1215                     ; 479 {
1216                     .text:	section	.text,new
1217  0000               f_SPI_ResetCRC:
1219  0000 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1225  0001 4b01          	push	#1
1226  0003 8d000000      	callf	f_SPI_CalculateCRCCmd
1228  0007 84            	pop	a
1229                     ; 485   SPI_Cmd(SPIx, ENABLE);
1231  0008 4b01          	push	#1
1232  000a 1e02          	ldw	x,(OFST+2,sp)
1233  000c 8d000000      	callf	f_SPI_Cmd
1235                     ; 486 }
1238  0010 5b03          	addw	sp,#3
1239  0012 87            	retf	
1276                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1276                     ; 494 {
1277                     .text:	section	.text,new
1278  0000               f_SPI_GetCRCPolynomial:
1282                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1284  0000 e605          	ld	a,(5,x)
1287  0002 87            	retf	
1363                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1363                     ; 526 {
1364                     .text:	section	.text,new
1365  0000               f_SPI_DMACmd:
1367       fffffffe      OFST: set -2
1370                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1372                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1374                     ; 531   if (NewState != DISABLE)
1376  0000 7b05          	ld	a,(OFST+7,sp)
1377  0002 2706          	jreq	L376
1378                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1380  0004 e602          	ld	a,(2,x)
1381  0006 1a04          	or	a,(OFST+6,sp)
1383  0008 2005          	jra	L576
1384  000a               L376:
1385                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1387  000a 7b04          	ld	a,(OFST+6,sp)
1388  000c 43            	cpl	a
1389  000d e402          	and	a,(2,x)
1390  000f               L576:
1391  000f e702          	ld	(2,x),a
1392                     ; 541 }
1395  0011 87            	retf	
1513                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1513                     ; 627 {
1514                     .text:	section	.text,new
1515  0000               f_SPI_ITConfig:
1517  0000 89            	pushw	x
1518  0001 88            	push	a
1519       00000001      OFST:	set	1
1522                     ; 628   uint8_t itpos = 0;
1524                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1526                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1528                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1530  0002 7b07          	ld	a,(OFST+6,sp)
1531  0004 a40f          	and	a,#15
1532  0006 5f            	clrw	x
1533  0007 97            	ld	xl,a
1534  0008 a601          	ld	a,#1
1535  000a 5d            	tnzw	x
1536  000b 2704          	jreq	L64
1537  000d               L05:
1538  000d 48            	sll	a
1539  000e 5a            	decw	x
1540  000f 26fc          	jrne	L05
1541  0011               L64:
1542  0011 6b01          	ld	(OFST+0,sp),a
1544                     ; 636   if (NewState != DISABLE)
1546  0013 0d08          	tnz	(OFST+7,sp)
1547  0015 2708          	jreq	L357
1548                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1550  0017 1e02          	ldw	x,(OFST+1,sp)
1551  0019 e602          	ld	a,(2,x)
1552  001b 1a01          	or	a,(OFST+0,sp)
1554  001d 2005          	jra	L557
1555  001f               L357:
1556                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1558  001f 1e02          	ldw	x,(OFST+1,sp)
1559  0021 43            	cpl	a
1560  0022 e402          	and	a,(2,x)
1561  0024               L557:
1562  0024 e702          	ld	(2,x),a
1563                     ; 644 }
1566  0026 5b03          	addw	sp,#3
1567  0028 87            	retf	
1699                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1699                     ; 662 {
1700                     .text:	section	.text,new
1701  0000               f_SPI_GetFlagStatus:
1703       fffffffe      OFST: set -2
1706                     ; 663   FlagStatus status = RESET;
1708                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1710                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1712  0000 e603          	ld	a,(3,x)
1713  0002 1504          	bcp	a,(OFST+6,sp)
1714  0004 2703          	jreq	L1401
1715                     ; 670     status = SET; /* SPI_FLAG is set */
1717  0006 a601          	ld	a,#1
1721  0008 87            	retf	
1722  0009               L1401:
1723                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1725  0009 4f            	clr	a
1727                     ; 678   return status;
1731  000a 87            	retf	
1777                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1777                     ; 697 {
1778                     .text:	section	.text,new
1779  0000               f_SPI_ClearFlag:
1781       fffffffe      OFST: set -2
1784                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1786                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1788  0000 7b04          	ld	a,(OFST+6,sp)
1789  0002 43            	cpl	a
1790  0003 e703          	ld	(3,x),a
1791                     ; 701 }
1794  0005 87            	retf	
1881                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1881                     ; 718 {
1882                     .text:	section	.text,new
1883  0000               f_SPI_GetITStatus:
1885  0000 89            	pushw	x
1886  0001 5203          	subw	sp,#3
1887       00000003      OFST:	set	3
1890                     ; 719   ITStatus pendingbitstatus = RESET;
1892                     ; 720   uint8_t itpos = 0;
1894                     ; 721   uint8_t itmask1 = 0;
1896                     ; 722   uint8_t itmask2 = 0;
1898                     ; 723   __IO uint8_t enablestatus = 0;
1900  0003 0f02          	clr	(OFST-1,sp)
1902                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1904                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1906  0005 7b09          	ld	a,(OFST+6,sp)
1907  0007 a40f          	and	a,#15
1908  0009 5f            	clrw	x
1909  000a 97            	ld	xl,a
1910  000b a601          	ld	a,#1
1911  000d 5d            	tnzw	x
1912  000e 2704          	jreq	L06
1913  0010               L26:
1914  0010 48            	sll	a
1915  0011 5a            	decw	x
1916  0012 26fc          	jrne	L26
1917  0014               L06:
1918  0014 6b01          	ld	(OFST-2,sp),a
1920                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1922  0016 7b09          	ld	a,(OFST+6,sp)
1923  0018 4e            	swap	a
1924  0019 a40f          	and	a,#15
1925  001b 6b03          	ld	(OFST+0,sp),a
1927                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1929  001d 5f            	clrw	x
1930  001e 97            	ld	xl,a
1931  001f a601          	ld	a,#1
1932  0021 5d            	tnzw	x
1933  0022 2704          	jreq	L46
1934  0024               L66:
1935  0024 48            	sll	a
1936  0025 5a            	decw	x
1937  0026 26fc          	jrne	L66
1938  0028               L46:
1939  0028 6b03          	ld	(OFST+0,sp),a
1941                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1943  002a 1e04          	ldw	x,(OFST+1,sp)
1944  002c e603          	ld	a,(3,x)
1945  002e 1403          	and	a,(OFST+0,sp)
1946  0030 6b02          	ld	(OFST-1,sp),a
1948                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1950  0032 e602          	ld	a,(2,x)
1951  0034 1501          	bcp	a,(OFST-2,sp)
1952  0036 2708          	jreq	L3311
1954  0038 0d02          	tnz	(OFST-1,sp)
1955  003a 2704          	jreq	L3311
1956                     ; 738     pendingbitstatus = SET;
1958  003c a601          	ld	a,#1
1961  003e 2001          	jra	L5311
1962  0040               L3311:
1963                     ; 743     pendingbitstatus = RESET;
1965  0040 4f            	clr	a
1967  0041               L5311:
1968                     ; 746   return  pendingbitstatus;
1972  0041 5b05          	addw	sp,#5
1973  0043 87            	retf	
2027                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2027                     ; 765 {
2028                     .text:	section	.text,new
2029  0000               f_SPI_ClearITPendingBit:
2031  0000 89            	pushw	x
2032  0001 88            	push	a
2033       00000001      OFST:	set	1
2036                     ; 766   uint8_t itpos = 0;
2038                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2040                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2042  0002 7b07          	ld	a,(OFST+6,sp)
2043  0004 4e            	swap	a
2044  0005 a40f          	and	a,#15
2045  0007 5f            	clrw	x
2046  0008 97            	ld	xl,a
2047  0009 a601          	ld	a,#1
2048  000b 5d            	tnzw	x
2049  000c 2704          	jreq	L27
2050  000e               L47:
2051  000e 48            	sll	a
2052  000f 5a            	decw	x
2053  0010 26fc          	jrne	L47
2054  0012               L27:
2055  0012 6b01          	ld	(OFST+0,sp),a
2057                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2059  0014 43            	cpl	a
2060  0015 1e02          	ldw	x,(OFST+1,sp)
2061  0017 e703          	ld	(3,x),a
2062                     ; 776 }
2065  0019 5b03          	addw	sp,#3
2066  001b 87            	retf	
2078                     	xdef	f_SPI_ClearITPendingBit
2079                     	xdef	f_SPI_GetITStatus
2080                     	xdef	f_SPI_ClearFlag
2081                     	xdef	f_SPI_GetFlagStatus
2082                     	xdef	f_SPI_ITConfig
2083                     	xdef	f_SPI_DMACmd
2084                     	xdef	f_SPI_GetCRCPolynomial
2085                     	xdef	f_SPI_ResetCRC
2086                     	xdef	f_SPI_GetCRC
2087                     	xdef	f_SPI_CalculateCRCCmd
2088                     	xdef	f_SPI_TransmitCRC
2089                     	xdef	f_SPI_ReceiveData
2090                     	xdef	f_SPI_SendData
2091                     	xdef	f_SPI_BiDirectionalLineConfig
2092                     	xdef	f_SPI_NSSInternalSoftwareCmd
2093                     	xdef	f_SPI_Cmd
2094                     	xdef	f_SPI_Init
2095                     	xdef	f_SPI_DeInit
2114                     	end
