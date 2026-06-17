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
      009332                         37 __start__stack:
      009332                         38 	.ds	1
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
      008004 82 00 86 10             59 	int _TRAP_IRQHandler ; trap
      008008 82 00 86 11             60 	int _TLI_IRQHandler ; int0
      00800C 82 00 86 12             61 	int _AWU_IRQHandler ; int1
      008010 82 00 86 13             62 	int _CLK_IRQHandler ; int2
      008014 82 00 86 14             63 	int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 15             64 	int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 16             65 	int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 86 17             66 	int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 86 18             67 	int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 86 19             68 	int _CAN_RX_IRQHandler ; int8
      00802C 82 00 86 1A             69 	int _CAN_TX_IRQHandler ; int9
      008030 82 00 86 1B             70 	int _SPI_IRQHandler ; int10
      008034 82 00 86 1C             71 	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 86 1D             72 	int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 86 1E             73 	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 86 1F             74 	int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 86 20             75 	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
      008048 82 00 86 21             76 	int _TIM3_CAP_COM_IRQHandler ; int16
      00804C 82 00 86 22             77 	int _UART1_TX_IRQHandler ; int17
      008050 82 00 86 23             78 	int _UART1_RX_IRQHandler ; int18
      008054 82 00 86 24             79 	int _I2C_IRQHandler ; int19
      008058 82 00 86 25             80 	int _UART3_TX_IRQHandler ; int20
      00805C 82 00 86 26             81 	int _UART3_RX_IRQHandler ; int21
      008060 82 00 86 27             82 	int _ADC2_IRQHandler ; int22
      008064 82 00 86 28             83 	int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 86 42             84 	int _EEPROM_EEC_IRQHandler ; int24
                                     85 ;--------------------------------------------------------
                                     86 ; global & static initialisations
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
                                     89 	.area GSINIT
                                     90 	.area GSFINAL
                                     91 	.area GSINIT
      00806F CD 89 54         [ 4]   92 	call	___sdcc_external_startup
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
      00806C CC 82 9A         [ 2]  122 	jp	_main
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
      0081AD CD 8A 8D         [ 4]  160 	call	__modsint
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
                                    176 ;	src/main.c: 40: uint8_t valC  = 0;
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
                                    248 ;	src/main.c: 49: (GPIO_ReadOutputData(SEG_PORT_C) & ~maskC) | valC);
                                    249 ; genSend
      0081F5 89               [ 2]  250 	pushw	x
      0081F6 AE 50 0A         [ 2]  251 	ldw	x, #0x500a
                                    252 ; genCall
      0081F9 CD 89 87         [ 4]  253 	call	_GPIO_ReadOutputData
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
                                    264 ; genOr
      008209 89               [ 2]  265 	pushw	x
      00820A 1A 01            [ 1]  266 	or	a, (1, sp)
      00820C 85               [ 2]  267 	popw	x
                                    268 ;	src/main.c: 48: GPIO_Write(SEG_PORT_C,
                                    269 ; genSend
                                    270 ; genSend
      00820D AE 50 0A         [ 2]  271 	ldw	x, #0x500a
                                    272 ; genCall
      008210 CD 8A 7F         [ 4]  273 	call	_GPIO_Write
                                    274 ;	src/main.c: 52: if (p & 0x20) GPIO_WriteHigh(SEG_PORT_B, SEG_F);
                                    275 ; genAnd
      008213 7B 01            [ 1]  276 	ld	a, (0x01, sp)
      008215 A5 20            [ 1]  277 	bcp	a, #0x20
      008217 26 03            [ 1]  278 	jrne	00183$
      008219 CC 82 27         [ 2]  279 	jp	00112$
      00821C                        280 00183$:
                                    281 ; skipping generated iCode
                                    282 ; genSend
      00821C A6 08            [ 1]  283 	ld	a, #0x08
                                    284 ; genSend
      00821E AE 50 05         [ 2]  285 	ldw	x, #0x5005
                                    286 ; genCall
      008221 CD 8A 76         [ 4]  287 	call	_GPIO_WriteHigh
                                    288 ; genGoto
      008224 CC 82 2F         [ 2]  289 	jp	00113$
                                    290 ; genLabel
      008227                        291 00112$:
                                    292 ;	src/main.c: 53: else          GPIO_WriteLow(SEG_PORT_B, SEG_F);
                                    293 ; genSend
      008227 A6 08            [ 1]  294 	ld	a, #0x08
                                    295 ; genSend
      008229 AE 50 05         [ 2]  296 	ldw	x, #0x5005
                                    297 ; genCall
      00822C CD 89 48         [ 4]  298 	call	_GPIO_WriteLow
                                    299 ; genLabel
      00822F                        300 00113$:
                                    301 ;	src/main.c: 55: if (p & 0x40) GPIO_WriteHigh(SEG_PORT_B, SEG_G);
                                    302 ; genAnd
      00822F 7B 01            [ 1]  303 	ld	a, (0x01, sp)
      008231 A5 40            [ 1]  304 	bcp	a, #0x40
      008233 26 03            [ 1]  305 	jrne	00184$
      008235 CC 82 43         [ 2]  306 	jp	00115$
      008238                        307 00184$:
                                    308 ; skipping generated iCode
                                    309 ; genSend
      008238 A6 01            [ 1]  310 	ld	a, #0x01
                                    311 ; genSend
      00823A AE 50 05         [ 2]  312 	ldw	x, #0x5005
                                    313 ; genCall
      00823D CD 8A 76         [ 4]  314 	call	_GPIO_WriteHigh
                                    315 ; genGoto
      008240 CC 82 4B         [ 2]  316 	jp	00117$
                                    317 ; genLabel
      008243                        318 00115$:
                                    319 ;	src/main.c: 56: else          GPIO_WriteLow(SEG_PORT_B, SEG_G);
                                    320 ; genSend
      008243 A6 01            [ 1]  321 	ld	a, #0x01
                                    322 ; genSend
      008245 AE 50 05         [ 2]  323 	ldw	x, #0x5005
                                    324 ; genCall
      008248 CD 89 48         [ 4]  325 	call	_GPIO_WriteLow
                                    326 ; genLabel
      00824B                        327 00117$:
                                    328 ;	src/main.c: 57: }
                                    329 ; genEndFunction
      00824B 85               [ 2]  330 	popw	x
      00824C 85               [ 2]  331 	popw	x
      00824D 84               [ 1]  332 	pop	a
      00824E FC               [ 2]  333 	jp	(x)
                                    334 ;	src/main.c: 59: static void hw_init(void)
                                    335 ; genLabel
                                    336 ;	-----------------------------------------
                                    337 ;	 function hw_init
                                    338 ;	-----------------------------------------
                                    339 ;	Register assignment is optimal.
                                    340 ;	Stack space usage: 0 bytes.
      00824F                        341 _hw_init:
                                    342 ;	src/main.c: 61: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
                                    343 ; genSend
      00824F 4F               [ 1]  344 	clr	a
                                    345 ; genCall
      008250 CD 89 72         [ 4]  346 	call	_CLK_HSIPrescalerConfig
                                    347 ;	src/main.c: 62: init_milis();
                                    348 ; genCall
      008253 CD 85 EF         [ 4]  349 	call	_init_milis
                                    350 ;	src/main.c: 63: init_uart1(115200);
                                    351 ; genIPush
      008256 4B 00            [ 1]  352 	push	#0x00
      008258 4B C2            [ 1]  353 	push	#0xc2
      00825A 4B 01            [ 1]  354 	push	#0x01
      00825C 4B 00            [ 1]  355 	push	#0x00
                                    356 ; genCall
      00825E CD 86 43         [ 4]  357 	call	_init_uart1
                                    358 ;	src/main.c: 65: GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
                                    359 ; genIPush
      008261 4B C0            [ 1]  360 	push	#0xc0
                                    361 ; genSend
      008263 A6 20            [ 1]  362 	ld	a, #0x20
                                    363 ; genSend
      008265 AE 50 05         [ 2]  364 	ldw	x, #0x5005
                                    365 ; genCall
      008268 CD 86 9E         [ 4]  366 	call	_GPIO_Init
                                    367 ;	src/main.c: 67: GPIO_Init(SEG_PORT_C,
                                    368 ; genIPush
      00826B 4B C0            [ 1]  369 	push	#0xc0
                                    370 ; genSend
      00826D A6 F8            [ 1]  371 	ld	a, #0xf8
                                    372 ; genSend
      00826F AE 50 0A         [ 2]  373 	ldw	x, #0x500a
                                    374 ; genCall
      008272 CD 86 9E         [ 4]  375 	call	_GPIO_Init
                                    376 ;	src/main.c: 71: GPIO_Init(SEG_PORT_B,
                                    377 ; genIPush
      008275 4B C0            [ 1]  378 	push	#0xc0
                                    379 ; genSend
      008277 A6 09            [ 1]  380 	ld	a, #0x09
                                    381 ; genSend
      008279 AE 50 05         [ 2]  382 	ldw	x, #0x5005
                                    383 ; genCall
      00827C CD 86 9E         [ 4]  384 	call	_GPIO_Init
                                    385 ;	src/main.c: 75: GPIO_Init(BTN_START_PORT, BTN_START_PIN, GPIO_MODE_IN_PU_NO_IT);
                                    386 ; genIPush
      00827F 4B 40            [ 1]  387 	push	#0x40
                                    388 ; genSend
      008281 A6 10            [ 1]  389 	ld	a, #0x10
                                    390 ; genSend
      008283 AE 50 05         [ 2]  391 	ldw	x, #0x5005
                                    392 ; genCall
      008286 CD 86 9E         [ 4]  393 	call	_GPIO_Init
                                    394 ;	src/main.c: 76: GPIO_Init(BTN_LAP_PORT,   BTN_LAP_PIN,  GPIO_MODE_IN_PU_NO_IT);
                                    395 ; genIPush
      008289 4B 40            [ 1]  396 	push	#0x40
                                    397 ; genSend
      00828B A6 80            [ 1]  398 	ld	a, #0x80
                                    399 ; genSend
      00828D AE 50 05         [ 2]  400 	ldw	x, #0x5005
                                    401 ; genCall
      008290 CD 86 9E         [ 4]  402 	call	_GPIO_Init
                                    403 ;	src/main.c: 78: seg7_show(0, false);
                                    404 ; genIPush
      008293 4B 00            [ 1]  405 	push	#0x00
                                    406 ; genSend
      008295 4F               [ 1]  407 	clr	a
                                    408 ; genCall
      008296 CD 81 9B         [ 4]  409 	call	_seg7_show
                                    410 ; genLabel
      008299                        411 00101$:
                                    412 ;	src/main.c: 79: }
                                    413 ; genEndFunction
      008299 81               [ 4]  414 	ret
                                    415 ;	src/main.c: 81: int main(void)
                                    416 ; genLabel
                                    417 ;	-----------------------------------------
                                    418 ;	 function main
                                    419 ;	-----------------------------------------
                                    420 ;	Register assignment might be sub-optimal.
                                    421 ;	Stack space usage: 93 bytes.
      00829A                        422 _main:
      00829A 52 5D            [ 2]  423 	sub	sp, #93
                                    424 ;	src/main.c: 83: hw_init();
                                    425 ; genCall
      00829C CD 82 4F         [ 4]  426 	call	_hw_init
                                    427 ;	src/main.c: 85: bool     running    = false;
                                    428 ; genAssign
      00829F 0F 2D            [ 1]  429 	clr	(0x2d, sp)
                                    430 ;	src/main.c: 86: uint32_t start_tick = 0;
                                    431 ; genAssign
      0082A1 5F               [ 1]  432 	clrw	x
      0082A2 1F 30            [ 2]  433 	ldw	(0x30, sp), x
      0082A4 1F 2E            [ 2]  434 	ldw	(0x2e, sp), x
                                    435 ;	src/main.c: 87: uint32_t elapsed    = 0;
                                    436 ; genAssign
      0082A6 5F               [ 1]  437 	clrw	x
      0082A7 1F 34            [ 2]  438 	ldw	(0x34, sp), x
      0082A9 1F 32            [ 2]  439 	ldw	(0x32, sp), x
                                    440 ;	src/main.c: 88: uint32_t lap        = 0;
                                    441 ; genAssign
      0082AB 5F               [ 1]  442 	clrw	x
      0082AC 1F 38            [ 2]  443 	ldw	(0x38, sp), x
      0082AE 1F 36            [ 2]  444 	ldw	(0x36, sp), x
                                    445 ;	src/main.c: 89: bool     lap_active = false;
                                    446 ; genAssign
      0082B0 0F 3A            [ 1]  447 	clr	(0x3a, sp)
                                    448 ;	src/main.c: 90: uint32_t lap_end    = 0;
                                    449 ; genAssign
      0082B2 5F               [ 1]  450 	clrw	x
      0082B3 1F 3D            [ 2]  451 	ldw	(0x3d, sp), x
      0082B5 1F 3B            [ 2]  452 	ldw	(0x3b, sp), x
                                    453 ;	src/main.c: 92: uint32_t led_tick   = 0;
                                    454 ; genAssign
      0082B7 5F               [ 1]  455 	clrw	x
      0082B8 1F 41            [ 2]  456 	ldw	(0x41, sp), x
      0082BA 1F 3F            [ 2]  457 	ldw	(0x3f, sp), x
                                    458 ;	src/main.c: 93: uint32_t uart_tick  = 0;
                                    459 ; genAssign
      0082BC 5F               [ 1]  460 	clrw	x
      0082BD 1F 45            [ 2]  461 	ldw	(0x45, sp), x
      0082BF 1F 43            [ 2]  462 	ldw	(0x43, sp), x
                                    463 ;	src/main.c: 94: uint32_t blink_tick = 0;
                                    464 ; genAssign
      0082C1 5F               [ 1]  465 	clrw	x
      0082C2 1F 49            [ 2]  466 	ldw	(0x49, sp), x
      0082C4 1F 47            [ 2]  467 	ldw	(0x47, sp), x
                                    468 ;	src/main.c: 95: bool     blink_on   = true;
                                    469 ; genAssign
      0082C6 A6 01            [ 1]  470 	ld	a, #0x01
      0082C8 6B 5D            [ 1]  471 	ld	(0x5d, sp), a
                                    472 ;	src/main.c: 97: bool     btn_s_prev = false,  btn_l_prev = false;
                                    473 ; genAssign
      0082CA 0F 4B            [ 1]  474 	clr	(0x4b, sp)
                                    475 ; genAssign
      0082CC 0F 4C            [ 1]  476 	clr	(0x4c, sp)
                                    477 ;	src/main.c: 98: uint32_t btn_s_t    = 0,      btn_l_t    = 0;
                                    478 ; genAssign
      0082CE 5F               [ 1]  479 	clrw	x
      0082CF 1F 4F            [ 2]  480 	ldw	(0x4f, sp), x
      0082D1 1F 4D            [ 2]  481 	ldw	(0x4d, sp), x
                                    482 ; genAssign
      0082D3 5F               [ 1]  483 	clrw	x
      0082D4 1F 53            [ 2]  484 	ldw	(0x53, sp), x
      0082D6 1F 51            [ 2]  485 	ldw	(0x51, sp), x
                                    486 ;	src/main.c: 101: while (1) {
                                    487 ; genLabel
      0082D8                        488 00134$:
                                    489 ;	src/main.c: 102: uint32_t now = milis();
                                    490 ; genCall
      0082D8 CD 85 CF         [ 4]  491 	call	_milis
      0082DB 1F 57            [ 2]  492 	ldw	(0x57, sp), x
      0082DD 17 55            [ 2]  493 	ldw	(0x55, sp), y
                                    494 ;	src/main.c: 104: bool s = (GPIO_ReadInputPin(BTN_START_PORT, BTN_START_PIN) == RESET);
                                    495 ; genSend
      0082DF A6 10            [ 1]  496 	ld	a, #0x10
                                    497 ; genSend
      0082E1 AE 50 05         [ 2]  498 	ldw	x, #0x5005
                                    499 ; genCall
      0082E4 CD 87 B1         [ 4]  500 	call	_GPIO_ReadInputPin
                                    501 ; genNot
      0082E7 A8 01            [ 1]  502 	xor	a, #0x01
      0082E9 6B 59            [ 1]  503 	ld	(0x59, sp), a
                                    504 ;	src/main.c: 105: bool l = (GPIO_ReadInputPin(BTN_LAP_PORT,   BTN_LAP_PIN)   == RESET);
                                    505 ; genSend
      0082EB A6 80            [ 1]  506 	ld	a, #0x80
                                    507 ; genSend
      0082ED AE 50 05         [ 2]  508 	ldw	x, #0x5005
                                    509 ; genCall
      0082F0 CD 87 B1         [ 4]  510 	call	_GPIO_ReadInputPin
                                    511 ; genNot
      0082F3 A8 01            [ 1]  512 	xor	a, #0x01
      0082F5 6B 5A            [ 1]  513 	ld	(0x5a, sp), a
                                    514 ;	src/main.c: 107: bool s_edge = s && !btn_s_prev && (now - btn_s_t > 20);
                                    515 ; genIfx
      0082F7 0D 59            [ 1]  516 	tnz	(0x59, sp)
      0082F9 26 03            [ 1]  517 	jrne	00297$
      0082FB CC 83 28         [ 2]  518 	jp	00138$
      0082FE                        519 00297$:
                                    520 ; genIfx
      0082FE 0D 4B            [ 1]  521 	tnz	(0x4b, sp)
      008300 27 03            [ 1]  522 	jreq	00298$
      008302 CC 83 28         [ 2]  523 	jp	00138$
      008305                        524 00298$:
                                    525 ; genMinus
      008305 1E 57            [ 2]  526 	ldw	x, (0x57, sp)
      008307 72 F0 4F         [ 2]  527 	subw	x, (0x4f, sp)
      00830A 1F 03            [ 2]  528 	ldw	(0x03, sp), x
      00830C 7B 56            [ 1]  529 	ld	a, (0x56, sp)
      00830E 12 4E            [ 1]  530 	sbc	a, (0x4e, sp)
      008310 6B 02            [ 1]  531 	ld	(0x02, sp), a
      008312 7B 55            [ 1]  532 	ld	a, (0x55, sp)
      008314 12 4D            [ 1]  533 	sbc	a, (0x4d, sp)
      008316 6B 01            [ 1]  534 	ld	(0x01, sp), a
                                    535 ; genCmp
                                    536 ; genCmpTnz
      008318 AE 00 14         [ 2]  537 	ldw	x, #0x0014
      00831B 13 03            [ 2]  538 	cpw	x, (0x03, sp)
      00831D 4F               [ 1]  539 	clr	a
      00831E 12 02            [ 1]  540 	sbc	a, (0x02, sp)
      008320 4F               [ 1]  541 	clr	a
      008321 12 01            [ 1]  542 	sbc	a, (0x01, sp)
      008323 24 03            [ 1]  543 	jrnc	00299$
      008325 CC 83 2C         [ 2]  544 	jp	00139$
      008328                        545 00299$:
                                    546 ; skipping generated iCode
                                    547 ; genLabel
      008328                        548 00138$:
                                    549 ; genAssign
      008328 4F               [ 1]  550 	clr	a
                                    551 ; genGoto
      008329 CC 83 2E         [ 2]  552 	jp	00140$
                                    553 ; genLabel
      00832C                        554 00139$:
                                    555 ; genAssign
      00832C A6 01            [ 1]  556 	ld	a, #0x01
                                    557 ; genLabel
      00832E                        558 00140$:
                                    559 ; genAssign
      00832E 6B 5B            [ 1]  560 	ld	(0x5b, sp), a
                                    561 ;	src/main.c: 108: bool l_edge = l && !btn_l_prev && (now - btn_l_t > 20);
                                    562 ; genIfx
      008330 0D 5A            [ 1]  563 	tnz	(0x5a, sp)
      008332 26 03            [ 1]  564 	jrne	00300$
      008334 CC 83 61         [ 2]  565 	jp	00144$
      008337                        566 00300$:
                                    567 ; genIfx
      008337 0D 4C            [ 1]  568 	tnz	(0x4c, sp)
      008339 27 03            [ 1]  569 	jreq	00301$
      00833B CC 83 61         [ 2]  570 	jp	00144$
      00833E                        571 00301$:
                                    572 ; genMinus
      00833E 1E 57            [ 2]  573 	ldw	x, (0x57, sp)
      008340 72 F0 53         [ 2]  574 	subw	x, (0x53, sp)
      008343 1F 03            [ 2]  575 	ldw	(0x03, sp), x
      008345 7B 56            [ 1]  576 	ld	a, (0x56, sp)
      008347 12 52            [ 1]  577 	sbc	a, (0x52, sp)
      008349 6B 02            [ 1]  578 	ld	(0x02, sp), a
      00834B 7B 55            [ 1]  579 	ld	a, (0x55, sp)
      00834D 12 51            [ 1]  580 	sbc	a, (0x51, sp)
      00834F 6B 01            [ 1]  581 	ld	(0x01, sp), a
                                    582 ; genCmp
                                    583 ; genCmpTnz
      008351 AE 00 14         [ 2]  584 	ldw	x, #0x0014
      008354 13 03            [ 2]  585 	cpw	x, (0x03, sp)
      008356 4F               [ 1]  586 	clr	a
      008357 12 02            [ 1]  587 	sbc	a, (0x02, sp)
      008359 4F               [ 1]  588 	clr	a
      00835A 12 01            [ 1]  589 	sbc	a, (0x01, sp)
      00835C 24 03            [ 1]  590 	jrnc	00302$
      00835E CC 83 65         [ 2]  591 	jp	00145$
      008361                        592 00302$:
                                    593 ; skipping generated iCode
                                    594 ; genLabel
      008361                        595 00144$:
                                    596 ; genAssign
      008361 4F               [ 1]  597 	clr	a
                                    598 ; genGoto
      008362 CC 83 67         [ 2]  599 	jp	00146$
                                    600 ; genLabel
      008365                        601 00145$:
                                    602 ; genAssign
      008365 A6 01            [ 1]  603 	ld	a, #0x01
                                    604 ; genLabel
      008367                        605 00146$:
                                    606 ; genAssign
      008367 6B 5C            [ 1]  607 	ld	(0x5c, sp), a
                                    608 ;	src/main.c: 110: if (!s) btn_s_prev = false;
                                    609 ; genIfx
      008369 0D 59            [ 1]  610 	tnz	(0x59, sp)
      00836B 27 03            [ 1]  611 	jreq	00303$
      00836D CC 83 75         [ 2]  612 	jp	00104$
      008370                        613 00303$:
                                    614 ; genAssign
      008370 0F 4B            [ 1]  615 	clr	(0x4b, sp)
                                    616 ; genGoto
      008372 CC 83 88         [ 2]  617 	jp	00105$
                                    618 ; genLabel
      008375                        619 00104$:
                                    620 ;	src/main.c: 111: else if (s_edge) { btn_s_prev = true; btn_s_t = now; }
                                    621 ; genIfx
      008375 0D 5B            [ 1]  622 	tnz	(0x5b, sp)
      008377 26 03            [ 1]  623 	jrne	00304$
      008379 CC 83 88         [ 2]  624 	jp	00105$
      00837C                        625 00304$:
                                    626 ; genAssign
      00837C A6 01            [ 1]  627 	ld	a, #0x01
      00837E 6B 4B            [ 1]  628 	ld	(0x4b, sp), a
                                    629 ; genAssign
      008380 16 57            [ 2]  630 	ldw	y, (0x57, sp)
      008382 17 4F            [ 2]  631 	ldw	(0x4f, sp), y
      008384 16 55            [ 2]  632 	ldw	y, (0x55, sp)
      008386 17 4D            [ 2]  633 	ldw	(0x4d, sp), y
                                    634 ; genLabel
      008388                        635 00105$:
                                    636 ;	src/main.c: 113: if (!l) btn_l_prev = false;
                                    637 ; genIfx
      008388 0D 5A            [ 1]  638 	tnz	(0x5a, sp)
      00838A 27 03            [ 1]  639 	jreq	00305$
      00838C CC 83 94         [ 2]  640 	jp	00109$
      00838F                        641 00305$:
                                    642 ; genAssign
      00838F 0F 4C            [ 1]  643 	clr	(0x4c, sp)
                                    644 ; genGoto
      008391 CC 83 A7         [ 2]  645 	jp	00110$
                                    646 ; genLabel
      008394                        647 00109$:
                                    648 ;	src/main.c: 114: else if (l_edge) { btn_l_prev = true; btn_l_t = now; }
                                    649 ; genIfx
      008394 0D 5C            [ 1]  650 	tnz	(0x5c, sp)
      008396 26 03            [ 1]  651 	jrne	00306$
      008398 CC 83 A7         [ 2]  652 	jp	00110$
      00839B                        653 00306$:
                                    654 ; genAssign
      00839B A6 01            [ 1]  655 	ld	a, #0x01
      00839D 6B 4C            [ 1]  656 	ld	(0x4c, sp), a
                                    657 ; genAssign
      00839F 16 57            [ 2]  658 	ldw	y, (0x57, sp)
      0083A1 17 53            [ 2]  659 	ldw	(0x53, sp), y
      0083A3 16 55            [ 2]  660 	ldw	y, (0x55, sp)
      0083A5 17 51            [ 2]  661 	ldw	(0x51, sp), y
                                    662 ; genLabel
      0083A7                        663 00110$:
                                    664 ;	src/main.c: 116: if (s_edge) {
                                    665 ; genIfx
      0083A7 0D 5B            [ 1]  666 	tnz	(0x5b, sp)
      0083A9 26 03            [ 1]  667 	jrne	00307$
      0083AB CC 83 F0         [ 2]  668 	jp	00115$
      0083AE                        669 00307$:
                                    670 ;	src/main.c: 117: if (!running) {
                                    671 ; genIfx
      0083AE 0D 2D            [ 1]  672 	tnz	(0x2d, sp)
      0083B0 27 03            [ 1]  673 	jreq	00308$
      0083B2 CC 83 CF         [ 2]  674 	jp	00112$
      0083B5                        675 00308$:
                                    676 ;	src/main.c: 118: start_tick = now - elapsed;
                                    677 ; genMinus
      0083B5 1E 57            [ 2]  678 	ldw	x, (0x57, sp)
      0083B7 72 F0 34         [ 2]  679 	subw	x, (0x34, sp)
      0083BA 1F 30            [ 2]  680 	ldw	(0x30, sp), x
      0083BC 7B 56            [ 1]  681 	ld	a, (0x56, sp)
      0083BE 12 33            [ 1]  682 	sbc	a, (0x33, sp)
      0083C0 6B 2F            [ 1]  683 	ld	(0x2f, sp), a
      0083C2 7B 55            [ 1]  684 	ld	a, (0x55, sp)
      0083C4 12 32            [ 1]  685 	sbc	a, (0x32, sp)
      0083C6 6B 2E            [ 1]  686 	ld	(0x2e, sp), a
                                    687 ;	src/main.c: 119: running    = true;
                                    688 ; genAssign
      0083C8 A6 01            [ 1]  689 	ld	a, #0x01
      0083CA 6B 2D            [ 1]  690 	ld	(0x2d, sp), a
                                    691 ; genGoto
      0083CC CC 83 F0         [ 2]  692 	jp	00115$
                                    693 ; genLabel
      0083CF                        694 00112$:
                                    695 ;	src/main.c: 121: elapsed    = now - start_tick;
                                    696 ; genMinus
      0083CF 1E 57            [ 2]  697 	ldw	x, (0x57, sp)
      0083D1 72 F0 30         [ 2]  698 	subw	x, (0x30, sp)
      0083D4 1F 34            [ 2]  699 	ldw	(0x34, sp), x
      0083D6 7B 56            [ 1]  700 	ld	a, (0x56, sp)
      0083D8 12 2F            [ 1]  701 	sbc	a, (0x2f, sp)
      0083DA 6B 33            [ 1]  702 	ld	(0x33, sp), a
      0083DC 7B 55            [ 1]  703 	ld	a, (0x55, sp)
      0083DE 12 2E            [ 1]  704 	sbc	a, (0x2e, sp)
      0083E0 6B 32            [ 1]  705 	ld	(0x32, sp), a
                                    706 ;	src/main.c: 122: running    = false;
                                    707 ; genAssign
      0083E2 0F 2D            [ 1]  708 	clr	(0x2d, sp)
                                    709 ;	src/main.c: 123: blink_tick = now;
                                    710 ; genAssign
      0083E4 16 57            [ 2]  711 	ldw	y, (0x57, sp)
      0083E6 17 49            [ 2]  712 	ldw	(0x49, sp), y
      0083E8 16 55            [ 2]  713 	ldw	y, (0x55, sp)
      0083EA 17 47            [ 2]  714 	ldw	(0x47, sp), y
                                    715 ;	src/main.c: 124: blink_on   = true;
                                    716 ; genAssign
      0083EC A6 01            [ 1]  717 	ld	a, #0x01
      0083EE 6B 5D            [ 1]  718 	ld	(0x5d, sp), a
                                    719 ; genLabel
      0083F0                        720 00115$:
                                    721 ;	src/main.c: 121: elapsed    = now - start_tick;
                                    722 ; genMinus
      0083F0 1E 57            [ 2]  723 	ldw	x, (0x57, sp)
      0083F2 72 F0 30         [ 2]  724 	subw	x, (0x30, sp)
      0083F5 1F 03            [ 2]  725 	ldw	(0x03, sp), x
      0083F7 7B 56            [ 1]  726 	ld	a, (0x56, sp)
      0083F9 12 2F            [ 1]  727 	sbc	a, (0x2f, sp)
      0083FB 97               [ 1]  728 	ld	xl, a
      0083FC 7B 55            [ 1]  729 	ld	a, (0x55, sp)
      0083FE 12 2E            [ 1]  730 	sbc	a, (0x2e, sp)
      008400 95               [ 1]  731 	ld	xh, a
                                    732 ;	src/main.c: 128: if (l_edge && running) {
                                    733 ; genIfx
      008401 0D 5C            [ 1]  734 	tnz	(0x5c, sp)
      008403 26 03            [ 1]  735 	jrne	00309$
      008405 CC 84 2D         [ 2]  736 	jp	00117$
      008408                        737 00309$:
                                    738 ; genIfx
      008408 0D 2D            [ 1]  739 	tnz	(0x2d, sp)
      00840A 26 03            [ 1]  740 	jrne	00310$
      00840C CC 84 2D         [ 2]  741 	jp	00117$
      00840F                        742 00310$:
                                    743 ;	src/main.c: 129: lap        = now - start_tick;
                                    744 ; genAssign
      00840F 1F 36            [ 2]  745 	ldw	(0x36, sp), x
      008411 16 03            [ 2]  746 	ldw	y, (0x03, sp)
      008413 17 38            [ 2]  747 	ldw	(0x38, sp), y
                                    748 ;	src/main.c: 130: lap_active = true;
                                    749 ; genAssign
      008415 A6 01            [ 1]  750 	ld	a, #0x01
      008417 6B 3A            [ 1]  751 	ld	(0x3a, sp), a
                                    752 ;	src/main.c: 131: lap_end    = now + 2000;
                                    753 ; genPlus
      008419 16 57            [ 2]  754 	ldw	y, (0x57, sp)
      00841B 72 A9 07 D0      [ 2]  755 	addw	y, #0x07d0
      00841F 17 3D            [ 2]  756 	ldw	(0x3d, sp), y
      008421 7B 56            [ 1]  757 	ld	a, (0x56, sp)
      008423 A9 00            [ 1]  758 	adc	a, #0x00
      008425 6B 3C            [ 1]  759 	ld	(0x3c, sp), a
      008427 7B 55            [ 1]  760 	ld	a, (0x55, sp)
      008429 A9 00            [ 1]  761 	adc	a, #0x00
      00842B 6B 3B            [ 1]  762 	ld	(0x3b, sp), a
                                    763 ; genLabel
      00842D                        764 00117$:
                                    765 ;	src/main.c: 134: if (running) elapsed = now - start_tick;
                                    766 ; genIfx
      00842D 0D 2D            [ 1]  767 	tnz	(0x2d, sp)
      00842F 26 03            [ 1]  768 	jrne	00311$
      008431 CC 84 3A         [ 2]  769 	jp	00120$
      008434                        770 00311$:
                                    771 ; genAssign
      008434 1F 32            [ 2]  772 	ldw	(0x32, sp), x
      008436 16 03            [ 2]  773 	ldw	y, (0x03, sp)
      008438 17 34            [ 2]  774 	ldw	(0x34, sp), y
                                    775 ; genLabel
      00843A                        776 00120$:
                                    777 ;	src/main.c: 135: if (lap_active && now >= lap_end) lap_active = false;
                                    778 ; genIfx
      00843A 0D 3A            [ 1]  779 	tnz	(0x3a, sp)
      00843C 26 03            [ 1]  780 	jrne	00312$
      00843E CC 84 54         [ 2]  781 	jp	00122$
      008441                        782 00312$:
                                    783 ; genCmp
                                    784 ; genCmpTnz
      008441 1E 57            [ 2]  785 	ldw	x, (0x57, sp)
      008443 13 3D            [ 2]  786 	cpw	x, (0x3d, sp)
      008445 7B 56            [ 1]  787 	ld	a, (0x56, sp)
      008447 12 3C            [ 1]  788 	sbc	a, (0x3c, sp)
      008449 7B 55            [ 1]  789 	ld	a, (0x55, sp)
      00844B 12 3B            [ 1]  790 	sbc	a, (0x3b, sp)
      00844D 24 03            [ 1]  791 	jrnc	00313$
      00844F CC 84 54         [ 2]  792 	jp	00122$
      008452                        793 00313$:
                                    794 ; skipping generated iCode
                                    795 ; genAssign
      008452 0F 3A            [ 1]  796 	clr	(0x3a, sp)
                                    797 ; genLabel
      008454                        798 00122$:
                                    799 ;	src/main.c: 137: uint32_t disp = lap_active ? lap : elapsed;
                                    800 ; genIfx
      008454 0D 3A            [ 1]  801 	tnz	(0x3a, sp)
      008456 26 03            [ 1]  802 	jrne	00314$
      008458 CC 84 64         [ 2]  803 	jp	00150$
      00845B                        804 00314$:
                                    805 ; genAssign
      00845B 16 38            [ 2]  806 	ldw	y, (0x38, sp)
      00845D 17 5B            [ 2]  807 	ldw	(0x5b, sp), y
      00845F 16 36            [ 2]  808 	ldw	y, (0x36, sp)
                                    809 ; genGoto
      008461 CC 84 6A         [ 2]  810 	jp	00151$
                                    811 ; genLabel
      008464                        812 00150$:
                                    813 ; genAssign
      008464 16 34            [ 2]  814 	ldw	y, (0x34, sp)
      008466 17 5B            [ 2]  815 	ldw	(0x5b, sp), y
      008468 16 32            [ 2]  816 	ldw	y, (0x32, sp)
                                    817 ; genLabel
      00846A                        818 00151$:
                                    819 ; genAssign
      00846A 1E 5B            [ 2]  820 	ldw	x, (0x5b, sp)
                                    821 ;	src/main.c: 138: uint8_t  dig  = (uint8_t)((disp / 1000) % 10);
                                    822 ; genIPush
      00846C 4B E8            [ 1]  823 	push	#0xe8
      00846E 4B 03            [ 1]  824 	push	#0x03
      008470 4B 00            [ 1]  825 	push	#0x00
      008472 4B 00            [ 1]  826 	push	#0x00
                                    827 ; genIPush
      008474 89               [ 2]  828 	pushw	x
      008475 90 89            [ 2]  829 	pushw	y
                                    830 ; genCall
      008477 CD 88 C0         [ 4]  831 	call	__divulong
      00847A 5B 08            [ 2]  832 	addw	sp, #8
                                    833 ; genIPush
      00847C 4B 0A            [ 1]  834 	push	#0x0a
      00847E 4B 00            [ 1]  835 	push	#0x00
      008480 4B 00            [ 1]  836 	push	#0x00
      008482 4B 00            [ 1]  837 	push	#0x00
                                    838 ; genIPush
      008484 89               [ 2]  839 	pushw	x
      008485 90 89            [ 2]  840 	pushw	y
                                    841 ; genCall
      008487 CD 87 BE         [ 4]  842 	call	__modulong
      00848A 5B 08            [ 2]  843 	addw	sp, #8
                                    844 ; genCast
                                    845 ; genAssign
                                    846 ;	src/main.c: 140: if (!running) {
                                    847 ; genIfx
      00848C 0D 2D            [ 1]  848 	tnz	(0x2d, sp)
      00848E 27 03            [ 1]  849 	jreq	00315$
      008490 CC 84 D2         [ 2]  850 	jp	00127$
      008493                        851 00315$:
                                    852 ;	src/main.c: 141: if (now - blink_tick > 500) {
                                    853 ; genMinus
      008493 16 57            [ 2]  854 	ldw	y, (0x57, sp)
      008495 72 F2 49         [ 2]  855 	subw	y, (0x49, sp)
      008498 17 5B            [ 2]  856 	ldw	(0x5b, sp), y
      00849A 7B 56            [ 1]  857 	ld	a, (0x56, sp)
      00849C 12 48            [ 1]  858 	sbc	a, (0x48, sp)
      00849E 6B 5A            [ 1]  859 	ld	(0x5a, sp), a
      0084A0 7B 55            [ 1]  860 	ld	a, (0x55, sp)
      0084A2 12 47            [ 1]  861 	sbc	a, (0x47, sp)
      0084A4 6B 59            [ 1]  862 	ld	(0x59, sp), a
                                    863 ; genCmp
                                    864 ; genCmpTnz
      0084A6 A6 F4            [ 1]  865 	ld	a, #0xf4
      0084A8 11 5C            [ 1]  866 	cp	a, (0x5c, sp)
      0084AA A6 01            [ 1]  867 	ld	a, #0x01
      0084AC 12 5B            [ 1]  868 	sbc	a, (0x5b, sp)
      0084AE 4F               [ 1]  869 	clr	a
      0084AF 12 5A            [ 1]  870 	sbc	a, (0x5a, sp)
      0084B1 4F               [ 1]  871 	clr	a
      0084B2 12 59            [ 1]  872 	sbc	a, (0x59, sp)
      0084B4 25 03            [ 1]  873 	jrc	00316$
      0084B6 CC 84 C6         [ 2]  874 	jp	00125$
      0084B9                        875 00316$:
                                    876 ; skipping generated iCode
                                    877 ;	src/main.c: 142: blink_on = !blink_on;
                                    878 ; genNot
      0084B9 04 5D            [ 1]  879 	srl	(0x5d, sp)
      0084BB 8C               [ 1]  880 	ccf
      0084BC 09 5D            [ 1]  881 	rlc	(0x5d, sp)
                                    882 ;	src/main.c: 143: blink_tick = now;
                                    883 ; genAssign
      0084BE 16 57            [ 2]  884 	ldw	y, (0x57, sp)
      0084C0 17 49            [ 2]  885 	ldw	(0x49, sp), y
      0084C2 16 55            [ 2]  886 	ldw	y, (0x55, sp)
      0084C4 17 47            [ 2]  887 	ldw	(0x47, sp), y
                                    888 ; genLabel
      0084C6                        889 00125$:
                                    890 ;	src/main.c: 145: seg7_show(dig, !blink_on);
                                    891 ; genNot
      0084C6 7B 5D            [ 1]  892 	ld	a, (0x5d, sp)
      0084C8 A8 01            [ 1]  893 	xor	a, #0x01
                                    894 ; genIPush
      0084CA 88               [ 1]  895 	push	a
                                    896 ; genSend
      0084CB 9F               [ 1]  897 	ld	a, xl
                                    898 ; genCall
      0084CC CD 81 9B         [ 4]  899 	call	_seg7_show
                                    900 ; genGoto
      0084CF CC 84 D8         [ 2]  901 	jp	00128$
                                    902 ; genLabel
      0084D2                        903 00127$:
                                    904 ;	src/main.c: 147: seg7_show(dig, false);
                                    905 ; genIPush
      0084D2 4B 00            [ 1]  906 	push	#0x00
                                    907 ; genSend
      0084D4 9F               [ 1]  908 	ld	a, xl
                                    909 ; genCall
      0084D5 CD 81 9B         [ 4]  910 	call	_seg7_show
                                    911 ; genLabel
      0084D8                        912 00128$:
                                    913 ;	src/main.c: 150: if (now - led_tick > 1000) {
                                    914 ; genMinus
      0084D8 1E 57            [ 2]  915 	ldw	x, (0x57, sp)
      0084DA 72 F0 41         [ 2]  916 	subw	x, (0x41, sp)
      0084DD 1F 5B            [ 2]  917 	ldw	(0x5b, sp), x
      0084DF 7B 56            [ 1]  918 	ld	a, (0x56, sp)
      0084E1 12 40            [ 1]  919 	sbc	a, (0x40, sp)
      0084E3 6B 5A            [ 1]  920 	ld	(0x5a, sp), a
      0084E5 7B 55            [ 1]  921 	ld	a, (0x55, sp)
      0084E7 12 3F            [ 1]  922 	sbc	a, (0x3f, sp)
      0084E9 6B 59            [ 1]  923 	ld	(0x59, sp), a
                                    924 ; genCmp
                                    925 ; genCmpTnz
      0084EB AE 03 E8         [ 2]  926 	ldw	x, #0x03e8
      0084EE 13 5B            [ 2]  927 	cpw	x, (0x5b, sp)
      0084F0 4F               [ 1]  928 	clr	a
      0084F1 12 5A            [ 1]  929 	sbc	a, (0x5a, sp)
      0084F3 4F               [ 1]  930 	clr	a
      0084F4 12 59            [ 1]  931 	sbc	a, (0x59, sp)
      0084F6 25 03            [ 1]  932 	jrc	00317$
      0084F8 CC 85 0B         [ 2]  933 	jp	00130$
      0084FB                        934 00317$:
                                    935 ; skipping generated iCode
                                    936 ;	src/main.c: 151: REVERSE(LED);
                                    937 ; genSend
      0084FB A6 20            [ 1]  938 	ld	a, #0x20
                                    939 ; genSend
      0084FD AE 50 05         [ 2]  940 	ldw	x, #0x5005
                                    941 ; genCall
      008500 CD 87 A8         [ 4]  942 	call	_GPIO_WriteReverse
                                    943 ;	src/main.c: 152: led_tick = now;
                                    944 ; genAssign
      008503 16 57            [ 2]  945 	ldw	y, (0x57, sp)
      008505 17 41            [ 2]  946 	ldw	(0x41, sp), y
      008507 16 55            [ 2]  947 	ldw	y, (0x55, sp)
      008509 17 3F            [ 2]  948 	ldw	(0x3f, sp), y
                                    949 ; genLabel
      00850B                        950 00130$:
                                    951 ;	src/main.c: 155: if (now - uart_tick > 1000) {
                                    952 ; genMinus
      00850B 1E 57            [ 2]  953 	ldw	x, (0x57, sp)
      00850D 72 F0 45         [ 2]  954 	subw	x, (0x45, sp)
      008510 1F 5B            [ 2]  955 	ldw	(0x5b, sp), x
      008512 7B 56            [ 1]  956 	ld	a, (0x56, sp)
      008514 12 44            [ 1]  957 	sbc	a, (0x44, sp)
      008516 6B 5A            [ 1]  958 	ld	(0x5a, sp), a
      008518 7B 55            [ 1]  959 	ld	a, (0x55, sp)
      00851A 12 43            [ 1]  960 	sbc	a, (0x43, sp)
      00851C 6B 59            [ 1]  961 	ld	(0x59, sp), a
                                    962 ; genCmp
                                    963 ; genCmpTnz
      00851E AE 03 E8         [ 2]  964 	ldw	x, #0x03e8
      008521 13 5B            [ 2]  965 	cpw	x, (0x5b, sp)
      008523 4F               [ 1]  966 	clr	a
      008524 12 5A            [ 1]  967 	sbc	a, (0x5a, sp)
      008526 4F               [ 1]  968 	clr	a
      008527 12 59            [ 1]  969 	sbc	a, (0x59, sp)
      008529 25 03            [ 1]  970 	jrc	00318$
      00852B CC 82 D8         [ 2]  971 	jp	00134$
      00852E                        972 00318$:
                                    973 ; skipping generated iCode
                                    974 ;	src/main.c: 158: (uint16_t)(lap / 1000),     (uint8_t)((lap % 1000) / 10));
                                    975 ; genIPush
      00852E 4B E8            [ 1]  976 	push	#0xe8
      008530 4B 03            [ 1]  977 	push	#0x03
      008532 5F               [ 1]  978 	clrw	x
      008533 89               [ 2]  979 	pushw	x
                                    980 ; genIPush
      008534 1E 3C            [ 2]  981 	ldw	x, (0x3c, sp)
      008536 89               [ 2]  982 	pushw	x
      008537 1E 3C            [ 2]  983 	ldw	x, (0x3c, sp)
      008539 89               [ 2]  984 	pushw	x
                                    985 ; genCall
      00853A CD 87 BE         [ 4]  986 	call	__modulong
      00853D 5B 08            [ 2]  987 	addw	sp, #8
                                    988 ; genIPush
      00853F 4B 0A            [ 1]  989 	push	#0x0a
      008541 4B 00            [ 1]  990 	push	#0x00
      008543 4B 00            [ 1]  991 	push	#0x00
      008545 4B 00            [ 1]  992 	push	#0x00
                                    993 ; genIPush
      008547 89               [ 2]  994 	pushw	x
      008548 90 89            [ 2]  995 	pushw	y
                                    996 ; genCall
      00854A CD 88 C0         [ 4]  997 	call	__divulong
      00854D 5B 08            [ 2]  998 	addw	sp, #8
      00854F 9F               [ 1]  999 	ld	a, xl
                                   1000 ; genCast
                                   1001 ; genAssign
                                   1002 ; genIPush
      008550 88               [ 1] 1003 	push	a
      008551 4B E8            [ 1] 1004 	push	#0xe8
      008553 4B 03            [ 1] 1005 	push	#0x03
      008555 5F               [ 1] 1006 	clrw	x
      008556 89               [ 2] 1007 	pushw	x
                                   1008 ; genIPush
      008557 1E 3D            [ 2] 1009 	ldw	x, (0x3d, sp)
      008559 89               [ 2] 1010 	pushw	x
      00855A 1E 3D            [ 2] 1011 	ldw	x, (0x3d, sp)
      00855C 89               [ 2] 1012 	pushw	x
                                   1013 ; genCall
      00855D CD 88 C0         [ 4] 1014 	call	__divulong
      008560 5B 08            [ 2] 1015 	addw	sp, #8
      008562 84               [ 1] 1016 	pop	a
                                   1017 ; genCast
                                   1018 ; genAssign
      008563 1F 5A            [ 2] 1019 	ldw	(0x5a, sp), x
                                   1020 ;	src/main.c: 157: (uint16_t)(elapsed / 1000), (uint8_t)((elapsed % 1000) / 10),
                                   1021 ; genIPush
      008565 88               [ 1] 1022 	push	a
      008566 4B E8            [ 1] 1023 	push	#0xe8
      008568 4B 03            [ 1] 1024 	push	#0x03
      00856A 5F               [ 1] 1025 	clrw	x
      00856B 89               [ 2] 1026 	pushw	x
                                   1027 ; genIPush
      00856C 1E 39            [ 2] 1028 	ldw	x, (0x39, sp)
      00856E 89               [ 2] 1029 	pushw	x
      00856F 1E 39            [ 2] 1030 	ldw	x, (0x39, sp)
      008571 89               [ 2] 1031 	pushw	x
                                   1032 ; genCall
      008572 CD 87 BE         [ 4] 1033 	call	__modulong
      008575 5B 08            [ 2] 1034 	addw	sp, #8
      008577 1F 46            [ 2] 1035 	ldw	(0x46, sp), x
      008579 84               [ 1] 1036 	pop	a
                                   1037 ; genIPush
      00857A 88               [ 1] 1038 	push	a
      00857B 4B 0A            [ 1] 1039 	push	#0x0a
      00857D 5F               [ 1] 1040 	clrw	x
      00857E 89               [ 2] 1041 	pushw	x
      00857F 4B 00            [ 1] 1042 	push	#0x00
                                   1043 ; genIPush
      008581 1E 4A            [ 2] 1044 	ldw	x, (0x4a, sp)
      008583 89               [ 2] 1045 	pushw	x
      008584 90 89            [ 2] 1046 	pushw	y
                                   1047 ; genCall
      008586 CD 88 C0         [ 4] 1048 	call	__divulong
      008589 5B 08            [ 2] 1049 	addw	sp, #8
      00858B 84               [ 1] 1050 	pop	a
                                   1051 ; genCast
                                   1052 ; genAssign
      00858C 41               [ 1] 1053 	exg	a, xl
      00858D 6B 5C            [ 1] 1054 	ld	(0x5c, sp), a
      00858F 41               [ 1] 1055 	exg	a, xl
                                   1056 ; genIPush
      008590 88               [ 1] 1057 	push	a
      008591 4B E8            [ 1] 1058 	push	#0xe8
      008593 4B 03            [ 1] 1059 	push	#0x03
      008595 5F               [ 1] 1060 	clrw	x
      008596 89               [ 2] 1061 	pushw	x
                                   1062 ; genIPush
      008597 1E 39            [ 2] 1063 	ldw	x, (0x39, sp)
      008599 89               [ 2] 1064 	pushw	x
      00859A 1E 39            [ 2] 1065 	ldw	x, (0x39, sp)
      00859C 89               [ 2] 1066 	pushw	x
                                   1067 ; genCall
      00859D CD 88 C0         [ 4] 1068 	call	__divulong
      0085A0 5B 08            [ 2] 1069 	addw	sp, #8
      0085A2 84               [ 1] 1070 	pop	a
                                   1071 ; genCast
                                   1072 ; genAssign
                                   1073 ;	src/main.c: 156: sprintf(buf, "T=%u.%02us LAP=%u.%02us\r\n",
                                   1074 ; skipping iCode since result will be rematerialized
                                   1075 ; skipping iCode since result will be rematerialized
                                   1076 ; skipping iCode since result will be rematerialized
                                   1077 ; skipping iCode since result will be rematerialized
                                   1078 ; genIPush
      0085A3 88               [ 1] 1079 	push	a
                                   1080 ; genIPush
      0085A4 16 5B            [ 2] 1081 	ldw	y, (0x5b, sp)
      0085A6 90 89            [ 2] 1082 	pushw	y
                                   1083 ; genIPush
      0085A8 7B 5F            [ 1] 1084 	ld	a, (0x5f, sp)
      0085AA 88               [ 1] 1085 	push	a
                                   1086 ; genIPush
      0085AB 89               [ 2] 1087 	pushw	x
                                   1088 ; genIPush
      0085AC 4B 9F            [ 1] 1089 	push	#<(___str_0+0)
      0085AE 4B 80            [ 1] 1090 	push	#((___str_0+0) >> 8)
                                   1091 ; genIPush
      0085B0 96               [ 1] 1092 	ldw	x, sp
      0085B1 1C 00 0D         [ 2] 1093 	addw	x, #13
      0085B4 89               [ 2] 1094 	pushw	x
                                   1095 ; genCall
      0085B5 CD 88 53         [ 4] 1096 	call	_sprintf
      0085B8 5B 0A            [ 2] 1097 	addw	sp, #10
                                   1098 ;	src/main.c: 159: uart1_puts(buf);
                                   1099 ; skipping iCode since result will be rematerialized
                                   1100 ; skipping iCode since result will be rematerialized
                                   1101 ; genSend
      0085BA 96               [ 1] 1102 	ldw	x, sp
      0085BB 1C 00 05         [ 2] 1103 	addw	x, #5
                                   1104 ; genCall
      0085BE CD 86 6A         [ 4] 1105 	call	_uart1_puts
                                   1106 ;	src/main.c: 160: uart_tick = now;
                                   1107 ; genAssign
      0085C1 16 57            [ 2] 1108 	ldw	y, (0x57, sp)
      0085C3 17 45            [ 2] 1109 	ldw	(0x45, sp), y
      0085C5 16 55            [ 2] 1110 	ldw	y, (0x55, sp)
      0085C7 17 43            [ 2] 1111 	ldw	(0x43, sp), y
                                   1112 ; genGoto
      0085C9 CC 82 D8         [ 2] 1113 	jp	00134$
                                   1114 ; genLabel
      0085CC                       1115 00136$:
                                   1116 ;	src/main.c: 163: }
                                   1117 ; genEndFunction
      0085CC 5B 5D            [ 2] 1118 	addw	sp, #93
      0085CE 81               [ 4] 1119 	ret
                                   1120 	.area CODE
                                   1121 	.area CONST
      008095                       1122 _SEG7:
      008095 3F                    1123 	.db #0x3f	; 63
      008096 06                    1124 	.db #0x06	; 6
      008097 5B                    1125 	.db #0x5b	; 91
      008098 4F                    1126 	.db #0x4f	; 79	'O'
      008099 66                    1127 	.db #0x66	; 102	'f'
      00809A 6D                    1128 	.db #0x6d	; 109	'm'
      00809B 7D                    1129 	.db #0x7d	; 125
      00809C 07                    1130 	.db #0x07	; 7
      00809D 7F                    1131 	.db #0x7f	; 127
      00809E 6F                    1132 	.db #0x6f	; 111	'o'
                                   1133 	.area CONST
      00809F                       1134 ___str_0:
      00809F 54 3D 25 75 2E 25 30  1135 	.ascii "T=%u.%02us LAP=%u.%02us"
             32 75 73 20 4C 41 50
             3D 25 75 2E 25 30 32
             75 73
      0080B6 0D                    1136 	.db 0x0d
      0080B7 0A                    1137 	.db 0x0a
      0080B8 00                    1138 	.db 0x00
                                   1139 	.area CODE
                                   1140 	.area INITIALIZER
                                   1141 	.area CABS (ABS)
