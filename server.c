#include "minitalk.h"
#include <stdio.h>

void    handle_sigusr(int signum)
{
    static int count_binary = 7;

    static char c = 0;
    if (signum == SIGUSR1)
    {
        c |= 1 << count_binary;
    }
    else
        ;
    count_binary--;
    if (count_binary == -1)
    {
        write(1, &c, 1);
        c = 0;
        count_binary = 7;
    }

}

int main() {
    int my_pid = getpid();
    printf("My process ID is: %d\n", my_pid);
    signal(SIGUSR1, handle_sigusr);
    signal(SIGUSR2, handle_sigusr);
    while (1)
        pause();
}