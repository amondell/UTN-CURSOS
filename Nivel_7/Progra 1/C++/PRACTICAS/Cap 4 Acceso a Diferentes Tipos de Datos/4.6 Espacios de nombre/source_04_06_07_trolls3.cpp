#include <iostream>

using namespace std;

namespace Hogwarts {
	int Troll = 1;
}

namespace Mordor {
	int Troll = 2 ;
}

int main(void) {
	{ 
		using namespace Hogwarts;
		cout << Troll << " " ;
	}
	{ 
		using namespace Mordor;
		cout << Troll << endl;
	}
	return 0;
}

