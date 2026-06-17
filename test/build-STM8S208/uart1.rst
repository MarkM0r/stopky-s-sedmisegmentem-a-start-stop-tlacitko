                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module uart1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UART1_GetFlagStatus
                                     12 	.globl _UART1_SendData8
                                     13 	.globl _UART1_Cmd
                                     14 	.globl _UART1_Init
                                     15 	.globl _UART1_DeInit
                                     16 	.globl _CLK_PeripheralClockConfig
                                     17 	.globl _init_uart1
                                     18 	.globl _uart1_puts
                                     19 	.globl _putchar
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 
                                     33 ; default segment ordering for linker
                                     34 	.area HOME
                                     35 	.area GSINIT
                                     36 	.area GSFINAL
                                     37 	.area CONST
                                     38 	.area INITIALIZER
                                     39 	.area CODE
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; global & static initialisations
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
                                     45 	.area GSINIT
                                     46 	.area GSFINAL
                                     47 	.area GSINIT
                                     48 ;--------------------------------------------------------
                                     49 ; Home
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area HOME
                                     53 ;--------------------------------------------------------
                                     54 ; code
                                     55 ;--------------------------------------------------------
                                     56 	.area CODE
                                     57 ;	src/uart1.c: 4: void init_uart1(uint32_t baud)
                                     58 ; genLabel
                                     59 ;	-----------------------------------------
                                     60 ;	 function init_uart1
                                     61 ;	-----------------------------------------
                                     62 ;	Register assignment is optimal.
                                     63 ;	Stack space usage: 0 bytes.
      008643                         64 _init_uart1:
                                     65 ;	src/uart1.c: 7: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
                                     66 ; genIPush
      008643 4B 01            [ 1]   67 	push	#0x01
                                     68 ; genSend
      008645 A6 02            [ 1]   69 	ld	a, #0x02
                                     70 ; genCall
      008647 CD 88 6B         [ 4]   71 	call	_CLK_PeripheralClockConfig
                                     72 ;	src/uart1.c: 10: UART1_DeInit();
                                     73 ; genCall
      00864A CD 89 1D         [ 4]   74 	call	_UART1_DeInit
                                     75 ;	src/uart1.c: 11: UART1_Init(baud,
                                     76 ; genIPush
      00864D 4B 04            [ 1]   77 	push	#0x04
                                     78 ; genIPush
      00864F 4B 80            [ 1]   79 	push	#0x80
                                     80 ; genIPush
      008651 4B 00            [ 1]   81 	push	#0x00
                                     82 ; genIPush
      008653 4B 00            [ 1]   83 	push	#0x00
                                     84 ; genIPush
      008655 4B 00            [ 1]   85 	push	#0x00
                                     86 ; genIPush
      008657 1E 0A            [ 2]   87 	ldw	x, (0x0a, sp)
      008659 89               [ 2]   88 	pushw	x
      00865A 1E 0A            [ 2]   89 	ldw	x, (0x0a, sp)
      00865C 89               [ 2]   90 	pushw	x
                                     91 ; genCall
      00865D CD 8B 42         [ 4]   92 	call	_UART1_Init
                                     93 ;	src/uart1.c: 18: UART1_Cmd(ENABLE);
                                     94 ; genSend
      008660 A6 01            [ 1]   95 	ld	a, #0x01
                                     96 ; genCall
      008662 CD 8B 26         [ 4]   97 	call	_UART1_Cmd
                                     98 ; genLabel
      008665                         99 00101$:
                                    100 ;	src/uart1.c: 19: }
                                    101 ; genEndFunction
      008665 1E 01            [ 2]  102 	ldw	x, (1, sp)
      008667 5B 06            [ 2]  103 	addw	sp, #6
      008669 FC               [ 2]  104 	jp	(x)
                                    105 ;	src/uart1.c: 22: void uart1_puts(const char *s)
                                    106 ; genLabel
                                    107 ;	-----------------------------------------
                                    108 ;	 function uart1_puts
                                    109 ;	-----------------------------------------
                                    110 ;	Register assignment is optimal.
                                    111 ;	Stack space usage: 0 bytes.
      00866A                        112 _uart1_puts:
                                    113 ; genReceive
                                    114 ;	src/uart1.c: 24: while (*s) {
                                    115 ; genLabel
      00866A                        116 00104$:
                                    117 ; genPointerGet
      00866A F6               [ 1]  118 	ld	a, (x)
                                    119 ; genIfx
      00866B 4D               [ 1]  120 	tnz	a
      00866C 26 03            [ 1]  121 	jrne	00138$
      00866E CC 86 88         [ 2]  122 	jp	00107$
      008671                        123 00138$:
                                    124 ;	src/uart1.c: 25: UART1_SendData8((uint8_t)*s++);
                                    125 ; genPlus
      008671 5C               [ 1]  126 	incw	x
                                    127 ; genSend
      008672 89               [ 2]  128 	pushw	x
                                    129 ; genCall
      008673 CD 89 19         [ 4]  130 	call	_UART1_SendData8
      008676 85               [ 2]  131 	popw	x
                                    132 ;	src/uart1.c: 26: while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
                                    133 ; genLabel
      008677                        134 00101$:
                                    135 ; genSend
      008677 89               [ 2]  136 	pushw	x
      008678 AE 00 80         [ 2]  137 	ldw	x, #0x0080
                                    138 ; genCall
      00867B CD 87 28         [ 4]  139 	call	_UART1_GetFlagStatus
      00867E 85               [ 2]  140 	popw	x
                                    141 ; genIfx
      00867F 4D               [ 1]  142 	tnz	a
      008680 27 03            [ 1]  143 	jreq	00139$
      008682 CC 86 6A         [ 2]  144 	jp	00104$
      008685                        145 00139$:
                                    146 ; genGoto
      008685 CC 86 77         [ 2]  147 	jp	00101$
                                    148 ; genLabel
      008688                        149 00107$:
                                    150 ;	src/uart1.c: 30: }
                                    151 ; genEndFunction
      008688 81               [ 4]  152 	ret
                                    153 ;	src/uart1.c: 33: PUTCHAR_PROTOTYPE
                                    154 ; genLabel
                                    155 ;	-----------------------------------------
                                    156 ;	 function putchar
                                    157 ;	-----------------------------------------
                                    158 ;	Register assignment is optimal.
                                    159 ;	Stack space usage: 0 bytes.
      008689                        160 _putchar:
                                    161 ; genReceive
                                    162 ;	src/uart1.c: 35: UART1_SendData8((uint8_t)c);
                                    163 ; genCast
                                    164 ; genAssign
      008689 9F               [ 1]  165 	ld	a, xl
                                    166 ; genSend
      00868A 89               [ 2]  167 	pushw	x
                                    168 ; genCall
      00868B CD 89 19         [ 4]  169 	call	_UART1_SendData8
      00868E 85               [ 2]  170 	popw	x
                                    171 ;	src/uart1.c: 36: while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
                                    172 ; genLabel
      00868F                        173 00101$:
                                    174 ; genSend
      00868F 89               [ 2]  175 	pushw	x
      008690 AE 00 80         [ 2]  176 	ldw	x, #0x0080
                                    177 ; genCall
      008693 CD 87 28         [ 4]  178 	call	_UART1_GetFlagStatus
      008696 85               [ 2]  179 	popw	x
                                    180 ; genIfx
      008697 4D               [ 1]  181 	tnz	a
      008698 26 03            [ 1]  182 	jrne	00120$
      00869A CC 86 8F         [ 2]  183 	jp	00101$
      00869D                        184 00120$:
                                    185 ;	src/uart1.c: 39: return c;
                                    186 ; genReturn
                                    187 ; genLabel
      00869D                        188 00104$:
                                    189 ;	src/uart1.c: 40: }
                                    190 ; genEndFunction
      00869D 81               [ 4]  191 	ret
                                    192 	.area CODE
                                    193 	.area CONST
                                    194 	.area INITIALIZER
                                    195 	.area CABS (ABS)
