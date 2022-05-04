#include <iostream> 
using namespace std; 
int main(void) { 
	float f = 1234.5678; 
	double d = f; 
        
	if(d == f) 
		cout << "equal" << endl; 
	else 
		cout << "not equal" << endl; 
	return 0; 
} 
