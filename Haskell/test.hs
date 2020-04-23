numberFactorial :: (Num a, Ord a) => a -> a
numberFactorial number
    | number >= 1 = number * numberFactorial (number - 1)
    | otherwise = 1

fibonacci :: Integral a => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)


cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- divideBy :: Num a => a -> a -> a
-- divideBy divident divisor 
--     | divisor 0 = 0
--     | divisor 1 = 1
--     | divisor <=2 = divideBy divident-divisor divisor-1

dividedBy :: (Num a, Ord a) => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n  d count
            | n < d = (count, n)
            | otherwise = go (n-d) d (count + 1)


multiplyBy :: (Num a, Eq a) => a -> a -> a
multiplyBy num times 
    | times == 0 = 0
    | otherwise = num + multiplyBy num (times - 1)

-- 4 + multiplyBy 4 4
-- 4 + multiplyBy 4 4 + multiplyBy 4 3
-- 4 + multiplyBy 4 4 + multiplyBy 4 3 + multiplyBy 4 2
-- 4 + multiplyBy 4 4 + multiplyBy 4 3 + multiplyBy 4 2 + multiplyBy 4 1
-- 4 + multiplyBy 4 4 + multiplyBy 4 3 + multiplyBy 4 2 + multiplyBy 4 1 +  multiplyBy 4 0

addTill :: (Num a, Eq a, Ord a) => a -> a
addTill 0 = 0
addTill n = n + addTill (n -1) 

