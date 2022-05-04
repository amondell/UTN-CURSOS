#include <iostream>
#include <string>

using namespace std;

void PrintInfo(string &s) {
	cout << "content =\"" << s << "\" ";
	cout << "capacity = " << s.capacity() << endl;
	cout << "is empty? " << (s.empty() ? "yes" : "no") << endl;
	cout << "---------" << endl;
}

int main(void) {
	string TheString = "content"; 
	PrintInfo(TheString);
	TheString.resize(50,'?');
	PrintInfo(TheString);
	TheString.resize(4);
	PrintInfo(TheString);
	TheString.clear();
	PrintInfo(TheString);

	return 0;
}
