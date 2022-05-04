#include <iostream>
using namespace std;
int main(void) {
	short s = 32767;
	int i = s;
	if(i == s)
		cout << "equal" << endl;
	else
		cout << "not equal" << endl;
	return 0;
}
