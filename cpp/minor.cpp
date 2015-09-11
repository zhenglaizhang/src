#include <iostream>
#include <iomanip>


using namespace std;

template <typename T1, typename T2>
class A {};


template <typename T1, typename T2>
auto f(const T1& t1, const T2& t2) -> decltype(t1+t2)
{
	return t1 + t2;
}

template <typename T>
constexpr T pi = T(3.1415555555);

int main(int argc, char const *argv[])
{
	// A a;
	// A<int> a2;
	// int a{2.3};
	cout << f(1.1, 2) << endl;
	cout << pi<float> << endl;
	cout << pi<long double> << endl;
	cout << pi<int> << endl;
	cout.flush();
	cout << put_money("12000") << endl;
	if (cout.fail())
	{
		cerr << "Unable to flush to cout" << endl;
	}

	clog << pi<long long> << endl;
	return 0;
}