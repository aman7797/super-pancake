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