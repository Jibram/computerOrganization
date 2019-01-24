#include <stdio.h>
int main()
{
	int count;
	int i;	
	printf("Enter the number of lines for the punishment: ");
	scanf("%d", &count);
	
	if (count < 0)
	{
		printf("You entered an incorrect value for the number of lines!\n");
	} 
	else
	{
		for (i = 0; i < count; i++){
			printf("C programming language is the best!\n");
		}
	}
}
