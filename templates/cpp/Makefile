

CC		= g++

NAME		= hello

SRC		= main.cpp \
			hello.cpp

OBJ		= $(SRC:.cpp=.o)

CFLAGS		= -Wall -Werror -Wextra

$(NAME)		: $(OBJ)
		@ $(CC) $(OBJ) -o $(NAME)
		@ echo "\033[32mcompilation of "$(NAME)" done\033[m"

all		: $(NAME)

clean		:
		@ echo "\033[32mremove all .o\033[m"
		$(RM) $(OBJ)

fclean		: clean
		@ echo "\033[32mremove "$(NAME)" binary\033[m"
		$(RM) $(NAME)

re		: fclean all

.PHONY		: all clean fclean re