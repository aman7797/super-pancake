myAbs :: Integer -> Integer
myAbs x = if x < 0
    then x * (-1)
    else x

id :: a -> a 
id a = a

id2 :: a -> a -> a
id2 a _ = a

id2' :: a -> a -> a
id2' _  a = a

id3 :: a -> b -> b
id3 _ b = b