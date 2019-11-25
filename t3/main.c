#include <stdio.h>
#include <string.h>

const char *leavelastndig(const char *str, int n);

int main(int argc, char const *argv[])
{
	for(int i = 1; i < argc; ++i){
		char input[80];
		strcpy(input, argv[i]);

		printf("%s\t=>\t%s\n", input, leavelastndig(argv[i], 2));
	}

	return 0;
}