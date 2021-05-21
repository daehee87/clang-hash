#include <stdio.h>
#include <stdlib.h>


int main(){
	printf("hello llvm?\n");
	int i=0;
	int sum=0;
	for(i=0; i<10; i++){
		sum += i;
	}
	printf("sum is %d\n", sum);
	return 0;
}


