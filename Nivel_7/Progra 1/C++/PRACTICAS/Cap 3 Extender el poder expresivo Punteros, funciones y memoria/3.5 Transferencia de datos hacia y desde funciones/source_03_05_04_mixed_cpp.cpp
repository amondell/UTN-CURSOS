#include <iostream>

using namespace std;

void MixedStyles(int bval, int &bref)
{
	bref = bval + 1;
}

int main(void) 
{
	int var1 = 1, var2;

	MixedStyles(var1, var2);	
	cout << "var1 = " << var1 << ", var2 = " << var2 << endl;
	return 0;
}

