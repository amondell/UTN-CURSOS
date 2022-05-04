#include <iostream>

using namespace std;

struct Date {
	int year;
	int month;
	int day;
};

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


int dayOfYear(Date date) {
	int i=1;
	int result = 0;
	// Insert your code here
	for (i; i< date.month; i++){
		result+= monthLength(date.year, i);
	}
	result+= date.day;
	return result;
}

int daysBetween(Date d1, Date d2) {
	// Insert you code here
	int difYear = d2.year - d1.year;
	int difMonth =  d2.month - d1.month;
	int difDay = d2.day - d1.day;
	
	if (difYear > 0){
		//difYear -=1;
		int days =  (365 - dayOfYear(d1)) + dayOfYear(d2) + (difYear-1)*365;
		return days;
	}
	if (difYear == 0){
		if (difMonth > 0){
			int days =  (365 - dayOfYear(d1)) + dayOfYear(d2);
			return days;
		}
		if (difMonth == 0){
				if (difDay > 0){
					int days = difDay;
					return days;
				}
				if (difDay ==0){
					int days = 0;
					return days;
				}else{
					return -1;
				}
		}
		else{
			return -1;
		}
	}
	else {
		return -1;
	}
	
}

int main(void) {
	Date since,till;
	cout << "Enter first date (y m d): ";
	cin >> since.year >> since.month >> since.day;
	cout << "Enter second date (y m d): ";
	cin >> till.year >> till.month >> till.day;
	cout << daysBetween(since,till) << endl;
return 0;
}
