#include <stdio.h>
int main()
{
	int count;
	int error;
	int i;	

	printf("Enter the number of lines for the punishment: ");
	scanf("%d", &count);

	if (count < 0)
	{
		printf("You entered an incorrect value for the number of lines!\n");
		return 0;
	}
	
	printf("Enter the line for which we want to make a type: ");
	scanf("%d", &error);			
		
	if (error < 1)
	{
		printf("You entered an incorrect value for the number of lines!\n");
		return 0;	
	}


	for (i = 0; i < count; i++)
	{
		if (i == error - 1)
		{
			printf("C programming language is the bet!\n");
		}
		else
		{		
			printf("C programming language is the best!\n");
		}
	}
	return 0;
}
