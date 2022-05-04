#include <iostream>
#include <string>

using namespace std;

void printInfo(string &s) {
	cout << "length = " << s.length() << endl;
	cout << "capacity = " << s.capacity() << endl;
	cout << "max size = " << s.max_size() << endl;
	cout << "---------" << endl;
}

int main(void) {
	string TheString = "content"; 
	printInfo(TheString);
	for(int i = 0; i < 10; i++)
		TheString += TheString;
	printInfo(TheString);
//	cout<<TheString;
	return 0;
}
