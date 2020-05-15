import Control.Monad
import System.Exit
import Data.Char

palindrome :: IO ()
palindrome = forever $ do
    line1 <- getLine 
    let smallLine1 = filter isLetter $ map toLower line1
    case (smallLine1 == reverse smallLine1) of
        True -> putStrLn "It's a palindrome!"
        False -> do
            putStrLn "Nope!"
            exitSuccess

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $
      "Name was: " ++ show name ++ " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStr $ "Enter name: "
  name <- getLine
  putStr $ "Enter age: "
  age <- getLine
  if (any (not . isDigit) age)
  then do
    putStrLn "Age is not number"
    exitFailure
  else
    return ()
  let p = mkPerson name $ read age
  putStrLn "Person is:"
  putStrLn $ show p