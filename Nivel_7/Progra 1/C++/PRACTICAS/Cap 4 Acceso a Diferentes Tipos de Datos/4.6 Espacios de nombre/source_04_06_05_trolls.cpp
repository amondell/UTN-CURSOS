#include <iostream>

using namespace std;

namespace Hogwarts {
	int Troll = 1;
}

namespace Mordor {
	int Troll = 2 ;
}

int main(void) {
	cout << Hogwarts::Troll << " " << Mordor::Troll << endl;
	return 0;
}

