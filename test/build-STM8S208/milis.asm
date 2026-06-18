;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module milis
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_ClearFlag
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _ITC_SetSoftwarePriority
	.globl _miliseconds
	.globl _milis
	.globl _init_milis
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_miliseconds::
	.ds 4
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
;	src/milis.c: 13: MILIS_PROTOTYPE
; genLabel
;	-----------------------------------------
;	 function milis
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 4 bytes.
_milis:
	sub	sp, #4
;	src/milis.c: 20: TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
; genIPush
	push	#0x00
; genSend
	ld	a, #0x01
; genCall
	call	_TIM4_ITConfig
;	src/milis.c: 21: tmp = miliseconds;
; genAssign
	ldw	x, _miliseconds+2
	ldw	y, _miliseconds+0
	ldw	(0x01, sp), y
;	src/milis.c: 22: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
; genIPush
	pushw	x
	push	#0x01
; genSend
	ld	a, #0x01
; genCall
	call	_TIM4_ITConfig
	popw	x
;	src/milis.c: 23: return tmp;
; genReturn
	ldw	y, (0x01, sp)
; genLabel
00101$:
;	src/milis.c: 24: }
; genEndFunction
	addw	sp, #4
	ret
;	src/milis.c: 27: void init_milis(void)
; genLabel
;	-----------------------------------------
;	 function init_milis
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_init_milis:
;	src/milis.c: 29: TIM4_TimeBaseInit(PRESCALER, PERIOD);       // (16MHz / 128) / 125 = 1000Hz
; genIPush
	push	#0x7c
; genSend
	ld	a, #0x07
; genCall
	call	_TIM4_TimeBaseInit
;	src/milis.c: 30: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
; genSend
	ld	a, #0x01
; genCall
	call	_TIM4_ClearFlag
;	src/milis.c: 31: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
; genIPush
	push	#0x01
; genSend
	ld	a, #0x01
; genCall
	call	_TIM4_ITConfig
;	src/milis.c: 32: ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);     // nízká priorita pøerušení
; genIPush
	push	#0x01
; genSend
	ld	a, #0x17
; genCall
	call	_ITC_SetSoftwarePriority
;	src/milis.c: 33: enableInterrupts();
;	genInline
	rim
;	src/milis.c: 34: TIM4_Cmd(ENABLE);
; genSend
	ld	a, #0x01
; genCall
	jp	_TIM4_Cmd
; genLabel
00101$:
;	src/milis.c: 35: }
; genEndFunction
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__miliseconds:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
	.area CABS (ABS)
