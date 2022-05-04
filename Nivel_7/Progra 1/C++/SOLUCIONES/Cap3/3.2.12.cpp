#include <iostream>

using namespace std;

int main(void)
{

	int matrix[10][10];
	// Insert your code here

	int *p = &matrix[0][0];

	int k = 0;
	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			*(p + k) = (i + 1) * (j + 1);
			k++;
		}
	}

	for (int i = 0; i < 10; i++)
	{
		for (int j = 0; j < 10; j++)
		{
			cout.width(4);
			cout << matrix[i][j];
		}
		cout << endl;
	}

	return 0;
}
