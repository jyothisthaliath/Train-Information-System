/******************************************************************
 * MAIN.C
 * Train Module Main Controller for PIC16F877A
 * Reads GPS NMEA data and transmits over GPRS/GSM TCP Connection
 ******************************************************************/

#include <pic.h>
#include <string.h>
#include "delay.h"
#include "modem.h"

/* Multiplexer Control Pin (RE2) to switch between GPS and GPRS */
#define MULTIPLEXER_PIN RE2
#define BUZZER RE0

unsigned int GpsGsm = 0;
void convet_lcd(int data);
void Cnvrt_Data(unsigned int adcvalue);
void Send_Data_To_Gprs(void);

bit serverok = 0;
bit connect, servf1 = 0, servf2 = 0, servf3 = 0, servf4 = 0, servf5 = 0, servf6, servf7 = 0, servf8 = 0;
bit remoteok, remote1 = 0, remote2 = 0, remote3 = 0, remote4 = 0, remote5 = 0, remote6, remote7 = 0, remote8 = 0, netsel = 0;
unsigned char lcd_ary[5];
unsigned char DataCount;
static volatile bit DataFlag;
static volatile bit FirstData;
static volatile bit SecData;
static volatile bit GPSData;
unsigned char GPSRead;
int ADC, i_idx, arrays[4];
bank2 unsigned char RMCData[54];
bit GPS = 0, Max_value = 0;
int gpscnt = 0;
unsigned int ct = 0;
bit location = 0;

void main(void)
{
    tris_init();
    port_init();
    uart_init();
    LcdInitial();
    
    RBPU = 1;         // Port B pull-up enabled
    subcom(0x80);
    GpsGsm = 0;       // Start in GPRS/GSM mode
    MULTIPLEXER_PIN = 0;
    
    Send2Lcd("TRAIN LOCATION");
    BUZZER = 1;
    DelayS(2);
    BUZZER = 0;
    
    subcom(0x01); // Clear LCD
    subcom(0x80);
    Send2Lcd("initialization  ");
    
    strcpy(array, "AT\r\n");
    send_data();
    
    subcom(0x80);
    Send2Lcd("Init Complete..");
    while(count == 0); // Wait for UART response "OK"
    
    strcpy(array, "ATE0\r\n");
    send_data();
    subcom(0x80);
    Send2Lcd("Echo Off.......");
    while(count == 1);
    
    /* Set GPRS APN */
    strcpy(array, "AT+CIPCSGP=1,\"INTERNET\"\r\n");  
    send_data();
    netsel = 0; // Default to internet APN
    
    subcom(0x80);
    Send2Lcd("APN Send........");
    while(count == 2);
    
    /* Start TCP Server on Port 2050 */
    strcpy(array, "AT+CIPSERVER=1,2050\r\n");
    send_data();
    while(count == 3);
    
    subcom(0x80);
    Send2Lcd("Server-Mode-Port");
    while(serverok == 0);
    serverok = 0;
    
    subcom(0x80);
    Send2Lcd("Server----------");
    
    /* Query local IP address */
    strcpy(array, "AT+CIFSR\r\n");
    send_data();
    ip_flag = 1;
    while(ip_get == 0);
    ip_get = 0;
    
    subcom(0x80);
    Send2Lcd("Get Ip Adress.");
    subcom(0xC0); // LCD Line 2
    strcpy(array, ip_array);
    sendIP_data();
    
    while(remoteok == 0); // Wait for connection from Remote IP (Kiosk client)
    remoteok = 0;     
    
    subcom(0x80);
    Send2Lcd("Get Remote IP");
    
    while(1)
    {  
        if(location == 1)
        {
            location = 0;
            
            /* Send 29 bytes of location telemetry */
            strcpy(array, "AT+CIPSEND=29\r\n");
            send_data();
            DelayMs(200);
            
            TXREG = '#'; // Header
            while(TRMT != 1);
            TXREG = '$';
            while(TRMT != 1);
            
            /* Switch multiplexer to GPS module (RE2 High) */
            GpsGsm = 1;
            MULTIPLEXER_PIN = 1; 
            
            while(GPS == 0); // Wait for interrupt to parse valid $GPRMC string
            GPS = 0;
            
            /* Switch multiplexer back to GSM/GPRS (RE2 Low) */
            GpsGsm = 0;
            MULTIPLEXER_PIN = 0;
            
            /* Transmit Latitude and Longitude from RMCData over GPRS */
            for(gpscnt = 17; gpscnt != 27; gpscnt++)
            {
                TXREG = RMCData[gpscnt];
                while(TRMT != 1);
            }
            for(gpscnt = 29; gpscnt != 39; gpscnt++)
            {
                TXREG = RMCData[gpscnt];
                while(TRMT != 1);
            }
            
            TXREG = '$';
            while(TRMT != 1);
            TXREG = '*';
            while(TRMT != 1);
            TXREG = '\n';
            while(TRMT != 1);
        }
    }
}

