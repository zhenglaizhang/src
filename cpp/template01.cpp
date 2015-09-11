/*
 * =====================================================================================
 *
 *       Filename:  template01.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  07/29/2015 21:32:55
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
#include <string>

using namespace std;

template <typename T, const T DEFAULT=T()>
struct Grid
{
    static void print()
    {
        cout << DEFAULT << endl;
    }
};

int main()
{
    Grid<int, 12>::print();
//    Grid<string, "test">::print();
}