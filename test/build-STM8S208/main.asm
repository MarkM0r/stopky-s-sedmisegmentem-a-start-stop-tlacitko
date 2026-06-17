;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _uart1_puts
	.globl _init_uart1
	.globl _milis
	.globl _init_milis
	.globl _GPIO_ReadInputPin
	.globl _GPIO_ReadOutputData
	.globl _GPIO_WriteReverse
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Write
	.globl _GPIO_Init
	.globl _CLK_HSIPrescalerConfig
	.globl _sprintf
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int _CAN_RX_IRQHandler ; int8
	int _CAN_TX_IRQHandler ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int _UART1_TX_IRQHandler ; int17
	int _UART1_RX_IRQHandler ; int18
	int _I2C_IRQHandler ; int19
	int _UART3_TX_IRQHandler ; int20
	int _UART3_RX_IRQHandler ; int21
	int _ADC2_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	call	___sdcc_external_startup
	tnz	a
	jreq	__sdcc_init_data
	jp	__sdcc_program_startup
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	src/main.c: 34: static void seg7_show(uint8_t digit, bool blank)
; genLabel
;	-----------------------------------------
;	 function seg7_show
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 2 bytes.
_seg7_show:
	pushw	x
; genReceive
;	src/main.c: 36: uint8_t p = blank ? 0 : SEG7[digit % 10];
; genIfx
	tnz	(0x05, sp)
	jrne	00177$
	jp	00119$
00177$:
; genAssign
	clr	a
; genGoto
	jp	00120$
; genLabel
00119$:
; skipping iCode since result will be rematerialized
; genCast
; genAssign
	clrw	x
; genIPush
	push	#0x0a
	push	#0x00
; genSend
	ld	xl, a
; genCall
	call	__modsint
; genPlus
	addw	x, #(_SEG7+0)
; genPointerGet
	ld	a, (x)
; genCast
; genAssign
; genCast
; genAssign
; genLabel
00120$:
; genCast
; genAssign
; genCast
; genAssign
	ld	(0x01, sp), a
;	src/main.c: 40: uint8_t valC  = 0;
; genAssign
	clrw	x
;	src/main.c: 42: if (p & 0x01) valC |= SEG_A;
; genAnd
	ld	a, (0x01, sp)
	srl	a
	jrc	00178$
	jp	00102$
00178$:
; skipping generated iCode
; genAssign
	ld	a, #0x08
	ld	xh, a
; genLabel
00102$:
;	src/main.c: 43: if (p & 0x02) valC |= SEG_B;
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x02
	jrne	00179$
	jp	00104$
00179$:
; skipping generated iCode
; genOr
	ld	a, xh
	or	a, #0x10
	ld	xh, a
; genLabel
00104$:
;	src/main.c: 44: if (p & 0x04) valC |= SEG_C;
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x04
	jrne	00180$
	jp	00106$
00180$:
; skipping generated iCode
; genOr
	ld	a, xh
	or	a, #0x20
	ld	xh, a
; genLabel
00106$:
;	src/main.c: 45: if (p & 0x08) valC |= SEG_D;
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x08
	jrne	00181$
	jp	00108$
00181$:
; skipping generated iCode
; genOr
	ld	a, xh
	or	a, #0x40
	ld	xh, a
; genLabel
00108$:
;	src/main.c: 46: if (p & 0x10) valC |= SEG_E;
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x10
	jrne	00182$
	jp	00110$
00182$:
; skipping generated iCode
; genOr
	sllw	x
	scf
	rrcw	x
; genLabel
00110$:
;	src/main.c: 49: (GPIO_ReadOutputData(SEG_PORT_C) & ~maskC) | valC);
; genSend
	pushw	x
	ldw	x, #0x500a
; genCall
	call	_GPIO_ReadOutputData
	ld	(0x04, sp), a
	rlwa	x
	pop	a
	rrwa	x
	addw	sp, #1
; genCpl
	ld	a, #0xff
	xor	a, #0xf8
; genAnd
	and	a, (0x02, sp)
