/*
 * =====================================================================================
 *
 *       Filename:  new.cpp
 *
 *    Description:  demo for new & delete
 *
 *        Version:  1.0
 *        Created:  07/28/2015 00:30:58
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>


using namespace std;

class can_not_create_with_new
{
public:
    void* operator new(std::size_t size) = delete;
    void* operator new[](std::size_t size) = delete;
};

int main()
{
    can_not_create_with_new* a = new can_not_create_with_new;   
    can_not_create_with_new* arr = new can_not_create_with_new[2];
    return 0;
}