-- Repeat the given string n times
repeatString str n =
     if n == 0
     then ""
     else str ++ (repeatString str (n -1))

-- Recursion function to power the number
pow2 n = pow2loop n 1 0
pow2loop n x i =
 if i<n
 then pow2loop n (x*2) (i+1)
 else x

-- Function to double the list values
double nums=
    if null nums
        then []
        else (2*(head nums)) : (double (tail nums))

-- Remove Odd List
removeOdd nums=
    if null nums
        then []
        else
            if (mod (head nums) 2) == 0
                then (head nums) : (removeOdd (tail nums))
                else removeOdd (tail nums)