   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 170                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 170                     ; 149 {
 171                     .text:	section	.text,new
 172  0000               f_USART_DeInit:
 176                     ; 153   (void) USARTx->SR;
 178  0000 f6            	ld	a,(x)
 179                     ; 154   (void) USARTx->DR;
 181  0001 e601          	ld	a,(1,x)
 182                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 184  0003 6f03          	clr	(3,x)
 185                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 187  0005 6f02          	clr	(2,x)
 188                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 190  0007 6f04          	clr	(4,x)
 191                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 193  0009 6f05          	clr	(5,x)
 194                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 196  000b 6f06          	clr	(6,x)
 197                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 199  000d 6f07          	clr	(7,x)
 200                     ; 163 }
 203  000f 87            	retf	
 390                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 390                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 390                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 390                     ; 195 {
 391                     .text:	section	.text,new
 392  0000               f_USART_Init:
 394  0000 89            	pushw	x
 395  0001 5204          	subw	sp,#4
 396       00000004      OFST:	set	4
 399                     ; 196   uint32_t BaudRate_Mantissa = 0;
 401                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 403                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 405                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 407                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 409                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 411                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 413  0003 e604          	ld	a,(4,x)
 414  0005 a4e9          	and	a,#233
 415  0007 e704          	ld	(4,x),a
 416                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 418  0009 7b0e          	ld	a,(OFST+10,sp)
 419  000b 1a10          	or	a,(OFST+12,sp)
 420  000d ea04          	or	a,(4,x)
 421  000f e704          	ld	(4,x),a
 422                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 424  0011 e606          	ld	a,(6,x)
 425  0013 a4cf          	and	a,#207
 426  0015 e706          	ld	(6,x),a
 427                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 429  0017 e606          	ld	a,(6,x)
 430  0019 1a0f          	or	a,(OFST+11,sp)
 431  001b e706          	ld	(6,x),a
 432                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 434  001d 6f02          	clr	(2,x)
 435                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 437  001f e603          	ld	a,(3,x)
 438  0021 a40f          	and	a,#15
 439  0023 e703          	ld	(3,x),a
 440                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 442  0025 e603          	ld	a,(3,x)
 443  0027 a4f0          	and	a,#240
 444  0029 e703          	ld	(3,x),a
 445                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 447  002b 8d000000      	callf	f_CLK_GetClockFreq
 449  002f 96            	ldw	x,sp
 450  0030 1c000a        	addw	x,#OFST+6
 451  0033 8d000000      	callf	d_ludv
 453  0037 96            	ldw	x,sp
 454  0038 5c            	incw	x
 455  0039 8d000000      	callf	d_rtol
 458                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 460  003d 7b03          	ld	a,(OFST-1,sp)
 461  003f a4f0          	and	a,#240
 462  0041 1e05          	ldw	x,(OFST+1,sp)
 463  0043 e703          	ld	(3,x),a
 464                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 466  0045 7b04          	ld	a,(OFST+0,sp)
 467  0047 a40f          	and	a,#15
 468  0049 ea03          	or	a,(3,x)
 469  004b e703          	ld	(3,x),a
 470                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  004d 96            	ldw	x,sp
 473  004e 5c            	incw	x
 474  004f 8d000000      	callf	d_ltor
 476  0053 a604          	ld	a,#4
 477  0055 8d000000      	callf	d_lursh
 479  0059 b603          	ld	a,c_lreg+3
 480  005b 1e05          	ldw	x,(OFST+1,sp)
 481  005d e702          	ld	(2,x),a
 482                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  005f e605          	ld	a,(5,x)
 485  0061 a4f3          	and	a,#243
 486  0063 e705          	ld	(5,x),a
 487                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 489  0065 e605          	ld	a,(5,x)
 490  0067 1a11          	or	a,(OFST+13,sp)
 491  0069 e705          	ld	(5,x),a
 492                     ; 239 }
 495  006b 5b06          	addw	sp,#6
 496  006d 87            	retf	
 655                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 655                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 655                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 655                     ; 267 {
 656                     .text:	section	.text,new
 657  0000               f_USART_ClockInit:
 659       fffffffe      OFST: set -2
 662                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 664                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 666                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 668                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 670                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 672  0000 e606          	ld	a,(6,x)
 673  0002 a4f8          	and	a,#248
 674  0004 e706          	ld	(6,x),a
 675                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 677  0006 7b05          	ld	a,(OFST+7,sp)
 678  0008 1a06          	or	a,(OFST+8,sp)
 679  000a 1a07          	or	a,(OFST+9,sp)
 680  000c ea06          	or	a,(6,x)
 681  000e e706          	ld	(6,x),a
 682                     ; 279   if (USART_Clock != USART_Clock_Disable)
 684  0010 7b04          	ld	a,(OFST+6,sp)
 685  0012 2706          	jreq	L123
 686                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 688  0014 e606          	ld	a,(6,x)
 689  0016 aa08          	or	a,#8
 691  0018 2004          	jra	L323
 692  001a               L123:
 693                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 695  001a e606          	ld	a,(6,x)
 696  001c a4f7          	and	a,#247
 697  001e               L323:
 698  001e e706          	ld	(6,x),a
 699                     ; 287 }
 702  0020 87            	retf	
 768                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 768                     ; 297 {
 769                     .text:	section	.text,new
 770  0000               f_USART_Cmd:
 772       fffffffe      OFST: set -2
 775                     ; 298   if (NewState != DISABLE)
 777  0000 7b04          	ld	a,(OFST+6,sp)
 778  0002 2706          	jreq	L163
 779                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 781  0004 e604          	ld	a,(4,x)
 782  0006 a4df          	and	a,#223
 784  0008 2004          	jra	L363
 785  000a               L163:
 786                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 788  000a e604          	ld	a,(4,x)
 789  000c aa20          	or	a,#32
 790  000e               L363:
 791  000e e704          	ld	(4,x),a
 792                     ; 306 }
 795  0010 87            	retf	
 838                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 838                     ; 330 {
 839                     .text:	section	.text,new
 840  0000               f_USART_SetPrescaler:
 842       fffffffe      OFST: set -2
 845                     ; 332   USARTx->PSCR = USART_Prescaler;
 847  0000 7b04          	ld	a,(OFST+6,sp)
 848  0002 e70a          	ld	(10,x),a
 849                     ; 333 }
 852  0004 87            	retf	
 888                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 888                     ; 341 {
 889                     .text:	section	.text,new
 890  0000               f_USART_SendBreak:
 894                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 896  0000 e605          	ld	a,(5,x)
 897  0002 aa01          	or	a,#1
 898  0004 e705          	ld	(5,x),a
 899                     ; 343 }
 902  0006 87            	retf	
 938                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 938                     ; 383 {
 939                     .text:	section	.text,new
 940  0000               f_USART_ReceiveData8:
 944                     ; 384   return USARTx->DR;
 946  0000 e601          	ld	a,(1,x)
 949  0002 87            	retf	
 992                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
 992                     ; 393 {
 993                     .text:	section	.text,new
 994  0000               f_USART_ReceiveData9:
 996  0000 89            	pushw	x
 997  0001 89            	pushw	x
 998       00000002      OFST:	set	2
1001                     ; 394   uint16_t temp = 0;
1003                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1005  0002 e604          	ld	a,(4,x)
1006  0004 a480          	and	a,#128
1007  0006 5f            	clrw	x
1008  0007 02            	rlwa	x,a
1009  0008 58            	sllw	x
1010  0009 1f01          	ldw	(OFST-1,sp),x
1012                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1014  000b 1e03          	ldw	x,(OFST+1,sp)
1015  000d e601          	ld	a,(1,x)
1016  000f 5f            	clrw	x
1017  0010 97            	ld	xl,a
1018  0011 01            	rrwa	x,a
1019  0012 1a02          	or	a,(OFST+0,sp)
1020  0014 01            	rrwa	x,a
1021  0015 1a01          	or	a,(OFST-1,sp)
1022  0017 a401          	and	a,#1
1023  0019 01            	rrwa	x,a
1026  001a 5b04          	addw	sp,#4
1027  001c 87            	retf	
1070                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1070                     ; 406 {
1071                     .text:	section	.text,new
1072  0000               f_USART_SendData8:
1074       fffffffe      OFST: set -2
1077                     ; 408   USARTx->DR = Data;
1079  0000 7b04          	ld	a,(OFST+6,sp)
1080  0002 e701          	ld	(1,x),a
1081                     ; 409 }
1084  0004 87            	retf	
1127                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1127                     ; 419 {
1128                     .text:	section	.text,new
1129  0000               f_USART_SendData9:
1131       fffffffe      OFST: set -2
1134                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1136                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1138  0000 e604          	ld	a,(4,x)
1139  0002 a4bf          	and	a,#191
1140  0004 e704          	ld	(4,x),a
1141                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1143  0006 1604          	ldw	y,(OFST+6,sp)
1144  0008 9054          	srlw	y
1145  000a 9054          	srlw	y
1146  000c 909f          	ld	a,yl
1147  000e a440          	and	a,#64
1148  0010 ea04          	or	a,(4,x)
1149  0012 e704          	ld	(4,x),a
1150                     ; 429   USARTx->DR   = (uint8_t)(Data);
1152  0014 7b05          	ld	a,(OFST+7,sp)
1153  0016 e701          	ld	(1,x),a
1154                     ; 430 }
1157  0018 87            	retf	
1204                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1204                     ; 474 {
1205                     .text:	section	.text,new
1206  0000               f_USART_ReceiverWakeUpCmd:
1208       fffffffe      OFST: set -2
1211                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1213                     ; 477   if (NewState != DISABLE)
1215  0000 7b04          	ld	a,(OFST+6,sp)
1216  0002 2706          	jreq	L165
1217                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1219  0004 e605          	ld	a,(5,x)
1220  0006 aa02          	or	a,#2
1222  0008 2004          	jra	L365
1223  000a               L165:
1224                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1226  000a e605          	ld	a,(5,x)
1227  000c a4fd          	and	a,#253
1228  000e               L365:
1229  000e e705          	ld	(5,x),a
1230                     ; 487 }
1233  0010 87            	retf	
1276                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1276                     ; 497 {
1277                     .text:	section	.text,new
1278  0000               f_USART_SetAddress:
1280       fffffffe      OFST: set -2
1283                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1285                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1287  0000 e607          	ld	a,(7,x)
1288  0002 a4f0          	and	a,#240
1289  0004 e707          	ld	(7,x),a
1290                     ; 504   USARTx->CR4 |= USART_Address;
1292  0006 e607          	ld	a,(7,x)
1293  0008 1a04          	or	a,(OFST+6,sp)
1294  000a e707          	ld	(7,x),a
1295                     ; 505 }
1298  000c 87            	retf	
1366                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1366                     ; 516 {
1367                     .text:	section	.text,new
1368  0000               f_USART_WakeUpConfig:
1370       fffffffe      OFST: set -2
1373                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1375                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1377  0000 e604          	ld	a,(4,x)
1378  0002 a4f7          	and	a,#247
1379  0004 e704          	ld	(4,x),a
1380                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1382  0006 e604          	ld	a,(4,x)
1383  0008 1a04          	or	a,(OFST+6,sp)
1384  000a e704          	ld	(4,x),a
1385                     ; 521 }
1388  000c 87            	retf	
1435                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1435                     ; 567 {
1436                     .text:	section	.text,new
1437  0000               f_USART_HalfDuplexCmd:
1439       fffffffe      OFST: set -2
1442                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1444                     ; 570   if (NewState != DISABLE)
1446  0000 7b04          	ld	a,(OFST+6,sp)
1447  0002 2706          	jreq	L766
1448                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1450  0004 e608          	ld	a,(8,x)
1451  0006 aa08          	or	a,#8
1453  0008 2004          	jra	L176
1454  000a               L766:
1455                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1457  000a e608          	ld	a,(8,x)
1458  000c a4f7          	and	a,#247
1459  000e               L176:
1460  000e e708          	ld	(8,x),a
1461                     ; 578 }
1464  0010 87            	retf	
1510                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1510                     ; 645 {
1511                     .text:	section	.text,new
1512  0000               f_USART_SmartCardCmd:
1514       fffffffe      OFST: set -2
1517                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1519                     ; 648   if (NewState != DISABLE)
1521  0000 7b04          	ld	a,(OFST+6,sp)
1522  0002 2706          	jreq	L717
1523                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1525  0004 e608          	ld	a,(8,x)
1526  0006 aa20          	or	a,#32
1528  0008 2004          	jra	L127
1529  000a               L717:
1530                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1532  000a e608          	ld	a,(8,x)
1533  000c a4df          	and	a,#223
1534  000e               L127:
1535  000e e708          	ld	(8,x),a
1536                     ; 658 }
1539  0010 87            	retf	
1586                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1586                     ; 668 {
1587                     .text:	section	.text,new
1588  0000               f_USART_SmartCardNACKCmd:
1590       fffffffe      OFST: set -2
1593                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1595                     ; 671   if (NewState != DISABLE)
1597  0000 7b04          	ld	a,(OFST+6,sp)
1598  0002 2706          	jreq	L747
1599                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1601  0004 e608          	ld	a,(8,x)
1602  0006 aa10          	or	a,#16
1604  0008 2004          	jra	L157
1605  000a               L747:
1606                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1608  000a e608          	ld	a,(8,x)
1609  000c a4ef          	and	a,#239
1610  000e               L157:
1611  000e e708          	ld	(8,x),a
1612                     ; 681 }
1615  0010 87            	retf	
1658                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1658                     ; 691 {
1659                     .text:	section	.text,new
1660  0000               f_USART_SetGuardTime:
1662       fffffffe      OFST: set -2
1665                     ; 693   USARTx->GTR = USART_GuardTime;
1667  0000 7b04          	ld	a,(OFST+6,sp)
1668  0002 e709          	ld	(9,x),a
1669                     ; 694 }
1672  0004 87            	retf	
1740                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1740                     ; 752 {
1741                     .text:	section	.text,new
1742  0000               f_USART_IrDAConfig:
1744       fffffffe      OFST: set -2
1747                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1749                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1751  0000 7b04          	ld	a,(OFST+6,sp)
1752  0002 2706          	jreq	L1301
1753                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1755  0004 e608          	ld	a,(8,x)
1756  0006 aa04          	or	a,#4
1758  0008 2004          	jra	L3301
1759  000a               L1301:
1760                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1762  000a e608          	ld	a,(8,x)
1763  000c a4fb          	and	a,#251
1764  000e               L3301:
1765  000e e708          	ld	(8,x),a
1766                     ; 763 }
1769  0010 87            	retf	
1815                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1815                     ; 773 {
1816                     .text:	section	.text,new
1817  0000               f_USART_IrDACmd:
1819       fffffffe      OFST: set -2
1822                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1824                     ; 778   if (NewState != DISABLE)
1826  0000 7b04          	ld	a,(OFST+6,sp)
1827  0002 2706          	jreq	L1601
1828                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1830  0004 e608          	ld	a,(8,x)
1831  0006 aa02          	or	a,#2
1833  0008 2004          	jra	L3601
1834  000a               L1601:
1835                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1837  000a e608          	ld	a,(8,x)
1838  000c a4fd          	and	a,#253
1839  000e               L3601:
1840  000e e708          	ld	(8,x),a
1841                     ; 788 }
1844  0010 87            	retf	
1920                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1920                     ; 819                   FunctionalState NewState)
1920                     ; 820 {
1921                     .text:	section	.text,new
1922  0000               f_USART_DMACmd:
1924       fffffffe      OFST: set -2
1927                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1929                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
1931                     ; 825   if (NewState != DISABLE)
1933  0000 7b05          	ld	a,(OFST+7,sp)
1934  0002 2706          	jreq	L5211
1935                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1937  0004 e608          	ld	a,(8,x)
1938  0006 1a04          	or	a,(OFST+6,sp)
1940  0008 2005          	jra	L7211
1941  000a               L5211:
1942                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
1944  000a 7b04          	ld	a,(OFST+6,sp)
1945  000c 43            	cpl	a
1946  000d e408          	and	a,(8,x)
1947  000f               L7211:
1948  000f e708          	ld	(8,x),a
1949                     ; 837 }
1952  0011 87            	retf	
2091                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2091                     ; 940 {
2092                     .text:	section	.text,new
2093  0000               f_USART_ITConfig:
2095  0000 89            	pushw	x
2096  0001 89            	pushw	x
2097       00000002      OFST:	set	2
2100                     ; 941   uint8_t usartreg, itpos = 0x00;
2102                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2104                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2106                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2108  0002 7b08          	ld	a,(OFST+6,sp)
2109  0004 6b01          	ld	(OFST-1,sp),a
2111                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2113  0006 7b09          	ld	a,(OFST+7,sp)
2114  0008 a40f          	and	a,#15
2115  000a 5f            	clrw	x
2116  000b 97            	ld	xl,a
2117  000c a601          	ld	a,#1
2118  000e 5d            	tnzw	x
2119  000f 2704          	jreq	L06
2120  0011               L26:
2121  0011 48            	sll	a
2122  0012 5a            	decw	x
2123  0013 26fc          	jrne	L26
2124  0015               L06:
2125  0015 6b02          	ld	(OFST+0,sp),a
2127                     ; 950   if (NewState != DISABLE)
2129  0017 7b0a          	ld	a,(OFST+8,sp)
2130  0019 2722          	jreq	L3121
2131                     ; 953     if (usartreg == 0x01)
2133  001b 7b01          	ld	a,(OFST-1,sp)
2134  001d a101          	cp	a,#1
2135  001f 2608          	jrne	L5121
2136                     ; 955       USARTx->CR1 |= itpos;
2138  0021 1e03          	ldw	x,(OFST+1,sp)
2139  0023 e604          	ld	a,(4,x)
2140  0025 1a02          	or	a,(OFST+0,sp)
2142  0027 2021          	jpf	LC002
2143  0029               L5121:
2144                     ; 957     else if (usartreg == 0x05)
2146  0029 a105          	cp	a,#5
2147  002b 2608          	jrne	L1221
2148                     ; 959       USARTx->CR5 |= itpos;
2150  002d 1e03          	ldw	x,(OFST+1,sp)
2151  002f e608          	ld	a,(8,x)
2152  0031 1a02          	or	a,(OFST+0,sp)
2154  0033 2024          	jpf	LC003
2155  0035               L1221:
2156                     ; 964       USARTx->CR2 |= itpos;
2158  0035 1e03          	ldw	x,(OFST+1,sp)
2159  0037 e605          	ld	a,(5,x)
2160  0039 1a02          	or	a,(OFST+0,sp)
2161  003b 2027          	jpf	LC001
2162  003d               L3121:
2163                     ; 970     if (usartreg == 0x01)
2165  003d 7b01          	ld	a,(OFST-1,sp)
2166  003f a101          	cp	a,#1
2167  0041 260b          	jrne	L7221
2168                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2170  0043 1e03          	ldw	x,(OFST+1,sp)
2171  0045 7b02          	ld	a,(OFST+0,sp)
2172  0047 43            	cpl	a
2173  0048 e404          	and	a,(4,x)
2174  004a               LC002:
2175  004a e704          	ld	(4,x),a
2177  004c 2018          	jra	L5221
2178  004e               L7221:
2179                     ; 974     else if (usartreg == 0x05)
2181  004e a105          	cp	a,#5
2182  0050 260b          	jrne	L3321
2183                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2185  0052 1e03          	ldw	x,(OFST+1,sp)
2186  0054 7b02          	ld	a,(OFST+0,sp)
2187  0056 43            	cpl	a
2188  0057 e408          	and	a,(8,x)
2189  0059               LC003:
2190  0059 e708          	ld	(8,x),a
2192  005b 2009          	jra	L5221
2193  005d               L3321:
2194                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2196  005d 1e03          	ldw	x,(OFST+1,sp)
2197  005f 7b02          	ld	a,(OFST+0,sp)
2198  0061 43            	cpl	a
2199  0062 e405          	and	a,(5,x)
2200  0064               LC001:
2201  0064 e705          	ld	(5,x),a
2202  0066               L5221:
2203                     ; 984 }
2206  0066 5b04          	addw	sp,#4
2207  0068 87            	retf	
2354                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2354                     ; 1003 {
2355                     .text:	section	.text,new
2356  0000               f_USART_GetFlagStatus:
2358  0000 89            	pushw	x
2359  0001 88            	push	a
2360       00000001      OFST:	set	1
2363                     ; 1004   FlagStatus status = RESET;
2365                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2367                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2369  0002 1e07          	ldw	x,(OFST+6,sp)
2370  0004 a30101        	cpw	x,#257
2371  0007 260a          	jrne	L5231
2372                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2374  0009 1e02          	ldw	x,(OFST+1,sp)
2375  000b e605          	ld	a,(5,x)
2376  000d 1508          	bcp	a,(OFST+7,sp)
2377  000f 270d          	jreq	L5331
2378                     ; 1014       status = SET;
2380  0011 2007          	jpf	LC005
2381                     ; 1019       status = RESET;
2382  0013               L5231:
2383                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2385  0013 1e02          	ldw	x,(OFST+1,sp)
2386  0015 f6            	ld	a,(x)
2387  0016 1508          	bcp	a,(OFST+7,sp)
2388  0018 2704          	jreq	L5331
2389                     ; 1027       status = SET;
2391  001a               LC005:
2393  001a a601          	ld	a,#1
2396  001c 2001          	jra	L3331
2397  001e               L5331:
2398                     ; 1032       status = RESET;
2401  001e 4f            	clr	a
2403  001f               L3331:
2404                     ; 1036   return status;
2408  001f 5b03          	addw	sp,#3
2409  0021 87            	retf	
2455                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2455                     ; 1061 {
2456                     .text:	section	.text,new
2457  0000               f_USART_ClearFlag:
2459       fffffffe      OFST: set -2
2462                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2464                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2466  0000 7b05          	ld	a,(OFST+7,sp)
2467  0002 43            	cpl	a
2468  0003 f7            	ld	(x),a
2469                     ; 1066 }
2472  0004 87            	retf	
2564                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2564                     ; 1084 {
2565                     .text:	section	.text,new
2566  0000               f_USART_GetITStatus:
2568  0000 89            	pushw	x
2569  0001 5203          	subw	sp,#3
2570       00000003      OFST:	set	3
2573                     ; 1085   ITStatus pendingbitstatus = RESET;
2575                     ; 1086   uint8_t temp = 0;
2577                     ; 1087   uint8_t itpos = 0;
2579                     ; 1088   uint8_t itmask1 = 0;
2581                     ; 1089   uint8_t itmask2 = 0;
2583                     ; 1090   uint8_t enablestatus = 0;
2585                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2587                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2589  0003 7b0a          	ld	a,(OFST+7,sp)
2590  0005 a40f          	and	a,#15
2591  0007 5f            	clrw	x
2592  0008 97            	ld	xl,a
2593  0009 a601          	ld	a,#1
2594  000b 5d            	tnzw	x
2595  000c 2704          	jreq	L27
2596  000e               L47:
2597  000e 48            	sll	a
2598  000f 5a            	decw	x
2599  0010 26fc          	jrne	L47
2600  0012               L27:
2601  0012 6b02          	ld	(OFST-1,sp),a
2603                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2605  0014 7b0a          	ld	a,(OFST+7,sp)
2606  0016 4e            	swap	a
2607  0017 a40f          	and	a,#15
2608  0019 6b03          	ld	(OFST+0,sp),a
2610                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2612  001b 5f            	clrw	x
2613  001c 97            	ld	xl,a
2614  001d a601          	ld	a,#1
2615  001f 5d            	tnzw	x
2616  0020 2704          	jreq	L67
2617  0022               L001:
2618  0022 48            	sll	a
2619  0023 5a            	decw	x
2620  0024 26fc          	jrne	L001
2621  0026               L67:
2622  0026 6b03          	ld	(OFST+0,sp),a
2624                     ; 1103   if (USART_IT == USART_IT_PE)
2626  0028 1e09          	ldw	x,(OFST+6,sp)
2627  002a a30100        	cpw	x,#256
2628  002d 2611          	jrne	L7241
2629                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2631  002f 1e04          	ldw	x,(OFST+1,sp)
2632  0031 e604          	ld	a,(4,x)
2633  0033 1403          	and	a,(OFST+0,sp)
2634  0035 6b03          	ld	(OFST+0,sp),a
2636                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2638  0037 f6            	ld	a,(x)
2639  0038 1502          	bcp	a,(OFST-1,sp)
2640  003a 2739          	jreq	L1541
2642  003c 7b03          	ld	a,(OFST+0,sp)
2643                     ; 1112       pendingbitstatus = SET;
2645  003e 201e          	jpf	LC008
2646                     ; 1117       pendingbitstatus = RESET;
2647  0040               L7241:
2648                     ; 1121   else if (USART_IT == USART_IT_OR)
2650  0040 a30235        	cpw	x,#565
2651  0043 261f          	jrne	L7341
2652                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2654  0045 1e04          	ldw	x,(OFST+1,sp)
2655  0047 e605          	ld	a,(5,x)
2656  0049 1403          	and	a,(OFST+0,sp)
2657  004b 6b03          	ld	(OFST+0,sp),a
2659                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2661  004d e608          	ld	a,(8,x)
2662  004f a401          	and	a,#1
2663  0051 6b01          	ld	(OFST-2,sp),a
2665                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2667  0053 f6            	ld	a,(x)
2668  0054 1502          	bcp	a,(OFST-1,sp)
2669  0056 271d          	jreq	L1541
2671  0058 7b03          	ld	a,(OFST+0,sp)
2672  005a 2604          	jrne	L3441
2674  005c 7b01          	ld	a,(OFST-2,sp)
2675  005e               LC008:
2676  005e 2715          	jreq	L1541
2677  0060               L3441:
2678                     ; 1132       pendingbitstatus = SET;
2682  0060 a601          	ld	a,#1
2685  0062 2012          	jra	L5341
2686                     ; 1137       pendingbitstatus = RESET;
2687  0064               L7341:
2688                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2690  0064 1e04          	ldw	x,(OFST+1,sp)
2691  0066 e605          	ld	a,(5,x)
2692  0068 1403          	and	a,(OFST+0,sp)
2693  006a 6b03          	ld	(OFST+0,sp),a
2695                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2697  006c f6            	ld	a,(x)
2698  006d 1502          	bcp	a,(OFST-1,sp)
2699  006f 2704          	jreq	L1541
2701  0071 7b03          	ld	a,(OFST+0,sp)
2702                     ; 1149       pendingbitstatus = SET;
2704  0073 26eb          	jrne	L3441
2705  0075               L1541:
2706                     ; 1154       pendingbitstatus = RESET;
2710  0075 4f            	clr	a
2712  0076               L5341:
2713                     ; 1159   return  pendingbitstatus;
2717  0076 5b05          	addw	sp,#5
2718  0078 87            	retf	
2755                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2755                     ; 1184 {
2756                     .text:	section	.text,new
2757  0000               f_USART_ClearITPendingBit:
2761                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2763                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2765  0000 f6            	ld	a,(x)
2766  0001 a4bf          	and	a,#191
2767  0003 f7            	ld	(x),a
2768                     ; 1189 }
2771  0004 87            	retf	
2783                     	xdef	f_USART_ClearITPendingBit
2784                     	xdef	f_USART_GetITStatus
2785                     	xdef	f_USART_ClearFlag
2786                     	xdef	f_USART_GetFlagStatus
2787                     	xdef	f_USART_ITConfig
2788                     	xdef	f_USART_DMACmd
2789                     	xdef	f_USART_IrDACmd
2790                     	xdef	f_USART_IrDAConfig
2791                     	xdef	f_USART_SetGuardTime
2792                     	xdef	f_USART_SmartCardNACKCmd
2793                     	xdef	f_USART_SmartCardCmd
2794                     	xdef	f_USART_HalfDuplexCmd
2795                     	xdef	f_USART_SetAddress
2796                     	xdef	f_USART_ReceiverWakeUpCmd
2797                     	xdef	f_USART_WakeUpConfig
2798                     	xdef	f_USART_ReceiveData9
2799                     	xdef	f_USART_ReceiveData8
2800                     	xdef	f_USART_SendData9
2801                     	xdef	f_USART_SendData8
2802                     	xdef	f_USART_SendBreak
2803                     	xdef	f_USART_SetPrescaler
2804                     	xdef	f_USART_Cmd
2805                     	xdef	f_USART_ClockInit
2806                     	xdef	f_USART_Init
2807                     	xdef	f_USART_DeInit
2808                     	xref	f_CLK_GetClockFreq
2809                     	xref.b	c_lreg
2810                     	xref.b	c_x
2829                     	xref	d_lursh
2830                     	xref	d_ltor
2831                     	xref	d_rtol
2832                     	xref	d_ludv
2833                     	end
