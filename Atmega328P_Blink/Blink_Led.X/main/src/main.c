/*
 * It is a basic example for Arduino.
 * TOGGLE PORT B Pin 5.
 * It should be the 13th pin.
 * First, I am using the external crystal.
 * It is not ARM, so I still feel like using it as GPIO.
 * But it is not ARM, right? Just the Arduino! Still GPIO.
 * Just define pin 5 as GPIO_PIN_5.
 * And I like to write everything using functions, so next up are setters,
 * and main,
 * and 1-2-3-4 toggle LED, yeeeeah!
 * But the project name is Blink LED anyway, I think it will be a great series.
 */

#define F_CPU 16000000UL  // 16 MHz external crystal Arduino Uno
#include <avr/io.h> //must include
#include <util/delay.h> //delay lib

#define GPIO_PIN_5 0b00100000 //binary show : pin5

void set_PIN_OUTPUT()
{
    DDRB=GPIO_PIN_5; //PORTB Pin5 set output 
}

void set_pin_High()
{
    PORTB=GPIO_PIN_5; //PORTB Pin 5 set High
}

void set_pin_LOW()
{
    PORTB&=~GPIO_PIN_5; //PORTB Pin 5 set Low
}


int main(void) {
   
    //initialize PORTB Pin 5
    set_PIN_OUTPUT();

    while (1)  //rock age toggle using while 
    {
        //Set pin High
        set_pin_High();

        // Delay ms
        _delay_ms(250);
        
        //Set pin Low
        set_pin_LOW();
        
        //Delay_ms
         _delay_ms(400);
    }

    return 0;
}