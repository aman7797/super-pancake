import sys


def euclid_gcd(a, b):
    if b == 0:
        return a
    else:
        remainder = a % b
        return euclid_gcd(b, remainder)


if __name__ == '__main__':

    input_value = sys.stdin.read()
    value = input_value.split()
    value1 = int(value[0])
    value2 = int(value[1])
    answer = euclid_gcd(value1, value2)
    print(answer)