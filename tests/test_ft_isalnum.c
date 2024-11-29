#include <stdio.h>
#include "libft.h" // GCC will resolve this dynamically

void test_isalnum(int input, int expected)
{
    int result = ft_isalnum(input);
    if (result == expected)
        printf("✅ Test Passed: ft_isalnum(%d) == %d\n", input, result);
    else
        printf("❌ Test Failed: ft_isalnum(%d) == %d (Expected: %d)\n", input, result, expected);
}

int main(void)
{
    test_isalnum('A', 1);
    test_isalnum('z', 1);
    test_isalnum('5', 1);
    test_isalnum('!', 0);
    test_isalnum(' ', 0);
    test_isalnum(128, 0);

    return 0;
}
