{-# LANGUAGE FlexibleInstances #-}

import Prelude
import Test.QuickCheck
import Test.QuickCheck.Function

-- Functor Properties for test 

functorCompose' :: (Eq (f c), Functor f) => f a -> Fun a b -> Fun b c -> Bool
functorCompose' x (Fun _ f) (Fun _ g) = 
    (fmap (g . f) x) == (fmap g . fmap f $ x)

functorIdentity :: (Functor f, Eq (f a)) => f a -> Bool
functorIdentity f = 
    fmap id f == f

type IntToInt = Fun Int Int

-- 1
newtype Identity a = Identity a deriving (Show, Eq)

instance Functor Identity where
    fmap f (Identity a) = Identity (f a)

instance (Arbitrary a) => Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return $ Identity a

type IdentityFC =  Identity Int -> IntToInt -> IntToInt -> Bool

-- 2
data Pair a = Pair a a deriving (Show, Eq)

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

instance (Arbitrary a) => Arbitrary (Pair a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Pair a b

type PairFC = Pair Int -> IntToInt -> IntToInt -> Bool

-- 3
data Two a b = Two a b deriving (Show, Eq)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary(Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Two a b
    
type TwoFC = Two String Int -> IntToInt -> IntToInt -> Bool

-- 4
data Three a b c = Three a b c deriving (Show, Eq)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary(Three a b c) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary    
        c <- arbitrary
        return $ Three a b c

type ThreeFC = Three String Char Int -> IntToInt -> IntToInt -> Bool

-- 5
data Three' a b = Three' a b b deriving (Show, Eq)

instance Functor (Three' a) where
    fmap f (Three' a b b') = Three' a (f b) (f b')


instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        b' <- arbitrary
        return $ Three' a b b'

type ThreeFC' = Three' String Int -> IntToInt -> IntToInt -> Bool

-- 6
data Four a b c d = Four a b c d deriving (Show, Eq)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary(Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four a b c d

type FourFC = Four String String String Int -> IntToInt -> IntToInt -> Bool

-- 7
data Four' a b = Four' a a a b deriving (Show, Eq)

instance Functor (Four' a ) where
    fmap f (Four' a b c d) = Four' a b c (f d)

instance (Arbitrary a, Arbitrary b) => Arbitrary(Four' a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return $ Four' a b c d
    
type FourFC' = Four' String Int -> IntToInt -> IntToInt -> Bool

-- 8
data Trivial = Trivial

-- Functor is of type * -> * thats why we cannot write instance

-- Exercise Possibly

data Possibly a = LolNope | Yeppers a deriving (Eq, Show)

instance Functor Possibly where
    fmap f (Yeppers a) = Yeppers (f a)
    fmap _ LolNope = LolNope

instance (Arbitrary a) => Arbitrary(Possibly a) where
    arbitrary = do
        a <- arbitrary
        (oneof . (fmap return)) [LolNope, Yeppers a]

type PossiblyFC = Possibly Int -> IntToInt -> IntToInt -> Bool

data Sum a b = First a | Second b deriving (Eq, Show)
    
instance Functor (Sum a) where
    fmap _ (First a) = First a 
    fmap f (Second b) = Second (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary(Sum a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        (oneof . (fmap return)) [First a, Second b]

type SumFC = Sum String Int -> IntToInt -> IntToInt -> Bool

data BoolAndMaybeSomethingElse a = Falsish | Truish a

instance Functor BoolAndMaybeSomethingElse where
    fmap _ Falsish = Falsish
    fmap f (Truish a) = Truish (f a)

data Company a c b = DeepBlue a c | Something b

instance Functor (Company e e') where
    fmap f (Something b) = Something (f b)
    fmap _ (DeepBlue a c) = DeepBlue a c

data More b a = L a b a | R b a b deriving (Eq, Show)

instance Functor (More x) where
    fmap f (L a b a') = L (f a) b (f a')
    fmap f (R b a b') = R b (f a) b'

-- Chapter Exercise

data Quant a b = Finance | Desk a | Bloor b deriving (Eq, Show)

instance Functor (Quant a) where
    fmap _ Finance = Finance
    fmap _ (Desk a) = Desk a
    fmap f (Bloor b) = Bloor (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Quant a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        (oneof . (fmap return)) [Finance, Desk a, Bloor b]

type QuantFC = Quant String Int -> IntToInt -> IntToInt -> Bool

data K a b = K a deriving (Show, Eq)

instance Functor (K a) where 
    fmap _ (K a) = K a

instance (Arbitrary a) => Arbitrary (K a b) where
  arbitrary = do
    a <- arbitrary
    return $ K a

type KFC = K Float Int -> IntToInt -> IntToInt -> Bool

newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

newtype K' a b = K' a deriving (Eq, Show)
-- should remind you of an
-- instance you've written before

instance Functor (Flip K' a) where
    fmap f (Flip (K' a)) =  (Flip (K' (f a)))

instance (Arbitrary b) => Arbitrary (Flip K' a b) where
  arbitrary = do
    b <- arbitrary
    return $ Flip $ K' b

type FlipFC = Flip K' Float Int -> IntToInt -> IntToInt -> Bool

data EvilGoateeConst a b = GoatyConst b deriving (Show, Eq)

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst (f b)

instance (Arbitrary b) => Arbitrary(EvilGoateeConst a b) where
    arbitrary = do
        b <- arbitrary
        return $ GoatyConst b

type EvilGoateeConstFC = EvilGoateeConst Float Int -> IntToInt -> IntToInt -> Bool

data LiftItOut f a = LiftItOut (f a) deriving (Show, Eq)

instance (Functor f) => Functor (LiftItOut f) where
    fmap f (LiftItOut fa) = LiftItOut $ fmap f fa

instance (Arbitrary a) => Arbitrary (LiftItOut Maybe a) where
  arbitrary = do
    a <- arbitrary
    (oneof . (fmap return)) [LiftItOut Nothing, LiftItOut $ Just a]

type LiftItOutFC = LiftItOut Maybe Int -> IntToInt -> IntToInt -> Bool

data Parappa f g a = DaWrappa (f a) (g a) deriving (Show, Eq)

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap f (DaWrappa fa ga) = DaWrappa (fmap f fa) (fmap f ga)

instance (Arbitrary a) => Arbitrary (Parappa Maybe [] a) where
  arbitrary = do
    a <- arbitrary
    (oneof . (fmap return)) [ DaWrappa x y | x <- [Nothing, Just a], y <- [[], [a]]]

type ParappaFC = Parappa Maybe [] Int -> IntToInt -> IntToInt -> Bool

data IgnoreOne f g a b = IgnoringSomething (f a) (g b) deriving (Show, Eq)

instance (Functor g) => Functor (IgnoreOne f g a) where
    fmap f (IgnoringSomething fa gb) = IgnoringSomething fa (fmap f gb)

instance (Arbitrary a, Arbitrary b) => Arbitrary (IgnoreOne Maybe [] a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    (oneof . (fmap return)) [ IgnoringSomething x y | x <- [Nothing, Just a], y <- [[], [b]]]

type IgnoreOneFC = IgnoreOne Maybe [] Float Int -> IntToInt -> IntToInt -> Bool

data Notorious g o a t = Notorious (g o) (g a) (g t) deriving (Show, Eq)

instance (Functor g) => Functor (Notorious g o a) where
    fmap f (Notorious go ga gt) = Notorious go ga (fmap f gt)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Notorious Maybe a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    (oneof . (fmap return)) [ Notorious x y z | x <- [Nothing, Just a], y <- [Nothing, Just b], z <- [Nothing, Just c]]

type NotoriousFC = Notorious Maybe Char Float Int -> IntToInt -> IntToInt -> Bool

data List a = Nil | Cons a (List a) deriving (Show, Eq)

instance Functor List where 
    fmap _ Nil = Nil
    fmap f (Cons a as) = Cons (f a) (fmap f as)


instance (Arbitrary a) => Arbitrary(List a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        (oneof . (fmap return)) [Nil,Cons a b]

type ListFC = List Int -> IntToInt -> IntToInt -> Bool

data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a) deriving (Show, Eq)

instance Functor GoatLord where
    fmap _ NoGoat = NoGoat
    fmap f (OneGoat a) = OneGoat (f a)
    fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

instance (Arbitrary a) => Arbitrary (GoatLord a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        (oneof . (fmap return)) [NoGoat, OneGoat a, MoreGoats b c d]
    
type GoatLordFC = GoatLord Int -> IntToInt -> IntToInt -> Bool

data TalkToMe a = Halt | Print String a | Read (String -> a) 

instance Functor TalkToMe where
    fmap _ Halt = Halt
    fmap f (Print a b) = Print a (f b)
    fmap f (Read toGeta) = Read (fmap f toGeta)

instance (Arbitrary a) => Arbitrary(TalkToMe a) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary 
        toGeta <- arbitrary
        (oneof . (fmap return)) [Halt, Print a b, Read toGeta]
    
type TalkToMeFC = TalkToMe Int -> IntToInt -> IntToInt -> Bool

instance (Show a) => Show(TalkToMe a) where
    show Halt           = "Halt"
    show (Print a b)    = "Print " ++ a ++ (show b)             -- a is String and b is integer
    show (Read _)       = "Read calling function"               -- don't know the return type of (String -> a)

instance (Eq a) => Eq (TalkToMe a) where
    (==) Halt Halt                  = True
    (==) (Print s a) (Print s' a')  = (s == s') && (a == a')
    (==) (Read _) (Read _)          = True                      -- don't know the return type of (String -> a)
    (==) _ _                        = False

main :: IO ()
main = do
  putStrLn "Identity:"
  quickCheck (functorIdentity :: (Identity Int -> Bool))
  quickCheck (functorCompose' :: IdentityFC)

  putStrLn "Pair:"
  quickCheck (functorIdentity :: (Pair Int -> Bool))
  quickCheck (functorCompose' :: PairFC)

  putStrLn "Two:"
  quickCheck (functorIdentity :: (Two String Int -> Bool))
  quickCheck (functorCompose' :: TwoFC)

  putStrLn "Three:"
  quickCheck (functorIdentity :: (Three String Char Int -> Bool))
  quickCheck (functorCompose' :: ThreeFC)

  putStrLn "Three':"
  quickCheck (functorIdentity :: (Three' String Int -> Bool))
  quickCheck (functorCompose' :: ThreeFC')

  putStrLn "Four:"
  quickCheck (functorIdentity :: (Four String Char Float Int -> Bool))
  quickCheck (functorCompose' :: FourFC)

  putStrLn "Four':"
  quickCheck (functorIdentity :: (Four' Char Int -> Bool))
  quickCheck (functorCompose' :: FourFC')

  putStrLn "Possibly:"
  quickCheck (functorIdentity :: (Possibly Int -> Bool))
  quickCheck (functorCompose' :: PossiblyFC)

  putStrLn "Sum:"
  quickCheck (functorIdentity :: (Sum Char Int -> Bool))
  quickCheck (functorCompose' :: SumFC)

  putStrLn "Quant:"
  quickCheck (functorIdentity :: (Quant Char Int -> Bool))
  quickCheck (functorCompose' :: QuantFC)

  putStrLn "K:"
  quickCheck (functorIdentity :: (K Float Int -> Bool))
  quickCheck (functorCompose' :: KFC)

  putStrLn "Flip:"
  quickCheck (functorIdentity :: (Flip K' Float Int -> Bool))
  quickCheck (functorCompose' :: FlipFC)

  putStrLn "EvilGoateeConst:"
  quickCheck (functorIdentity :: (EvilGoateeConst Float Int -> Bool))
  quickCheck (functorCompose' :: EvilGoateeConstFC)

  putStrLn "LiftItOut:"
  quickCheck (functorIdentity :: (LiftItOut Maybe Int -> Bool))
  quickCheck (functorCompose' :: LiftItOutFC)

  putStrLn "Parappa:"
  quickCheck (functorIdentity :: (Parappa Maybe [] Int -> Bool))
  quickCheck (functorCompose' :: ParappaFC)

  putStrLn "IgnoreOne:"
  quickCheck (functorIdentity :: (IgnoreOne Maybe [] Float Int -> Bool))
  quickCheck (functorCompose' :: IgnoreOneFC)

  putStrLn "List:"
  quickCheck (functorIdentity :: (List Int -> Bool))
  quickCheck (functorCompose' :: ListFC)

  putStrLn "GoatLord:"
  quickCheck (functorIdentity :: (GoatLord Int -> Bool))
  quickCheck (functorCompose' :: GoatLordFC)

  putStrLn "TalkToMe:"
  quickCheck (functorIdentity :: (TalkToMe Int -> Bool))
  quickCheck (functorCompose' :: TalkToMeFC)