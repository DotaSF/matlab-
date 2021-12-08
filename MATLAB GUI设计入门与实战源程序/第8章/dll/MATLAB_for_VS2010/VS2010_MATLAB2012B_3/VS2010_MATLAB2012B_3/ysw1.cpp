#include <iostream>
#include "add.h"
#include "mclmcrrt.h"
#include "mclcppclass.h"
#include <stdio.h>
using namespace std;

void main()
{
	if(addInitialize())
	{
		printf("welcome!!!\n");
	}
	else
	{
		printf("fail!!!\n");
	}
	mwArray a(1,1,mxDOUBLE_CLASS);
	a(1,1)=1;
	mwArray b(1,1,mxDOUBLE_CLASS);
	b(1,1)=1;
	mwArray c(1,1,mxDOUBLE_CLASS);
	//double adata[1];
	//int i;
	//try
	//{
		add(1,c,a,b);
		//adata[0] = c;
		//printf("%f\n",adata[0]+0.1);
		std::cout<<c(1,1)<<std::endl;
	//}
	//catch( const mwException& e)
	//{
	//	printf("%f\n",a(1,1));
	//}
	
	// terminate the lib
	addTerminate();
	// terminate MCR
	mclTerminateApplication();
}



