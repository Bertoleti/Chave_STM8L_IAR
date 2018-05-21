   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  51                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  51                     ; 53 {
  52                     .text:	section	.text,new
  53  0000               f_NonHandledInterrupt:
  57                     ; 57 }
  60  0000 80            	iret	
  82                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  82                     ; 68 {
  83                     .text:	section	.text,new
  84  0000               f_TRAP_IRQHandler:
  88                     ; 72 }
  91  0000 80            	iret	
 113                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 113                     ; 79 {
 114                     .text:	section	.text,new
 115  0000               f_FLASH_IRQHandler:
 119                     ; 83 }
 122  0000 80            	iret	
 145                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 145                     ; 90 {
 146                     .text:	section	.text,new
 147  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 151                     ; 94 }
 154  0000 80            	iret	
 177                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 177                     ; 101 {
 178                     .text:	section	.text,new
 179  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 183                     ; 105 }
 186  0000 80            	iret	
 209                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 209                     ; 112 {
 210                     .text:	section	.text,new
 211  0000               f_RTC_CSSLSE_IRQHandler:
 215                     ; 116 }
 218  0000 80            	iret	
 241                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 241                     ; 123 {
 242                     .text:	section	.text,new
 243  0000               f_EXTIE_F_PVD_IRQHandler:
 247                     ; 127 }
 250  0000 80            	iret	
 272                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 272                     ; 135 {
 273                     .text:	section	.text,new
 274  0000               f_EXTIB_G_IRQHandler:
 278                     ; 139 }
 281  0000 80            	iret	
 303                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 303                     ; 147 {
 304                     .text:	section	.text,new
 305  0000               f_EXTID_H_IRQHandler:
 309                     ; 151 }
 312  0000 80            	iret	
 334                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 334                     ; 159 {
 335                     .text:	section	.text,new
 336  0000               f_EXTI0_IRQHandler:
 340                     ; 163 }
 343  0000 80            	iret	
 365                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 365                     ; 171 {
 366                     .text:	section	.text,new
 367  0000               f_EXTI1_IRQHandler:
 371                     ; 175 }
 374  0000 80            	iret	
 396                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 396                     ; 183 {
 397                     .text:	section	.text,new
 398  0000               f_EXTI2_IRQHandler:
 402                     ; 187 }
 405  0000 80            	iret	
 427                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 427                     ; 195 {
 428                     .text:	section	.text,new
 429  0000               f_EXTI3_IRQHandler:
 433                     ; 199 }
 436  0000 80            	iret	
 458                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 458                     ; 207 {
 459                     .text:	section	.text,new
 460  0000               f_EXTI4_IRQHandler:
 464                     ; 211 }
 467  0000 80            	iret	
 489                     ; 218 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 489                     ; 219 {
 490                     .text:	section	.text,new
 491  0000               f_EXTI5_IRQHandler:
 495                     ; 223 }
 498  0000 80            	iret	
 520                     ; 230 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 520                     ; 231 {
 521                     .text:	section	.text,new
 522  0000               f_EXTI6_IRQHandler:
 526                     ; 235 }
 529  0000 80            	iret	
 551                     ; 242 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 551                     ; 243 {
 552                     .text:	section	.text,new
 553  0000               f_EXTI7_IRQHandler:
 557                     ; 247 }
 560  0000 80            	iret	
 582                     ; 253 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 582                     ; 254 {
 583                     .text:	section	.text,new
 584  0000               f_LCD_AES_IRQHandler:
 588                     ; 258 }
 591  0000 80            	iret	
 614                     ; 264 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 614                     ; 265 {
 615                     .text:	section	.text,new
 616  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 620                     ; 269 }
 623  0000 80            	iret	
 646                     ; 276 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 646                     ; 277 {
 647                     .text:	section	.text,new
 648  0000               f_ADC1_COMP_IRQHandler:
 652                     ; 281 }
 655  0000 80            	iret	
 679                     ; 288 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 679                     ; 289 {
 680                     .text:	section	.text,new
 681  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 685                     ; 293 }
 688  0000 80            	iret	
 711                     ; 300 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 711                     ; 301 {
 712                     .text:	section	.text,new
 713  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 717                     ; 305 }
 720  0000 80            	iret	
 744                     ; 313 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 744                     ; 314 {
 745                     .text:	section	.text,new
 746  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 750                     ; 318 }
 753  0000 80            	iret	
 776                     ; 324 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 776                     ; 325 {
 777                     .text:	section	.text,new
 778  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 782                     ; 329 }
 785  0000 80            	iret	
 808                     ; 335 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 808                     ; 336 {
 809                     .text:	section	.text,new
 810  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 814                     ; 340 }
 817  0000 80            	iret	
 839                     ; 346 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 839                     ; 347 {
 840                     .text:	section	.text,new
 841  0000               f_TIM1_CC_IRQHandler:
 845                     ; 351 }
 848  0000 80            	iret	
 871                     ; 358 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 871                     ; 359 {
 872                     .text:	section	.text,new
 873  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 877                     ; 363 }
 880  0000 80            	iret	
 902                     ; 369 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 902                     ; 370 {
 903                     .text:	section	.text,new
 904  0000               f_SPI1_IRQHandler:
 908                     ; 374 }
 911  0000 80            	iret	
 935                     ; 381 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 935                     ; 382 {
 936                     .text:	section	.text,new
 937  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 941                     ; 386 }
 944  0000 80            	iret	
 967                     ; 393 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 967                     ; 394 {
 968                     .text:	section	.text,new
 969  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 973                     ; 398 }
 976  0000 80            	iret	
 999                     ; 405 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
 999                     ; 406 {
1000                     .text:	section	.text,new
1001  0000               f_I2C1_SPI2_IRQHandler:
1005                     ; 410 }
1008  0000 80            	iret	
1020                     	xdef	f_I2C1_SPI2_IRQHandler
1021                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1022                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1023                     	xdef	f_SPI1_IRQHandler
1024                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1025                     	xdef	f_TIM1_CC_IRQHandler
1026                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1027                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1028                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1029                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1030                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1031                     	xdef	f_ADC1_COMP_IRQHandler
1032                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1033                     	xdef	f_LCD_AES_IRQHandler
1034                     	xdef	f_EXTI7_IRQHandler
1035                     	xdef	f_EXTI6_IRQHandler
1036                     	xdef	f_EXTI5_IRQHandler
1037                     	xdef	f_EXTI4_IRQHandler
1038                     	xdef	f_EXTI3_IRQHandler
1039                     	xdef	f_EXTI2_IRQHandler
1040                     	xdef	f_EXTI1_IRQHandler
1041                     	xdef	f_EXTI0_IRQHandler
1042                     	xdef	f_EXTID_H_IRQHandler
1043                     	xdef	f_EXTIB_G_IRQHandler
1044                     	xdef	f_EXTIE_F_PVD_IRQHandler
1045                     	xdef	f_RTC_CSSLSE_IRQHandler
1046                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1047                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1048                     	xdef	f_FLASH_IRQHandler
1049                     	xdef	f_TRAP_IRQHandler
1050                     	xdef	f_NonHandledInterrupt
1069                     	end
