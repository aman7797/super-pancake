module Cipher where

import Data.Char

data Cipher = Encode | Decode deriving Show

encode :: Cipher -> Char -> Int -> Char
encode Encode input count 
    | elem input ['a'..'z'] = cipherIncr (ord 'a') count (length ['a'..'z']) input
    | elem input ['A'..'z'] = cipherIncr (ord 'A') count (length ['A'..'Z']) input
    | elem input ['0'..'9'] = cipherIncr (ord '0') count (length ['0'..'9']) input
    | otherwise = input
encode Decode input count
    | elem input ['a'..'z'] = cipherDecr (ord 'a') count (length ['a'..'z']) input
    | elem input ['A'..'z'] = cipherDecr (ord 'A') count (length ['A'..'Z']) input
    | elem input ['0'..'9'] = cipherDecr (ord '0') count (length ['0'..'9']) input
    | otherwise = input

cipherIncr :: Int -> Int -> Int -> Char -> Char
cipherIncr startCount count length variable = chr ( startCount + (((ord variable) - startCount) + (count `mod` length)) `mod` length)

cipherDecr :: Int -> Int -> Int -> Char -> Char
cipherDecr startCount count length variable = chr ( startCount + (((ord variable) - startCount) - (count `mod` length)) `mod` length)

cipher :: Cipher -> [Char] -> Int -> [Char]
cipher _ [] _ = []
cipher _ input 0 = input
cipher encryptOrDecrypt (x:xa) count = encode encryptOrDecrypt x count : cipher encryptOrDecrypt xa count


-- Chapter 11 Exercise

charPosition :: Char -> Int
charPosition character = position
    where 
        position = head output
        putStrLn ("Its Here")
        output = [n | (l, n) <- zip ['a'..'z'] [1..], l == character]

vigenèreCipher :: Cipher -> [Char] -> [Char] -> [Char]
vigenèreCipher _ [] _ = []
vigenèreCipher _ input [] = input
vigenèreCipher encryptOrDecrypt (x:xa) (y:ya) = encode encryptOrDecrypt x (charPosition y) : vigenèreCipher encryptOrDecrypt xa ya
