#include <stdio.h>
#include <string.h>

const char *reversedig(const char *str);

int main(int argc, char const *argv[])
{
	for(int i = 1; i < argc; ++i){
		char input[80];
		strcpy(input, argv[i]);

		printf("%s\t=>\t%s\n", input, reversedig(argv[i]));
	}

	return 0;
}
