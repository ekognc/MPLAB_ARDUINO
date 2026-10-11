/*
 *okay now i am here for understand the communication protocol
 * this is my way to show how works communication protocols
 * it is StoneAge basic one wire communication which looks like uart tx
 * there is <startBit><Data><stopBit>
 */


#define F_CPU 16000000UL

#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>
#include <string.h>

#define GPIO_PIN_0 0b00000001
#define GPIO_PIN_1 0b00000010
#define GPIO_PIN_2 0b00000100
#define GPIO_PIN_3 0b00001000
#define GPIO_PIN_4 0b00010000
#define GPIO_PIN_5 0b00100000
#define GPIO_PIN_6 0b01000000
#define GPIO_PIN_7 0b10000000

#define GPIO_TX GPIO_PIN_0 //i am going to use it to send data


#define Delay_time 1 //this makes easy to tune delay time


void message_delay(int param_delay) //delay func
{
    for(int i=param_delay; i>0; i--)
    {
        _delay_us(1); //mikrodelay
    }
}

void GPIO_Init() 
{
    DDRB|=GPIO_TX;
    PORTB|=GPIO_TX;
    message_delay(10);
}

void GPIO_TX_Start() //Start Bit  
{
    PORTB&=~GPIO_TX;
    message_delay(Delay_time);
}

void GPIO_TX_End() //End Bit
{
    PORTB|=GPIO_TX;
    message_delay(Delay_time);
}

void GPIO_TX_H_PULSE()// it is HIGH bit to use for data
{
    PORTB|=GPIO_TX;
    message_delay(Delay_time);
}

void GPIO_TX_L_PULSE()// it is LOW bit to use for data
{
    PORTB&=~GPIO_TX;
    message_delay(Delay_time);
}

void send_Message(char* param_message) //put the message in it and watch the data from the oscilloscope display
{
    int strlen_keeper=0;
    int bit_counter=0;
    int byte_counter=0;
    char this_char;
    
    strlen_keeper=strlen(param_message)-1;
    
    //Sooo everything start there
    //<StartBIT>
    GPIO_TX_Start();
    //<Data/>
    for(byte_counter=0; byte_counter<=strlen_keeper; byte_counter++)
    {
     this_char=param_message[byte_counter];   
        
        for(bit_counter=7;bit_counter>=0;bit_counter--)
        {
            if((this_char>>bit_counter)&(0x01))
            {
                GPIO_TX_H_PULSE();
            }
            else
            {
                GPIO_TX_L_PULSE();
            }
        }
        
    }
    //</Data>
    
    //<EndBIT>
    GPIO_TX_End();
    
}




int main(void)
{
    GPIO_Init();
    while(1)
    {
       send_Message("TEST_TXT"); //Message
    }
    
    return 0;
}