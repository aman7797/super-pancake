-- {-# LANGUAGE NoMonomorphismRestriction #-}
-- module DetermineTheType where
-- -- simple example
-- example = 1

-- myAbs :: Integer -> Integer
-- myAbs x = if x < 0
--     then x * (-1)
--     else x

-- id :: a -> a 
-- id a = a

-- id2 :: a -> a -> a
-- id2 a _ = a

-- id2' :: a -> a -> a
-- id2' _  a = a

-- id3 :: a -> b -> b
-- id3 _ b = b

-- -- Polymorphic function
-- triple x = x * 3

-- -- the above function is polymorphic as '3' narrowed down the scope of '*' from Num to Int 

-- -- Non Polymorphic function
-- double x = x + x

-- -- where in this case x can be anything so the double definition will be like this
-- -- double :: Num a => a -> a

-- bigNum = (^) 5 $ 10

-- wahoo = bigNum 

-- module Sing where

-- fstString :: [Char] -> [Char]
-- fstString x = x ++ " in the rain"

-- sndString :: [Char] -> [Char]
-- sndString x = x ++ " over the rainbow"
    
-- sing = if (x < y)
--     then fstString x
--     else sndString y
--     where x = "Singin"
--           y = "Somewher"

-- arith3broken.hs
module Arith3Broken where
main :: IO ()
main = do
    print (1 + 2)
    putStrLn(show 10)
    print (negate (-1))
    print ((+) 0 blah)
    where blah = negate 1
