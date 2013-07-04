#include "led.h"
#include "mailbox.h"

int kernel (void)
{
    unsigned int var;
    WriteMailbox(8, 0xfffffff0);

    while(1)
    {
        var = ReadMailbox(8);
        if (var == 0xfffffff0)
        {
            LedOn();
        }
    }

    return 0;
}