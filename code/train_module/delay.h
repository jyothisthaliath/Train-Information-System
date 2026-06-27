/******************************************************************
 * DELAY.H
 * Delay functions header for PIC16F877A at 20 MHz Fosc
 ******************************************************************/

#ifndef DELAY_H
#define DELAY_H

void DelayUs(unsigned char x);
void Delay1Ms(void);
void DelayMs(unsigned char y);
void Delay1S(void);
void DelayS(unsigned char x);

#endif /* DELAY_H */
