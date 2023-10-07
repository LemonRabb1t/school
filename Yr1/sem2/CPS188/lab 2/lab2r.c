#include <stdio.h>
#include <math.h>

static double spsound(double T);
static double tempC2F(double C);
static double fts2kmh(double fts);

/* speed of sound calc (deg C)*/
double spsound (double T){
	double spft, F;
	F = tempC2F(T);
	
	spft = 1086*sqrt( ( (5*F)+297 )/247.0 );
	printf("Speed in ft/s: %lf", spft);
	
	return (fts2kmh(spft));
}

double tempC2F(double C){
	return ((C*9/5)+32);
}

double fts2kmh(double fts){
	return (fts*1.097);
}

int
main (void)
{
	double usersp;

	/* get deg C*/
	printf ("Enter a temperature in C: ");
	scanf ("%lf", &usersp);

	/* output km/h*/
	printf ("The speed in km/h is %lf.\n", spsound(usersp));
	
	return (0);
}
