/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kotkobay <kotkobay@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/01 00:36:56 by kotkobay          #+#    #+#             */
/*   Updated: 2023/12/05 01:45:11 by kotkobay         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	handle_signum(int signum)
{
	static int	count_binary = 7;
	static char	c;

	if (signum == SIGUSR1)
		c |= 1 << count_binary;
	count_binary--;
	if (count_binary == -1)
	{
		ft_printf("%c", c);
		c = 0;
		count_binary = 7;
	}
	return ;
}

int	main(void)
{
	int	my_pid;

	my_pid = getpid();
	ft_printf("My process ID is: %d\n", my_pid);
	signal(SIGUSR1, handle_signum);
	signal(SIGUSR2, handle_signum);
	while (1)
		pause();
}
