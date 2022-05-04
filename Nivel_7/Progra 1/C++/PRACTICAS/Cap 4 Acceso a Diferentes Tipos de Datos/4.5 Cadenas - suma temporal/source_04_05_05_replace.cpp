#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string ToDo = "I'll think about that in one hour"; 
	string Schedule = "today yesterday tomorrow";
	
	ToDo.replace(22, 12, Schedule, 16, 8);
	cout << ToDo << endl;
	return 0;
}
