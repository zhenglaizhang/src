/*
 * =====================================================================================
 *
 *       Filename:  numric.cpp
 *
 *    Description:  demo for limits header file
 *
 *        Version:  1.0
 *        Created:  07/28/2015 01:17:07
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
#include <limits>
#include <vector>

using namespace std;

class El
{
public:
    El(int i, const string& s)
        : i(i), s(s) {}
    int i;
    string s;
};

int main()
{
    cout << sizeof(bool) << endl;
    vector<El> v;
    v.push_back({1,"hello"});
    cout << numeric_limits<int>::max() << endl;
    cout << numeric_limits<int>::min() << endl;
    cout << numeric_limits<double>::lowest() << endl;
    return 0;
}
