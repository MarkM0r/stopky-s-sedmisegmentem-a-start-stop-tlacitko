#ifndef __STM8_UART1_H
#define __STM8_UART1_H

#include "stm8s.h"

#define _ISOC99_SOURCE
#define _GNU_SOURCE

#ifdef _RAISONANCE_
  #define PUTCHAR_PROTOTYPE int putchar (char c)
  #define GETCHAR_PROTOTYPE int getchar (void)
#elif defined (_COSMIC_)
  #define PUTCHAR_PROTOTYPE char putchar (char c)
  #define GETCHAR_PROTOTYPE char getchar (void)
#elif defined (_SDCC_)
  #define PUTCHAR_PROTOTYPE int putchar(int c)
  #define GETCHAR_PROTOTYPE int getchar(void)
#else
  #define PUTCHAR_PROTOTYPE int putchar (int c)
  #define GETCHAR_PROTOTYPE int getchar (void)
#endif

PUTCHAR_PROTOTYPE;
GETCHAR_PROTOTYPE;

/* Inicializace UART1 na zadaný baudrate (např. 115200) */
void init_uart1(uint32_t baud);

/* Odeslání C‑řetězce přes UART1 (blokující) */
void uart1_puts(const char *s);

#endif /* __STM8_UART1_H */
