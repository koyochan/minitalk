#include "minitalk.h"

void    send_char(int pid, char c)
{
    int digit = 8;
    while (digit > 0)
    {
        if (c & (1 << digit))
            kill (pid, SIGUSR1);
        else
            kill(pid, SIGUSR2);
        digit++;
    }
}

void    send_to_client(int pid, char *str)
{
    while(*str)
    {
        send_char(pid, *str);
        str++;
    }
}

int main(int ac, char **av)
{
    int pid;
    if (ac != 3)
        return (0);
    pid = ft_atoi(av[1]);
    send_to_client(pid, av[2]);
}
