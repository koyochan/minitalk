NAME = minitalk.a

CC = cc
CFLAG = -Wall -Wextra -Werror
SRC = client.c server.c 
OBJ = $(SRC:.c=.o)

printf:
	make -C printf

libft:
	make -C libft

$(OBJ): $(SRC)
	cc -I printf/includes -o $@ -c $<
	cc -I printf/includes -o $@ -c $<


all: $(NAME)

$(NAME): printf $(OBJ)
	cc $(OBJ) -L printf -lft -o $(NAME)
	cc $(OBJ) -L printf -lft -o $(NAME)

%.o: %.c
	$(CC) $(CFLAG) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re #printf