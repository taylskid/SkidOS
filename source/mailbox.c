#include "mailbox.h"

volatile unsigned int *MailboxRead   = (unsigned int *) 0x2000B880;
volatile unsigned int *MailboxStatus = (unsigned int *) 0x2000B898;
volatile unsigned int *MailboxWrite  = (unsigned int *) 0x2000B8A0;



unsigned int ReadMailbox(unsigned int channel)
{
    unsigned int data;

    while(1)
    {
        data = *MailboxRead;

        if ((data & 15) == channel)
            return data;
    }
}

void WriteMailbox(unsigned int channel, unsigned int data)
{
    *MailboxWrite = (data | channel);
}