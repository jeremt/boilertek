
NAME = lib{{name}}.a
CFLAGS = -Wall -I lib

AR ?= ar
CC ?= gcc

SRC = lib/{{name}}.c
OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) rc $@ $^

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all