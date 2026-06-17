#ifndef _MAIN_H_
#define _MAIN_H_ 1

#include "stm8s.h"

/* Makra pro práci s piny definovanými jako XXX_PORT / XXX_PIN */
#define LOW(BAGR)     GPIO_WriteLow(BAGR##_PORT, BAGR##_PIN)
#define HIGH(BAGR)    GPIO_WriteHigh(BAGR##_PORT, BAGR##_PIN)
#define REVERSE(BAGR) GPIO_WriteReverse(BAGR##_PORT, BAGR##_PIN)

#define READ(BAGR) (GPIO_ReadInputPin(BAGR##_PORT, BAGR##_PIN)!=RESET)
#define PUSH(BAGR) (GPIO_ReadInputPin(BAGR##_PORT, BAGR##_PIN)==RESET)

#endif // !_MAIN_H_
