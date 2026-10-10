#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>


    #define GPIO_PIN_0   0b00000001
    #define GPIO_PIN_1   0b00000010
    #define GPIO_PIN_2   0b00000100
    #define GPIO_PIN_3   0b00001000
    #define GPIO_PIN_4   0b00010000
    #define GPIO_PIN_5   0b00100000
    #define GPIO_PIN_6   0b01000000 //cant holding knight sword because it is XTAL
    #define GPIO_PIN_7   0b10000000 //so this one XTAL too
    #define GPIO_PIN_ALL 0b00111111 //6 and 7 XTAL
            


void GPIO_Init() //init pins
{
    DDRB=GPIO_PIN_ALL;
}

void set_GPIO_HIGH(uint8_t param_PIN) //set as High
{
    PORTB|=param_PIN;
}

void set_GPIO_LOW(uint8_t param_PIN) //set as Low
{
    PORTB&=~param_PIN;
}

void KnightRider(uint8_t param_PIN) //so Knight shine for a moment and than done
{
        set_GPIO_HIGH(param_PIN);
        _delay_ms(100);
        set_GPIO_LOW(param_PIN);
        
}


//i am not using bit shifting now, just write as i want. but later i can make it beter
int main()
{
    GPIO_Init();
    while(1)
    {
        KnightRider(GPIO_PIN_0);

        KnightRider(GPIO_PIN_1);

        KnightRider(GPIO_PIN_2);

        KnightRider(GPIO_PIN_3);

        KnightRider(GPIO_PIN_4);
    
        KnightRider(GPIO_PIN_5);
        
        //i am coming from cave

       KnightRider(GPIO_PIN_4);
       
       KnightRider(GPIO_PIN_3);
       
       KnightRider(GPIO_PIN_2);
       
       KnightRider(GPIO_PIN_1);
        
       
        
    }
    return 0;
}