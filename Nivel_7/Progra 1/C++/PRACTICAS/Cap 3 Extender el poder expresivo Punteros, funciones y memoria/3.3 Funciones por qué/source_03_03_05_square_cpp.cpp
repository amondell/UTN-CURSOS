#include <iostream>

using namespace std;

float square(float x)
{
	float result;

	result = x * x;
	return result;
}

int main(void) {
	float arg = 2.0;

	cout << "The second power of " << arg << " is " << square(arg) << endl;
	return 0;
}
