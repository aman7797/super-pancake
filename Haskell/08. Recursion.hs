import Data.List (intersperse)

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

dividedByA :: Integral a => a -> a -> (a, a)
dividedByA dividend dividor = go dividend dividor 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n-d) d (count + 1)

dividedByB :: Integral a => a -> a -> Maybe (a, a)
dividedByB _ 0              = Nothing
dividedByB 0 _              = Just (0, 0)
dividedByB dividend dividor = Just $ go dividend dividor 0
  where
    sign = (dividend*dividor) `div` (abs (dividend*dividor))
    go n d count
     | abs n < abs d = (count*sign, n)
     | otherwise = go (n-(d*sign)) d (count + 1)



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

mc91 n
  | n <= 100  = mc91 . mc91 $ n + 11
  | otherwise = n - 10


-- module WordNumber where


digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = "#*$(#&$*(&*#($&"

-- Cannot deal with negatives in digitToWords so just return abs value
digits :: Int -> [Int]
digits num = digits' (abs num)
  where digits' n
           | n < 10 && n > -1 = [abs n]
           | otherwise        = ((digits . div n) 10) ++ [mod n 10]


wordNumber :: Int -> String
wordNumber n = (concat . intersperse "-" . map digitToWord) $ digits n















-- Need to resolve the data type issue divisibleBy negative number

-- data DividedResult = Result Int | Intger | DividedByZero | DividedendIsZero deriving Show

-- dividedByC :: (Num a, Ord a) => a -> a -> DividedResult
-- dividedByC dividor dividend
--     | dividor == 0 || dividend == 0 = DividedByZero
--     | dividend > 0 && dividor > 0   = Result $ fst $ go dividend dividor 0
--     -- | dividend < 0 && dividor < 0   = Result $ fst $ go negate dividend negate dividor 0
--     -- | otherwise                     = Result $ (-1 * fst $ go dividend dividor 0)

-- -- checkDivide dividend dividor = Result $ fsghcit $ go dividend dividor 0
-- checkDivide dividor dividend 
--     | dividor == 0 || dividend == 0 = 3
--     | dividend > 0 && dividor > 0 = go (-1)*dividend (-1)*dividor 0

-- go n d count
--     | n < d = (count, n)
--     | otherwise = go (n-d) d (count + 1)