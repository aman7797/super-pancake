addOneIfOddQ n = case odd n of
    True -> f n
    False -> n
    where f n = n + 1


addOneIfOdd = \n -> case odd n of
    True -> f n
    False -> n
    where f n = n + 1

addFiveQ x y = (if x > y then y else x) + 5

addFive = \x -> \y -> (if x > y then y else x) + 5

mflipQ f = \x -> \y -> f y x

mflip = \f -> \x -> \y -> f y x

y = 1 
x = 2 
f y x = x + y


-- functionC x y = if (x > y) then x else y

functionC x y =
    case check of
        True -> x
        False -> y
    where check = x > y

-- ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2 n =
    case even n of
        True -> n + 2
        False -> n

nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0

dodgy :: Num a => a -> a-> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = (flip dodgy) 2

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade marks
    | x >= 0.7 = 'C'
    | x >= 0.9 = 'A'
    | x >= 0.8 = 'B'
    | x >= 0.6 = 'D'
    | x >= 0.5 = 'E'
    | otherwise = 'F'
    where x = marks/100

pal xs
    | xs == reverse xs = True
    | otherwise = False

numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1


add :: Int -> Int -> Int
add x y = x + y

addPF :: Int -> Int -> Int
addPF = (+)

addOne :: Int -> Int
addOne = \x -> x + 1

addOnePF :: Int -> Int
addOnePF = (+1)

main :: IO ()
main = do
    print (roundTrip 4)
    print ((roundTrip2 4) :: Double)
    print (0 :: Int)
    print (add 1 0)
    print (addOne 0)
    print (addOnePF 0)
    print ((addOne . addOne) 0)
    print ((addOnePF . addOne) 0)
    print ((addOne . addOnePF) 0)
    print ((addOnePF . addOnePF) 0)
    print (negate (addOne 0))
    print ((negate . addOne) 0)
    print ((addOne . addOne . addOne . negate . addOne) 0)

ftest :: Char -> String
ftest = undefined

gtest :: String -> [String]
gtest = undefined

tensDigit :: Integral a => a -> a
tensDigit x = d
    where (xLast,_) = x `divMod` 10
          (_,d) = xLast `divMod` 10
        
hunsD x = d2
    where d = x `div` 100
          d2 = d `mod` 10
        
hunsDDigit :: Integral a => a -> a
hunsDDigit x = d
    where (xLast,_) = x `divMod` 100
          (_,d) = xLast `divMod` 10
        
foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard input1 input2 condition 
    | condition == True = input1
    | condition == False = input2

foldBoolCase :: a -> a -> Bool -> a
foldBoolCase input1 input2 condition =
    case condition of
        True -> input1
        False -> input2


foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ True = x
foldBool3 _ y False = y

g :: (a -> b) -> (a, c) -> (b, c)
g fInput (a,c) = (fInput a,c)                 -- f a to get b and c we can return as it is

fInput :: Num a => a -> a
fInput a = a + 1

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

roundTrip2 :: (Show a, Read b) => a -> b
roundTrip2 a = read (show a)
