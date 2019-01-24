#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int main() {
	int num;					//STACK, ALLOCATED, In STACK, No
	int *ptr; 					//STACK, ALLOCATED, In STACK, No
	int **handle; 					//STACK, ALLOCATED, In STACK, No

	num = 14; 					//STACK, neither, n/a, No
	ptr = (int *)malloc(2 * sizeof(int));		//HEAP, ALLOCATED, In HEAP, No
	handle = &ptr;					//STACK, neither, n/a, No
	*ptr = num;					//STACK, neither, n/a, No
	ptr = &num;					//STACK, neither, n/a, Yes
	handle = (int **)malloc(1 * sizeof(int **));	//HEAP, ALLOCATED, In HEAP, No
}
