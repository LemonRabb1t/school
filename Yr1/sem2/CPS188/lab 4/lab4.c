#include <stdio.h>
#include <math.h>

int main(void){
	int rows;
	printf("Num of rows: ");
	scanf("%d", &rows);
	
	for (int x=1; x<=rows;x++){
		
		for (int y =1;y<x;y++){
			printf("%d", y);
		}
		
		for (int y =x;y>0;y--){
			printf("%d", y);
		}
		printf("\n");
	}

	return (0);
}
