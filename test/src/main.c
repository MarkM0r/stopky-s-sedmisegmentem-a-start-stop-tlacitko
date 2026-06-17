#include <stdbool.h>
#include <stdio.h>
#include <stm8s.h>
#include "main.h"
#include "milis.h"
#include "uart1.h"

#define LED_PORT  GPIOB
#define LED_PIN   GPIO_PIN_5

// Segmenty A–E na PORTC
#define SEG_PORT_C  GPIOC
#define SEG_A  GPIO_PIN_3
#define SEG_B  GPIO_PIN_4
#define SEG_C  GPIO_PIN_5
#define SEG_D  GPIO_PIN_6
#define SEG_E  GPIO_PIN_7

// Segmenty F a G na PORTB (nové piny!)
#define SEG_PORT_B  GPIOB
#define SEG_F  GPIO_PIN_3   // PB3
#define SEG_G  GPIO_PIN_0   // PB0

#define BTN_START_PORT  GPIOB
#define BTN_START_PIN   GPIO_PIN_4
#define BTN_LAP_PORT    GPIOB
#define BTN_LAP_PIN     GPIO_PIN_7

static const uint8_t SEG7[10] = {
    0x3F, 0x06, 0x5B, 0x4F, 0x66,
    0x6D, 0x7D, 0x07, 0x7F, 0x6F
};

static void seg7_show(uint8_t digit, bool blank)
{
    uint8_t p = blank ? 0 : SEG7[digit % 10];

    /* PORT C: segmenty A–E */
    uint8_t maskC = SEG_A | SEG_B | SEG_C | SEG_D | SEG_E;
    uint8_t valC  = 0;

    if (p & 0x01) valC |= SEG_A;
    if (p & 0x02) valC |= SEG_B;
    if (p & 0x04) valC |= SEG_C;
    if (p & 0x08) valC |= SEG_D;
    if (p & 0x10) valC |= SEG_E;

    GPIO_Write(SEG_PORT_C,
               (GPIO_ReadOutputData(SEG_PORT_C) & ~maskC) | valC);

    /* PORT B: segmenty F a G */
    if (p & 0x20) GPIO_WriteHigh(SEG_PORT_B, SEG_F);
    else          GPIO_WriteLow(SEG_PORT_B, SEG_F);

    if (p & 0x40) GPIO_WriteHigh(SEG_PORT_B, SEG_G);
    else          GPIO_WriteLow(SEG_PORT_B, SEG_G);
}

static void hw_init(void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    init_milis();
    init_uart1(115200);

    GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);

    GPIO_Init(SEG_PORT_C,
              (GPIO_Pin_TypeDef)(SEG_A|SEG_B|SEG_C|SEG_D|SEG_E),
              GPIO_MODE_OUT_PP_LOW_SLOW);

    GPIO_Init(SEG_PORT_B,
              (GPIO_Pin_TypeDef)(SEG_F|SEG_G),
              GPIO_MODE_OUT_PP_LOW_SLOW);

    GPIO_Init(BTN_START_PORT, BTN_START_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BTN_LAP_PORT,   BTN_LAP_PIN,  GPIO_MODE_IN_PU_NO_IT);

    seg7_show(0, false);
}

int main(void)
{
    hw_init();

    bool     running    = false;
    uint32_t start_tick = 0;
    uint32_t elapsed    = 0;
    uint32_t lap        = 0;
    bool     lap_active = false;
    uint32_t lap_end    = 0;

    uint32_t led_tick   = 0;
    uint32_t uart_tick  = 0;
    uint32_t blink_tick = 0;
    bool     blink_on   = true;

    bool     btn_s_prev = false,  btn_l_prev = false;
    uint32_t btn_s_t    = 0,      btn_l_t    = 0;
    char     buf[40];

    while (1) {
        uint32_t now = milis();

        bool s = (GPIO_ReadInputPin(BTN_START_PORT, BTN_START_PIN) == RESET);
        bool l = (GPIO_ReadInputPin(BTN_LAP_PORT,   BTN_LAP_PIN)   == RESET);

        bool s_edge = s && !btn_s_prev && (now - btn_s_t > 20);
        bool l_edge = l && !btn_l_prev && (now - btn_l_t > 20);

        if (!s) btn_s_prev = false;
        else if (s_edge) { btn_s_prev = true; btn_s_t = now; }

        if (!l) btn_l_prev = false;
        else if (l_edge) { btn_l_prev = true; btn_l_t = now; }

        if (s_edge) {
            if (!running) {
                start_tick = now - elapsed;
                running    = true;
            } else {
                elapsed    = now - start_tick;
                running    = false;
                blink_tick = now;
                blink_on   = true;
            }
        }

        if (l_edge && running) {
            lap        = now - start_tick;
            lap_active = true;
            lap_end    = now + 2000;
        }

        if (running) elapsed = now - start_tick;
        if (lap_active && now >= lap_end) lap_active = false;

        uint32_t disp = lap_active ? lap : elapsed;
        uint8_t  dig  = (uint8_t)((disp / 1000) % 10);

        if (!running) {
            if (now - blink_tick > 500) {
                blink_on = !blink_on;
                blink_tick = now;
            }
            seg7_show(dig, !blink_on);
        } else {
            seg7_show(dig, false);
        }

        if (now - led_tick > 1000) {
            REVERSE(LED);
            led_tick = now;
        }

        if (now - uart_tick > 1000) {
            sprintf(buf, "T=%u.%02us LAP=%u.%02us\r\n",
                    (uint16_t)(elapsed / 1000), (uint8_t)((elapsed % 1000) / 10),
                    (uint16_t)(lap / 1000),     (uint8_t)((lap % 1000) / 10));
            uart1_puts(buf);
            uart_tick = now;
        }
    }
}

#include "__assert__.h"
