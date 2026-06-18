                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _uart1_puts
                                     13 	.globl _init_uart1
                                     14 	.globl _milis
                                     15 	.globl _init_milis
                                     16 	.globl _GPIO_ReadInputPin
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_WriteReverse
                                     19 	.globl _GPIO_WriteLow
                                     20 	.globl _GPIO_WriteHigh
                                     21 	.globl _GPIO_Write
                                     22 	.globl _GPIO_Init
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _sprintf
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DATA
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area INITIALIZED
                                     33 ;--------------------------------------------------------
                                     34 ; Stack segment in internal ram
                                     35 ;--------------------------------------------------------
                                     36 	.area SSEG
      009335                         37 __start__stack:
      009335                         38 	.ds	1
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; absolute external ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DABS (ABS)
                                     44 
                                     45 ; default segment ordering for linker
                                     46 	.area HOME
                                     47 	.area GSINIT
                                     48 	.area GSFINAL
                                     49 	.area CONST
                                     50 	.area INITIALIZER
                                     51 	.area CODE
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; interrupt vector
                                     55 ;--------------------------------------------------------
                                     56 	.area HOME
      008000                         57 __interrupt_vect:
      008000 82 00 80 6F             58 	int s_GSINIT ; reset
      008004 82 00 86 13             59 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 14             60 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 15             61 	int _AWU_IRQHandler ; int1
      008010 82 00 86 16             62 	int _CLK_IRQHandler ; int2
      008014 82 00 86 17             63 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 18             64 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 19             65 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 86 1A             66 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 86 1B             67 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 86 1C             68 	int _CAN_RX_IRQHandler ; int8
      00802C 82 00 86 1D             69 	int _CAN_TX_IRQHandler ; int9
      008030 82 00 86 1E             70 	int _SPI_IRQHandler ; int10
      008034 82 00 86 1F             71 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 86 20             72 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 86 21             73 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 86 22             74 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 86 23             75 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 86 24             76 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 86 25             77 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 86 26             78 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 86 27             79 	int _I2C_IRQHandler ; int19
      008058 82 00 86 28             80 	int _UART3_TX_IRQHandler ; int20
      00805C 82 00 86 29             81 	int _UART3_RX_IRQHandler ; int21
      008060 82 00 86 2A             82 	int _ADC2_IRQHandler ; int22
      008064 82 00 86 2B             83 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 86 45             84 	int _EEPROM_EEC_IRQHandler ; int24
                                     85 ;--------------------------------------------------------
                                     86 ; global & static initialisations
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
                                     89 	.area GSINIT
                                     90 	.area GSFINAL
                                     91 	.area GSINIT
      00806F CD 89 57         [ 4]   92 	call	___sdcc_external_startup
      008072 4D               [ 1]   93 	tnz	a
      008073 27 03            [ 1]   94 	jreq	__sdcc_init_data
      008075 CC 80 6C         [ 2]   95 	jp	__sdcc_program_startup
      008078                         96 __sdcc_init_data:
                                     97 ; stm8_genXINIT() start
      008078 AE 00 00         [ 2]   98 	ldw x, #l_DATA
      00807B 27 07            [ 1]   99 	jreq	00002$
      00807D                        100 00001$:
      00807D 72 4F 00 00      [ 1]  101 	clr (s_DATA - 1, x)
      008081 5A               [ 2]  102 	decw x
      008082 26 F9            [ 1]  103 	jrne	00001$
      008084                        104 00002$:
      008084 AE 00 04         [ 2]  105 	ldw	x, #l_INITIALIZER
      008087 27 09            [ 1]  106 	jreq	00004$
      008089                        107 00003$:
      008089 D6 80 CF         [ 1]  108 	ld	a, (s_INITIALIZER - 1, x)
      00808C D7 00 00         [ 1]  109 	ld	(s_INITIALIZED - 1, x), a
      00808F 5A               [ 2]  110 	decw	x
      008090 26 F7            [ 1]  111 	jrne	00003$
      008092                        112 00004$:
                                    113 ; stm8_genXINIT() end
                                    114 	.area GSFINAL
      008092 CC 80 6C         [ 2]  115 	jp	__sdcc_program_startup
                                    116 ;--------------------------------------------------------
                                    117 ; Home
                                    118 ;--------------------------------------------------------
                                    119 	.area HOME
                                    120 	.area HOME
      00806C                        121 __sdcc_program_startup:
      00806C CC 82 9D         [ 2]  122 	jp	_main
                                    123 ;	return from main will return to caller
                                    124 ;--------------------------------------------------------
                                    125 ; code
                                    126 ;--------------------------------------------------------
                                    127 	.area CODE
                                    128 ;	src/main.c: 34: static void seg7_show(uint8_t digit, bool blank)
                                    129 ; genLabel
                                    130 ;	-----------------------------------------
                                    131 ;	 function seg7_show
                                    132 ;	-----------------------------------------
                                    133 ;	Register assignment might be sub-optimal.
                                    134 ;	Stack space usage: 2 bytes.
      00819B                        135 _seg7_show:
      00819B 89               [ 2]  136 	pushw	x
                                    137 ; genReceive
                                    138 ;	src/main.c: 36: uint8_t p = blank ? 0 : SEG7[digit % 10];
                                    139 ; genIfx
      00819C 0D 05            [ 1]  140 	tnz	(0x05, sp)
      00819E 26 03            [ 1]  141 	jrne	00177$
      0081A0 CC 81 A7         [ 2]  142 	jp	00119$
      0081A3                        143 00177$:
                                    144 ; genAssign
      0081A3 4F               [ 1]  145 	clr	a
                                    146 ; genGoto
      0081A4 CC 81 B4         [ 2]  147 	jp	00120$
                                    148 ; genLabel
      0081A7                        149 00119$:
                                    150 ; skipping iCode since result will be rematerialized
                                    151 ; genCast
                                    152 ; genAssign
      0081A7 5F               [ 1]  153 	clrw	x
                                    154 ; genIPush
      0081A8 4B 0A            [ 1]  155 	push	#0x0a
      0081AA 4B 00            [ 1]  156 	push	#0x00
                                    157 ; genSend
      0081AC 97               [ 1]  158 	ld	xl, a
                                    159 ; genCall
      0081AD CD 8A 90         [ 4]  160 	call	__modsint
                                    161 ; genPlus
      0081B0 1C 80 95         [ 2]  162 	addw	x, #(_SEG7+0)
                                    163 ; genPointerGet
      0081B3 F6               [ 1]  164 	ld	a, (x)
                                    165 ; genCast
                                    166 ; genAssign
                                    167 ; genCast
                                    168 ; genAssign
                                    169 ; genLabel
      0081B4                        170 00120$:
                                    171 ; genCast
                                    172 ; genAssign
                                    173 ; genCast
                                    174 ; genAssign
      0081B4 6B 01            [ 1]  175 	ld	(0x01, sp), a
                                    176 ;	src/main.c: 40: uint8_t valC = 0;
                                    177 ; genAssign
      0081B6 5F               [ 1]  178 	clrw	x
                                    179 ;	src/main.c: 42: if (p & 0x01) valC |= SEG_A;
                                    180 ; genAnd
      0081B7 7B 01            [ 1]  181 	ld	a, (0x01, sp)
      0081B9 44               [ 1]  182 	srl	a
      0081BA 25 03            [ 1]  183 	jrc	00178$
      0081BC CC 81 C2         [ 2]  184 	jp	00102$
      0081BF                        185 00178$:
                                    186 ; skipping generated iCode
                                    187 ; genAssign
      0081BF A6 08            [ 1]  188 	ld	a, #0x08
      0081C1 95               [ 1]  189 	ld	xh, a
                                    190 ; genLabel
      0081C2                        191 00102$:
                                    192 ;	src/main.c: 43: if (p & 0x02) valC |= SEG_B;
                                    193 ; genAnd
      0081C2 7B 01            [ 1]  194 	ld	a, (0x01, sp)
      0081C4 A5 02            [ 1]  195 	bcp	a, #0x02
      0081C6 26 03            [ 1]  196 	jrne	00179$
      0081C8 CC 81 CF         [ 2]  197 	jp	00104$
      0081CB                        198 00179$:
                                    199 ; skipping generated iCode
                                    200 ; genOr
      0081CB 9E               [ 1]  201 	ld	a, xh
      0081CC AA 10            [ 1]  202 	or	a, #0x10
      0081CE 95               [ 1]  203 	ld	xh, a
                                    204 ; genLabel
      0081CF                        205 00104$:
                                    206 ;	src/main.c: 44: if (p & 0x04) valC |= SEG_C;
                                    207 ; genAnd
      0081CF 7B 01            [ 1]  208 	ld	a, (0x01, sp)
      0081D1 A5 04            [ 1]  209 	bcp	a, #0x04
      0081D3 26 03            [ 1]  210 	jrne	00180$
      0081D5 CC 81 DC         [ 2]  211 	jp	00106$
      0081D8                        212 00180$:
                                    213 ; skipping generated iCode
                                    214 ; genOr
      0081D8 9E               [ 1]  215 	ld	a, xh
      0081D9 AA 20            [ 1]  216 	or	a, #0x20
      0081DB 95               [ 1]  217 	ld	xh, a
                                    218 ; genLabel
      0081DC                        219 00106$:
                                    220 ;	src/main.c: 45: if (p & 0x08) valC |= SEG_D;
                                    221 ; genAnd
      0081DC 7B 01            [ 1]  222 	ld	a, (0x01, sp)
      0081DE A5 08            [ 1]  223 	bcp	a, #0x08
      0081E0 26 03            [ 1]  224 	jrne	00181$
      0081E2 CC 81 E9         [ 2]  225 	jp	00108$
      0081E5                        226 00181$:
                                    227 ; skipping generated iCode
                                    228 ; genOr
      0081E5 9E               [ 1]  229 	ld	a, xh
      0081E6 AA 40            [ 1]  230 	or	a, #0x40
      0081E8 95               [ 1]  231 	ld	xh, a
                                    232 ; genLabel
      0081E9                        233 00108$:
                                    234 ;	src/main.c: 46: if (p & 0x10) valC |= SEG_E;
                                    235 ; genAnd
      0081E9 7B 01            [ 1]  236 	ld	a, (0x01, sp)
      0081EB A5 10            [ 1]  237 	bcp	a, #0x10
      0081ED 26 03            [ 1]  238 	jrne	00182$
      0081EF CC 81 F5         [ 2]  239 	jp	00110$
      0081F2                        240 00182$:
                                    241 ; skipping generated iCode
                                    242 ; genOr
      0081F2 58               [ 2]  243 	sllw	x
      0081F3 99               [ 1]  244 	scf
      0081F4 56               [ 2]  245 	rrcw	x
                                    246 ; genLabel
      0081F5                        247 00110$:
                                    248 ;	src/main.c: 49: (GPIO_ReadOutputData(SEG_PORT_C) & ~maskC) | (valC ^ maskC));
                                    249 ; genSend
      0081F5 89               [ 2]  250 	pushw	x
      0081F6 AE 50 0A         [ 2]  251 	ldw	x, #0x500a
                                    252 ; genCall
      0081F9 CD 89 8A         [ 4]  253 	call	_GPIO_ReadOutputData
      0081FC 6B 04            [ 1]  254 	ld	(0x04, sp), a
      0081FE 02               [ 1]  255 	rlwa	x
      0081FF 84               [ 1]  256 	pop	a
      008200 01               [ 1]  257 	rrwa	x
      008201 5B 01            [ 2]  258 	addw	sp, #1
                                    259 ; genCpl
      008203 A6 FF            [ 1]  260 	ld	a, #0xff
      008205 A8 F8            [ 1]  261 	xor	a, #0xf8
                                    262 ; genAnd
      008207 14 02            [ 1]  263 	and	a, (0x02, sp)
      008209 6B 02            [ 1]  264 	ld	(0x02, sp), a
                                    265 ; genXor
      00820B 9E               [ 1]  266 	ld	a, xh
      00820C A8 F8            [ 1]  267 	xor	a, #0xf8
                                    268 ; genOr
      00820E 1A 02            [ 1]  269 	or	a, (0x02, sp)
                                    270 ;	src/main.c: 48: GPIO_Write(SEG_PORT_C,
                                    271 ; genSend
                                    272 ; genSend
      008210 AE 50 0A         [ 2]  273 	ldw	x, #0x500a
                                    274 ; genCall
      008213 CD 8A 82         [ 4]  275 	call	_GPIO_Write
                                    276 ;	src/main.c: 52: if (p & 0x20) GPIO_WriteLow(SEG_PORT_B, SEG_F);
                                    277 ; genAnd
      008216 7B 01            [ 1]  278 	ld	a, (0x01, sp)
      008218 A5 20            [ 1]  279 	bcp	a, #0x20
      00821A 26 03            [ 1]  280 	jrne	00183$
      00821C CC 82 2A         [ 2]  281 	jp	00112$
      00821F                        282 00183$:
                                    283 ; skipping generated iCode
                                    284 ; genSend
      00821F A6 08            [ 1]  285 	ld	a, #0x08
                                    286 ; genSend
      008221 AE 50 05         [ 2]  287 	ldw	x, #0x5005
                                    288 ; genCall
      008224 CD 89 4B         [ 4]  289 	call	_GPIO_WriteLow
                                    290 ; genGoto
      008227 CC 82 32         [ 2]  291 	jp	00113$
                                    292 ; genLabel
      00822A                        293 00112$:
                                    294 ;	src/main.c: 53: else GPIO_WriteHigh(SEG_PORT_B, SEG_F);
                                    295 ; genSend
      00822A A6 08            [ 1]  296 	ld	a, #0x08
                                    297 ; genSend
      00822C AE 50 05         [ 2]  298 	ldw	x, #0x5005
                                    299 ; genCall
      00822F CD 8A 79         [ 4]  300 	call	_GPIO_WriteHigh
                                    301 ; genLabel
      008232                        302 00113$:
                                    303 ;	src/main.c: 55: if (p & 0x40) GPIO_WriteLow(SEG_PORT_B, SEG_G);
                                    304 ; genAnd
      008232 7B 01            [ 1]  305 	ld	a, (0x01, sp)
      008234 A5 40            [ 1]  306 	bcp	a, #0x40
      008236 26 03            [ 1]  307 	jrne	00184$
      008238 CC 82 46         [ 2]  308 	jp	00115$
      00823B                        309 00184$:
                                    310 ; skipping generated iCode
                                    311 ; genSend
      00823B A6 01            [ 1]  312 	ld	a, #0x01
                                    313 ; genSend
      00823D AE 50 05         [ 2]  314 	ldw	x, #0x5005
                                    315 ; genCall
      008240 CD 89 4B         [ 4]  316 	call	_GPIO_WriteLow
                                    317 ; genGoto
      008243 CC 82 4E         [ 2]  318 	jp	00117$
                                    319 ; genLabel
      008246                        320 00115$:
                                    321 ;	src/main.c: 56: else GPIO_WriteHigh(SEG_PORT_B, SEG_G);
                                    322 ; genSend
      008246 A6 01            [ 1]  323 	ld	a, #0x01
                                    324 ; genSend
      008248 AE 50 05         [ 2]  325 	ldw	x, #0x5005
                                    326 ; genCall
      00824B CD 8A 79         [ 4]  327 	call	_GPIO_WriteHigh
                                    328 ; genLabel
      00824E                        329 00117$:
                                    330 ;	src/main.c: 57: }
                                    331 ; genEndFunction
      00824E 85               [ 2]  332 	popw	x
      00824F 85               [ 2]  333 	popw	x
      008250 84               [ 1]  334 	pop	a
      008251 FC               [ 2]  335 	jp	(x)
                                    336 ;	src/main.c: 59: static void hw_init(void)
                                    337 ; genLabel
                                    338 ;	-----------------------------------------
                                    339 ;	 function hw_init
                                    340 ;	-----------------------------------------
                                    341 ;	Register assignment is optimal.
                                    342 ;	Stack space usage: 0 bytes.
      008252                        343 _hw_init:
                                    344 ;	src/main.c: 61: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
                                    345 ; genSend
      008252 4F               [ 1]  346 	clr	a
                                    347 ; genCall
      008253 CD 89 75         [ 4]  348 	call	_CLK_HSIPrescalerConfig
                                    349 ;	src/main.c: 62: init_milis();
                                    350 ; genCall
      008256 CD 85 F2         [ 4]  351 	call	_init_milis
                                    352 ;	src/main.c: 63: init_uart1(115200);
                                    353 ; genIPush
      008259 4B 00            [ 1]  354 	push	#0x00
      00825B 4B C2            [ 1]  355 	push	#0xc2
      00825D 4B 01            [ 1]  356 	push	#0x01
      00825F 4B 00            [ 1]  357 	push	#0x00
                                    358 ; genCall
      008261 CD 86 46         [ 4]  359 	call	_init_uart1
                                    360 ;	src/main.c: 65: GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    361 ; genIPush
      008264 4B C0            [ 1]  362 	push	#0xc0
                                    363 ; genSend
      008266 A6 20            [ 1]  364 	ld	a, #0x20
                                    365 ; genSend
      008268 AE 50 05         [ 2]  366 	ldw	x, #0x5005
                                    367 ; genCall
      00826B CD 86 A1         [ 4]  368 	call	_GPIO_Init
                                    369 ;	src/main.c: 67: GPIO_Init(SEG_PORT_C,
                                    370 ; genIPush
      00826E 4B C0            [ 1]  371 	push	#0xc0
                                    372 ; genSend
      008270 A6 F8            [ 1]  373 	ld	a, #0xf8
                                    374 ; genSend
      008272 AE 50 0A         [ 2]  375 	ldw	x, #0x500a
                                    376 ; genCall
      008275 CD 86 A1         [ 4]  377 	call	_GPIO_Init
                                    378 ;	src/main.c: 71: GPIO_Init(SEG_PORT_B,
                                    379 ; genIPush
      008278 4B C0            [ 1]  380 	push	#0xc0
                                    381 ; genSend
      00827A A6 09            [ 1]  382 	ld	a, #0x09
                                    383 ; genSend
      00827C AE 50 05         [ 2]  384 	ldw	x, #0x5005
                                    385 ; genCall
      00827F CD 86 A1         [ 4]  386 	call	_GPIO_Init
                                    387 ;	src/main.c: 75: GPIO_Init(BTN_START_PORT, BTN_START_PIN, GPIO_MODE_IN_PU_NO_IT);
                                    388 ; genIPush
      008282 4B 40            [ 1]  389 	push	#0x40
                                    390 ; genSend
      008284 A6 10            [ 1]  391 	ld	a, #0x10
                                    392 ; genSend
      008286 AE 50 05         [ 2]  393 	ldw	x, #0x5005
                                    394 ; genCall
      008289 CD 86 A1         [ 4]  395 	call	_GPIO_Init
                                    396 ;	src/main.c: 76: GPIO_Init(BTN_LAP_PORT, BTN_LAP_PIN, GPIO_MODE_IN_PU_NO_IT);
                                    397 ; genIPush
      00828C 4B 40            [ 1]  398 	push	#0x40
                                    399 ; genSend
      00828E A6 80            [ 1]  400 	ld	a, #0x80
                                    401 ; genSend
      008290 AE 50 05         [ 2]  402 	ldw	x, #0x5005
                                    403 ; genCall
      008293 CD 86 A1         [ 4]  404 	call	_GPIO_Init
                                    405 ;	src/main.c: 78: seg7_show(0, false);
                                    406 ; genIPush
      008296 4B 00            [ 1]  407 	push	#0x00
                                    408 ; genSend
      008298 4F               [ 1]  409 	clr	a
                                    410 ; genCall
      008299 CD 81 9B         [ 4]  411 	call	_seg7_show
                                    412 ; genLabel
      00829C                        413 00101$:
                                    414 ;	src/main.c: 79: }
                                    415 ; genEndFunction
      00829C 81               [ 4]  416 	ret
                                    417 ;	src/main.c: 81: int main(void)
                                    418 ; genLabel
                                    419 ;	-----------------------------------------
                                    420 ;	 function main
                                    421 ;	-----------------------------------------
                                    422 ;	Register assignment might be sub-optimal.
                                    423 ;	Stack space usage: 93 bytes.
      00829D                        424 _main:
      00829D 52 5D            [ 2]  425 	sub	sp, #93
                                    426 ;	src/main.c: 83: hw_init();
                                    427 ; genCall
      00829F CD 82 52         [ 4]  428 	call	_hw_init
                                    429 ;	src/main.c: 85: bool running = false;
                                    430 ; genAssign
      0082A2 0F 2D            [ 1]  431 	clr	(0x2d, sp)
                                    432 ;	src/main.c: 86: uint32_t start_tick = 0;
                                    433 ; genAssign
      0082A4 5F               [ 1]  434 	clrw	x
      0082A5 1F 30            [ 2]  435 	ldw	(0x30, sp), x
      0082A7 1F 2E            [ 2]  436 	ldw	(0x2e, sp), x
                                    437 ;	src/main.c: 87: uint32_t elapsed = 0;
                                    438 ; genAssign
      0082A9 5F               [ 1]  439 	clrw	x
      0082AA 1F 34            [ 2]  440 	ldw	(0x34, sp), x
      0082AC 1F 32            [ 2]  441 	ldw	(0x32, sp), x
                                    442 ;	src/main.c: 88: uint32_t lap = 0;
                                    443 ; genAssign
      0082AE 5F               [ 1]  444 	clrw	x
      0082AF 1F 38            [ 2]  445 	ldw	(0x38, sp), x
      0082B1 1F 36            [ 2]  446 	ldw	(0x36, sp), x
                                    447 ;	src/main.c: 89: bool lap_active = false;
                                    448 ; genAssign
      0082B3 0F 3A            [ 1]  449 	clr	(0x3a, sp)
                                    450 ;	src/main.c: 90: uint32_t lap_end = 0;
                                    451 ; genAssign
      0082B5 5F               [ 1]  452 	clrw	x
      0082B6 1F 3D            [ 2]  453 	ldw	(0x3d, sp), x
      0082B8 1F 3B            [ 2]  454 	ldw	(0x3b, sp), x
                                    455 ;	src/main.c: 92: uint32_t led_tick = 0;
                                    456 ; genAssign
      0082BA 5F               [ 1]  457 	clrw	x
      0082BB 1F 41            [ 2]  458 	ldw	(0x41, sp), x
      0082BD 1F 3F            [ 2]  459 	ldw	(0x3f, sp), x
                                    460 ;	src/main.c: 93: uint32_t uart_tick = 0;
                                    461 ; genAssign
      0082BF 5F               [ 1]  462 	clrw	x
      0082C0 1F 45            [ 2]  463 	ldw	(0x45, sp), x
      0082C2 1F 43            [ 2]  464 	ldw	(0x43, sp), x
                                    465 ;	src/main.c: 94: uint32_t blink_tick = 0;
                                    466 ; genAssign
      0082C4 5F               [ 1]  467 	clrw	x
      0082C5 1F 49            [ 2]  468 	ldw	(0x49, sp), x
      0082C7 1F 47            [ 2]  469 	ldw	(0x47, sp), x
                                    470 ;	src/main.c: 95: bool blink_on = true;
                                    471 ; genAssign
      0082C9 A6 01            [ 1]  472 	ld	a, #0x01
      0082CB 6B 5D            [ 1]  473 	ld	(0x5d, sp), a
                                    474 ;	src/main.c: 97: bool btn_s_prev = false, btn_l_prev = false;
                                    475 ; genAssign
      0082CD 0F 4B            [ 1]  476 	clr	(0x4b, sp)
                                    477 ; genAssign
      0082CF 0F 4C            [ 1]  478 	clr	(0x4c, sp)
                                    479 ;	src/main.c: 98: uint32_t btn_s_t = 0, btn_l_t = 0;
                                    480 ; genAssign
      0082D1 5F               [ 1]  481 	clrw	x
      0082D2 1F 4F            [ 2]  482 	ldw	(0x4f, sp), x
      0082D4 1F 4D            [ 2]  483 	ldw	(0x4d, sp), x
                                    484 ; genAssign
      0082D6 5F               [ 1]  485 	clrw	x
      0082D7 1F 53            [ 2]  486 	ldw	(0x53, sp), x
      0082D9 1F 51            [ 2]  487 	ldw	(0x51, sp), x
                                    488 ;	src/main.c: 101: while (1) {
                                    489 ; genLabel
      0082DB                        490 00134$:
                                    491 ;	src/main.c: 102: uint32_t now = milis();
                                    492 ; genCall
      0082DB CD 85 D2         [ 4]  493 	call	_milis
      0082DE 1F 57            [ 2]  494 	ldw	(0x57, sp), x
      0082E0 17 55            [ 2]  495 	ldw	(0x55, sp), y
                                    496 ;	src/main.c: 104: bool s = (GPIO_ReadInputPin(BTN_START_PORT, BTN_START_PIN) == RESET);
                                    497 ; genSend
      0082E2 A6 10            [ 1]  498 	ld	a, #0x10
                                    499 ; genSend
      0082E4 AE 50 05         [ 2]  500 	ldw	x, #0x5005
                                    501 ; genCall
      0082E7 CD 87 B4         [ 4]  502 	call	_GPIO_ReadInputPin
                                    503 ; genNot
      0082EA A8 01            [ 1]  504 	xor	a, #0x01
      0082EC 6B 59            [ 1]  505 	ld	(0x59, sp), a
                                    506 ;	src/main.c: 105: bool l = (GPIO_ReadInputPin(BTN_LAP_PORT, BTN_LAP_PIN) == RESET);
                                    507 ; genSend
      0082EE A6 80            [ 1]  508 	ld	a, #0x80
                                    509 ; genSend
      0082F0 AE 50 05         [ 2]  510 	ldw	x, #0x5005
                                    511 ; genCall
      0082F3 CD 87 B4         [ 4]  512 	call	_GPIO_ReadInputPin
                                    513 ; genNot
      0082F6 A8 01            [ 1]  514 	xor	a, #0x01
      0082F8 6B 5A            [ 1]  515 	ld	(0x5a, sp), a
                                    516 ;	src/main.c: 107: bool s_edge = s && !btn_s_prev && (now - btn_s_t > 20);
                                    517 ; genIfx
      0082FA 0D 59            [ 1]  518 	tnz	(0x59, sp)
      0082FC 26 03            [ 1]  519 	jrne	00297$
      0082FE CC 83 2B         [ 2]  520 	jp	00138$
      008301                        521 00297$:
                                    522 ; genIfx
      008301 0D 4B            [ 1]  523 	tnz	(0x4b, sp)
      008303 27 03            [ 1]  524 	jreq	00298$
      008305 CC 83 2B         [ 2]  525 	jp	00138$
      008308                        526 00298$:
                                    527 ; genMinus
      008308 1E 57            [ 2]  528 	ldw	x, (0x57, sp)
      00830A 72 F0 4F         [ 2]  529 	subw	x, (0x4f, sp)
      00830D 1F 03            [ 2]  530 	ldw	(0x03, sp), x
      00830F 7B 56            [ 1]  531 	ld	a, (0x56, sp)
      008311 12 4E            [ 1]  532 	sbc	a, (0x4e, sp)
      008313 6B 02            [ 1]  533 	ld	(0x02, sp), a
      008315 7B 55            [ 1]  534 	ld	a, (0x55, sp)
      008317 12 4D            [ 1]  535 	sbc	a, (0x4d, sp)
      008319 6B 01            [ 1]  536 	ld	(0x01, sp), a
                                    537 ; genCmp
                                    538 ; genCmpTnz
      00831B AE 00 14         [ 2]  539 	ldw	x, #0x0014
      00831E 13 03            [ 2]  540 	cpw	x, (0x03, sp)
      008320 4F               [ 1]  541 	clr	a
      008321 12 02            [ 1]  542 	sbc	a, (0x02, sp)
      008323 4F               [ 1]  543 	clr	a
      008324 12 01            [ 1]  544 	sbc	a, (0x01, sp)
      008326 24 03            [ 1]  545 	jrnc	00299$
      008328 CC 83 2F         [ 2]  546 	jp	00139$
      00832B                        547 00299$:
                                    548 ; skipping generated iCode
                                    549 ; genLabel
      00832B                        550 00138$:
                                    551 ; genAssign
      00832B 4F               [ 1]  552 	clr	a
                                    553 ; genGoto
      00832C CC 83 31         [ 2]  554 	jp	00140$
                                    555 ; genLabel
      00832F                        556 00139$:
                                    557 ; genAssign
      00832F A6 01            [ 1]  558 	ld	a, #0x01
                                    559 ; genLabel
      008331                        560 00140$:
                                    561 ; genAssign
      008331 6B 5B            [ 1]  562 	ld	(0x5b, sp), a
                                    563 ;	src/main.c: 108: bool l_edge = l && !btn_l_prev && (now - btn_l_t > 20);
                                    564 ; genIfx
      008333 0D 5A            [ 1]  565 	tnz	(0x5a, sp)
      008335 26 03            [ 1]  566 	jrne	00300$
      008337 CC 83 64         [ 2]  567 	jp	00144$
      00833A                        568 00300$:
                                    569 ; genIfx
      00833A 0D 4C            [ 1]  570 	tnz	(0x4c, sp)
      00833C 27 03            [ 1]  571 	jreq	00301$
      00833E CC 83 64         [ 2]  572 	jp	00144$
      008341                        573 00301$:
                                    574 ; genMinus
      008341 1E 57            [ 2]  575 	ldw	x, (0x57, sp)
      008343 72 F0 53         [ 2]  576 	subw	x, (0x53, sp)
      008346 1F 03            [ 2]  577 	ldw	(0x03, sp), x
      008348 7B 56            [ 1]  578 	ld	a, (0x56, sp)
      00834A 12 52            [ 1]  579 	sbc	a, (0x52, sp)
      00834C 6B 02            [ 1]  580 	ld	(0x02, sp), a
      00834E 7B 55            [ 1]  581 	ld	a, (0x55, sp)
      008350 12 51            [ 1]  582 	sbc	a, (0x51, sp)
      008352 6B 01            [ 1]  583 	ld	(0x01, sp), a
                                    584 ; genCmp
                                    585 ; genCmpTnz
      008354 AE 00 14         [ 2]  586 	ldw	x, #0x0014
      008357 13 03            [ 2]  587 	cpw	x, (0x03, sp)
      008359 4F               [ 1]  588 	clr	a
      00835A 12 02            [ 1]  589 	sbc	a, (0x02, sp)
      00835C 4F               [ 1]  590 	clr	a
      00835D 12 01            [ 1]  591 	sbc	a, (0x01, sp)
      00835F 24 03            [ 1]  592 	jrnc	00302$
      008361 CC 83 68         [ 2]  593 	jp	00145$
      008364                        594 00302$:
                                    595 ; skipping generated iCode
                                    596 ; genLabel
      008364                        597 00144$:
                                    598 ; genAssign
      008364 4F               [ 1]  599 	clr	a
                                    600 ; genGoto
      008365 CC 83 6A         [ 2]  601 	jp	00146$
                                    602 ; genLabel
      008368                        603 00145$:
                                    604 ; genAssign
      008368 A6 01            [ 1]  605 	ld	a, #0x01
                                    606 ; genLabel
      00836A                        607 00146$:
                                    608 ; genAssign
      00836A 6B 5C            [ 1]  609 	ld	(0x5c, sp), a
                                    610 ;	src/main.c: 110: if (!s) btn_s_prev = false;
                                    611 ; genIfx
      00836C 0D 59            [ 1]  612 	tnz	(0x59, sp)
      00836E 27 03            [ 1]  613 	jreq	00303$
      008370 CC 83 78         [ 2]  614 	jp	00104$
      008373                        615 00303$:
                                    616 ; genAssign
      008373 0F 4B            [ 1]  617 	clr	(0x4b, sp)
                                    618 ; genGoto
      008375 CC 83 8B         [ 2]  619 	jp	00105$
                                    620 ; genLabel
      008378                        621 00104$:
                                    622 ;	src/main.c: 111: else if (s_edge) { btn_s_prev = true; btn_s_t = now; }
                                    623 ; genIfx
      008378 0D 5B            [ 1]  624 	tnz	(0x5b, sp)
      00837A 26 03            [ 1]  625 	jrne	00304$
      00837C CC 83 8B         [ 2]  626 	jp	00105$
      00837F                        627 00304$:
                                    628 ; genAssign
      00837F A6 01            [ 1]  629 	ld	a, #0x01
      008381 6B 4B            [ 1]  630 	ld	(0x4b, sp), a
                                    631 ; genAssign
      008383 16 57            [ 2]  632 	ldw	y, (0x57, sp)
      008385 17 4F            [ 2]  633 	ldw	(0x4f, sp), y
      008387 16 55            [ 2]  634 	ldw	y, (0x55, sp)
      008389 17 4D            [ 2]  635 	ldw	(0x4d, sp), y
                                    636 ; genLabel
      00838B                        637 00105$:
                                    638 ;	src/main.c: 113: if (!l) btn_l_prev = false;
                                    639 ; genIfx
      00838B 0D 5A            [ 1]  640 	tnz	(0x5a, sp)
      00838D 27 03            [ 1]  641 	jreq	00305$
      00838F CC 83 97         [ 2]  642 	jp	00109$
      008392                        643 00305$:
                                    644 ; genAssign
      008392 0F 4C            [ 1]  645 	clr	(0x4c, sp)
                                    646 ; genGoto
      008394 CC 83 AA         [ 2]  647 	jp	00110$
                                    648 ; genLabel
      008397                        649 00109$:
                                    650 ;	src/main.c: 114: else if (l_edge) { btn_l_prev = true; btn_l_t = now; }
                                    651 ; genIfx
      008397 0D 5C            [ 1]  652 	tnz	(0x5c, sp)
      008399 26 03            [ 1]  653 	jrne	00306$
      00839B CC 83 AA         [ 2]  654 	jp	00110$
      00839E                        655 00306$:
                                    656 ; genAssign
      00839E A6 01            [ 1]  657 	ld	a, #0x01
      0083A0 6B 4C            [ 1]  658 	ld	(0x4c, sp), a
                                    659 ; genAssign
      0083A2 16 57            [ 2]  660 	ldw	y, (0x57, sp)
      0083A4 17 53            [ 2]  661 	ldw	(0x53, sp), y
      0083A6 16 55            [ 2]  662 	ldw	y, (0x55, sp)
      0083A8 17 51            [ 2]  663 	ldw	(0x51, sp), y
                                    664 ; genLabel
      0083AA                        665 00110$:
                                    666 ;	src/main.c: 116: if (s_edge) {
                                    667 ; genIfx
      0083AA 0D 5B            [ 1]  668 	tnz	(0x5b, sp)
      0083AC 26 03            [ 1]  669 	jrne	00307$
      0083AE CC 83 F3         [ 2]  670 	jp	00115$
      0083B1                        671 00307$:
                                    672 ;	src/main.c: 117: if (!running) {
                                    673 ; genIfx
      0083B1 0D 2D            [ 1]  674 	tnz	(0x2d, sp)
      0083B3 27 03            [ 1]  675 	jreq	00308$
      0083B5 CC 83 D2         [ 2]  676 	jp	00112$
      0083B8                        677 00308$:
                                    678 ;	src/main.c: 118: start_tick = now - elapsed;
                                    679 ; genMinus
      0083B8 1E 57            [ 2]  680 	ldw	x, (0x57, sp)
      0083BA 72 F0 34         [ 2]  681 	subw	x, (0x34, sp)
      0083BD 1F 30            [ 2]  682 	ldw	(0x30, sp), x
      0083BF 7B 56            [ 1]  683 	ld	a, (0x56, sp)
      0083C1 12 33            [ 1]  684 	sbc	a, (0x33, sp)
      0083C3 6B 2F            [ 1]  685 	ld	(0x2f, sp), a
      0083C5 7B 55            [ 1]  686 	ld	a, (0x55, sp)
      0083C7 12 32            [ 1]  687 	sbc	a, (0x32, sp)
      0083C9 6B 2E            [ 1]  688 	ld	(0x2e, sp), a
                                    689 ;	src/main.c: 119: running = true;
                                    690 ; genAssign
      0083CB A6 01            [ 1]  691 	ld	a, #0x01
      0083CD 6B 2D            [ 1]  692 	ld	(0x2d, sp), a
                                    693 ; genGoto
      0083CF CC 83 F3         [ 2]  694 	jp	00115$
                                    695 ; genLabel
      0083D2                        696 00112$:
                                    697 ;	src/main.c: 121: elapsed = now - start_tick;
                                    698 ; genMinus
      0083D2 1E 57            [ 2]  699 	ldw	x, (0x57, sp)
      0083D4 72 F0 30         [ 2]  700 	subw	x, (0x30, sp)
      0083D7 1F 34            [ 2]  701 	ldw	(0x34, sp), x
      0083D9 7B 56            [ 1]  702 	ld	a, (0x56, sp)
      0083DB 12 2F            [ 1]  703 	sbc	a, (0x2f, sp)
      0083DD 6B 33            [ 1]  704 	ld	(0x33, sp), a
      0083DF 7B 55            [ 1]  705 	ld	a, (0x55, sp)
      0083E1 12 2E            [ 1]  706 	sbc	a, (0x2e, sp)
      0083E3 6B 32            [ 1]  707 	ld	(0x32, sp), a
                                    708 ;	src/main.c: 122: running = false;
                                    709 ; genAssign
      0083E5 0F 2D            [ 1]  710 	clr	(0x2d, sp)
                                    711 ;	src/main.c: 123: blink_tick = now;
                                    712 ; genAssign
      0083E7 16 57            [ 2]  713 	ldw	y, (0x57, sp)
      0083E9 17 49            [ 2]  714 	ldw	(0x49, sp), y
      0083EB 16 55            [ 2]  715 	ldw	y, (0x55, sp)
      0083ED 17 47            [ 2]  716 	ldw	(0x47, sp), y
                                    717 ;	src/main.c: 124: blink_on = true;
                                    718 ; genAssign
      0083EF A6 01            [ 1]  719 	ld	a, #0x01
      0083F1 6B 5D            [ 1]  720 	ld	(0x5d, sp), a
                                    721 ; genLabel
      0083F3                        722 00115$:
                                    723 ;	src/main.c: 121: elapsed = now - start_tick;
                                    724 ; genMinus
      0083F3 1E 57            [ 2]  725 	ldw	x, (0x57, sp)
      0083F5 72 F0 30         [ 2]  726 	subw	x, (0x30, sp)
      0083F8 1F 03            [ 2]  727 	ldw	(0x03, sp), x
      0083FA 7B 56            [ 1]  728 	ld	a, (0x56, sp)
      0083FC 12 2F            [ 1]  729 	sbc	a, (0x2f, sp)
      0083FE 97               [ 1]  730 	ld	xl, a
      0083FF 7B 55            [ 1]  731 	ld	a, (0x55, sp)
      008401 12 2E            [ 1]  732 	sbc	a, (0x2e, sp)
      008403 95               [ 1]  733 	ld	xh, a
                                    734 ;	src/main.c: 128: if (l_edge && running) {
                                    735 ; genIfx
      008404 0D 5C            [ 1]  736 	tnz	(0x5c, sp)
      008406 26 03            [ 1]  737 	jrne	00309$
      008408 CC 84 30         [ 2]  738 	jp	00117$
      00840B                        739 00309$:
                                    740 ; genIfx
      00840B 0D 2D            [ 1]  741 	tnz	(0x2d, sp)
      00840D 26 03            [ 1]  742 	jrne	00310$
      00840F CC 84 30         [ 2]  743 	jp	00117$
      008412                        744 00310$:
                                    745 ;	src/main.c: 129: lap = now - start_tick;
                                    746 ; genAssign
      008412 1F 36            [ 2]  747 	ldw	(0x36, sp), x
      008414 16 03            [ 2]  748 	ldw	y, (0x03, sp)
      008416 17 38            [ 2]  749 	ldw	(0x38, sp), y
                                    750 ;	src/main.c: 130: lap_active = true;
                                    751 ; genAssign
      008418 A6 01            [ 1]  752 	ld	a, #0x01
      00841A 6B 3A            [ 1]  753 	ld	(0x3a, sp), a
                                    754 ;	src/main.c: 131: lap_end = now + 2000;
                                    755 ; genPlus
      00841C 16 57            [ 2]  756 	ldw	y, (0x57, sp)
      00841E 72 A9 07 D0      [ 2]  757 	addw	y, #0x07d0
      008422 17 3D            [ 2]  758 	ldw	(0x3d, sp), y
      008424 7B 56            [ 1]  759 	ld	a, (0x56, sp)
      008426 A9 00            [ 1]  760 	adc	a, #0x00
      008428 6B 3C            [ 1]  761 	ld	(0x3c, sp), a
      00842A 7B 55            [ 1]  762 	ld	a, (0x55, sp)
      00842C A9 00            [ 1]  763 	adc	a, #0x00
      00842E 6B 3B            [ 1]  764 	ld	(0x3b, sp), a
                                    765 ; genLabel
      008430                        766 00117$:
                                    767 ;	src/main.c: 134: if (running) elapsed = now - start_tick;
                                    768 ; genIfx
      008430 0D 2D            [ 1]  769 	tnz	(0x2d, sp)
      008432 26 03            [ 1]  770 	jrne	00311$
      008434 CC 84 3D         [ 2]  771 	jp	00120$
      008437                        772 00311$:
                                    773 ; genAssign
      008437 1F 32            [ 2]  774 	ldw	(0x32, sp), x
      008439 16 03            [ 2]  775 	ldw	y, (0x03, sp)
      00843B 17 34            [ 2]  776 	ldw	(0x34, sp), y
                                    777 ; genLabel
      00843D                        778 00120$:
                                    779 ;	src/main.c: 135: if (lap_active && now >= lap_end) lap_active = false;
                                    780 ; genIfx
      00843D 0D 3A            [ 1]  781 	tnz	(0x3a, sp)
      00843F 26 03            [ 1]  782 	jrne	00312$
      008441 CC 84 57         [ 2]  783 	jp	00122$
      008444                        784 00312$:
                                    785 ; genCmp
                                    786 ; genCmpTnz
      008444 1E 57            [ 2]  787 	ldw	x, (0x57, sp)
      008446 13 3D            [ 2]  788 	cpw	x, (0x3d, sp)
      008448 7B 56            [ 1]  789 	ld	a, (0x56, sp)
      00844A 12 3C            [ 1]  790 	sbc	a, (0x3c, sp)
      00844C 7B 55            [ 1]  791 	ld	a, (0x55, sp)
      00844E 12 3B            [ 1]  792 	sbc	a, (0x3b, sp)
      008450 24 03            [ 1]  793 	jrnc	00313$
      008452 CC 84 57         [ 2]  794 	jp	00122$
      008455                        795 00313$:
                                    796 ; skipping generated iCode
                                    797 ; genAssign
      008455 0F 3A            [ 1]  798 	clr	(0x3a, sp)
                                    799 ; genLabel
      008457                        800 00122$:
                                    801 ;	src/main.c: 137: uint32_t disp = lap_active ? lap : elapsed;
                                    802 ; genIfx
      008457 0D 3A            [ 1]  803 	tnz	(0x3a, sp)
      008459 26 03            [ 1]  804 	jrne	00314$
      00845B CC 84 67         [ 2]  805 	jp	00150$
      00845E                        806 00314$:
                                    807 ; genAssign
      00845E 16 38            [ 2]  808 	ldw	y, (0x38, sp)
      008460 17 5B            [ 2]  809 	ldw	(0x5b, sp), y
      008462 16 36            [ 2]  810 	ldw	y, (0x36, sp)
                                    811 ; genGoto
      008464 CC 84 6D         [ 2]  812 	jp	00151$
                                    813 ; genLabel
      008467                        814 00150$:
                                    815 ; genAssign
      008467 16 34            [ 2]  816 	ldw	y, (0x34, sp)
      008469 17 5B            [ 2]  817 	ldw	(0x5b, sp), y
      00846B 16 32            [ 2]  818 	ldw	y, (0x32, sp)
                                    819 ; genLabel
      00846D                        820 00151$:
                                    821 ; genAssign
      00846D 1E 5B            [ 2]  822 	ldw	x, (0x5b, sp)
                                    823 ;	src/main.c: 138: uint8_t dig = (uint8_t)((disp / 1000) % 10);
                                    824 ; genIPush
      00846F 4B E8            [ 1]  825 	push	#0xe8
      008471 4B 03            [ 1]  826 	push	#0x03
      008473 4B 00            [ 1]  827 	push	#0x00
      008475 4B 00            [ 1]  828 	push	#0x00
                                    829 ; genIPush
      008477 89               [ 2]  830 	pushw	x
      008478 90 89            [ 2]  831 	pushw	y
                                    832 ; genCall
      00847A CD 88 C3         [ 4]  833 	call	__divulong
      00847D 5B 08            [ 2]  834 	addw	sp, #8
                                    835 ; genIPush
      00847F 4B 0A            [ 1]  836 	push	#0x0a
      008481 4B 00            [ 1]  837 	push	#0x00
      008483 4B 00            [ 1]  838 	push	#0x00
      008485 4B 00            [ 1]  839 	push	#0x00
                                    840 ; genIPush
      008487 89               [ 2]  841 	pushw	x
      008488 90 89            [ 2]  842 	pushw	y
                                    843 ; genCall
      00848A CD 87 C1         [ 4]  844 	call	__modulong
      00848D 5B 08            [ 2]  845 	addw	sp, #8
                                    846 ; genCast
                                    847 ; genAssign
                                    848 ;	src/main.c: 140: if (!running) {
                                    849 ; genIfx
      00848F 0D 2D            [ 1]  850 	tnz	(0x2d, sp)
      008491 27 03            [ 1]  851 	jreq	00315$
      008493 CC 84 D5         [ 2]  852 	jp	00127$
      008496                        853 00315$:
                                    854 ;	src/main.c: 141: if (now - blink_tick > 500) {
                                    855 ; genMinus
      008496 16 57            [ 2]  856 	ldw	y, (0x57, sp)
      008498 72 F2 49         [ 2]  857 	subw	y, (0x49, sp)
      00849B 17 5B            [ 2]  858 	ldw	(0x5b, sp), y
      00849D 7B 56            [ 1]  859 	ld	a, (0x56, sp)
      00849F 12 48            [ 1]  860 	sbc	a, (0x48, sp)
      0084A1 6B 5A            [ 1]  861 	ld	(0x5a, sp), a
      0084A3 7B 55            [ 1]  862 	ld	a, (0x55, sp)
      0084A5 12 47            [ 1]  863 	sbc	a, (0x47, sp)
      0084A7 6B 59            [ 1]  864 	ld	(0x59, sp), a
                                    865 ; genCmp
                                    866 ; genCmpTnz
      0084A9 A6 F4            [ 1]  867 	ld	a, #0xf4
      0084AB 11 5C            [ 1]  868 	cp	a, (0x5c, sp)
      0084AD A6 01            [ 1]  869 	ld	a, #0x01
      0084AF 12 5B            [ 1]  870 	sbc	a, (0x5b, sp)
      0084B1 4F               [ 1]  871 	clr	a
      0084B2 12 5A            [ 1]  872 	sbc	a, (0x5a, sp)
      0084B4 4F               [ 1]  873 	clr	a
      0084B5 12 59            [ 1]  874 	sbc	a, (0x59, sp)
      0084B7 25 03            [ 1]  875 	jrc	00316$
      0084B9 CC 84 C9         [ 2]  876 	jp	00125$
      0084BC                        877 00316$:
                                    878 ; skipping generated iCode
                                    879 ;	src/main.c: 142: blink_on = !blink_on;
                                    880 ; genNot
      0084BC 04 5D            [ 1]  881 	srl	(0x5d, sp)
      0084BE 8C               [ 1]  882 	ccf
      0084BF 09 5D            [ 1]  883 	rlc	(0x5d, sp)
                                    884 ;	src/main.c: 143: blink_tick = now;
                                    885 ; genAssign
      0084C1 16 57            [ 2]  886 	ldw	y, (0x57, sp)
      0084C3 17 49            [ 2]  887 	ldw	(0x49, sp), y
      0084C5 16 55            [ 2]  888 	ldw	y, (0x55, sp)
      0084C7 17 47            [ 2]  889 	ldw	(0x47, sp), y
                                    890 ; genLabel
      0084C9                        891 00125$:
                                    892 ;	src/main.c: 145: seg7_show(dig, !blink_on);
                                    893 ; genNot
      0084C9 7B 5D            [ 1]  894 	ld	a, (0x5d, sp)
      0084CB A8 01            [ 1]  895 	xor	a, #0x01
                                    896 ; genIPush
      0084CD 88               [ 1]  897 	push	a
                                    898 ; genSend
      0084CE 9F               [ 1]  899 	ld	a, xl
                                    900 ; genCall
      0084CF CD 81 9B         [ 4]  901 	call	_seg7_show
                                    902 ; genGoto
      0084D2 CC 84 DB         [ 2]  903 	jp	00128$
                                    904 ; genLabel
      0084D5                        905 00127$:
                                    906 ;	src/main.c: 147: seg7_show(dig, false);
                                    907 ; genIPush
      0084D5 4B 00            [ 1]  908 	push	#0x00
                                    909 ; genSend
      0084D7 9F               [ 1]  910 	ld	a, xl
                                    911 ; genCall
      0084D8 CD 81 9B         [ 4]  912 	call	_seg7_show
                                    913 ; genLabel
      0084DB                        914 00128$:
                                    915 ;	src/main.c: 150: if (now - led_tick > 1000) {
                                    916 ; genMinus
      0084DB 1E 57            [ 2]  917 	ldw	x, (0x57, sp)
      0084DD 72 F0 41         [ 2]  918 	subw	x, (0x41, sp)
      0084E0 1F 5B            [ 2]  919 	ldw	(0x5b, sp), x
      0084E2 7B 56            [ 1]  920 	ld	a, (0x56, sp)
      0084E4 12 40            [ 1]  921 	sbc	a, (0x40, sp)
      0084E6 6B 5A            [ 1]  922 	ld	(0x5a, sp), a
      0084E8 7B 55            [ 1]  923 	ld	a, (0x55, sp)
      0084EA 12 3F            [ 1]  924 	sbc	a, (0x3f, sp)
      0084EC 6B 59            [ 1]  925 	ld	(0x59, sp), a
                                    926 ; genCmp
                                    927 ; genCmpTnz
      0084EE AE 03 E8         [ 2]  928 	ldw	x, #0x03e8
      0084F1 13 5B            [ 2]  929 	cpw	x, (0x5b, sp)
      0084F3 4F               [ 1]  930 	clr	a
      0084F4 12 5A            [ 1]  931 	sbc	a, (0x5a, sp)
      0084F6 4F               [ 1]  932 	clr	a
      0084F7 12 59            [ 1]  933 	sbc	a, (0x59, sp)
      0084F9 25 03            [ 1]  934 	jrc	00317$
      0084FB CC 85 0E         [ 2]  935 	jp	00130$
      0084FE                        936 00317$:
                                    937 ; skipping generated iCode
                                    938 ;	src/main.c: 151: REVERSE(LED);
                                    939 ; genSend
      0084FE A6 20            [ 1]  940 	ld	a, #0x20
                                    941 ; genSend
      008500 AE 50 05         [ 2]  942 	ldw	x, #0x5005
                                    943 ; genCall
      008503 CD 87 AB         [ 4]  944 	call	_GPIO_WriteReverse
                                    945 ;	src/main.c: 152: led_tick = now;
                                    946 ; genAssign
      008506 16 57            [ 2]  947 	ldw	y, (0x57, sp)
      008508 17 41            [ 2]  948 	ldw	(0x41, sp), y
      00850A 16 55            [ 2]  949 	ldw	y, (0x55, sp)
      00850C 17 3F            [ 2]  950 	ldw	(0x3f, sp), y
                                    951 ; genLabel
      00850E                        952 00130$:
                                    953 ;	src/main.c: 155: if (now - uart_tick > 1000) {
                                    954 ; genMinus
      00850E 1E 57            [ 2]  955 	ldw	x, (0x57, sp)
      008510 72 F0 45         [ 2]  956 	subw	x, (0x45, sp)
      008513 1F 5B            [ 2]  957 	ldw	(0x5b, sp), x
      008515 7B 56            [ 1]  958 	ld	a, (0x56, sp)
      008517 12 44            [ 1]  959 	sbc	a, (0x44, sp)
      008519 6B 5A            [ 1]  960 	ld	(0x5a, sp), a
      00851B 7B 55            [ 1]  961 	ld	a, (0x55, sp)
      00851D 12 43            [ 1]  962 	sbc	a, (0x43, sp)
      00851F 6B 59            [ 1]  963 	ld	(0x59, sp), a
                                    964 ; genCmp
                                    965 ; genCmpTnz
      008521 AE 03 E8         [ 2]  966 	ldw	x, #0x03e8
      008524 13 5B            [ 2]  967 	cpw	x, (0x5b, sp)
      008526 4F               [ 1]  968 	clr	a
      008527 12 5A            [ 1]  969 	sbc	a, (0x5a, sp)
      008529 4F               [ 1]  970 	clr	a
      00852A 12 59            [ 1]  971 	sbc	a, (0x59, sp)
      00852C 25 03            [ 1]  972 	jrc	00318$
      00852E CC 82 DB         [ 2]  973 	jp	00134$
      008531                        974 00318$:
                                    975 ; skipping generated iCode
                                    976 ;	src/main.c: 158: (uint16_t)(lap / 1000), (uint8_t)((lap % 1000) / 10));
                                    977 ; genIPush
      008531 4B E8            [ 1]  978 	push	#0xe8
      008533 4B 03            [ 1]  979 	push	#0x03
      008535 5F               [ 1]  980 	clrw	x
      008536 89               [ 2]  981 	pushw	x
                                    982 ; genIPush
      008537 1E 3C            [ 2]  983 	ldw	x, (0x3c, sp)
      008539 89               [ 2]  984 	pushw	x
      00853A 1E 3C            [ 2]  985 	ldw	x, (0x3c, sp)
      00853C 89               [ 2]  986 	pushw	x
                                    987 ; genCall
      00853D CD 87 C1         [ 4]  988 	call	__modulong
      008540 5B 08            [ 2]  989 	addw	sp, #8
                                    990 ; genIPush
      008542 4B 0A            [ 1]  991 	push	#0x0a
      008544 4B 00            [ 1]  992 	push	#0x00
      008546 4B 00            [ 1]  993 	push	#0x00
      008548 4B 00            [ 1]  994 	push	#0x00
                                    995 ; genIPush
      00854A 89               [ 2]  996 	pushw	x
      00854B 90 89            [ 2]  997 	pushw	y
                                    998 ; genCall
      00854D CD 88 C3         [ 4]  999 	call	__divulong
      008550 5B 08            [ 2] 1000 	addw	sp, #8
      008552 9F               [ 1] 1001 	ld	a, xl
                                   1002 ; genCast
                                   1003 ; genAssign
                                   1004 ; genIPush
      008553 88               [ 1] 1005 	push	a
      008554 4B E8            [ 1] 1006 	push	#0xe8
      008556 4B 03            [ 1] 1007 	push	#0x03
      008558 5F               [ 1] 1008 	clrw	x
      008559 89               [ 2] 1009 	pushw	x
                                   1010 ; genIPush
      00855A 1E 3D            [ 2] 1011 	ldw	x, (0x3d, sp)
      00855C 89               [ 2] 1012 	pushw	x
      00855D 1E 3D            [ 2] 1013 	ldw	x, (0x3d, sp)
      00855F 89               [ 2] 1014 	pushw	x
                                   1015 ; genCall
      008560 CD 88 C3         [ 4] 1016 	call	__divulong
      008563 5B 08            [ 2] 1017 	addw	sp, #8
      008565 84               [ 1] 1018 	pop	a
                                   1019 ; genCast
                                   1020 ; genAssign
      008566 1F 5A            [ 2] 1021 	ldw	(0x5a, sp), x
                                   1022 ;	src/main.c: 157: (uint16_t)(elapsed / 1000), (uint8_t)((elapsed % 1000) / 10),
                                   1023 ; genIPush
      008568 88               [ 1] 1024 	push	a
      008569 4B E8            [ 1] 1025 	push	#0xe8
      00856B 4B 03            [ 1] 1026 	push	#0x03
      00856D 5F               [ 1] 1027 	clrw	x
      00856E 89               [ 2] 1028 	pushw	x
                                   1029 ; genIPush
      00856F 1E 39            [ 2] 1030 	ldw	x, (0x39, sp)
      008571 89               [ 2] 1031 	pushw	x
      008572 1E 39            [ 2] 1032 	ldw	x, (0x39, sp)
      008574 89               [ 2] 1033 	pushw	x
                                   1034 ; genCall
      008575 CD 87 C1         [ 4] 1035 	call	__modulong
      008578 5B 08            [ 2] 1036 	addw	sp, #8
      00857A 1F 46            [ 2] 1037 	ldw	(0x46, sp), x
      00857C 84               [ 1] 1038 	pop	a
                                   1039 ; genIPush
      00857D 88               [ 1] 1040 	push	a
      00857E 4B 0A            [ 1] 1041 	push	#0x0a
      008580 5F               [ 1] 1042 	clrw	x
      008581 89               [ 2] 1043 	pushw	x
      008582 4B 00            [ 1] 1044 	push	#0x00
                                   1045 ; genIPush
      008584 1E 4A            [ 2] 1046 	ldw	x, (0x4a, sp)
      008586 89               [ 2] 1047 	pushw	x
      008587 90 89            [ 2] 1048 	pushw	y
                                   1049 ; genCall
      008589 CD 88 C3         [ 4] 1050 	call	__divulong
      00858C 5B 08            [ 2] 1051 	addw	sp, #8
      00858E 84               [ 1] 1052 	pop	a
                                   1053 ; genCast
                                   1054 ; genAssign
      00858F 41               [ 1] 1055 	exg	a, xl
      008590 6B 5C            [ 1] 1056 	ld	(0x5c, sp), a
      008592 41               [ 1] 1057 	exg	a, xl
                                   1058 ; genIPush
      008593 88               [ 1] 1059 	push	a
      008594 4B E8            [ 1] 1060 	push	#0xe8
      008596 4B 03            [ 1] 1061 	push	#0x03
      008598 5F               [ 1] 1062 	clrw	x
      008599 89               [ 2] 1063 	pushw	x
                                   1064 ; genIPush
      00859A 1E 39            [ 2] 1065 	ldw	x, (0x39, sp)
      00859C 89               [ 2] 1066 	pushw	x
      00859D 1E 39            [ 2] 1067 	ldw	x, (0x39, sp)
      00859F 89               [ 2] 1068 	pushw	x
                                   1069 ; genCall
      0085A0 CD 88 C3         [ 4] 1070 	call	__divulong
      0085A3 5B 08            [ 2] 1071 	addw	sp, #8
      0085A5 84               [ 1] 1072 	pop	a
                                   1073 ; genCast
                                   1074 ; genAssign
                                   1075 ;	src/main.c: 156: sprintf(buf, "T=%u.%02us LAP=%u.%02us\r\n",
                                   1076 ; skipping iCode since result will be rematerialized
                                   1077 ; skipping iCode since result will be rematerialized
                                   1078 ; skipping iCode since result will be rematerialized
                                   1079 ; skipping iCode since result will be rematerialized
                                   1080 ; genIPush
      0085A6 88               [ 1] 1081 	push	a
                                   1082 ; genIPush
      0085A7 16 5B            [ 2] 1083 	ldw	y, (0x5b, sp)
      0085A9 90 89            [ 2] 1084 	pushw	y
                                   1085 ; genIPush
      0085AB 7B 5F            [ 1] 1086 	ld	a, (0x5f, sp)
      0085AD 88               [ 1] 1087 	push	a
                                   1088 ; genIPush
      0085AE 89               [ 2] 1089 	pushw	x
                                   1090 ; genIPush
      0085AF 4B 9F            [ 1] 1091 	push	#<(___str_0+0)
      0085B1 4B 80            [ 1] 1092 	push	#((___str_0+0) >> 8)
                                   1093 ; genIPush
      0085B3 96               [ 1] 1094 	ldw	x, sp
      0085B4 1C 00 0D         [ 2] 1095 	addw	x, #13
      0085B7 89               [ 2] 1096 	pushw	x
                                   1097 ; genCall
      0085B8 CD 88 56         [ 4] 1098 	call	_sprintf
      0085BB 5B 0A            [ 2] 1099 	addw	sp, #10
                                   1100 ;	src/main.c: 159: uart1_puts(buf);
                                   1101 ; skipping iCode since result will be rematerialized
                                   1102 ; skipping iCode since result will be rematerialized
                                   1103 ; genSend
      0085BD 96               [ 1] 1104 	ldw	x, sp
      0085BE 1C 00 05         [ 2] 1105 	addw	x, #5
                                   1106 ; genCall
      0085C1 CD 86 6D         [ 4] 1107 	call	_uart1_puts
                                   1108 ;	src/main.c: 160: uart_tick = now;
                                   1109 ; genAssign
      0085C4 16 57            [ 2] 1110 	ldw	y, (0x57, sp)
      0085C6 17 45            [ 2] 1111 	ldw	(0x45, sp), y
      0085C8 16 55            [ 2] 1112 	ldw	y, (0x55, sp)
      0085CA 17 43            [ 2] 1113 	ldw	(0x43, sp), y
                                   1114 ; genGoto
      0085CC CC 82 DB         [ 2] 1115 	jp	00134$
                                   1116 ; genLabel
      0085CF                       1117 00136$:
                                   1118 ;	src/main.c: 163: }
                                   1119 ; genEndFunction
      0085CF 5B 5D            [ 2] 1120 	addw	sp, #93
      0085D1 81               [ 4] 1121 	ret
                                   1122 	.area CODE
                                   1123 	.area CONST
      008095                       1124 _SEG7:
      008095 3F                    1125 	.db #0x3f	; 63
      008096 06                    1126 	.db #0x06	; 6
      008097 5B                    1127 	.db #0x5b	; 91
      008098 4F                    1128 	.db #0x4f	; 79	'O'
      008099 66                    1129 	.db #0x66	; 102	'f'
      00809A 6D                    1130 	.db #0x6d	; 109	'm'
      00809B 7D                    1131 	.db #0x7d	; 125
      00809C 07                    1132 	.db #0x07	; 7
      00809D 7F                    1133 	.db #0x7f	; 127
      00809E 6F                    1134 	.db #0x6f	; 111	'o'
                                   1135 	.area CONST
      00809F                       1136 ___str_0:
      00809F 54 3D 25 75 2E 25 30  1137 	.ascii "T=%u.%02us LAP=%u.%02us"
             32 75 73 20 4C 41 50
             3D 25 75 2E 25 30 32
             75 73
      0080B6 0D                    1138 	.db 0x0d
      0080B7 0A                    1139 	.db 0x0a
      0080B8 00                    1140 	.db 0x00
                                   1141 	.area CODE
                                   1142 	.area INITIALIZER
                                   1143 	.area CABS (ABS)
