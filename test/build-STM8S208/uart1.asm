;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module uart1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_GetFlagStatus
	.globl _UART1_SendData8
	.globl _UART1_Cmd
	.globl _UART1_Init
	.globl _UART1_DeInit
	.globl _CLK_PeripheralClockConfig
	.globl _init_uart1
	.globl _uart1_puts
	.globl _putchar
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	src/uart1.c: 4: void init_uart1(uint32_t baud)
; genLabel
;	-----------------------------------------
;	 function init_uart1
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_init_uart1:
;	src/uart1.c: 7: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x02
; genCall
	call	_CLK_PeripheralClockConfig
;	src/uart1.c: 10: UART1_DeInit();
; genCall
	call	_UART1_DeInit
;	src/uart1.c: 11: UART1_Init(baud,
; genIPush
	push	#0x04
; genIPush
	push	#0x80
; genIPush
	push	#0x00
; genIPush
	push	#0x00
; genIPush
	push	#0x00
; genIPush
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
; genCall
	call	_UART1_Init
;	src/uart1.c: 18: UART1_Cmd(ENABLE);
; genSend
	ld	a, #0x01
; genCall
	call	_UART1_Cmd
; genLabel
00101$:
;	src/uart1.c: 19: }
; genEndFunction
	ldw	x, (1, sp)
	addw	sp, #6
	jp	(x)
;	src/uart1.c: 22: void uart1_puts(const char *s)
; genLabel
;	-----------------------------------------
;	 function uart1_puts
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_uart1_puts:
; genReceive
;	src/uart1.c: 24: while (*s) {
; genLabel
00104$:
; genPointerGet
	ld	a, (x)
; genIfx
	tnz	a
	jrne	00138$
	jp	00107$
00138$:
;	src/uart1.c: 25: UART1_SendData8((uint8_t)*s++);
; genPlus
	incw	x
; genSend
	pushw	x
; genCall
	call	_UART1_SendData8
	popw	x
;	src/uart1.c: 26: while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
; genLabel
00101$:
; genSend
	pushw	x
	ldw	x, #0x0080
; genCall
	call	_UART1_GetFlagStatus
	popw	x
; genIfx
	tnz	a
	jreq	00139$
	jp	00104$
00139$:
; genGoto
	jp	00101$
; genLabel
00107$:
;	src/uart1.c: 30: }
; genEndFunction
	ret
;	src/uart1.c: 33: PUTCHAR_PROTOTYPE
; genLabel
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_putchar:
; genReceive
;	src/uart1.c: 35: UART1_SendData8((uint8_t)c);
; genCast
; genAssign
	ld	a, xl
; genSend
	pushw	x
; genCall
	call	_UART1_SendData8
	popw	x
;	src/uart1.c: 36: while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
; genLabel
00101$:
; genSend
	pushw	x
	ldw	x, #0x0080
; genCall
	call	_UART1_GetFlagStatus
	popw	x
; genIfx
	tnz	a
	jrne	00120$
	jp	00101$
00120$:
;	src/uart1.c: 39: return c;
; genReturn
; genLabel
00104$:
;	src/uart1.c: 40: }
; genEndFunction
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
