
NAME = {{project}}

CFLAGS = -Wall -I inc/

LFLAGS =

SRC = src/main.c

OBJ = $(SRC:.c=.o)

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ) $(LFLAGS)

all: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: $(NAME) clean fclean re all