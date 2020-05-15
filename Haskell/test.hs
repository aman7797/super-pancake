import Data.Monoid
import Data.Maybe

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

newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

instance Monoid (First' a) where
    mempty = First' { getFirst' = Nothing }
    mappend (First' a) (First' a')= First' { getFirst' = mappend a a'}

firstMappend :: First' a -> First' a -> First' a
firstMappend a b = mappend a b