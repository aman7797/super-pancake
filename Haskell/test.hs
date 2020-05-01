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
vowelCheck input = elem input ['a','e','i','o','u']

countVowels :: String -> Integer
countVowels [] = 0
countVowels (x:xa) = if vowelCheck x
    then 1 + countVowels xa
    else countVowels xa