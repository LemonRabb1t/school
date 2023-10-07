#include <stdio.h>
#include <math.h>

int main(void){
	double sum, min, final, mid, grade, midperc, finalperc;
	double G;

	
	for (int x=0; x<10;x++){
		printf("Enter grade %d: ", x+1);
		scanf("%lf", &G);
		
		if (x==0){
			min = G;
			sum = 0;
		} 
		
		if (min>G){
			min =G;
		}
		
		sum+=G;
	}
	sum -=min;
	sum /=9;
	sum *= 10*0.25;
	
	printf("\nEnter midterm grade: ");
	scanf("%lf", &mid);
	
	printf("Enter final exam grade: ");
	scanf("%lf", &final);
	
	if (mid >= final){
		midperc = 0.35;
		finalperc=0.4;
	} else {
		midperc = 0.25;
		finalperc=0.5;
	}
	
	grade = (sum)+(mid*midperc)+(finalperc*final);
	
	printf("Grade: %.2lf", grade);
}
