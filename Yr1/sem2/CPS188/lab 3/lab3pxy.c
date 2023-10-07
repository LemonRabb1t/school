#include <stdio.h>
#include <math.h>

int
THR (double mhr, double rhr, double lvl, char s){
	return (round(lvl*(mhr-rhr)+rhr));
}

double mhr (double a, char s){
	double i =0;
	if (s=='M'){
		i= (203.7/(1+exp(0.033*(a-104.3))));
	} else if (s=='F'){
		i= (190.2/(1+exp(0.0453*(a-107.5))));
	} else {
		printf("lmao sex is wrong loser");
		i=-100000;
	}
	return (i);
}

double LVL (char f){
	if (f == 'L'){
		return (0.55);
	} else if (f == 'M'){
		return (0.65);
	} else if (f=='H'){
		return (0.8);
	} else {
		return (0);
	}
}

int main (void){
	double age, RHR;
	char lvl, s;
	
	printf("Input age: ");
	scanf("%lf", &age);
	
	printf("Input resting heart rate: ");
	scanf("%lf", &RHR);
	
	printf("Input fitness level: ");
	scanf(" %c", &lvl);
	
	printf("Input sex: ");
	scanf(" %c", &s);
	
	printf("\nTraining heart rate: %d", THR(mhr(age, s), RHR, LVL(lvl), s)); 
	
	return (0);
}
