#include <iostream>
using namespace std;
int function(int parameter)
{
		return parameter * 2;
}

int main(void) 
{
		int var = 1;
		var = function(var);
		var = function(var);
		var = function(var);
		cout << var << endl;
		return 0;
}

