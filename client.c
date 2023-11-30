#include "minitalk.h"

int	send_char(int pid, char c)
{
	int	digit;
	int	error;
	int	count;

	error = 0;
	count = 0;
	digit = 7;
	while (digit >= 0)
	{
		if (c & (1 << digit))
		{
			count++;
			error = kill(pid, SIGUSR1);
		}
		else
			error = kill(pid, SIGUSR2);
		if (error == -1)
			return (-1);
		digit--;
		usleep(1000);
	}
	return (count);
}

int	send_to_server(int pid, char *str)
{
	int	count;
	int	error;

	count = 0;
	while (*str)
	{
		error = send_char(pid, *str);
		if (error == -1)
			return (-1);
		count += error;
		str++;
	}
	return (count);
}

int	main(int ac, char **av)
{
	int	pid;

	if (ac != 3)
		return (0);
	pid = ft_atoi(av[1]);
	return (send_to_server(pid, av[2]));
}
