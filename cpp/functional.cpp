/*
 * =====================================================================================
 *
 *       Filename:  functional.cpp
 *
 *    Description:  functional demo
 *
 *        Version:  1.0
 *        Created:  08/02/2015 19:43:04
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Zhenglai Zhang (darinzh), zhenglaizhang@hotmail.com
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <thread>
#include <stdexcept>
#include <functional>
#include <algorithm>
#include <numeric>

using namespace std;

bool isEven(int num)
{
    return num % 2 == 0;
}

void process(const vector<int>& vec, function<void(int)> f)
{
    for (auto& i : vec) {
        f(i);
    }    
}

void print(int num)
{
    cout << num << " ";
}


int main(int argc, char* argv[])
{
    vector<int> vec(10);
    iota(begin(vec), end(vec), 0);
    function<bool(int)> f2 = isEven;
    int cnt = count_if(cbegin(vec), cend(vec), f2);
    cout << cnt << " even numbers" << endl;

    int sum{};
    process(vec, [&sum](int num) { sum += num; });
    cout << "sum = " << sum << endl;
    return 0;
}
