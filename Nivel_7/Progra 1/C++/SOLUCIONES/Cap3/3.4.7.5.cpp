#include <iostream>
#include <ctime>

using namespace std;

struct Date {
	int year;
	int month;
	int day;
};
Date today(void) {
// Insert your code here
	Date time_;
    time_t t = time(0);   // get time now
    struct tm * now = localtime( & t );
	

	time_.year    = now->tm_year + 1900;
	time_.month   = now->tm_mon + 1;
	time_.day     = now->tm_mday;
	
	return time_;

}
int main(void) {
	Date t = today();
	cout << t.year << "-" << t.month << "-" << t.day << endl;
	return 0;
}


