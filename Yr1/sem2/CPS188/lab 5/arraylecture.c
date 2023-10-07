

#include <stdio.h>
void sort(int a, int b, int c, int *min, int *mid, int *max);

int main()
{
	/* vars */
	int a, b, c;
	int leave = 1;
    
	/*get ints */
    while (leave!=0){
    	printf("\nPlease input an int: ");
    	scanf ("%d", &a);
    	printf("Please input an int: ");
     	scanf ("%d", &b);
    	printf("Please input an int: ");
     	scanf ("%d", &c);
        
     	int min, mid, max;
    	 
     	/*pass pointers for largest, msallest, middle values to 1 function which will fill values based on values passed*/
     	sort(a ,b ,c , &min, &mid, &max);
     	printf("Sorted values: %d %d %d\n(0=exit/1=cont)", min, mid, max);
     	scanf("%d", &leave);
    }
	return 0;
}

void sort(int a, int b, int c, int *min, int *mid, int *max){

	// a max, b min, c mid
	if (a>c && c >b){
    	*min = b;
    	*mid = c;
    	*max = a;
	} 
	// b max, a mid, c min
	else if (b>a && a>c){
    	*min = c;
    	*mid = a;
    	*max = b;
	}  
	// a mid, b min, c max
	else if (c>a && a>b){
    	*min = b;
    	*mid = a;
    	*max = c;
	}  
	// a mid, b max, c min
	else if (b>a && a>c){
    	*min = c;
    	*mid = a;
    	*max = b;
	}
	// a min, b max, c mid
	else if (b>c && c>a){
    	*min = a;
    	*mid = c;
    	*max = b;
	} // a min, b mid, c max
	else if (b>a && a>c){
    	*min = a;
    	*mid = b;
    	*max = c;
	}
    	// all equal
	if (a==b && c==a){
	    *min = * mid = *max = a;
	}

}

