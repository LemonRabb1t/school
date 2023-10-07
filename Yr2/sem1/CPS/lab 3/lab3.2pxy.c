#include <stdio.h>
#include <math.h>

double
BMI (double m, double w){
	return (w/pow(m,2));
}

int main(void){
	double bmi, H, W;
	
	printf("Enter weight (kg): ");
	scanf("%lf", &W);
	
	printf("Enter height (m): ");
	scanf("%lf", &H);
	
	bmi = BMI(H, W);
	
	printf("Your BMI value is %.1lf, which classifies you as ", bmi);
	
	if (bmi < 18.5){
		printf("Underweight");
	} else if (18.5<= bmi && bmi <= 24.9){
		printf("Normal");
	} else if (25<=bmi && bmi<=29.9){
		printf("Overweight");
	} else {
		printf("Obese");
	}
}
