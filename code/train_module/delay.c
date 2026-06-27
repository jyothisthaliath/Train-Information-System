#include "delay.h"
#include <pic.h>

unsigned char Dcnt;

/* Delay in Microseconds (accurate at 20MHz crystal oscillator) */
void DelayUs(unsigned char x)
{
    Dcnt = x;
    #asm
    movlw 0x03
    subwf _Dcnt, f
loop:
    nop
    nop
    decfsz _Dcnt, f
    goto loop
    return
    #endasm
}

/* 1 Millisecond Delay */
void Delay1Ms(void)
{
    DelayUs(0xc8);    /* 200 Microseconds */
    DelayUs(0xc8);
    DelayUs(0xc8);
    DelayUs(0xc8);
    DelayUs(0xc8);
}

/* Multiple Millisecond Delay */
void DelayMs(unsigned char y)
{
    unsigned char x;
    x = y;
    do
    {
        Delay1Ms();
    } while(--x != 0x00);
}

/* 1 Second Delay */
void Delay1S(void)
{
    DelayMs(0xff);
    DelayMs(0xff);
    DelayMs(0xff);
    DelayMs(0xe8);
}

/* Multiple Second Delay */
void DelayS(unsigned char x)
{
    do
    {
        Delay1S();
    } while(--x != 0x00);
}
