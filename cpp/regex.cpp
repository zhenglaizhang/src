/*
 * =====================================================================================
 *
 *       Filename:  regex.cpp
 *
 *    Description:  regex demo
 *
 *        Version:  1.0
 *        Created:  08/02/2015 13:09:50
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
#include <regex>

using namespace std;

int main(int argc, char* argv[])
{
//    regex r("\\d{4}/(?:0?[1-9]|1[0-2])/(?:0?[1-9]|[1-2][0-9]|3[0-1])");
    regex r("\\d{4}/(?:0?[1-9]|1[0-2])/(?:0?[1-9]|[1-2][0-9]|3[0-1])");
    regex r2("(\\d{4})/(0?[1-9]|1[0-2])/(0?[1-9]|[1-2][0-9]|3[0-1])");
    while (true) {
        cout << "Enter a date (year/month/day) (q=quit): ";
        string str;
        if (!getline(cin, str) || str == "q") {
            break;
        }            

        if (regex_match(str, r)) {
            cout << " Valid date." << endl;
        } else {
            cout << " Invalid date." << endl;
        }
        
        smatch sm;
        if (regex_match(str, sm, r2)) {
            int y = stoi(sm[1]);
            int m = stoi(sm[2]);
            int d = stoi(sm[3]);
            cout << y << "-" << m << "-" << d << endl;
        }
    }

    regex r3("//\\s*(.+)$");
     
    while ( true ) {
        cout << "Enter a string with optional code comment. (q=quit): ";
        string str;
         
        if ( !getline(cin, str) || str == "q" ) {
            break; 
        }
        smatch m;
        if ( regex_search(str, m, r3) ) {
            cout << " Found comment '" << m[1] << "'" << endl;
        } else {
            cout << " No comment found" << endl;
        }
    }

   regex r4("[\\w]+");
    while ( true ) {
        cout << "Enter a string to split (q=quit): ";
        string str;
       
        if ( !getline(cin, str) || str == "q" ) {
            break;
        }
        const sregex_iterator end;

        for ( sregex_iterator iter(cbegin(str), cend(str), r4); iter != end; ++iter ) {
            cout << "\"" << (*iter)[0] << "\"" << endl;
        }
    }

    regex r5("[\\w]+");
    while ( true ) {
        cout << "Enter a string to split (q=quit): ";
        string str;
       
        if ( !getline(cin, str) || str == "q" ) {
            break;
        }
        const sregex_token_iterator end;

        for ( sregex_token_iterator iter(cbegin(str), cend(str), r5); iter != end; ++iter ) {
            cout << "\"" << *iter << "\"" << endl;
        }
    }

    regex reg("^(\\d{4})/(0?[1-9]|1[0-2])/(0?[1-9]|[1-2][0-9]|3[0-1])$"); 
    while (true) {
        cout << "Enter a date (year/month/day) (q=quit): "; string str;
        if (!getline(cin, str) || str == "q")
            break;
        vector<int> indices{ 2, 3 };
        const sregex_token_iterator end;
        for (sregex_token_iterator iter(cbegin(str), cend(str), reg, indices);
                iter != end; ++iter) {
            cout << "\"" << *iter << "\"" << endl; }
    }

    regex reg2(R"(\s*[,;]\s*)");
    while (true) {
        cout << "Enter a string to split on ',' and ';' (q=quit): "; string str;
        if (!getline(cin, str) || str == "q")
            break;
        const sregex_token_iterator end;
        for (sregex_token_iterator iter(cbegin(str), cend(str), reg2, -1);
                iter != end; ++iter) {
            cout << "\"" << *iter << "\"" << endl; }
    }
    return 0;

    const string str("<body><h1>Header</h1><p>Some text</p></body>"); 
    r = regex("<h1>(.*)</h1><p>(.*)</p>");
    const string format("H1=$1 and P=$2");
    string result = regex_replace(str, r, format);
    cout << "Original string: '" << str << "'" << endl; 
    cout << "New string : '" << result << "'" << endl;
}