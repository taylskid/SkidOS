#include "led.h"

volatile unsigned int *gpioGPFSEL1 = (unsigned int *) 0x20200004;
volatile unsigned int *gpioGPSET0  = (unsigned int *) 0x2020001c;
volatile unsigned int *gpioGPCLR0  = (unsigned int *) 0x20200028;

static void wait(void)
{
    int timer = 3000000;
    while(timer--)
    {
        asm("mov r0,r0");
    }
}

static void LedSetup(void)
{
    unsigned int ra;

    ra = *gpioGPFSEL1;
    ra &=~(7<<18);
    ra |= 1<<18;

    *gpioGPFSEL1 = ra;
}

void LedOn(void)
{
    LedSetup();
    *gpioGPCLR0 = 1<<16;
}

void LedBlink(void)
{
    LedSetup();
    while(1) {
        *gpioGPCLR0 = 1<<16;
        wait();
        *gpioGPSET0 = 1<<16;
        wait();
    }
}