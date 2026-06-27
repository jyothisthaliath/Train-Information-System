/******************************************************************
 * MAIN.C
 * Touch Screen Controller / Serial Mouse Emulator for PIC16F877A
 * Scans a resistive touch screen via H-bridge and transmits
 * Microsoft serial mouse protocol coordinates over UART.
 ******************************************************************/

#include <pic.h>

/* Function declarations */
void mouse_default(void);
void mov1(int m);
void mov2(int m);
void mov3(int m);
void mov4(int m);
void mov5(int m);
void mov6(int m);
void mov7(int m);
void mov8(int m);
void divide1(int p);
void divide2(int q);
void click(void);
void uart_init(void);
void ExternalInt(void);
int adc(void);

int x, y, u, m_val, c, p_val, q_val;

void main(void)
{
    uart_init();        // Initialize UART transmitter
    ExternalInt();      // Initialize External Interrupt
    mouse_default();    // Set mouse to default state
    
    while(1)            // Infinite scanning loop
    {
        /* Make left side 0V and right side 5V to read X coordinate */
        RB4 = 1;        // Pin 37 high
        RB3 = 0;        // Pin 36 low
        x = adc();      // Read X coordinate digital value (RA0)
        
        if(x > 90)      // If touch detected
        {
            /* Make top side 0V and bottom side 5V to read Y coordinate */
            RB4 = 0;
            RB3 = 1;
            y = adc();  // Read Y coordinate digital value (RA0)
            
            divide1(x); // Calculate and send X movement packets
            divide2(y); // Calculate and send Y movement packets
            click();    // Send mouse click command
            mouse_default(); // Return to default tracking state
        }
    }
}

/* ISR for External Interrupt (RB0) */
void interrupt ext(void)
{
    if(INTF)
    {
        INTF = 0;           // Clear interrupt flag
        TXREG = 'M';        // Send 'M' to identify as Microsoft mouse
        while(TRMT == 0);   // Wait for transmission to complete
    }
}

/* Reset mouse position state */
void mouse_default(void)
{
    TXREG = 0x43; // Microsoft mouse position command
    while(TRMT == 0);

    TXREG = 0x43;
    while(TRMT == 0);
    
    TXREG = 0x43;
    while(TRMT == 0);
}

/* Analog-to-Digital Converter Read Routine (RA0/AN0) */
int adc(void)
{
    TRISA = 0xFF;  // Set Port A as inputs
    ADCON1 = 0x80; // Right justified, Vref+ = Vdd, Vref- = Vss
    
    ADCON0 = 0xA1; // Fosc/32, Channel 0 (AN0), Turn ON ADC
    ADGO = 1;      // Start conversion
    while(ADGO == 1);
    
    c = ADRESH;
    c = c << 8;
    c = c | ADRESL;
    return c;      // Return 10-bit digital result
}

/* Division for X coordinate: divides coordinate values to send packet steps */
void divide1(int p)
{
    if(p >= 400)
    {
        m_val = p % 400;
        p = p / 400;
        mov1(p);
    }
    if(m_val >= 180)
    {
        p = m_val;
        m_val = p % 180;
        p = p / 180;
        mov2(p);
    }
    if(m_val >= 50)
    {
        p = m_val;
        m_val = p % 50;
        p = p / 50;
        mov3(p);
    }
    if(m_val >= 10)
    {
        p = m_val;
        m_val = p % 10;
        p = p / 10;
        mov4(p);
    }
}

/* Division for Y coordinate: divides coordinate values to send packet steps */
void divide2(int q)
{
    if(q >= 400)
    {
        m_val = q % 400;
        q = q / 400;
        mov5(q);
    }
    if(m_val >= 180)
    {
        q = m_val;
        m_val = q % 180;
        q = q / 180;
        mov6(q);
    }
    if(m_val >= 50)
    {
        q = m_val;
        m_val = q % 50;
        q = q / 50;
        mov7(q);
    }
    if(m_val >= 10)
    {
        q = m_val;
        m_val = q % 10;
        q = q / 10;
        mov8(q);
    }
}

/* Mouse movements in Microsoft serial format to move right */
void mov1(int m)
{
    while(m > 0)
    {
        TXREG = 0x41;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov2(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov3(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov4(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        m = m - 1;
    }
}

/* Mouse movements in Microsoft serial format to move down */
void mov5(int m)
{
    while(m > 0)
    {
        TXREG = 0x44;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov6(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x3F;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov7(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x17;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        m = m - 1;
    }
}

void mov8(int m)
{
    while(m > 0)
    {
        TXREG = 0x40;
        while(TRMT == 0);
        TXREG = 0x08;
        while(TRMT == 0);
        TXREG = 0x00;
        while(TRMT == 0);
        m = m - 1;
    }
}

/* Microsoft mouse left click command */
void click(void)
{
    TXREG = 0x6F;
    while(TRMT == 0);
    TXREG = 0x00;
    while(TRMT == 0);
    TXREG = 0x00;
    while(TRMT == 0);
}

/* UART serial transmission initialization (1200 Baud @ 20MHz crystal) */
void uart_init(void)
{
    TXEN = 1;     // Transmission enable
    BRGH = 0;     // Low speed baud rate generator
    SYNC = 0;     // Asynchronous mode
    SPBRG = 255;  // SPBRG = 255 sets Baud Rate to 1200 at 20MHz Fosc
    SPEN = 1;     // Serial port enabled
}

/* Interrupt and Pin Direction Initialization */
void ExternalInt(void)
{
    PEIE = 1;     // Peripheral interrupt enable
    GIE = 1;      // Global interrupt enable
    INTE = 1;     // External Interrupt (RB0) enable
    RBPU = 0;     // PORTB pull-ups enabled
    INTEDG = 1;   // Interrupt on rising edge of RB0
    TRISB = 0x01; // RB0 as input (interrupt), others as outputs
}
