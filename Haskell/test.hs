{-# LANGUAGE InstanceSigs #-}

import Data.List (elemIndex)
import Test.QuickCheck
-- import Test.QuickCheck.Checkers
-- import Test.QuickCheck.Classes

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

-- Identity Instance
newtype Identity a = Identity a deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a)= Identity (f a)

instance Applicative Identity where
    pure = Identity
    Identity f <*> Identity a = Identity (f a)

-- Constant Instance
newtype Constant a b = Constant { getConstant :: a } deriving (Eq, Ord, Show)

instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where
  pure a = Constant mempty
  (<*>) :: Constant a (x -> y) -> Constant a x -> Constant a y
  (Constant x) <*> (Constant y) = Constant $ x `mappend` y

-- List Applicative Exercise
data List a = Nil | Cons a (List a) deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a listObj) = Cons (f a) (fmap f listObj)

instance Applicative List where
    pure a = Cons a Nil
    (<*>) _ Nil = Nil
    (<*>) Nil _ = Nil
    (<*>) a b = flatMap (\x -> x <$> b) a


append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x $ xs `append` ys

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil = b
fold f b (Cons h t) = f h (fold f b t)

concat' :: List (List a) -> List a
concat' = fold append Nil

flatMap :: (a -> List b) -> List a -> List b
flatMap f as = concat' $ f <$> as


take' :: Int -> List a -> List a
take' _ Nil = Nil
take' count (Cons x xa)
    | count > 0     = (Cons x Nil) `append` (take' (i-1) xa)
    | otherwise     = Nil

newtype ZipList' a = ZipList' (List a) deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
    xs =-= ys = xs' `eq` ys' where 
        xs' = let (ZipList' l) = xs 
            in take' 3000 l
        ys' = let (ZipList' l) = ys
            in take' 3000 l

instance Functor ZipList' where
    fmap f (ZipList' xs) = ZipList' $ fmap f xs

instance Applicative ZipList' where
    pure = undefined
    (<*>) = undefined
    