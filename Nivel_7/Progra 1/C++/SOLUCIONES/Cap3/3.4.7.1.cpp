#include <iostream>

using namespace std;

bool isLeap(int year) {
	// Insert your code here
	if (year % 4 == 0) {
        if (year % 100 == 0) {
            if (year % 400 == 0)
                return 1;
            else
               return 0;
        }
        else
            return 1;
    }
    else
        return 0;
}

int main(void) {
	for(int yr = 1995; yr < 2017; yr++)
	cout << yr << " -> " << isLeap(yr) << endl;
	return 0;
}
