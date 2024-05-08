NAME := term3d

cc := gcc
CFLAGS := -Wall -Werror -Wextra

LIBFT := libft/libft.a
LIBFT_DIR := libft

TERM3D := term3d
TERM3D_SRCS := term3d.c
TERM3D_OBJS := $(TERM3D_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(TERM3D)

$(TERM3D): $(TERM3D_OBJS)
	make -C $(LIBFT_DIR)
	$(CC) -o $(TERM3D) $(TERM3D_OBJS) $(LIBFT)

.PHONY:clean
clean:
	make clean -C $(LIBFT_DIR)
	rm -f $(TERM3D_OBJS)

.PHONY:fclean
fclean: clean
	make fclean -C $(LIBFT_DIR)
	rm -f $(TERM3D)

.PHONY:re
re: fclean all
	make re -C $(LIBFT_DIR)
