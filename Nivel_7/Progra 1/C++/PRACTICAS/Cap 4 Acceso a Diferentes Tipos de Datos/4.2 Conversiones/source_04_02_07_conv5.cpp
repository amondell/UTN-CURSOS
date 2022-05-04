#include <iostream> 
using namespace std; 
int main(void) { 
	double d = 123456.789012; 
	float f = d; 
        
	if(d == f) 
		cout << "equal" << endl; 
	else 
		cout << "not equal" << endl; 
	return 0; 
} 
