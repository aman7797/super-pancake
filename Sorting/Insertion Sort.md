# Insertion Sort

Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time. 

## Example

![Insertio Sort](img/insertion_sort.gif)

## Complexity
| Complexity	|Best Case	|Average Case	|Worst Case|
|--------------|-----------|-------------|-------------|
|Time	|Ω(n)	|θ(n2)	|o(n2)|


## Code

```java
#include <iostream>
#include <conio.h>

int main()
{
    int a[16], i, j, k, tmp,count;
    cout << "enter the number of elements\n";
    cin>>count;
    for (i = 0; i < count; i++) { cin >> a[i];
    }
    for (i = 1; i < count; i++) { for (j = i; j >= 1; j--) {
            if (a[j] < a[j - 1]) {
                tmp = a[j];
                a[j] = a[j - 1];
                a[j - 1] = tmp;
            }
            else
                break;
        }
    }
    cout << "sorted array\n" << endl;
    for (k = 0; k < count; k++) {
        cout << a[k] << "\t";
    }
}
```