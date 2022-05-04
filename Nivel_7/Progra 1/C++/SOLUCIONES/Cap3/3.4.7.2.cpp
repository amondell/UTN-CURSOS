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

int monthLength(int year, int month){
	if ((month == 1) or (month == 3) or (month == 5) or (month == 7) or (month == 8) or (month == 10) or (month == 12)){
		return 31;	
	}
	if ((month == 4) or (month == 6) or (month == 9) or (month == 11)){
		return 30;
	}
	if ((month == 2) and (isLeap(year) == 0)) {
		return 28;
	}
	else{
		return 29;
	}
}

int main(void) {
	for(int yr = 2000; yr < 2002; yr++) {
		for(int mo = 1; mo <= 12; mo++)
		cout << monthLength(yr,mo) << " ";
		cout << endl;
	}
return 0;
}
