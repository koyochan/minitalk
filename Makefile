	# Library Name #
NAME	=
CLIENT	=	client
SERVER	=	server
	# libft Variables #
LIBFT		=	./libft/libft.a
LIBFT_DIR	=	./libft


# ft_printf Variables
FT_PRINTF		=	./printf/ft_printf.a
FT_PRINTF_DIR	=	./printf

	# Mandatory Variables #
SRC_C	=	client.c
SRC_S	=	server.c
INC		=	-I. -I$(LIBFT_DIR) -I$(FT_PRINTF_DIR) -I$(LIBFT_DIR)/stack \
 		-I$(LIBFT_DIR)/get_next_line

	# Compiling Variables #
CC			=	gcc
CFLAG		=	-Wall -Wextra -Werror
RM			=	rm -f

	# Colors #
GREEN		=	\e[38;5;118m
YELLOW		=	\e[38;5;226m
RESET		=	\e[0m
_SUCCESS	=	[$(GREEN)SUCCESS$(RESET)]
_INFO		=	[$(YELLOW)INFO$(RESET)]

	# Debugger #
ifeq ($(DEBUG), 1)
	D_FLAG	=	-g
endif

	# Fsanitize #
ifeq ($(SANITIZE), 1)
	D_FLAG	=	-fsanitize=leak -g
endif


all: $(SERVER) $(CLIENT)

$(NAME): all

$(SERVER): $(LIBFT) $(FT_PRINTF)
	@ $(CC) $(D_FLAG) $(CFLAG) $(SRC_S) $(LIBFT) $(FT_PRINTF) $(INC) -o $(SERVER)
	@printf "$(_SUCCESS) server ready.\n"

$(CLIENT): $(LIBFT) $(FT_PRINTF)
	@ $(CC) $(D_FLAG) $(CFLAG) $(SRC_C) $(LIBFT) $(FT_PRINTF) $(INC) -o $(CLIENT)
	@printf "$(_SUCCESS) client ready.\n"


$(LIBFT):
	@ $(MAKE) DEBUG=$(DEBUG) -C ./libft

$(FT_PRINTF):
	@ $(MAKE) -C $(FT_PRINTF_DIR)

clean:
	@ $(RM) $(CLIENT) $(SERVER)
	@printf "$(_INFO) client removed.\n"
	@printf "$(_INFO) server removed.\n"

fclean:
	@ $(MAKE) fclean -C $(LIBFT_DIR)
	@ $(MAKE) fclean -C $(FT_PRINTF_DIR)
	@ $(RM) $(CLIENT) $(SERVER)
	@printf "$(_INFO) client removed.\n"
	@printf "$(_INFO) server removed.\n"

re: fclean all

mandatory:	$(CLIENT) $(SERVER)

m : mandatory

.PHONY: all clean fclean re mandatory m