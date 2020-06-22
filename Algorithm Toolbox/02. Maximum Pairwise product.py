
def max_pairwise(n, numbers):
    max_index1 = -1
    for i in range(n):
        if max_index1 == -1 or numbers[i] > numbers[max_index1]:
            max_index1 = i

    max_index2 = -1
    for i in range(n):
        if i != max_index1 and (max_index2 == -1 or numbers[i] > numbers[max_index2]):
            max_index2 = i

    return numbers[max_index1] * numbers[max_index2]


def max_sort_product(n,numbers):
    numbers.sort()
    return numbers[n-1] * numbers[n-2]


if __name__ == '__main__':

    n = int(input())
    listOfNumber = [int(x) for x in input().split()]
    assert (len(listOfNumber) == n)

    print(max_sort_product(n,listOfNumber))