#include <iostream>

using namespace std;

float FahrenheitToCelsius(float temp)
{
	return ((temp - 32.0) * 5.0) / 9.0;
}

void TestTheFunction(float temp) {
	cout << "Fahrenheit " << temp << " corresponds to " << FahrenheitToCelsius(temp) << " Centigrades" << endl; 
}

int main(void) 
{
	TestTheFunction(32.0);
	TestTheFunction(212.0);
	TestTheFunction(451.0);
	return 0;
}

