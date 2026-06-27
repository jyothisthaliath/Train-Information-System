/******************************************************************
 * MODEM.H
 * LCD and UART configuration for PIC16F877A Train Module
 ******************************************************************/

#ifndef MODEM_H
#define MODEM_H

#include <pic.h>

/* Assign port pins to LCD control signals */
#define RS RC5
#define EN RC1
#define RW RC0

/* Function declarations */
void send_data(void);
void tris_init(void);
void port_init(void);
void uart_init(void);
void sendIP_data(void);
void subcom(int command);
void LcdInitial(void);
void subdata(char lcddata);
static void Send2Lcd(const char *CPtr);

/* Global Variable Declarations */  
extern bank1 char array[40];
extern bank1 char get_data[10];
extern bank1 char ip_array[18];
extern int flag;
extern int count;
extern int i;
extern int f;
extern int A;
extern int strcnt;
extern bit sflag;
extern bit datasend;
extern bit client_flag;
extern bit data;
extern bit ip_flag;
extern bit data_flag;
extern int ip_get;
extern int get_cnt;
extern int cnt;
extern int j;

#endif /* MODEM_H */
