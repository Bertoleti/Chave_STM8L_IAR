   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
 116                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 116                     ; 97 {
 117                     .text:	section	.text,new
 118  0000               f_GPIO_DeInit:
 122                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 124  0000 6f04          	clr	(4,x)
 125                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 127  0002 7f            	clr	(x)
 128                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 130  0003 6f02          	clr	(2,x)
 131                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 133  0005 6f03          	clr	(3,x)
 134                     ; 102 }
 137  0007 87            	retf	
 290                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 290                     ; 134 {
 291                     .text:	section	.text,new
 292  0000               f_GPIO_Init:
 294  0000 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 300                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 302                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 304  0001 7b06          	ld	a,(OFST+6,sp)
 305  0003 43            	cpl	a
 306  0004 e404          	and	a,(4,x)
 307  0006 e704          	ld	(4,x),a
 308                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 310  0008 7b07          	ld	a,(OFST+7,sp)
 311  000a 2a16          	jrpl	L341
 312                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 314  000c a510          	bcp	a,#16
 315  000e 2705          	jreq	L541
 316                     ; 153       GPIOx->ODR |= GPIO_Pin;
 318  0010 f6            	ld	a,(x)
 319  0011 1a06          	or	a,(OFST+6,sp)
 321  0013 2004          	jra	L741
 322  0015               L541:
 323                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  0015 7b06          	ld	a,(OFST+6,sp)
 326  0017 43            	cpl	a
 327  0018 f4            	and	a,(x)
 328  0019               L741:
 329  0019 f7            	ld	(x),a
 330                     ; 159     GPIOx->DDR |= GPIO_Pin;
 332  001a 1e01          	ldw	x,(OFST+1,sp)
 333  001c e602          	ld	a,(2,x)
 334  001e 1a06          	or	a,(OFST+6,sp)
 336  0020 2005          	jra	L151
 337  0022               L341:
 338                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 340  0022 7b06          	ld	a,(OFST+6,sp)
 341  0024 43            	cpl	a
 342  0025 e402          	and	a,(2,x)
 343  0027               L151:
 344  0027 e702          	ld	(2,x),a
 345                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 347  0029 7b07          	ld	a,(OFST+7,sp)
 348  002b a540          	bcp	a,#64
 349  002d 2706          	jreq	L351
 350                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 352  002f e603          	ld	a,(3,x)
 353  0031 1a06          	or	a,(OFST+6,sp)
 355  0033 2005          	jra	L551
 356  0035               L351:
 357                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 359  0035 7b06          	ld	a,(OFST+6,sp)
 360  0037 43            	cpl	a
 361  0038 e403          	and	a,(3,x)
 362  003a               L551:
 363  003a e703          	ld	(3,x),a
 364                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 366  003c 7b07          	ld	a,(OFST+7,sp)
 367  003e a520          	bcp	a,#32
 368  0040 2706          	jreq	L751
 369                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 371  0042 e604          	ld	a,(4,x)
 372  0044 1a06          	or	a,(OFST+6,sp)
 374  0046 2005          	jra	L161
 375  0048               L751:
 376                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 378  0048 7b06          	ld	a,(OFST+6,sp)
 379  004a 43            	cpl	a
 380  004b e404          	and	a,(4,x)
 381  004d               L161:
 382  004d e704          	ld	(4,x),a
 383                     ; 190 }
 386  004f 85            	popw	x
 387  0050 87            	retf	
 461                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 461                     ; 210 {
 462                     .text:	section	.text,new
 463  0000               f_GPIO_ExternalPullUpConfig:
 465       fffffffe      OFST: set -2
 468                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 470                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 472                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 474  0000 7b05          	ld	a,(OFST+7,sp)
 475  0002 2706          	jreq	L122
 476                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 478  0004 e603          	ld	a,(3,x)
 479  0006 1a04          	or	a,(OFST+6,sp)
 481  0008 2005          	jra	L322
 482  000a               L122:
 483                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 485  000a 7b04          	ld	a,(OFST+6,sp)
 486  000c 43            	cpl	a
 487  000d e403          	and	a,(3,x)
 488  000f               L322:
 489  000f e703          	ld	(3,x),a
 490                     ; 222 }
 493  0011 87            	retf	
 536                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 536                     ; 249 {
 537                     .text:	section	.text,new
 538  0000               f_GPIO_Write:
 540       fffffffe      OFST: set -2
 543                     ; 250   GPIOx->ODR = GPIO_PortVal;
 545  0000 7b04          	ld	a,(OFST+6,sp)
 546  0002 f7            	ld	(x),a
 547                     ; 251 }
 550  0003 87            	retf	
 709                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 709                     ; 271 {
 710                     .text:	section	.text,new
 711  0000               f_GPIO_WriteBit:
 713       fffffffe      OFST: set -2
 716                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 718                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 720                     ; 276   if (GPIO_BitVal != RESET)
 722  0000 7b05          	ld	a,(OFST+7,sp)
 723  0002 2705          	jreq	L143
 724                     ; 278     GPIOx->ODR |= GPIO_Pin;
 726  0004 f6            	ld	a,(x)
 727  0005 1a04          	or	a,(OFST+6,sp)
 729  0007 2004          	jra	L343
 730  0009               L143:
 731                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 733  0009 7b04          	ld	a,(OFST+6,sp)
 734  000b 43            	cpl	a
 735  000c f4            	and	a,(x)
 736  000d               L343:
 737  000d f7            	ld	(x),a
 738                     ; 285 }
 741  000e 87            	retf	
 784                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 784                     ; 304 {
 785                     .text:	section	.text,new
 786  0000               f_GPIO_SetBits:
 788       fffffffe      OFST: set -2
 791                     ; 305   GPIOx->ODR |= GPIO_Pin;
 793  0000 f6            	ld	a,(x)
 794  0001 1a04          	or	a,(OFST+6,sp)
 795  0003 f7            	ld	(x),a
 796                     ; 306 }
 799  0004 87            	retf	
 842                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 842                     ; 325 {
 843                     .text:	section	.text,new
 844  0000               f_GPIO_ResetBits:
 846       fffffffe      OFST: set -2
 849                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 851  0000 7b04          	ld	a,(OFST+6,sp)
 852  0002 43            	cpl	a
 853  0003 f4            	and	a,(x)
 854  0004 f7            	ld	(x),a
 855                     ; 327 }
 858  0005 87            	retf	
 901                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 901                     ; 337 {
 902                     .text:	section	.text,new
 903  0000               f_GPIO_ToggleBits:
 905       fffffffe      OFST: set -2
 908                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 910  0000 f6            	ld	a,(x)
 911  0001 1804          	xor	a,(OFST+6,sp)
 912  0003 f7            	ld	(x),a
 913                     ; 339 }
 916  0004 87            	retf	
 952                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 952                     ; 348 {
 953                     .text:	section	.text,new
 954  0000               f_GPIO_ReadInputData:
 958                     ; 349   return ((uint8_t)GPIOx->IDR);
 960  0000 e601          	ld	a,(1,x)
 963  0002 87            	retf	
1000                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1000                     ; 359 {
1001                     .text:	section	.text,new
1002  0000               f_GPIO_ReadOutputData:
1006                     ; 360   return ((uint8_t)GPIOx->ODR);
1008  0000 f6            	ld	a,(x)
1011  0001 87            	retf	
1059                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1059                     ; 379 {
1060                     .text:	section	.text,new
1061  0000               f_GPIO_ReadInputDataBit:
1063       fffffffe      OFST: set -2
1066                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1068  0000 e601          	ld	a,(1,x)
1069  0002 1404          	and	a,(OFST+6,sp)
1072  0004 87            	retf	
1120                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1120                     ; 390 {
1121                     .text:	section	.text,new
1122  0000               f_GPIO_ReadOutputDataBit:
1124       fffffffe      OFST: set -2
1127                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1129  0000 f6            	ld	a,(x)
1130  0001 1404          	and	a,(OFST+6,sp)
1133  0003 87            	retf	
1145                     	xdef	f_GPIO_ReadOutputDataBit
1146                     	xdef	f_GPIO_ReadInputDataBit
1147                     	xdef	f_GPIO_ReadOutputData
1148                     	xdef	f_GPIO_ReadInputData
1149                     	xdef	f_GPIO_ToggleBits
1150                     	xdef	f_GPIO_ResetBits
1151                     	xdef	f_GPIO_SetBits
1152                     	xdef	f_GPIO_WriteBit
1153                     	xdef	f_GPIO_Write
1154                     	xdef	f_GPIO_ExternalPullUpConfig
1155                     	xdef	f_GPIO_Init
1156                     	xdef	f_GPIO_DeInit
1175                     	end
