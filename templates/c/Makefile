
# Config

NAME = {{project}}

SDIR = src/
IDIR = inc/

SRC = $(SDIR).main.c
OBJ = $(SRC:.c=.o)

# Tasks

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ)

all: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: $(NAME) clean fclean re all