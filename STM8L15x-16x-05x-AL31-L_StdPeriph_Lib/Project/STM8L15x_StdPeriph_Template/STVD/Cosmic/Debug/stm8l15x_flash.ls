   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 175 {
  86                     .text:	section	.text,new
  87  0000               f_FLASH_SetProgrammingTime:
  91                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  93                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  95  0000 72115050      	bres	20560,#0
  96                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  98  0004 ca5050        	or	a,20560
  99  0007 c75050        	ld	20560,a
 100                     ; 181 }
 103  000a 87            	retf	
 127                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 127                     ; 189 {
 128                     .text:	section	.text,new
 129  0000               f_FLASH_GetProgrammingTime:
 133                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 135  0000 c65050        	ld	a,20560
 136  0003 a401          	and	a,#1
 139  0005 87            	retf	
 194                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 194                     ; 204 {
 195                     .text:	section	.text,new
 196  0000               f_FLASH_PowerWaitModeConfig:
 200                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 202                     ; 209   if(FLASH_Power != FLASH_Power_On)
 204  0000 4a            	dec	a
 205  0001 2705          	jreq	L57
 206                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 208  0003 72145050      	bset	20560,#2
 211  0007 87            	retf	
 212  0008               L57:
 213                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 215  0008 72155050      	bres	20560,#2
 216                     ; 218 }
 219  000c 87            	retf	
 241                     ; 259 void FLASH_DeInit(void)
 241                     ; 260 {
 242                     .text:	section	.text,new
 243  0000               f_FLASH_DeInit:
 247                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 249  0000 725f5050      	clr	20560
 250                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 252  0004 725f5051      	clr	20561
 253                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 255  0008 35405054      	mov	20564,#64
 256                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 258  000c c65054        	ld	a,20564
 259                     ; 265 }
 262  000f 87            	retf	
 317                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 317                     ; 276 {
 318                     .text:	section	.text,new
 319  0000               f_FLASH_Unlock:
 321       00000000      OFST:	set	0
 324                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 326                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 328  0000 a1fd          	cp	a,#253
 329  0002 2608          	jrne	L731
 330                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 332  0004 35565052      	mov	20562,#86
 333                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 335  0008 35ae5052      	mov	20562,#174
 336  000c               L731:
 337                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 339  000c a1f7          	cp	a,#247
 340  000e 2608          	jrne	L141
 341                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 343  0010 35ae5053      	mov	20563,#174
 344                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 346  0014 35565053      	mov	20563,#86
 347  0018               L141:
 348                     ; 293 }
 351  0018 87            	retf	
 385                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 385                     ; 304 {
 386                     .text:	section	.text,new
 387  0000               f_FLASH_Lock:
 391                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 393                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 395  0000 c45054        	and	a,20564
 396  0003 c75054        	ld	20564,a
 397                     ; 310 }
 400  0006 87            	retf	
 438                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 438                     ; 319 {
 439                     .text:	section	.text,new
 440  0000               f_FLASH_ProgramByte:
 442       00000000      OFST:	set	0
 445                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 447                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 449  0000 7b08          	ld	a,(OFST+8,sp)
 450  0002 88            	push	a
 451  0003 7b06          	ld	a,(OFST+6,sp)
 452  0005 b700          	ld	c_x,a
 453  0007 1e07          	ldw	x,(OFST+7,sp)
 454  0009 bf01          	ldw	c_x+1,x
 455  000b 84            	pop	a
 456  000c 92bd0000      	ldf	[c_x.e],a
 457                     ; 324 }
 460  0010 87            	retf	
 491                     ; 331 void FLASH_EraseByte(uint32_t Address)
 491                     ; 332 {
 492                     .text:	section	.text,new
 493  0000               f_FLASH_EraseByte:
 495       00000000      OFST:	set	0
 498                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 500                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 502  0000 7b05          	ld	a,(OFST+5,sp)
 503  0002 b700          	ld	c_x,a
 504  0004 1e06          	ldw	x,(OFST+6,sp)
 505  0006 bf01          	ldw	c_x+1,x
 506  0008 4f            	clr	a
 507  0009 92bd0000      	ldf	[c_x.e],a
 508                     ; 337 }
 511  000d 87            	retf	
 549                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 549                     ; 346 {
 550                     .text:	section	.text,new
 551  0000               f_FLASH_ProgramWord:
 553       00000000      OFST:	set	0
 556                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 558                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 560  0000 721c5051      	bset	20561,#6
 561                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 563  0004 7b08          	ld	a,(OFST+8,sp)
 564  0006 88            	push	a
 565  0007 7b06          	ld	a,(OFST+6,sp)
 566  0009 b700          	ld	c_x,a
 567  000b 1e07          	ldw	x,(OFST+7,sp)
 568  000d bf01          	ldw	c_x+1,x
 569  000f 84            	pop	a
 570  0010 92bd0000      	ldf	[c_x.e],a
 571                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 573  0014 7b09          	ld	a,(OFST+9,sp)
 574  0016 88            	push	a
 575  0017 7b06          	ld	a,(OFST+6,sp)
 576  0019 b700          	ld	c_x,a
 577  001b 1e07          	ldw	x,(OFST+7,sp)
 578  001d bf01          	ldw	c_x+1,x
 579  001f ae0001        	ldw	x,#1
 580  0022 84            	pop	a
 581  0023 92a70000      	ldf	([c_x.e],x),a
 582                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 584  0027 7b0a          	ld	a,(OFST+10,sp)
 585  0029 88            	push	a
 586  002a 7b06          	ld	a,(OFST+6,sp)
 587  002c b700          	ld	c_x,a
 588  002e 1e07          	ldw	x,(OFST+7,sp)
 589  0030 bf01          	ldw	c_x+1,x
 590  0032 ae0002        	ldw	x,#2
 591  0035 84            	pop	a
 592  0036 92a70000      	ldf	([c_x.e],x),a
 593                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 595  003a 7b0b          	ld	a,(OFST+11,sp)
 596  003c 88            	push	a
 597  003d 7b06          	ld	a,(OFST+6,sp)
 598  003f b700          	ld	c_x,a
 599  0041 1e07          	ldw	x,(OFST+7,sp)
 600  0043 bf01          	ldw	c_x+1,x
 601  0045 ae0003        	ldw	x,#3
 602  0048 84            	pop	a
 603  0049 92a70000      	ldf	([c_x.e],x),a
 604                     ; 360 }
 607  004d 87            	retf	
 638                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 638                     ; 368 {
 639                     .text:	section	.text,new
 640  0000               f_FLASH_ReadByte:
 642       00000000      OFST:	set	0
 645                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 647  0000 7b05          	ld	a,(OFST+5,sp)
 648  0002 b700          	ld	c_x,a
 649  0004 1e06          	ldw	x,(OFST+6,sp)
 650  0006 bf01          	ldw	c_x+1,x
 651  0008 92bc0000      	ldf	a,[c_x.e]
 654  000c 87            	retf	
 694                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 694                     ; 418 {
 695                     .text:	section	.text,new
 696  0000               f_FLASH_ProgramOptionByte:
 698  0000 89            	pushw	x
 699       00000000      OFST:	set	0
 702                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 704                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 706  0001 721e5051      	bset	20561,#7
 707                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 709  0005 3f00          	clr	c_x
 710  0007 bf01          	ldw	c_x+1,x
 711  0009 7b06          	ld	a,(OFST+6,sp)
 712  000b 92bd0000      	ldf	[c_x.e],a
 713                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 715  000f a6fd          	ld	a,#253
 716  0011 8d000000      	callf	f_FLASH_WaitForLastOperation
 718                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 720  0015 721f5051      	bres	20561,#7
 721                     ; 432 }
 724  0019 85            	popw	x
 725  001a 87            	retf	
 758                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 758                     ; 440 {
 759                     .text:	section	.text,new
 760  0000               f_FLASH_EraseOptionByte:
 764                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 766                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 768  0000 721e5051      	bset	20561,#7
 769                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 771  0004 3f00          	clr	c_x
 772  0006 bf01          	ldw	c_x+1,x
 773  0008 4f            	clr	a
 774  0009 92bd0000      	ldf	[c_x.e],a
 775                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 777  000d a6fd          	ld	a,#253
 778  000f 8d000000      	callf	f_FLASH_WaitForLastOperation
 780                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 782  0013 721f5051      	bres	20561,#7
 783                     ; 454 }
 786  0017 87            	retf	
 842                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 842                     ; 463 {
 843                     .text:	section	.text,new
 844  0000               f_FLASH_GetReadOutProtectionStatus:
 846       00000001      OFST:	set	1
 849                     ; 464   FunctionalState state = DISABLE;
 851                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 853  0000 c64800        	ld	a,18432
 854  0003 a1aa          	cp	a,#170
 855  0005 2603          	jrne	L523
 856                     ; 469     state =  ENABLE;
 858  0007 a601          	ld	a,#1
 862  0009 87            	retf	
 863  000a               L523:
 864                     ; 474     state =  DISABLE;
 866  000a 4f            	clr	a
 868                     ; 477   return state;
 872  000b 87            	retf	
 903                     ; 485 uint16_t FLASH_GetBootSize(void)
 903                     ; 486 {
 904                     .text:	section	.text,new
 905  0000               f_FLASH_GetBootSize:
 907       00000002      OFST:	set	2
 910                     ; 487   uint16_t temp = 0;
 912                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 914  0000 c64802        	ld	a,18434
 915  0003 5f            	clrw	x
 916  0004 97            	ld	xl,a
 917  0005 4f            	clr	a
 918  0006 02            	rlwa	x,a
 919  0007 44            	srl	a
 920  0008 56            	rrcw	x
 922                     ; 493   if(OPT->UBC > 0x7F)
 924  0009 c64802        	ld	a,18434
 925  000c a180          	cp	a,#128
 926  000e 2503          	jrult	L543
 927                     ; 495     temp = 8192;
 929  0010 ae2000        	ldw	x,#8192
 931  0013               L543:
 932                     ; 499   return(temp);
 936  0013 87            	retf	
 967                     ; 508 uint16_t FLASH_GetCodeSize(void)
 967                     ; 509 {
 968                     .text:	section	.text,new
 969  0000               f_FLASH_GetCodeSize:
 971       00000002      OFST:	set	2
 974                     ; 510   uint16_t temp = 0;
 976                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 978  0000 c64807        	ld	a,18439
 979  0003 5f            	clrw	x
 980  0004 97            	ld	xl,a
 981  0005 4f            	clr	a
 982  0006 02            	rlwa	x,a
 983  0007 44            	srl	a
 984  0008 56            	rrcw	x
 986                     ; 516   if(OPT->PCODESIZE > 0x7F)
 988  0009 c64807        	ld	a,18439
 989  000c a180          	cp	a,#128
 990  000e 2503          	jrult	L363
 991                     ; 518     temp = 8192;
 993  0010 ae2000        	ldw	x,#8192
 995  0013               L363:
 996                     ; 522   return(temp);
1000  0013 87            	retf	
1034                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1034                     ; 548 {
1035                     .text:	section	.text,new
1036  0000               f_FLASH_ITConfig:
1040                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1042                     ; 552   if(NewState != DISABLE)
1044  0000 4d            	tnz	a
1045  0001 2705          	jreq	L304
1046                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1048  0003 72125050      	bset	20560,#1
1051  0007 87            	retf	
1052  0008               L304:
1053                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1055  0008 72135050      	bres	20560,#1
1056                     ; 562 }
1059  000c 87            	retf	
1167                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1167                     ; 577 {
1168                     .text:	section	.text,new
1169  0000               f_FLASH_GetFlagStatus:
1171       00000001      OFST:	set	1
1174                     ; 578   FlagStatus status = RESET;
1176                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1178                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1180  0000 c45054        	and	a,20564
1181  0003 2702          	jreq	L754
1182                     ; 584     status = SET; /* Flash_FLAG is set*/
1184  0005 a601          	ld	a,#1
1187  0007               L754:
1188                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1191                     ; 592   return status;
1195  0007 87            	retf	
1230                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1230                     ; 720 {
1231                     .text:	section	.text,new
1232  0000               f_FLASH_PowerRunModeConfig:
1236                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1238                     ; 724   if(FLASH_Power != FLASH_Power_On)
1240  0000 4a            	dec	a
1241  0001 2705          	jreq	L105
1242                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1244  0003 72165050      	bset	20560,#3
1247  0007 87            	retf	
1248  0008               L105:
1249                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1251  0008 72175050      	bres	20560,#3
1252                     ; 732 }
1255  000c 87            	retf	
1318                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1318                     ; 746 {
1319                     .text:	section	.text,new
1320  0000               f_FLASH_GetPowerStatus:
1324                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1326  0000 c65050        	ld	a,20560
1327  0003 a40c          	and	a,#12
1330  0005 87            	retf	
1427                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1427                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1427                     ; 767 {
1428                     .text:	section	.text,new
1429  0000               f_FLASH_ProgramBlock:
1431  0000 89            	pushw	x
1432  0001 5206          	subw	sp,#6
1433       00000006      OFST:	set	6
1436                     ; 768   uint16_t Count = 0;
1438                     ; 769   uint32_t startaddress = 0;
1440                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1442                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1444                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1446  0003 7b0c          	ld	a,(OFST+6,sp)
1447  0005 a1fd          	cp	a,#253
1448  0007 2605          	jrne	L575
1449                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1451                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1453  0009 ae8000        	ldw	x,#32768
1455  000c 2003          	jra	L775
1456  000e               L575:
1457                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1459                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1461  000e ae1000        	ldw	x,#4096
1462  0011               L775:
1463  0011 1f03          	ldw	(OFST-3,sp),x
1464  0013 5f            	clrw	x
1465  0014 1f01          	ldw	(OFST-5,sp),x
1467                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1469  0016 a680          	ld	a,#128
1470  0018 1e07          	ldw	x,(OFST+1,sp)
1471  001a 8d000000      	callf	d_cmulx
1473  001e 96            	ldw	x,sp
1474  001f 5c            	incw	x
1475  0020 8d000000      	callf	d_lgadd
1478                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1480  0024 7b0d          	ld	a,(OFST+7,sp)
1481  0026 2606          	jrne	L106
1482                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1484  0028 72105051      	bset	20561,#0
1486  002c 2004          	jra	L306
1487  002e               L106:
1488                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1490  002e 72185051      	bset	20561,#4
1491  0032               L306:
1492                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1494  0032 5f            	clrw	x
1495  0033 1f05          	ldw	(OFST-1,sp),x
1497  0035               L506:
1498                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1500  0035 1e0e          	ldw	x,(OFST+8,sp)
1501  0037 72fb05        	addw	x,(OFST-1,sp)
1502  003a f6            	ld	a,(x)
1503  003b 88            	push	a
1504  003c 7b03          	ld	a,(OFST-3,sp)
1505  003e b700          	ld	c_x,a
1506  0040 1e04          	ldw	x,(OFST-2,sp)
1507  0042 bf01          	ldw	c_x+1,x
1508  0044 84            	pop	a
1509  0045 1e05          	ldw	x,(OFST-1,sp)
1510  0047 92a70000      	ldf	([c_x.e],x),a
1511                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1513  004b 5c            	incw	x
1514  004c 1f05          	ldw	(OFST-1,sp),x
1518  004e a30080        	cpw	x,#128
1519  0051 25e2          	jrult	L506
1520                     ; 805 }
1523  0053 5b08          	addw	sp,#8
1524  0055 87            	retf	
1582                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1582                     ; 818 {
1583                     .text:	section	.text,new
1584  0000               f_FLASH_EraseBlock:
1586  0000 89            	pushw	x
1587  0001 5207          	subw	sp,#7
1588       00000007      OFST:	set	7
1591                     ; 819   uint32_t startaddress = 0;
1593                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1595                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1597  0003 7b0d          	ld	a,(OFST+6,sp)
1598  0005 a1fd          	cp	a,#253
1599  0007 2605          	jrne	L146
1600                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1602                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1604  0009 ae8000        	ldw	x,#32768
1606  000c 2003          	jra	L346
1607  000e               L146:
1608                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1610                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1612  000e ae1000        	ldw	x,#4096
1613  0011               L346:
1614  0011 1f03          	ldw	(OFST-4,sp),x
1615  0013 5f            	clrw	x
1616  0014 1f01          	ldw	(OFST-6,sp),x
1618                     ; 847   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1620  0016 a680          	ld	a,#128
1621  0018 1e08          	ldw	x,(OFST+1,sp)
1622  001a 8d000000      	callf	d_cmulx
1624  001e 96            	ldw	x,sp
1625  001f 5c            	incw	x
1626  0020 8d000000      	callf	d_ladd
1628  0024 450100        	mov	c_x,c_lreg+1
1629  0027 b600          	ld	a,c_x
1630  0029 be02          	ldw	x,c_lreg+2
1631  002b 6b05          	ld	(OFST-2,sp),a
1632  002d 1f06          	ldw	(OFST-1,sp),x
1634                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1636  002f 721a5051      	bset	20561,#5
1637                     ; 858   *pwFlash = (uint8_t)0;
1639  0033 b700          	ld	c_x,a
1640  0035 bf01          	ldw	c_x+1,x
1641  0037 4f            	clr	a
1642  0038 92bd0000      	ldf	[c_x.e],a
1643                     ; 859   *(pwFlash + 1) = (uint8_t)0;
1645  003c 7b05          	ld	a,(OFST-2,sp)
1646  003e b700          	ld	c_x,a
1647  0040 ae0001        	ldw	x,#1
1648  0043 4f            	clr	a
1649  0044 92a70000      	ldf	([c_x.e],x),a
1650                     ; 860   *(pwFlash + 2) = (uint8_t)0;
1652  0048 1e06          	ldw	x,(OFST-1,sp)
1653  004a bf01          	ldw	c_x+1,x
1654  004c ae0002        	ldw	x,#2
1655  004f 92a70000      	ldf	([c_x.e],x),a
1656                     ; 861   *(pwFlash + 3) = (uint8_t)0;
1658  0053 5c            	incw	x
1659  0054 92a70000      	ldf	([c_x.e],x),a
1660                     ; 863 }
1663  0058 5b09          	addw	sp,#9
1664  005a 87            	retf	
1744                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1744                     ; 876 {
1745                     .text:	section	.text,new
1746  0000               f_FLASH_WaitForLastOperation:
1748  0000 5203          	subw	sp,#3
1749       00000003      OFST:	set	3
1752                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1754  0002 aeffff        	ldw	x,#65535
1755  0005 1f01          	ldw	(OFST-2,sp),x
1757                     ; 878   uint8_t flagstatus = 0x00;
1759  0007 0f03          	clr	(OFST+0,sp)
1761                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1763  0009 a1fd          	cp	a,#253
1764  000b 2620          	jrne	L717
1766  000d 200a          	jra	L507
1767  000f               L307:
1768                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1768                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1770  000f c65054        	ld	a,20564
1771  0012 a405          	and	a,#5
1772  0014 6b03          	ld	(OFST+0,sp),a
1774                     ; 887       timeout--;
1776  0016 5a            	decw	x
1777  0017 1f01          	ldw	(OFST-2,sp),x
1779  0019               L507:
1780                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1782  0019 7b03          	ld	a,(OFST+0,sp)
1783  001b 2618          	jrne	L317
1785  001d 1e01          	ldw	x,(OFST-2,sp)
1786  001f 26ee          	jrne	L307
1787  0021 2012          	jra	L317
1788  0023               L517:
1789                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1789                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1791  0023 c65054        	ld	a,20564
1792  0026 a441          	and	a,#65
1793  0028 6b03          	ld	(OFST+0,sp),a
1795                     ; 896       timeout--;
1797  002a 5a            	decw	x
1798  002b 1f01          	ldw	(OFST-2,sp),x
1800  002d               L717:
1801                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1803  002d 7b03          	ld	a,(OFST+0,sp)
1804  002f 2604          	jrne	L317
1806  0031 1e01          	ldw	x,(OFST-2,sp)
1807  0033 26ee          	jrne	L517
1808  0035               L317:
1809                     ; 900   if(timeout == 0x00)
1811  0035 1e01          	ldw	x,(OFST-2,sp)
1812  0037 2602          	jrne	L527
1813                     ; 902     flagstatus = FLASH_Status_TimeOut;
1815  0039 a602          	ld	a,#2
1817  003b               L527:
1818                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1822  003b 5b03          	addw	sp,#3
1823  003d 87            	retf	
1835                     	xdef	f_FLASH_WaitForLastOperation
1836                     	xdef	f_FLASH_EraseBlock
1837                     	xdef	f_FLASH_ProgramBlock
1838                     	xdef	f_FLASH_GetPowerStatus
1839                     	xdef	f_FLASH_PowerRunModeConfig
1840                     	xdef	f_FLASH_GetFlagStatus
1841                     	xdef	f_FLASH_ITConfig
1842                     	xdef	f_FLASH_EraseOptionByte
1843                     	xdef	f_FLASH_ProgramOptionByte
1844                     	xdef	f_FLASH_GetReadOutProtectionStatus
1845                     	xdef	f_FLASH_GetCodeSize
1846                     	xdef	f_FLASH_GetBootSize
1847                     	xdef	f_FLASH_ReadByte
1848                     	xdef	f_FLASH_ProgramWord
1849                     	xdef	f_FLASH_EraseByte
1850                     	xdef	f_FLASH_ProgramByte
1851                     	xdef	f_FLASH_Lock
1852                     	xdef	f_FLASH_Unlock
1853                     	xdef	f_FLASH_DeInit
1854                     	xdef	f_FLASH_PowerWaitModeConfig
1855                     	xdef	f_FLASH_SetProgrammingTime
1856                     	xdef	f_FLASH_GetProgrammingTime
1857                     	xref.b	c_lreg
1858                     	xref.b	c_x
1877                     	xref	d_ladd
1878                     	xref	d_lgadd
1879                     	xref	d_cmulx
1880                     	end
