import Data.Char
import Prelude

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (x:[]) = Nothing
myTail (_:xs) = Just xs

eftBool :: Bool -> Bool -> [Bool]
eftBool True _ = []
eftBool False False = [False]
eftBool False True = [False, True]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd GT _  = []
eftOrd EQ EQ = [EQ]
eftOrd EQ GT = [EQ, GT]
eftOrd EQ _  = []
eftOrd LT EQ = [LT, EQ]
eftOrd LT LT = [LT]
eftOrd LT GT = LT:(eftOrd EQ GT)

eftInt :: Int -> Int -> [Int]
eftInt first last
    | first <= last = first : (eftInt (first + 1) last)
    | otherwise = []

eftChar :: Char -> Char -> [Char]
eftChar first last
    | first <= last = first : (eftChar (succ first) last)
    | otherwise = []


myWords :: [Char] -> [[Char]]
myWords input
    | input == [] = []
    | otherwise = (takeWhile (/=' ') input):(myWords $ (dropWhile (/=' ') . dropWhile (==' ')) input)

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
-- putStrLn sentences -- should print
-- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?
-- Implement this
myLines :: String -> [String]
myLines input
    | input == [] = []
    | otherwise = (takeWhile (/='\n') input):(myWords $ (dropWhile (=='\n') $ dropWhile (/='\n') input))

mySection :: (Eq a) => a -> [a] -> [[a]]
mySection _ [] = []
mySection d x = (takeSection x):(mySection d $ dropSection x)
  where
    takeSection = takeWhile (/=d)
    dropSection = (dropWhile (==d) . dropWhile (/=d))

-- What we want 'myLines sentences' to equal
shouldEqual = ["Tyger Tyger, burning bright", "In the forests of the night", "What immortal hand or eye", "Could frame thy fearful symmetry?"]
-- The main function here is a small test
-- to ensure you've written your function
-- correctly.
main :: IO ()
main = print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)

myFilter :: String -> [String]
myFilter = (filter (not . flip elem ["the", "a", "an"]) . words)

myZip :: [a] -> [b] -> [(a, b)]
myZip _ [] = []
myZip [] _ = []
myZip(x:xs) (y:ys) = (x,y):myZip xs ys

-- as we have 1st argument function so for that we are not checking null value
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = (f x y):myZipWith f xs ys

zipUmyZipWith :: [a] -> [b] -> [(a, b)]
zipUmyZipWith = myZipWith (,)

filterUpper :: String -> String
filterUpper [] = []
filterUpper (x:xa)
    | isUpper x = x :filterUpper xa
    | otherwise = filterUpper xa

capitalFirst :: String -> String
capitalFirst [] = []
capitalFirst (x:xa) = toUpper x : xa

capitalAll :: String -> String
capitalAll [] = []
capitalAll (x:xa) = toUpper x : capitalAll xa
 
returnFirst :: String -> Maybe Char
returnFirst [] = Nothing
returnFirst x = Just $ toUpper $ head x 