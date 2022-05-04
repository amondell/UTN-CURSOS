#include <iostream>

using namespace std;

void AmIAbleToChangeMyParameter(int param)
{
	cout << "----------" << endl;
	cout << "I have got: " << param << endl;
	param++;
	cout << "I'm about to give back: " << param << endl;
	cout << "----------" << endl;
}

int main(void) 
{
	int var = 1;
	
	cout << "var = " << var << endl;
	AmIAbleToChangeMyParameter(var);
	cout << "var = " << var << endl;
	return 0;
}

