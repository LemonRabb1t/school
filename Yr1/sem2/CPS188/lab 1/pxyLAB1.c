#include <stdio.h>
#include <math.h>

double hyp (double x, double y){
	double l;
	l = (pow(x,2))*(pow(y,2));
	l = sqrt(l);
	return (l);
}
double P (double x, double y, double z){
	return(x+y+z);
}
double SA (double x, double y){
	return (x*y/2);
}

int
main (void){
	
   double x,y;
   printf ("Please input traingle side 1: ");
   scanf("%lf", &x);
   printf ("Please input traingle side 2: ");
   scanf("%lf", &y);
   printf("The perimeter is: %.2lf\nThe area is: %.2lf\n", P(x,y,hyp(x,y)), SA(x,y));
   
   return (0);

}
