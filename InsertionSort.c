#include<stdio.h> 
int a[6]={5,4,8,1,10,2};
int n=6;
int i,j,aux;
int main(){
	printf("a =[");
	for(i=0;i<n;i++)
	{
		printf("%d,",a[i]);
	}
	printf("]\n");
	for(i=1;i<n;i++)
	{
		j=i;
		aux=a[j];
		while(j>0 && aux<a[j-1])
		{
			a[j]=a[j-1];
			j--;
			//descomentar este for para ver cambios en pantalla por cada iteracion
			/*
			printf("a =[");
			int ii;
			for(ii=0;ii<n;ii++)
			{
				printf("%d,",a[ii]);
			} 
			printf("]\n");
			*/
		}
		a[j]=aux;
	}
	printf("a =[");
	for(i=0;i<n;i++)
	{
		printf("%d,",a[i]);
	} 
	printf("]\n");
}
