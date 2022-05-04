#include <iostream>

using namespace std;

void NewGreet(string greet = "Good morning", int repeats = 1)
{
	for(int i = 0; i < repeats; i++)
		cout << greet << endl;
}

int main(void) 
{
	NewGreet("Hello", 2);
	NewGreet("Hi");
	NewGreet();
	return 0;
}
