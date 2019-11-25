#include <stdio.h>
#include <string.h>

const char *removerng(const char *str, char a, char b);

int main(int argc, char const *argv[])
{
	//removes all digits from str
	for(int i = 1; i < argc; ++i){
		char *input;
		strcpy(input, argv[i]);
		const char *retv = removerng(argv[i], '0', '9');

		printf("%s\t=>\t%s\n", input, retv);
		printf("input size : %u\t=>\toutput size : %u\n", strlen(input), strlen(retv));
	}

	return 0;
}