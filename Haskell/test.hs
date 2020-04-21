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
    
-- nums x =
--     case compare x 0 of
--         LT -> -1
--         GT -> 1

nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0