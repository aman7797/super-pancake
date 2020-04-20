{-# LANGUAGE OverloadedStrings #-}

module Greeting where

import Data.Monoid (mconcat)
import Data.Text.Lazy (Text)

data Language = English | Espanol
    deriving (Read)

greeting :: Language -> Text
greeting English = "Hello"
greeting Espanol = "Hola"

greet :: Text -> Language -> Text
greet name language =
    mconcat [greeting language, " ", name]
