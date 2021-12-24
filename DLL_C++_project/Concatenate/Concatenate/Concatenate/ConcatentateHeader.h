#include <wtypes.h>
#ifndef CONCATENATE_H
#define CONCATENATE_H

#define DLL_EXPORT __declspec(dllexport)

struct TwoStrings
{
	const char* string1;
	const char* string2;
	const char* concatenated;
};

extern "C" __declspec(dllexport) const char* GetStruct(TwoStrings val);

#endif //CONCATENATE_H

