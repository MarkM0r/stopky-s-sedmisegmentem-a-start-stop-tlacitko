                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_it
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TRAP_IRQHandler
                                     13 	.globl _TLI_IRQHandler
                                     14 	.globl _AWU_IRQHandler
                                     15 	.globl _CLK_IRQHandler
                                     16 	.globl _EXTI_PORTA_IRQHandler
                                     17 	.globl _EXTI_PORTB_IRQHandler
                                     18 	.globl _EXTI_PORTC_IRQHandler
                                     19 	.globl _EXTI_PORTD_IRQHandler
                                     20 	.globl _EXTI_PORTE_IRQHandler
                                     21 	.globl _CAN_RX_IRQHandler
                                     22 	.globl _CAN_TX_IRQHandler
                                     23 	.globl _SPI_IRQHandler
                                     24 	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                     25 	.globl _TIM1_CAP_COM_IRQHandler
                                     26 	.globl _TIM2_UPD_OVF_BRK_IRQHandler
                                     27 	.globl _TIM2_CAP_COM_IRQHandler
                                     28 	.globl _TIM3_UPD_OVF_BRK_IRQHandler
                                     29 	.globl _TIM3_CAP_COM_IRQHandler
                                     30 	.globl _UART1_TX_IRQHandler
                                     31 	.globl _UART1_RX_IRQHandler
                                     32 	.globl _I2C_IRQHandler
                                     33 	.globl _UART3_TX_IRQHandler
                                     34 	.globl _UART3_RX_IRQHandler
                                     35 	.globl _ADC2_IRQHandler
                                     36 	.globl _TIM4_UPD_OVF_IRQHandler
                                     37 	.globl _EEPROM_EEC_IRQHandler
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area DATA
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 
                                     51 ; default segment ordering for linker
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area CONST
                                     56 	.area INITIALIZER
                                     57 	.area CODE
                                     58 
                                     59 ;--------------------------------------------------------
                                     60 ; global & static initialisations
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area GSINIT
                                     64 	.area GSFINAL
                                     65 	.area GSINIT
                                     66 ;--------------------------------------------------------
                                     67 ; Home
                                     68 ;--------------------------------------------------------
                                     69 	.area HOME
                                     70 	.area HOME
                                     71 ;--------------------------------------------------------
                                     72 ; code
                                     73 ;--------------------------------------------------------
                                     74 	.area CODE
                                     75 ;	src/stm8s_it.c: 65: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
                                     76 ; genLabel
                                     77 ;	-----------------------------------------
                                     78 ;	 function TRAP_IRQHandler
                                     79 ;	-----------------------------------------
                                     80 ;	Register assignment is optimal.
                                     81 ;	Stack space usage: 0 bytes.
      008613                         82 _TRAP_IRQHandler:
                                     83 ;	src/stm8s_it.c: 70: }
                                     84 ; genLabel
      008613                         85 00101$:
                                     86 ; genEndFunction
      008613 80               [11]   87 	iret
                                     88 ;	src/stm8s_it.c: 76: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
                                     89 ; genLabel
                                     90 ;	-----------------------------------------
                                     91 ;	 function TLI_IRQHandler
                                     92 ;	-----------------------------------------
                                     93 ;	Register assignment is optimal.
                                     94 ;	Stack space usage: 0 bytes.
      008614                         95 _TLI_IRQHandler:
                                     96 ;	src/stm8s_it.c: 81: }
                                     97 ; genLabel
      008614                         98 00101$:
                                     99 ; genEndFunction
      008614 80               [11]  100 	iret
                                    101 ;	src/stm8s_it.c: 88: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
                                    102 ; genLabel
                                    103 ;	-----------------------------------------
                                    104 ;	 function AWU_IRQHandler
                                    105 ;	-----------------------------------------
                                    106 ;	Register assignment is optimal.
                                    107 ;	Stack space usage: 0 bytes.
      008615                        108 _AWU_IRQHandler:
                                    109 ;	src/stm8s_it.c: 93: }
                                    110 ; genLabel
      008615                        111 00101$:
                                    112 ; genEndFunction
      008615 80               [11]  113 	iret
                                    114 ;	src/stm8s_it.c: 100: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
                                    115 ; genLabel
                                    116 ;	-----------------------------------------
                                    117 ;	 function CLK_IRQHandler
                                    118 ;	-----------------------------------------
                                    119 ;	Register assignment is optimal.
                                    120 ;	Stack space usage: 0 bytes.
      008616                        121 _CLK_IRQHandler:
                                    122 ;	src/stm8s_it.c: 105: }
                                    123 ; genLabel
      008616                        124 00101$:
                                    125 ; genEndFunction
      008616 80               [11]  126 	iret
                                    127 ;	src/stm8s_it.c: 112: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
                                    128 ; genLabel
                                    129 ;	-----------------------------------------
                                    130 ;	 function EXTI_PORTA_IRQHandler
                                    131 ;	-----------------------------------------
                                    132 ;	Register assignment is optimal.
                                    133 ;	Stack space usage: 0 bytes.
      008617                        134 _EXTI_PORTA_IRQHandler:
                                    135 ;	src/stm8s_it.c: 117: }
                                    136 ; genLabel
      008617                        137 00101$:
                                    138 ; genEndFunction
      008617 80               [11]  139 	iret
                                    140 ;	src/stm8s_it.c: 124: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
                                    141 ; genLabel
                                    142 ;	-----------------------------------------
                                    143 ;	 function EXTI_PORTB_IRQHandler
                                    144 ;	-----------------------------------------
                                    145 ;	Register assignment is optimal.
                                    146 ;	Stack space usage: 0 bytes.
      008618                        147 _EXTI_PORTB_IRQHandler:
                                    148 ;	src/stm8s_it.c: 129: }
                                    149 ; genLabel
      008618                        150 00101$:
                                    151 ; genEndFunction
      008618 80               [11]  152 	iret
                                    153 ;	src/stm8s_it.c: 136: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
                                    154 ; genLabel
                                    155 ;	-----------------------------------------
                                    156 ;	 function EXTI_PORTC_IRQHandler
                                    157 ;	-----------------------------------------
                                    158 ;	Register assignment is optimal.
                                    159 ;	Stack space usage: 0 bytes.
      008619                        160 _EXTI_PORTC_IRQHandler:
                                    161 ;	src/stm8s_it.c: 141: }
                                    162 ; genLabel
      008619                        163 00101$:
                                    164 ; genEndFunction
      008619 80               [11]  165 	iret
                                    166 ;	src/stm8s_it.c: 148: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
                                    167 ; genLabel
                                    168 ;	-----------------------------------------
                                    169 ;	 function EXTI_PORTD_IRQHandler
                                    170 ;	-----------------------------------------
                                    171 ;	Register assignment is optimal.
                                    172 ;	Stack space usage: 0 bytes.
      00861A                        173 _EXTI_PORTD_IRQHandler:
                                    174 ;	src/stm8s_it.c: 153: }
                                    175 ; genLabel
      00861A                        176 00101$:
                                    177 ; genEndFunction
      00861A 80               [11]  178 	iret
                                    179 ;	src/stm8s_it.c: 160: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
                                    180 ; genLabel
                                    181 ;	-----------------------------------------
                                    182 ;	 function EXTI_PORTE_IRQHandler
                                    183 ;	-----------------------------------------
                                    184 ;	Register assignment is optimal.
                                    185 ;	Stack space usage: 0 bytes.
      00861B                        186 _EXTI_PORTE_IRQHandler:
                                    187 ;	src/stm8s_it.c: 165: }
                                    188 ; genLabel
      00861B                        189 00101$:
                                    190 ; genEndFunction
      00861B 80               [11]  191 	iret
                                    192 ;	src/stm8s_it.c: 186: INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
                                    193 ; genLabel
                                    194 ;	-----------------------------------------
                                    195 ;	 function CAN_RX_IRQHandler
                                    196 ;	-----------------------------------------
                                    197 ;	Register assignment is optimal.
                                    198 ;	Stack space usage: 0 bytes.
      00861C                        199 _CAN_RX_IRQHandler:
                                    200 ;	src/stm8s_it.c: 191: }
                                    201 ; genLabel
      00861C                        202 00101$:
                                    203 ; genEndFunction
      00861C 80               [11]  204 	iret
                                    205 ;	src/stm8s_it.c: 198: INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
                                    206 ; genLabel
                                    207 ;	-----------------------------------------
                                    208 ;	 function CAN_TX_IRQHandler
                                    209 ;	-----------------------------------------
                                    210 ;	Register assignment is optimal.
                                    211 ;	Stack space usage: 0 bytes.
      00861D                        212 _CAN_TX_IRQHandler:
                                    213 ;	src/stm8s_it.c: 203: }
                                    214 ; genLabel
      00861D                        215 00101$:
                                    216 ; genEndFunction
      00861D 80               [11]  217 	iret
                                    218 ;	src/stm8s_it.c: 211: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
                                    219 ; genLabel
                                    220 ;	-----------------------------------------
                                    221 ;	 function SPI_IRQHandler
                                    222 ;	-----------------------------------------
                                    223 ;	Register assignment is optimal.
                                    224 ;	Stack space usage: 0 bytes.
      00861E                        225 _SPI_IRQHandler:
                                    226 ;	src/stm8s_it.c: 216: }
                                    227 ; genLabel
      00861E                        228 00101$:
                                    229 ; genEndFunction
      00861E 80               [11]  230 	iret
                                    231 ;	src/stm8s_it.c: 223: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
                                    232 ; genLabel
                                    233 ;	-----------------------------------------
                                    234 ;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
                                    235 ;	-----------------------------------------
                                    236 ;	Register assignment is optimal.
                                    237 ;	Stack space usage: 0 bytes.
      00861F                        238 _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
                                    239 ;	src/stm8s_it.c: 228: }
                                    240 ; genLabel
      00861F                        241 00101$:
                                    242 ; genEndFunction
      00861F 80               [11]  243 	iret
                                    244 ;	src/stm8s_it.c: 235: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
                                    245 ; genLabel
                                    246 ;	-----------------------------------------
                                    247 ;	 function TIM1_CAP_COM_IRQHandler
                                    248 ;	-----------------------------------------
                                    249 ;	Register assignment is optimal.
                                    250 ;	Stack space usage: 0 bytes.
      008620                        251 _TIM1_CAP_COM_IRQHandler:
                                    252 ;	src/stm8s_it.c: 240: }
                                    253 ; genLabel
      008620                        254 00101$:
                                    255 ; genEndFunction
      008620 80               [11]  256 	iret
                                    257 ;	src/stm8s_it.c: 272: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
                                    258 ; genLabel
                                    259 ;	-----------------------------------------
                                    260 ;	 function TIM2_UPD_OVF_BRK_IRQHandler
                                    261 ;	-----------------------------------------
                                    262 ;	Register assignment is optimal.
                                    263 ;	Stack space usage: 0 bytes.
      008621                        264 _TIM2_UPD_OVF_BRK_IRQHandler:
                                    265 ;	src/stm8s_it.c: 277: }
                                    266 ; genLabel
      008621                        267 00101$:
                                    268 ; genEndFunction
      008621 80               [11]  269 	iret
                                    270 ;	src/stm8s_it.c: 284: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
                                    271 ; genLabel
                                    272 ;	-----------------------------------------
                                    273 ;	 function TIM2_CAP_COM_IRQHandler
                                    274 ;	-----------------------------------------
                                    275 ;	Register assignment is optimal.
                                    276 ;	Stack space usage: 0 bytes.
      008622                        277 _TIM2_CAP_COM_IRQHandler:
                                    278 ;	src/stm8s_it.c: 289: }
                                    279 ; genLabel
      008622                        280 00101$:
                                    281 ; genEndFunction
      008622 80               [11]  282 	iret
                                    283 ;	src/stm8s_it.c: 299: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
                                    284 ; genLabel
                                    285 ;	-----------------------------------------
                                    286 ;	 function TIM3_UPD_OVF_BRK_IRQHandler
                                    287 ;	-----------------------------------------
                                    288 ;	Register assignment is optimal.
                                    289 ;	Stack space usage: 0 bytes.
      008623                        290 _TIM3_UPD_OVF_BRK_IRQHandler:
                                    291 ;	src/stm8s_it.c: 304: }
                                    292 ; genLabel
      008623                        293 00101$:
                                    294 ; genEndFunction
      008623 80               [11]  295 	iret
                                    296 ;	src/stm8s_it.c: 311: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
                                    297 ; genLabel
                                    298 ;	-----------------------------------------
                                    299 ;	 function TIM3_CAP_COM_IRQHandler
                                    300 ;	-----------------------------------------
                                    301 ;	Register assignment is optimal.
                                    302 ;	Stack space usage: 0 bytes.
      008624                        303 _TIM3_CAP_COM_IRQHandler:
                                    304 ;	src/stm8s_it.c: 316: }
                                    305 ; genLabel
      008624                        306 00101$:
                                    307 ; genEndFunction
      008624 80               [11]  308 	iret
                                    309 ;	src/stm8s_it.c: 326: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
                                    310 ; genLabel
                                    311 ;	-----------------------------------------
                                    312 ;	 function UART1_TX_IRQHandler
                                    313 ;	-----------------------------------------
                                    314 ;	Register assignment is optimal.
                                    315 ;	Stack space usage: 0 bytes.
      008625                        316 _UART1_TX_IRQHandler:
                                    317 ;	src/stm8s_it.c: 331: }
                                    318 ; genLabel
      008625                        319 00101$:
                                    320 ; genEndFunction
      008625 80               [11]  321 	iret
                                    322 ;	src/stm8s_it.c: 338: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
                                    323 ; genLabel
                                    324 ;	-----------------------------------------
                                    325 ;	 function UART1_RX_IRQHandler
                                    326 ;	-----------------------------------------
                                    327 ;	Register assignment is optimal.
                                    328 ;	Stack space usage: 0 bytes.
      008626                        329 _UART1_RX_IRQHandler:
                                    330 ;	src/stm8s_it.c: 343: }
                                    331 ; genLabel
      008626                        332 00101$:
                                    333 ; genEndFunction
      008626 80               [11]  334 	iret
                                    335 ;	src/stm8s_it.c: 351: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
                                    336 ; genLabel
                                    337 ;	-----------------------------------------
                                    338 ;	 function I2C_IRQHandler
                                    339 ;	-----------------------------------------
                                    340 ;	Register assignment is optimal.
                                    341 ;	Stack space usage: 0 bytes.
      008627                        342 _I2C_IRQHandler:
                                    343 ;	src/stm8s_it.c: 356: }
                                    344 ; genLabel
      008627                        345 00101$:
                                    346 ; genEndFunction
      008627 80               [11]  347 	iret
                                    348 ;	src/stm8s_it.c: 390: INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
                                    349 ; genLabel
                                    350 ;	-----------------------------------------
                                    351 ;	 function UART3_TX_IRQHandler
                                    352 ;	-----------------------------------------
                                    353 ;	Register assignment is optimal.
                                    354 ;	Stack space usage: 0 bytes.
      008628                        355 _UART3_TX_IRQHandler:
                                    356 ;	src/stm8s_it.c: 395: }
                                    357 ; genLabel
      008628                        358 00101$:
                                    359 ; genEndFunction
      008628 80               [11]  360 	iret
                                    361 ;	src/stm8s_it.c: 402: INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
                                    362 ; genLabel
                                    363 ;	-----------------------------------------
                                    364 ;	 function UART3_RX_IRQHandler
                                    365 ;	-----------------------------------------
                                    366 ;	Register assignment is optimal.
                                    367 ;	Stack space usage: 0 bytes.
      008629                        368 _UART3_RX_IRQHandler:
                                    369 ;	src/stm8s_it.c: 407: }
                                    370 ; genLabel
      008629                        371 00101$:
                                    372 ; genEndFunction
      008629 80               [11]  373 	iret
                                    374 ;	src/stm8s_it.c: 416: INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
                                    375 ; genLabel
                                    376 ;	-----------------------------------------
                                    377 ;	 function ADC2_IRQHandler
                                    378 ;	-----------------------------------------
                                    379 ;	Register assignment is optimal.
                                    380 ;	Stack space usage: 0 bytes.
      00862A                        381 _ADC2_IRQHandler:
                                    382 ;	src/stm8s_it.c: 422: return;
                                    383 ; genReturn
                                    384 ; genLabel
      00862A                        385 00101$:
                                    386 ;	src/stm8s_it.c: 424: }
                                    387 ; genEndFunction
      00862A 80               [11]  388 	iret
                                    389 ;	src/stm8s_it.c: 473: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    390 ; genLabel
                                    391 ;	-----------------------------------------
                                    392 ;	 function TIM4_UPD_OVF_IRQHandler
                                    393 ;	-----------------------------------------
                                    394 ;	Register assignment might be sub-optimal.
                                    395 ;	Stack space usage: 0 bytes.
      00862B                        396 _TIM4_UPD_OVF_IRQHandler:
                                    397 ;	Reset bit 6 of reg CC. Hardware bug workaround.
      00862B 62               [ 2]  398 	div	x, a
                                    399 ;	src/stm8s_it.c: 475: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
                                    400 ; genSend
      00862C A6 01            [ 1]  401 	ld	a, #0x01
                                    402 ; genCall
      00862E CD 8B 24         [ 4]  403 	call	_TIM4_ClearFlag
                                    404 ;	src/stm8s_it.c: 476: miliseconds++;
                                    405 ; genAssign
      008631 CE 00 03         [ 2]  406 	ldw	x, _miliseconds+2
      008634 90 CE 00 01      [ 2]  407 	ldw	y, _miliseconds+0
                                    408 ; genPlus
      008638 5C               [ 1]  409 	incw	x
      008639 26 02            [ 1]  410 	jrne	00103$
      00863B 90 5C            [ 1]  411 	incw	y
      00863D                        412 00103$:
                                    413 ; genAssign
      00863D CF 00 03         [ 2]  414 	ldw	_miliseconds+2, x
      008640 90 CF 00 01      [ 2]  415 	ldw	_miliseconds+0, y
                                    416 ; genLabel
      008644                        417 00101$:
                                    418 ;	src/stm8s_it.c: 477: }
                                    419 ; genEndFunction
      008644 80               [11]  420 	iret
                                    421 ;	src/stm8s_it.c: 485: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
                                    422 ; genLabel
                                    423 ;	-----------------------------------------
                                    424 ;	 function EEPROM_EEC_IRQHandler
                                    425 ;	-----------------------------------------
                                    426 ;	Register assignment is optimal.
                                    427 ;	Stack space usage: 0 bytes.
      008645                        428 _EEPROM_EEC_IRQHandler:
                                    429 ;	src/stm8s_it.c: 490: }
                                    430 ; genLabel
      008645                        431 00101$:
                                    432 ; genEndFunction
      008645 80               [11]  433 	iret
                                    434 	.area CODE
                                    435 	.area CONST
                                    436 	.area INITIALIZER
                                    437 	.area CABS (ABS)
