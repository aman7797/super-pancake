{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- import Data.Optional
import Prelude
import Data.String (IsString)

newtype Name = Name { getName :: String } deriving (IsString)

greet :: Optional Name -> String
greet (Specific name) = "Hello, " ++ getName name
greet  Default        = "Hello"

newtype Age = Age { getAge :: Int } deriving (Num)

birthday :: Optional Age -> String
birthday (Specific age) = "You are " ++ show (getAge age) ++ " years old!"
birthday  Default       = "You are one year older!"

-- Madness
type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' e adv noun adj =
  e <> "! he said " <>
  adv <> " as he jumped into his car " <>
  noun <> " and drove off with his " <>
  adj <> " wife."

madlibbinBetter' :: Exclamation
                 -> Adverb
                 -> Noun
                 -> Adjective
                 -> String
madlibbinBetter' e adv noun adj = mconcat [ e, "! he said ", adv, " as he jummped into his car ", noun, " and drove off with his ", adj, " wife."]

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = undefined

instance Arbitrary Trivial where
    arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool

main :: IO ()
main = quickCheck (semigroupAssoc :: TrivialAssoc)