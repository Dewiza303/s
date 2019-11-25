#include <stdio.h>
#include <string.h>

const char *capwords(const char *str);

int main(int argc, char const *argv[])
{

	char input[80] = "!@#ala ma kota";

	printf("%s\t=>\t%s\n", "!@#ala ma kota", capwords(input));
	

	return 0;
}