; genOr
	pushw	x
	or	a, (1, sp)
	popw	x
;	src/main.c: 48: GPIO_Write(SEG_PORT_C,
; genSend
; genSend
	ldw	x, #0x500a
; genCall
	call	_GPIO_Write
;	src/main.c: 52: if (p & 0x20) GPIO_WriteHigh(SEG_PORT_B, SEG_F);
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x20
	jrne	00183$
	jp	00112$
00183$:
; skipping generated iCode
; genSend
	ld	a, #0x08
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00113$
; genLabel
00112$:
;	src/main.c: 53: else          GPIO_WriteLow(SEG_PORT_B, SEG_F);
; genSend
	ld	a, #0x08
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genLabel
00113$:
;	src/main.c: 55: if (p & 0x40) GPIO_WriteHigh(SEG_PORT_B, SEG_G);
; genAnd
	ld	a, (0x01, sp)
	bcp	a, #0x40
	jrne	00184$
	jp	00115$
00184$:
; skipping generated iCode
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteHigh
; genGoto
	jp	00117$
; genLabel
00115$:
;	src/main.c: 56: else          GPIO_WriteLow(SEG_PORT_B, SEG_G);
; genSend
	ld	a, #0x01
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteLow
; genLabel
00117$:
;	src/main.c: 57: }
; genEndFunction
	popw	x
	popw	x
	pop	a
	jp	(x)
;	src/main.c: 59: static void hw_init(void)
; genLabel
;	-----------------------------------------
;	 function hw_init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_hw_init:
;	src/main.c: 61: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
; genSend
	clr	a
; genCall
	call	_CLK_HSIPrescalerConfig
;	src/main.c: 62: init_milis();
; genCall
	call	_init_milis
;	src/main.c: 63: init_uart1(115200);
; genIPush
	push	#0x00
	push	#0xc2
	push	#0x01
	push	#0x00
; genCall
	call	_init_uart1
