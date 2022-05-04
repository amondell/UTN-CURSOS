#include <iostream>
#include <string>

using namespace std;

class Figure
{
	private:
		int l;
		int b;
	// Your code here
	public:
		Figure(){
		};
		~Figure(){
		};
		int getArea(){
			int area = this->b * this->l; 
			return area ;
		};
		void setL(int l){
			this->l = l;	
		};
		void setB(int b ){
			this->b = b;
		}
};




int main()
{
	Figure rectangulo;
	rectangulo.setL(10);
	rectangulo.setB(4);

	cout << "Area del rectangulo es: " << rectangulo.getArea() << endl;
	// Your code here
	return 0;
}
