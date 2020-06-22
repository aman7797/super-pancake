import sys


def fib_number_sum_with_range(value1, value2):

    fib_list = []
    for i in range(value1, value2+1):
        number = fib_number_by_position(i)
        fib_list.append(number)

    return fib_list


def fib_number_by_position(n):

    if n <= 1:
        return n
    elif n == 2:
        return 1
    else:
        output = fib_number_by_position(n-1) + fib_number_by_position(n-2)
        return output


if __name__ == '__main__':

    input_value = sys.stdin.read()
    value = input_value.split()
    value1 = int(value[0])
    value2 = int(value[1])
    answer = fib_number_sum_with_range(value1, value2)
    print(sum(answer))
