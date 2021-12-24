#include "pch.h"
#include "ConcatentateHeader.h"
#include <iostream>
#include <string>
#include <string.h>
using namespace std;
using std::string;

extern "C"
{
	DLL_EXPORT const char* GetStruct(TwoStrings val)
	{
		const char* one = val.string1;
		const char* two = val.string2;

		char* result = new char[strlen(one) + strlen(two) + 1]{ '\0' };

		strcat_s(result, strlen(one) + 1, one);
		strcat_s(result, strlen(one) + strlen(two) + 1, two);
		cout << result << endl;	

		val.concatenated = result;		
		return result;
	}
}

