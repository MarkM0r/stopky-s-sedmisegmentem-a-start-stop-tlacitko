;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Linux)
;--------------------------------------------------------
	.module stm8s_it
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_ClearFlag
	.globl _TRAP_IRQHandler
	.globl _TLI_IRQHandler
	.globl _AWU_IRQHandler
	.globl _CLK_IRQHandler
	.globl _EXTI_PORTA_IRQHandler
	.globl _EXTI_PORTB_IRQHandler
	.globl _EXTI_PORTC_IRQHandler
	.globl _EXTI_PORTD_IRQHandler
	.globl _EXTI_PORTE_IRQHandler
	.globl _CAN_RX_IRQHandler
	.globl _CAN_TX_IRQHandler
	.globl _SPI_IRQHandler
	.globl _TIM1_UPD_OVF_TRG_BRK_IRQHandler
	.globl _TIM1_CAP_COM_IRQHandler
	.globl _TIM2_UPD_OVF_BRK_IRQHandler
	.globl _TIM2_CAP_COM_IRQHandler
	.globl _TIM3_UPD_OVF_BRK_IRQHandler
	.globl _TIM3_CAP_COM_IRQHandler
	.globl _UART1_TX_IRQHandler
	.globl _UART1_RX_IRQHandler
	.globl _I2C_IRQHandler
	.globl _UART3_TX_IRQHandler
	.globl _UART3_RX_IRQHandler
	.globl _ADC2_IRQHandler
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _EEPROM_EEC_IRQHandler
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
;	src/stm8s_it.c: 65: INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
; genLabel
;	-----------------------------------------
;	 function TRAP_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TRAP_IRQHandler:
;	src/stm8s_it.c: 70: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 76: INTERRUPT_HANDLER(TLI_IRQHandler, 0)
; genLabel
;	-----------------------------------------
;	 function TLI_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TLI_IRQHandler:
;	src/stm8s_it.c: 81: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 88: INTERRUPT_HANDLER(AWU_IRQHandler, 1)
; genLabel
;	-----------------------------------------
;	 function AWU_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_AWU_IRQHandler:
;	src/stm8s_it.c: 93: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 100: INTERRUPT_HANDLER(CLK_IRQHandler, 2)
; genLabel
;	-----------------------------------------
;	 function CLK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CLK_IRQHandler:
;	src/stm8s_it.c: 105: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 112: INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTA_IRQHandler:
;	src/stm8s_it.c: 117: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 124: INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTB_IRQHandler:
;	src/stm8s_it.c: 129: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 136: INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTC_IRQHandler:
;	src/stm8s_it.c: 141: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 148: INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTD_IRQHandler:
;	src/stm8s_it.c: 153: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 160: INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
; genLabel
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EXTI_PORTE_IRQHandler:
;	src/stm8s_it.c: 165: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 186: INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
; genLabel
;	-----------------------------------------
;	 function CAN_RX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CAN_RX_IRQHandler:
;	src/stm8s_it.c: 191: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 198: INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
; genLabel
;	-----------------------------------------
;	 function CAN_TX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_CAN_TX_IRQHandler:
;	src/stm8s_it.c: 203: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 211: INTERRUPT_HANDLER(SPI_IRQHandler, 10)
; genLabel
;	-----------------------------------------
;	 function SPI_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_SPI_IRQHandler:
;	src/stm8s_it.c: 216: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 223: INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
; genLabel
;	-----------------------------------------
;	 function TIM1_UPD_OVF_TRG_BRK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
;	src/stm8s_it.c: 228: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 235: INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
; genLabel
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM1_CAP_COM_IRQHandler:
;	src/stm8s_it.c: 240: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 272: INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
; genLabel
;	-----------------------------------------
;	 function TIM2_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM2_UPD_OVF_BRK_IRQHandler:
;	src/stm8s_it.c: 277: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 284: INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
; genLabel
;	-----------------------------------------
;	 function TIM2_CAP_COM_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM2_CAP_COM_IRQHandler:
;	src/stm8s_it.c: 289: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 299: INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
; genLabel
;	-----------------------------------------
;	 function TIM3_UPD_OVF_BRK_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM3_UPD_OVF_BRK_IRQHandler:
;	src/stm8s_it.c: 304: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 311: INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
; genLabel
;	-----------------------------------------
;	 function TIM3_CAP_COM_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_TIM3_CAP_COM_IRQHandler:
;	src/stm8s_it.c: 316: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 326: INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
; genLabel
;	-----------------------------------------
;	 function UART1_TX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART1_TX_IRQHandler:
;	src/stm8s_it.c: 331: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 338: INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
; genLabel
;	-----------------------------------------
;	 function UART1_RX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART1_RX_IRQHandler:
;	src/stm8s_it.c: 343: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 351: INTERRUPT_HANDLER(I2C_IRQHandler, 19)
; genLabel
;	-----------------------------------------
;	 function I2C_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_I2C_IRQHandler:
;	src/stm8s_it.c: 356: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 390: INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
; genLabel
;	-----------------------------------------
;	 function UART3_TX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART3_TX_IRQHandler:
;	src/stm8s_it.c: 395: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 402: INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
; genLabel
;	-----------------------------------------
;	 function UART3_RX_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_UART3_RX_IRQHandler:
;	src/stm8s_it.c: 407: }
; genLabel
00101$:
; genEndFunction
	iret
;	src/stm8s_it.c: 416: INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
; genLabel
;	-----------------------------------------
;	 function ADC2_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_ADC2_IRQHandler:
;	src/stm8s_it.c: 422: return;
; genReturn
; genLabel
00101$:
;	src/stm8s_it.c: 424: }
; genEndFunction
	iret
;	src/stm8s_it.c: 473: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
; genLabel
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 0 bytes.
_TIM4_UPD_OVF_IRQHandler:
;	Reset bit 6 of reg CC. Hardware bug workaround.
	div	x, a
;	src/stm8s_it.c: 475: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
; genSend
	ld	a, #0x01
; genCall
	call	_TIM4_ClearFlag
;	src/stm8s_it.c: 476: miliseconds++;
; genAssign
	ldw	x, _miliseconds+2
	ldw	y, _miliseconds+0
; genPlus
	incw	x
	jrne	00103$
	incw	y
00103$:
; genAssign
	ldw	_miliseconds+2, x
	ldw	_miliseconds+0, y
; genLabel
00101$:
;	src/stm8s_it.c: 477: }
; genEndFunction
	iret
;	src/stm8s_it.c: 485: INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
; genLabel
;	-----------------------------------------
;	 function EEPROM_EEC_IRQHandler
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_EEPROM_EEC_IRQHandler:
;	src/stm8s_it.c: 490: }
; genLabel
00101$:
; genEndFunction
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
