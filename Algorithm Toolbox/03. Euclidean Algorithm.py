def euclid_gcd(a, b):
    if b == 0:
        return a
    else:
        remainder = a % b
        return euclid_gcd(b, remainder)


if __name__ == '__main__':
    number1 = int(input("Enter number 1 :: "))
    number2 = int(input("Enter number 2 :: "))

    print(euclid_gcd(number1, number2))