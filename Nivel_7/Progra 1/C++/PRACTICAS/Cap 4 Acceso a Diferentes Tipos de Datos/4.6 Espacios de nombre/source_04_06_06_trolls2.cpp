#include <iostream>

using namespace std;

namespace Hogwarts {
	int Troll = 1;
}

namespace Mordor {
	int Troll = 2 ;
}

using namespace Hogwarts;

int main(void) {
	cout << Troll << " " << Mordor::Troll << endl;
	return 0;
}

