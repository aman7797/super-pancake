import Data.Time

data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
             (fromGregorian 1911 5 1)
             (secondsToDiffTime 34123)
           )
  , DbNumber 9001
  , DbString "Hello, World!"
  , DbDate (UTCTime
             (fromGregorian 1921 5 1)
             (secondsToDiffTime 34123)
           )
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr ((++) . key) []
  where
    key :: DatabaseItem -> [UTCTime]
    key (DbDate x) = [x]
    key _          = []

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr ((++) . key) []
  where
    key :: DatabaseItem -> [Integer]
    key (DbNumber x) = [x]
    key _          = []

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = (foldr max oldUTC) . filterDbDate
  where
    oldUTC = UTCTime (fromGregorian 1 1 1) (secondsToDiffTime 1)

sumDb :: [DatabaseItem] -> Integer
sumDb input = sum $ filterDbNumber input

avgDb :: [DatabaseItem] -> Double
avgDb input = fromIntegral $ sumOfDbNumber `div` fromIntegral countOfDbNumber
    where
        sumOfDbNumber = sumDb input
        countOfDbNumber = length $ filterDbNumber input

fibs20 :: [Integer]
fibs20 = take 20 $ 1 : scanl (+) 1 fibs20

fibsLess100 :: [Integer]
fibsLess100 = takeWhile (<100) $ 1 : scanl (+) 1 fibsLess100

fibsFactorial :: Int -> Integer
fibsFactorial input = fibsFactorials !! input
  where
    fibsFactorials :: [Integer]
    fibsFactorials = scanl (*) 1 [1..]

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

stopvowelstop ::[(Char, Char, Char)]
stopvowelstop = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]

stopvowelstopPCombo ::[(Char, Char, Char)]
stopvowelstopPCombo = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']

nouns :: [String]
nouns = ["he","she","it"]

verbs :: [String]
verbs = ["loves","like","hate"]

nounVerbNoun ::[(String, String, String)]
nounVerbNoun = [(s1, v, s2) | s1 <- nouns, v <- verbs, s2 <- nouns]

seekritFunc x = div (sum (map length (words x))) (length (words x))

seekritFunc' :: String -> Double
seekritFunc' x = (/) (fromIntegral $ sum (map length (words x))) (fromIntegral $ length (words x))

myOr :: [Bool] -> Bool
myOr input = foldr (||) True input

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\a b -> f a || b) False

myElemAny :: Eq a => a -> [a] -> Bool
myElemAny e = any (== e)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x xs -> if f x then x:xs else xs) []

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = undefined
myMaximumBy f (x:xs) = foldl compareFn x xs
  where compareFn b x' = if f x' b == GT then x' else b

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x:xs) = foldl compareFn x xs
  where compareFn b x' = if f x' b == LT then x' else b