#include <iostream>

using namespace std;

int globvar = 0;

void func(void)
{
	cout << "Thank you for invoking me :)" << endl;
	globvar++;
}

int main(void) 
{
	for(int i = 0; i < 5; i++)
		func();
	cout << endl << "The function enjoyed " << globvar << " times" << endl;
	return 0;
}

