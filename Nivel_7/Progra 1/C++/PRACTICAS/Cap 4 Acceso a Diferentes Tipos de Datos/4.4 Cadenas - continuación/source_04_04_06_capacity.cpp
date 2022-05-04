#include <iostream>
#include <string>

using namespace std;

void PrintInfo(string &s) {
	cout << "content =\"" << s << "\" ";
	cout << "capacity = " << s.capacity() << endl;
	cout << "---------" << endl;
}

int main(void) {
	string TheString = "content"; 
	PrintInfo(TheString);
	TheString.reserve(100);
	PrintInfo(TheString);
	TheString.reserve(0);
	PrintInfo(TheString);
	return 0;
}
