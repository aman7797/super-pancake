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
