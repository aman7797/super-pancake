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
