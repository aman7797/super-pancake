module TypeClassExample where

data DayOfWeek = Mon | Tue | Wed | Thr | Fri | Sat | Sun

-- day of week and numerical day of month
data Date = Date DayOfWeek Int

instance Eq DayOfWeek where
 (==) Mon Mon = True
 (==) Tue Tue = True
 (==) Wed Wed = True
 (==) Thr Thr = True
 (==) Fri Fri = True
 (==) Sat Sat = True
 (==) Sun Sun = True
 (==) _ _ = False

instance Eq Date where
    (==) (Date weekday dayOfMonth) (Date weekday' dayOfMonth') = 
        weekday == weekday' && dayOfMonth == dayOfMonth'

data TisAnInteger = TisAn Integer
    
instance Eq TisAnInteger where
    (==) (TisAn a) (TisAn a') = a == a'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two a b) (Two a' b') = a == a' && b == b'

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt a) (TisAnInt a') = a == a'
    (==) (TisAString a) (TisAString a') = a == a'
    (==) _ _ = False

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
    (==) (Pair a b) (Pair a' b') = a == a' && b == b'

data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b)where
    (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'

data Which a = ThisOne a | ThatOne a

instance (Eq a)=> Eq (Which a) where
    (==) (ThisOne a) (ThisOne a') = a == a'
    (==) (ThatOne a) (ThatOne a') = a == a'
    (==) _ _ = False

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq(EitherOr a b) where
    (==) (Hello a) (Hello a') = a == a'
    (==) (Goodbye b) (Goodbye b') = b == b'
    (==) _ _ = False

x :: Int -> Int
x blah = blah + 20

printIt :: IO ()
printIt = putStrLn (show $ x 4)

data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

data Mood = Blah | Woot deriving (Show, Eq)

settleDown x = if x == Woot
    then Blah
    else x

type Subject = String

type Verb = String

type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

data Rocks = Rocks String deriving (Eq, Show, Ord)
data Yeah = Yeah Bool deriving (Eq, Show, Ord)
data Papu = Papu Rocks Yeah deriving (Eq, Show, Ord)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p

f :: Fractional a => a 
f = 1.0