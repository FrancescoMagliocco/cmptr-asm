#include    <stdio.h>

int
strtodec(char *str)
{
    int num = 0;
    while (*str >= '0' && *str <= '9')
    {
        num *= 10;
        num += (*str - '0');
        str++;
    }

    return num;
}
