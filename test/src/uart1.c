#include "stm8s.h"
#include "uart1.h"

void init_uart1(uint32_t baud)
{
    /* Povolit hodinový signál pro UART1 (podle SPL konfigurace) */
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);

    /* Inicializace UART1 – 8N1, asynchronní, pouze TX */
    UART1_DeInit();
    UART1_Init(baud,
               UART1_WORDLENGTH_8D,
               UART1_STOPBITS_1,
               UART1_PARITY_NO,
               UART1_SYNCMODE_CLOCK_DISABLE,
               UART1_MODE_TX_ENABLE);

    UART1_Cmd(ENABLE);
}

/* Jednoduchý blokující výpis řetězce */
void uart1_puts(const char *s)
{
    while (*s) {
        UART1_SendData8((uint8_t)*s++);
        while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
            /* čekej, než se vyprázdní TX buffer */
        }
    }
}

/* Přesměrování printf -> UART1 */
PUTCHAR_PROTOTYPE
{
    UART1_SendData8((uint8_t)c);
    while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET) {
        /* čekej */
    }
    return c;
}
