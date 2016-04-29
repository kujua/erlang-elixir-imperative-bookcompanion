#include <stdio.h>
#include "printlib.h"

int int_print_func(int x)
{
    printf( "%d\n", x );
}

int main()
{
    // declared in printlib.h as: void print_func(void*(*func)(int));
    print_func(int_print_func(42));

    return 0;
}
