#include <stdio.h>
#include <string.h>

unsigned int getdec(const char *str);

int main(int argc, char const *argv[])
{
	for(int i = 1; i < argc; ++i){
		char input[80];
		strcpy(input, argv[i]);

		printf("%s\t=>\t%u\n", input, getdec(argv[i]));
	}

	return 0;
}
