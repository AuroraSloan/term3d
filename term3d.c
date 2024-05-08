#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "libft/libft.h"

int return_fail(char *string)
{
	ft_putstr("err: ");
	ft_putstr(string);
	return EXIT_FAILURE;
}

int main(int argc, char **argv)
{
	int	fd, ret;
	char	*line;

	if (argc != 2)
	{
		return return_fail("Format: ./term3d filename\n");
	}

	fd = open(argv[1], O_RDONLY);
	if (fd == -1)
	{
		return return_fail("Could not open file");
	}

	while ((ret = get_next_line(fd, &line)) > 0)
	{
		if (ret == -1)
		{
			return return_fail("Could not read file");
		}
		ft_putstr(line);
		ft_putchar('\n');
		free(line);
	}

	return EXIT_SUCCESS;
}
