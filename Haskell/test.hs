import Data.List (elemIndex)

-- Exercise: Lookups
-- 1
added :: Maybe Integer
added = (+3) <$> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])
-- 2
y :: Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z
-- 3
x :: Maybe Int
x = elemIndex 3 [1, 2, 3, 4, 5]

y' :: Maybe Int
y' = elemIndex 4 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$>  x <*> y'

-- 4
xs = [1, 2, 3]

ys = [4, 5, 6]

x4 :: Maybe Integer
x4 = lookup 3 $ zip xs ys

y4 :: Maybe Integer
y4 = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = sum <$> ((,) <$> x4 <*> y4)


newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a)= Identity (f a)

instance Applicative Identity where
    pure = Identity
    (<*>) = undefined


newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Ord, Show)

instance Functor (Constant a) where
    fmap =undefined

instance Monoid a => Applicative (Constant a) where
    pure = undefined
    (<*>) = undefined