#ifndef MAILBOX_H
#define MAILBOX_H

extern unsigned int ReadMailbox(unsigned int channel);
extern void WriteMailbox(unsigned int channel, unsigned int data);

#endif