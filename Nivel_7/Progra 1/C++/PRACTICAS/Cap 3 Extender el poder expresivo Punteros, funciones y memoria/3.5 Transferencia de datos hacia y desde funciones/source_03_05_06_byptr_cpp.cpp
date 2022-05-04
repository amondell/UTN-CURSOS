#include <iostream>

using namespace std;

void ByPtr(int *ptr)
{
	*ptr = *ptr + 1;
}

int main(void) 
{
	int  variable = 1;
	int *pointer  = &variable;

	ByPtr(pointer);
	cout << "variable = " << variable << endl;
	return 0;
}