;	src/main.c: 65: GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x20
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	src/main.c: 67: GPIO_Init(SEG_PORT_C,
; genIPush
	push	#0xc0
; genSend
	ld	a, #0xf8
; genSend
	ldw	x, #0x500a
; genCall
	call	_GPIO_Init
;	src/main.c: 71: GPIO_Init(SEG_PORT_B,
; genIPush
	push	#0xc0
; genSend
	ld	a, #0x09
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	src/main.c: 75: GPIO_Init(BTN_START_PORT, BTN_START_PIN, GPIO_MODE_IN_PU_NO_IT);
; genIPush
	push	#0x40
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	src/main.c: 76: GPIO_Init(BTN_LAP_PORT,   BTN_LAP_PIN,  GPIO_MODE_IN_PU_NO_IT);
; genIPush
	push	#0x40
; genSend
	ld	a, #0x80
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_Init
;	src/main.c: 78: seg7_show(0, false);
; genIPush
	push	#0x00
; genSend
	clr	a
; genCall
	call	_seg7_show
; genLabel
00101$:
;	src/main.c: 79: }
; genEndFunction
	ret
;	src/main.c: 81: int main(void)
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 93 bytes.
_main:
	sub	sp, #93
;	src/main.c: 83: hw_init();
; genCall
	call	_hw_init
;	src/main.c: 85: bool     running    = false;
; genAssign
	clr	(0x2d, sp)
;	src/main.c: 86: uint32_t start_tick = 0;
; genAssign
	clrw	x
	ldw	(0x30, sp), x
	ldw	(0x2e, sp), x
;	src/main.c: 87: uint32_t elapsed    = 0;
; genAssign
	clrw	x
	ldw	(0x34, sp), x
	ldw	(0x32, sp), x
;	src/main.c: 88: uint32_t lap        = 0;
; genAssign
	clrw	x
	ldw	(0x38, sp), x
	ldw	(0x36, sp), x
;	src/main.c: 89: bool     lap_active = false;
; genAssign
	clr	(0x3a, sp)
;	src/main.c: 90: uint32_t lap_end    = 0;
; genAssign
	clrw	x
	ldw	(0x3d, sp), x
	ldw	(0x3b, sp), x
;	src/main.c: 92: uint32_t led_tick   = 0;
; genAssign
	clrw	x
	ldw	(0x41, sp), x
	ldw	(0x3f, sp), x
;	src/main.c: 93: uint32_t uart_tick  = 0;
; genAssign
	clrw	x
	ldw	(0x45, sp), x
	ldw	(0x43, sp), x
;	src/main.c: 94: uint32_t blink_tick = 0;
; genAssign
	clrw	x
	ldw	(0x49, sp), x
	ldw	(0x47, sp), x
;	src/main.c: 95: bool     blink_on   = true;
; genAssign
	ld	a, #0x01
	ld	(0x5d, sp), a
;	src/main.c: 97: bool     btn_s_prev = false,  btn_l_prev = false;
; genAssign
	clr	(0x4b, sp)
; genAssign
	clr	(0x4c, sp)
;	src/main.c: 98: uint32_t btn_s_t    = 0,      btn_l_t    = 0;
; genAssign
	clrw	x
	ldw	(0x4f, sp), x
	ldw	(0x4d, sp), x
; genAssign
	clrw	x
	ldw	(0x53, sp), x
	ldw	(0x51, sp), x
;	src/main.c: 101: while (1) {
; genLabel
00134$:
;	src/main.c: 102: uint32_t now = milis();
; genCall
	call	_milis
	ldw	(0x57, sp), x
	ldw	(0x55, sp), y
;	src/main.c: 104: bool s = (GPIO_ReadInputPin(BTN_START_PORT, BTN_START_PIN) == RESET);
; genSend
	ld	a, #0x10
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_ReadInputPin
; genNot
	xor	a, #0x01
	ld	(0x59, sp), a
;	src/main.c: 105: bool l = (GPIO_ReadInputPin(BTN_LAP_PORT,   BTN_LAP_PIN)   == RESET);
; genSend
	ld	a, #0x80
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_ReadInputPin
; genNot
	xor	a, #0x01
	ld	(0x5a, sp), a
;	src/main.c: 107: bool s_edge = s && !btn_s_prev && (now - btn_s_t > 20);
; genIfx
	tnz	(0x59, sp)
	jrne	00297$
	jp	00138$
00297$:
; genIfx
	tnz	(0x4b, sp)
	jreq	00298$
	jp	00138$
00298$:
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x4f, sp)
	ldw	(0x03, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x4e, sp)
	ld	(0x02, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x4d, sp)
	ld	(0x01, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x0014
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrnc	00299$
	jp	00139$
00299$:
; skipping generated iCode
; genLabel
00138$:
; genAssign
	clr	a
; genGoto
	jp	00140$
; genLabel
00139$:
; genAssign
	ld	a, #0x01
; genLabel
00140$:
; genAssign
	ld	(0x5b, sp), a
;	src/main.c: 108: bool l_edge = l && !btn_l_prev && (now - btn_l_t > 20);
; genIfx
	tnz	(0x5a, sp)
	jrne	00300$
	jp	00144$
00300$:
; genIfx
	tnz	(0x4c, sp)
	jreq	00301$
	jp	00144$
00301$:
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x53, sp)
	ldw	(0x03, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x52, sp)
	ld	(0x02, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x51, sp)
	ld	(0x01, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x0014
	cpw	x, (0x03, sp)
	clr	a
	sbc	a, (0x02, sp)
	clr	a
	sbc	a, (0x01, sp)
	jrnc	00302$
	jp	00145$
00302$:
; skipping generated iCode
; genLabel
00144$:
; genAssign
	clr	a
; genGoto
	jp	00146$
; genLabel
00145$:
; genAssign
	ld	a, #0x01
; genLabel
00146$:
; genAssign
	ld	(0x5c, sp), a
;	src/main.c: 110: if (!s) btn_s_prev = false;
; genIfx
	tnz	(0x59, sp)
	jreq	00303$
	jp	00104$
00303$:
; genAssign
	clr	(0x4b, sp)
; genGoto
	jp	00105$
; genLabel
00104$:
;	src/main.c: 111: else if (s_edge) { btn_s_prev = true; btn_s_t = now; }
; genIfx
	tnz	(0x5b, sp)
	jrne	00304$
	jp	00105$
00304$:
; genAssign
	ld	a, #0x01
	ld	(0x4b, sp), a
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x4f, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x4d, sp), y
; genLabel
00105$:
;	src/main.c: 113: if (!l) btn_l_prev = false;
; genIfx
	tnz	(0x5a, sp)
	jreq	00305$
	jp	00109$
00305$:
; genAssign
	clr	(0x4c, sp)
; genGoto
	jp	00110$
; genLabel
00109$:
;	src/main.c: 114: else if (l_edge) { btn_l_prev = true; btn_l_t = now; }
; genIfx
	tnz	(0x5c, sp)
	jrne	00306$
	jp	00110$
00306$:
; genAssign
	ld	a, #0x01
	ld	(0x4c, sp), a
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x53, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x51, sp), y
; genLabel
00110$:
;	src/main.c: 116: if (s_edge) {
; genIfx
	tnz	(0x5b, sp)
	jrne	00307$
	jp	00115$
00307$:
;	src/main.c: 117: if (!running) {
; genIfx
	tnz	(0x2d, sp)
	jreq	00308$
	jp	00112$
00308$:
;	src/main.c: 118: start_tick = now - elapsed;
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x34, sp)
	ldw	(0x30, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x33, sp)
	ld	(0x2f, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x32, sp)
	ld	(0x2e, sp), a
;	src/main.c: 119: running    = true;
; genAssign
	ld	a, #0x01
	ld	(0x2d, sp), a
; genGoto
	jp	00115$
; genLabel
00112$:
;	src/main.c: 121: elapsed    = now - start_tick;
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x30, sp)
	ldw	(0x34, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x2f, sp)
	ld	(0x33, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x2e, sp)
	ld	(0x32, sp), a
