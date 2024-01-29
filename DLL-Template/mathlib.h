#ifndef MATHLIB_H
#define MATHLIB_H

#if defined(_WIN32) // dll for Windows
    #ifdef MATHLIB_EXPORTS
        #define MATHLIB_API __declspec(dllexport)
    #else
        #define MATHLIB_API __declspec(dllimport)
    #endif
// Technically can work with CLang like this too
#elif defined(__linux__) || defined(__APPLE__) // shared-object for Linux/MacOS
    #ifdef MATHLIB_EXPORTS
        #define MATHLIB_API __attribute__((visibility("hidden")))
    #else
        #define MATHLIB_API __attribute__((visibility("default")))
    #endif
#endif

// DLL with functions in a namespace
namespace matlib {

    MATHLIB_API int Add(int a, int b);

    MATHLIB_API int Sub(int a, int b);
}

// You can implement classes like so
class MATHLIB_API Calculator {
public:
    static int ADD(int a, int b);
    static int SUB(int a, int b);
};


#endif