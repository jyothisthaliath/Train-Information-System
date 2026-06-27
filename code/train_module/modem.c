#include "modem.h"
#include "delay.h"
#include <string.h>

/* Global Variable Definitions */  
bank1 char array[40];
bank1 char get_data[10];
bank1 char ip_array[18];
int flag = 0;
int count = 0;
int i = 0;
int f = 0;
int A = 0;
int strcnt = 0;
bit sflag;
bit datasend = 0;
bit client_flag;
bit data;
bit ip_flag;
bit data_flag;
int ip_get = 0;
int get_cnt = 0;
int cnt = 0;
int j = 0;

/* Function for displaying IP address on LCD */
void sendIP_data(void)
{
    for(strcnt = 0; array[strcnt] != '\0'; strcnt++)
    {
        if(array[strcnt] != '\0')
        {
            subdata(array[strcnt]);
            DelayMs(5);
        }
    }
}

/* Function for Sending Data over UART TX */
void send_data(void)
{
    for(i = 0; array[i] != '\0'; i++)
    {
        TXREG = array[i];
        while(TRMT != 1);
    }
}

/* Function For UART Initialization (9600 Baud @ 20MHz crystal) */
void uart_init(void)
{
    SYNC = 0;  
    TXEN = 1;
    BRGH = 1;
    SPBRG = 0x81; // SPBRG = 129 for 9600 baud rate at 20MHz Fosc
    SPEN = 1;
    RCIF = 0;
    CREN = 1;
    GIE = 1;
    PEIE = 1;
    RCIE = 1;
}

/* Function For TRIS (Data Direction) configuration */
void tris_init(void)
{
    TRISC = 0x80; // RC7 is RX (input), RC6 is TX (output)
    TRISB = 0xF0; // High nibble input, Low nibble output
    TRISA = 0xFF; // Port A as analog inputs
    TRISD = 0x00; // Port D as digital outputs (LCD Data lines)
    TRISE = 0x00; // Port E as digital outputs (RE0 is Buzzer, RE2 is Switching Control)
} 

/* Function For port initialization */
void port_init(void)
{
    PORTC = 0x80;
    PORTB = 0x00;
    PORTA = 0x00;
    PORTD = 0x00;
    PORTE = 0x00;
}

/* LCD initialization commands */
void LcdInitial(void)
{	
    subcom(0x30); // 8-bit LCD interface
    subcom(0x0c); // Display ON, Cursor OFF
    subcom(0x01); // Clear display
    subcom(0x06); // Entry Mode: Increment cursor
    subcom(0x80); // Address of 1st line position
    subcom(0x38); // 2-line display, 5x7 font
}

/* Function for sending a command to LCD */
void subcom(int command)       
{
    RS = 0;        // Select Command Register
    RW = 0;        // Write to LCD
    EN = 1;        // Enable the module
    PORTD = command; // Send command through PORTD
    DelayMs(3);    // 3ms delay
    EN = 0;        // Disable the module
}

/* Function for sending data (single character) to LCD */
void subdata(char lcddata)    
{
    RS = 1;        // Select Data Register
    RW = 0;        // Write to LCD
    EN = 1;        // Enable the module
    PORTD = lcddata; // Send data character through PORTD
    DelayMs(10);   // 10ms delay
    EN = 0;        // Disable the module
}

/* Function for sending string to LCD */
static void Send2Lcd(const char *CPtr)
{
    while(*CPtr != '\0')
    {
        subdata(*CPtr);
        DelayMs(4);
        CPtr++;
    }
}