;	src/main.c: 122: running    = false;
; genAssign
	clr	(0x2d, sp)
;	src/main.c: 123: blink_tick = now;
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x49, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x47, sp), y
;	src/main.c: 124: blink_on   = true;
; genAssign
	ld	a, #0x01
	ld	(0x5d, sp), a
; genLabel
00115$:
;	src/main.c: 121: elapsed    = now - start_tick;
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x30, sp)
	ldw	(0x03, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x2f, sp)
	ld	xl, a
	ld	a, (0x55, sp)
	sbc	a, (0x2e, sp)
	ld	xh, a
;	src/main.c: 128: if (l_edge && running) {
; genIfx
	tnz	(0x5c, sp)
	jrne	00309$
	jp	00117$
00309$:
; genIfx
	tnz	(0x2d, sp)
	jrne	00310$
	jp	00117$
00310$:
;	src/main.c: 129: lap        = now - start_tick;
; genAssign
	ldw	(0x36, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x38, sp), y
;	src/main.c: 130: lap_active = true;
; genAssign
	ld	a, #0x01
	ld	(0x3a, sp), a
;	src/main.c: 131: lap_end    = now + 2000;
; genPlus
	ldw	y, (0x57, sp)
	addw	y, #0x07d0
	ldw	(0x3d, sp), y
	ld	a, (0x56, sp)
	adc	a, #0x00
	ld	(0x3c, sp), a
	ld	a, (0x55, sp)
	adc	a, #0x00
	ld	(0x3b, sp), a
; genLabel
00117$:
;	src/main.c: 134: if (running) elapsed = now - start_tick;
; genIfx
	tnz	(0x2d, sp)
	jrne	00311$
	jp	00120$
00311$:
; genAssign
	ldw	(0x32, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x34, sp), y
; genLabel
00120$:
;	src/main.c: 135: if (lap_active && now >= lap_end) lap_active = false;
; genIfx
	tnz	(0x3a, sp)
	jrne	00312$
	jp	00122$
00312$:
; genCmp
; genCmpTnz
	ldw	x, (0x57, sp)
	cpw	x, (0x3d, sp)
	ld	a, (0x56, sp)
	sbc	a, (0x3c, sp)
	ld	a, (0x55, sp)
	sbc	a, (0x3b, sp)
	jrnc	00313$
	jp	00122$
00313$:
; skipping generated iCode
; genAssign
	clr	(0x3a, sp)
; genLabel
00122$:
;	src/main.c: 137: uint32_t disp = lap_active ? lap : elapsed;
; genIfx
	tnz	(0x3a, sp)
	jrne	00314$
	jp	00150$
00314$:
; genAssign
	ldw	y, (0x38, sp)
	ldw	(0x5b, sp), y
	ldw	y, (0x36, sp)
; genGoto
	jp	00151$
; genLabel
00150$:
; genAssign
	ldw	y, (0x34, sp)
	ldw	(0x5b, sp), y
	ldw	y, (0x32, sp)
; genLabel
00151$:
; genAssign
	ldw	x, (0x5b, sp)
;	src/main.c: 138: uint8_t  dig  = (uint8_t)((disp / 1000) % 10);
; genIPush
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
; genIPush
	pushw	x
	pushw	y
; genCall
	call	__divulong
	addw	sp, #8
; genIPush
	push	#0x0a
	push	#0x00
	push	#0x00
	push	#0x00
; genIPush
	pushw	x
	pushw	y
; genCall
	call	__modulong
	addw	sp, #8
; genCast
; genAssign
;	src/main.c: 140: if (!running) {
; genIfx
	tnz	(0x2d, sp)
	jreq	00315$
	jp	00127$
00315$:
;	src/main.c: 141: if (now - blink_tick > 500) {
; genMinus
	ldw	y, (0x57, sp)
	subw	y, (0x49, sp)
	ldw	(0x5b, sp), y
	ld	a, (0x56, sp)
	sbc	a, (0x48, sp)
	ld	(0x5a, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x47, sp)
	ld	(0x59, sp), a
; genCmp
; genCmpTnz
	ld	a, #0xf4
	cp	a, (0x5c, sp)
	ld	a, #0x01
	sbc	a, (0x5b, sp)
	clr	a
	sbc	a, (0x5a, sp)
	clr	a
	sbc	a, (0x59, sp)
	jrc	00316$
	jp	00125$
00316$:
; skipping generated iCode
;	src/main.c: 142: blink_on = !blink_on;
; genNot
	srl	(0x5d, sp)
	ccf
	rlc	(0x5d, sp)
;	src/main.c: 143: blink_tick = now;
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x49, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x47, sp), y
; genLabel
00125$:
;	src/main.c: 145: seg7_show(dig, !blink_on);
; genNot
	ld	a, (0x5d, sp)
	xor	a, #0x01
; genIPush
	push	a
; genSend
	ld	a, xl
; genCall
	call	_seg7_show
; genGoto
	jp	00128$
; genLabel
00127$:
;	src/main.c: 147: seg7_show(dig, false);
; genIPush
	push	#0x00
; genSend
	ld	a, xl
; genCall
	call	_seg7_show
; genLabel
00128$:
;	src/main.c: 150: if (now - led_tick > 1000) {
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x41, sp)
	ldw	(0x5b, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x40, sp)
	ld	(0x5a, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x3f, sp)
	ld	(0x59, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x03e8
	cpw	x, (0x5b, sp)
	clr	a
	sbc	a, (0x5a, sp)
	clr	a
	sbc	a, (0x59, sp)
	jrc	00317$
	jp	00130$
00317$:
; skipping generated iCode
;	src/main.c: 151: REVERSE(LED);
; genSend
	ld	a, #0x20
; genSend
	ldw	x, #0x5005
; genCall
	call	_GPIO_WriteReverse
;	src/main.c: 152: led_tick = now;
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x41, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x3f, sp), y
; genLabel
00130$:
;	src/main.c: 155: if (now - uart_tick > 1000) {
; genMinus
	ldw	x, (0x57, sp)
	subw	x, (0x45, sp)
	ldw	(0x5b, sp), x
	ld	a, (0x56, sp)
	sbc	a, (0x44, sp)
	ld	(0x5a, sp), a
	ld	a, (0x55, sp)
	sbc	a, (0x43, sp)
	ld	(0x59, sp), a
; genCmp
; genCmpTnz
	ldw	x, #0x03e8
	cpw	x, (0x5b, sp)
	clr	a
	sbc	a, (0x5a, sp)
	clr	a
	sbc	a, (0x59, sp)
	jrc	00318$
	jp	00134$
00318$:
; skipping generated iCode
;	src/main.c: 158: (uint16_t)(lap / 1000),     (uint8_t)((lap % 1000) / 10));
; genIPush
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genIPush
	ldw	x, (0x3c, sp)
	pushw	x
	ldw	x, (0x3c, sp)
	pushw	x
; genCall
	call	__modulong
	addw	sp, #8
; genIPush
	push	#0x0a
	push	#0x00
	push	#0x00
	push	#0x00
; genIPush
	pushw	x
	pushw	y
; genCall
	call	__divulong
	addw	sp, #8
	ld	a, xl
; genCast
; genAssign
; genIPush
	push	a
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genIPush
	ldw	x, (0x3d, sp)
	pushw	x
	ldw	x, (0x3d, sp)
	pushw	x
; genCall
	call	__divulong
	addw	sp, #8
	pop	a
; genCast
; genAssign
	ldw	(0x5a, sp), x
;	src/main.c: 157: (uint16_t)(elapsed / 1000), (uint8_t)((elapsed % 1000) / 10),
; genIPush
	push	a
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genIPush
	ldw	x, (0x39, sp)
	pushw	x
	ldw	x, (0x39, sp)
	pushw	x
; genCall
	call	__modulong
	addw	sp, #8
	ldw	(0x46, sp), x
	pop	a
; genIPush
	push	a
	push	#0x0a
	clrw	x
	pushw	x
	push	#0x00
; genIPush
	ldw	x, (0x4a, sp)
	pushw	x
	pushw	y
; genCall
	call	__divulong
	addw	sp, #8
	pop	a
; genCast
; genAssign
	exg	a, xl
	ld	(0x5c, sp), a
	exg	a, xl
; genIPush
	push	a
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
; genIPush
	ldw	x, (0x39, sp)
	pushw	x
	ldw	x, (0x39, sp)
	pushw	x
; genCall
	call	__divulong
	addw	sp, #8
	pop	a
; genCast
; genAssign
;	src/main.c: 156: sprintf(buf, "T=%u.%02us LAP=%u.%02us\r\n",
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genIPush
	push	a
; genIPush
	ldw	y, (0x5b, sp)
	pushw	y
; genIPush
	ld	a, (0x5f, sp)
	push	a
; genIPush
	pushw	x
; genIPush
	push	#<(___str_0+0)
	push	#((___str_0+0) >> 8)
; genIPush
	ldw	x, sp
	addw	x, #13
	pushw	x
; genCall
	call	_sprintf
	addw	sp, #10
;	src/main.c: 159: uart1_puts(buf);
; skipping iCode since result will be rematerialized
; skipping iCode since result will be rematerialized
; genSend
	ldw	x, sp
	addw	x, #5
; genCall
	call	_uart1_puts
;	src/main.c: 160: uart_tick = now;
; genAssign
	ldw	y, (0x57, sp)
	ldw	(0x45, sp), y
	ldw	y, (0x55, sp)
	ldw	(0x43, sp), y
; genGoto
	jp	00134$
; genLabel
00136$:
;	src/main.c: 163: }
; genEndFunction
	addw	sp, #93
	ret
	.area CODE
	.area CONST
_SEG7:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.area CONST
___str_0:
	.ascii "T=%u.%02us LAP=%u.%02us"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
