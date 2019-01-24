#include <stdio.h>
int main()
{
	char str1[20];
	printf("Please enter your name: ");
	gets(str1);

	printf("Welcome to CSE031, %s", str1);
	printf("!\n");
}
