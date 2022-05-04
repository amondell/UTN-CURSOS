#include <iostream>

using namespace std;

void Greet(void)
{
	cout << "Ave user!" << endl;
}

void GreetManyTimes(int howmanytimes) 
{
	while(howmanytimes > 0) 
	{
		Greet();
		howmanytimes--;
	}
}

int main(void) 
{
	int sizeofego;

	cout << "How big is you ego? [km]" << endl;
	cin >> sizeofego;
	GreetManyTimes(1 + sizeofego / 10);
	return 0;
}

