#include <stdio.h>
#include <string.h>

const char *replnum(const char *str, char a);

int main(int argc, char const *argv[])
{
	for(int i = 1; i < argc; ++i){
		char input[80];
		strcpy(input, argv[i]);

		printf("%s\t=>\t%s\n", input, replnum(argv[i], 'W'));
	}

	return 0;
}
