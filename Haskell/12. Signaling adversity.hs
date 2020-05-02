import Data.Char

type Name = String

type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
    | name /= "" && age >= 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | otherwise = Left AgeTooLow

notThe :: String -> Maybe String
notThe input = if input == "the"
    then Nothing
    else Just input

replaceThe :: String -> String
replaceThe [] = []
replaceThe input = (replaceWithA $ takeWhile (/=' ') input) ++ (replaceThe $ (dropWhile (==' ') . dropWhile (/=' ')) input)

replaceWithA :: String -> String
replaceWithA input 
    | notThe input == Nothing = "a "
    | otherwise = input ++ " "

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel [] = 0
countTheBeforeVowel input 
    | (notThe $ (takeWhile (/=' ') input)) == Nothing = if vowelCheck (head $ (dropWhile (==' ') . dropWhile (/=' ')) input)
        then 1 + (countTheBeforeVowel $ (dropWhile (==' ') . dropWhile (/=' ')) input) 
        else (countTheBeforeVowel $ (dropWhile (==' ') . dropWhile (/=' ')) input)
    | otherwise = 0 + (countTheBeforeVowel $ (dropWhile (==' ') . dropWhile (/=' ')) input)

vowelCheck :: Char -> Bool
vowelCheck ' ' = False
vowelCheck input = elem input "aeiou"

countVowels :: String -> Integer
countVowels [] = 0
countVowels (x:xa) = if vowelCheck x
    then 1 + countVowels xa
    else countVowels xa

countConsonants :: String -> Integer
countConsonants [] = 0
countConsonants (x:xa) = if vowelCheck x
    then countConsonants xa
    else 1 + countConsonants xa

newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord input = if (countVowels input) == (countConsonants input)
    then Just $ Word' input
    else Nothing

data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0 
natToInteger (Succ x) = 1 + natToInteger x 


integerToNat :: Integer -> Maybe Nat
integerToNat input
    | input >= 0 = Just $ integerToNat' input
    | otherwise = Nothing

integerToNat' :: Integer -> Nat
integerToNat' 0 = Zero
integerToNat' input = Succ (integerToNat' (input-1))

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just _) = False

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee _ f (Just a) = f a              -- function will return from aTob
mayybee b _ Nothing = b                 -- return type is b that's why directly return b

fromMaybe :: a -> Maybe a -> a
fromMaybe a Nothing = a
fromMaybe _ (Just a) = a

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe input = Just $ head input

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just input) = [input]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Just x:xa) = x : catMaybes xa
catMaybes (Nothing : xa) = catMaybes xa

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (Nothing:xa) = Nothing
flipMaybe (Just x:xs) =
   case flipMaybe xs of
    Nothing -> Nothing
    Just ys -> Just (x:ys)

lefts' :: [Either a b] -> [a]
lefts' = foldr (\x acc -> case x of
                            Left a  -> a:acc
                            Right _ -> acc) []