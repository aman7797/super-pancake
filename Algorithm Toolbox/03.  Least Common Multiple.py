import sys


def euclid_gcd(a, b):
    if b == 0:
        return a
    else:
        remainder = a % b
        return euclid_gcd(b, remainder)


# This function computes LCM
def compute_lcm(x, y):
    lcm = (x * y) // euclid_gcd(x, y)
    return lcm


if __name__ == '__main__':
    input_value = sys.stdin.read()
    value = input_value.split()
    value1 = int(value[0])
    value2 = int(value[1])
    answer = compute_lcm(value1, value2)
    print(answer)