/* Interrupt Service Routine for UART Reception */
void interrupt recept(void)
{
    if(RCIF)
    {
        RCIF = 0;
        
        /* If in GPS mode (GpsGsm == 1), parse GPS NMEA GPRMC data */
        if (RCREG == '$' && GpsGsm == 1) 
        {
            DataFlag = 1;
        }
        else if (DataFlag)
        {
            DataFlag = 0;
            if (RCREG == 'G' && GpsGsm == 1) FirstData = 1;
        }
        else if (FirstData)
        {
            FirstData = 0;
            if (RCREG == 'P' && GpsGsm == 1) SecData = 1;
        }
        else if (SecData)  
        {
            SecData = 0;
            if (RCREG == 'R' && GpsGsm == 1) 
            {
                GPSData = 1;
                DataCount = 0;
            }
        }
        else if (RCREG == '*' && GpsGsm == 1)
        {
            GPSRead++;
            GPSData = 0;
            BUZZER = 1; // Sound buzzer briefly on valid GPS read
            GPS = 1;
        } 
        
        if (GPSData && GpsGsm == 1) 
        {
            RMCData[DataCount] = RCREG;
            DataCount++;
        } 
        
        /* If in GSM mode (GpsGsm == 0), handle AT command responses */
        if(RCREG == 'O' && GpsGsm == 0) 
        {
            f = 1;
        }
        else if((f == 1) && (RCREG == 'K') && (GpsGsm == 0))  
        {
            f = 0;
            count++;
        }
        
        /* Detect TCP "SERVER OK" response */
        if(RCREG == 'S' && GpsGsm == 0)
            servf1 = 1;
        if(RCREG == 'E' && servf1 == 1 && GpsGsm == 0)
        { servf2 = 1; servf1 = 0; }
        if(RCREG == 'R' && servf2 == 1 && GpsGsm == 0)
        { servf3 = 1; servf2 = 0; }
        if(RCREG == 'V' && servf3 == 1 && GpsGsm == 0)
        { servf4 = 1; servf3 = 0; }
        if(RCREG == 'E' && servf4 == 1 && GpsGsm == 0)
        { servf5 = 1; servf4 = 0; }
        if(RCREG == 'R' && servf5 == 1 && GpsGsm == 0)
        { servf5 = 0; servf6 = 1; }
        if(RCREG == ' ' && servf6 == 1 && GpsGsm == 0)
        { servf6 = 0; servf7 = 1; }
        if(RCREG == 'O' && servf7 == 1 && GpsGsm == 0)
        { servf7 = 0; servf8 = 1; }
        if(RCREG == 'K' && servf8 == 1 && GpsGsm == 0)
        { serverok = 1; servf8 = 0; }
        
        /* Detect Kiosk connection ("REMOTE IP") */
        if(RCREG == 'R' && GpsGsm == 0)
            remote1 = 1;
        if(RCREG == 'E' && remote1 == 1 && GpsGsm == 0)
        { remote2 = 1; remote1 = 0; }
        if(RCREG == 'M' && remote2 == 1 && GpsGsm == 0)
        { remote3 = 1; remote2 = 0; }
        if(RCREG == 'O' && remote3 == 1 && GpsGsm == 0)
        { remote4 = 1; remote3 = 0; }
        if(RCREG == 'T' && remote4 == 1 && GpsGsm == 0)
        { remote5 = 1; remote4 = 0; }
        if(RCREG == 'E' && remote5 == 1 && GpsGsm == 0)
        { remote5 = 0; remote6 = 1; }
        if(RCREG == ' ' && remote6 == 1 && GpsGsm == 0)
        { remote6 = 0; remote7 = 1; }
        if(RCREG == 'I' && remote7 == 1 && GpsGsm == 0)
        { remote7 = 0; remote8 = 1; }
        if(RCREG == 'P' && remote8 == 1 && GpsGsm == 0)
        { remoteok = 1; remote8 = 0; }
        
        /* Detect Data Start Flag '$' from Kiosk */
        if(RCREG == '$' && GpsGsm == 0)
        {
            BUZZER = 0;
            data_flag = 1;
            sflag = 1;
        }
        if(data_flag == 1 && RCREG != '*' && GpsGsm == 0)
        {
            get_data[get_cnt] = RCREG;
            get_cnt++;
        }
        if(RCREG == '*' && GpsGsm == 0)
        {
            data = 1;
            data_flag = 0;
            get_cnt = 0;
        }
        if(RCREG == '>')
        {
            datasend = 1;
        }
        
        /* Handle local IP characters receipt */
        if(ip_flag == 1)
        {
            ip_array[cnt] = RCREG;
            cnt++;
            if(cnt == 15)
            {
                cnt = 0;
                ip_flag = 0; 
                RB0 = 0; // Turn off status LED
                ip_get = 1;
            }
        }
        
        /* Detect location request code 'L' from remote client */
        if(RCREG == 'L' && GpsGsm == 0)
        {
            location = 1;
        }
    }
}

/* Helper function to display decimal data on LCD */
void convet_lcd(int data_val)
{
    int ct_idx;
    for(ct_idx = 0; ct_idx < 4; ct_idx++)
    {
        lcd_ary[ct_idx] = data_val % 10;
        data_val = data_val / 10;
    }
    subcom(0x01);
    subcom(0x85);
    for(ct_idx = 3; ct_idx >= 0; ct_idx--)
        subdata(lcd_ary[ct_idx] + '0');
} 

/* Helper function to transmit ADC numeric value via UART */
void Send_Data_To_Gprs(void)
{
    for(i_idx = 0; i_idx < 4; i_idx++)
    {
        arrays[i_idx] = ADC % 10;
        ADC = ADC / 10;
    } 
    for(i_idx = 3; i_idx >= 0; i_idx--)
    {
        TXREG = arrays[i_idx] + '0';
        while(TRMT != 1); 
    }    
}
