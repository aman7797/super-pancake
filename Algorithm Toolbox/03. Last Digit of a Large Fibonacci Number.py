# 0 1 1 2 3 5 8 13
def fib_number_by_position(n):

    if n <= 0:
        return 0
    elif n <= 2:
        return 1
    else:
        return fib_number_by_position(n-1) + fib_number_by_position(n-2)


def fib_without_recursion(n):
    a, b = 0, 1
    for i in range(n-1):
        c = a + b
        c = c % 10
        b, a = c, b
    return c


if __name__ == '__main__':

    n = int(input())
    if n<=1:
        print(n)
        quit()
    print(fib_without_recursion(n))
