#include <stdio.h>
#include <math.h>
#include <stdlib.h>

double gross(int h, double rate){
	double p;
	if (h>15 && h<=25){
		p=h*rate*1.05;
	} else if (h>25){
		p=h*rate*1.10;
	} else{
		p=h*rate;
	}
	return (p);
}

int main(void){
	// var
	FILE *file = fopen("L4_data.txt", "r");
	
	int i=0;
	int empnumsize = 9999;
	
	// array
	double a[100];	
	int arraycount = 0;
	
	// file
	if (a == NULL) perror ("no open file");
	else {
		// store in a
		while (fscanf(file, "%lf", &a[i]) != EOF)
		{
		  i++;
		}
		fclose(file);
		arraycount = i;
		
		// str completed
		a[i] = '\0';
		
		int sum = 0; // sum of hours
		double wage = 0; // wage
		int inlinec = 0; // inner line counter
		i=-1; // eternal counter
						
		// loop for every line aka every \n detected
		printf("Emp num: | hours worked: | gross:   |");
		while (arraycount!=i){
			inlinec++;
			i++;
			// if emp num detected add 1 to line#
			 if ((a[i]>empnumsize)||(arraycount==i)){
				
				if ((sum !=0)){
					// # hours
					printf("hours: %d | ", sum); ///// sfadfdasfadsfsadfdsa
					// gross
					printf("gross: %.2f", gross(sum, wage)); ///// sfadfdasfadsfsadfdsa

					//reset 
					inlinec=0;
					sum = 0;
					wage= 0;
				}
				if (arraycount==i)
					break;
				printf("\n%0.lf | ", a[i]);
				
			} else if ((inlinec>2)){
				if (i<3){
				sum-=a[i];
			}
				sum+=a[i];
			} 
			 if (a[i]>15){
				wage=a[i];
			}
		}
	}
	return (0);
}
