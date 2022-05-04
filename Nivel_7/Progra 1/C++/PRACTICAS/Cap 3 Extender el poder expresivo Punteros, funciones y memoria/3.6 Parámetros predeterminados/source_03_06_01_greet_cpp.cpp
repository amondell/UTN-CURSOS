#include <iostream>

using namespace std;

void NewGreet(string greet, int repeats)
{
	for(int i = 0; i < repeats; i++)
		cout << greet << endl;
}

int main(void) 
{
	NewGreet("Hi!", 5);
	return 0;
}

