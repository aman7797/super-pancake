main :: IO()
main = do 
    putStrLn("Aman Lalpuria")

area d = pi * (r * r)
    where r = d/2

addVariable input = concat[input,"!"]

valueat5 input = head $ drop4 input

drop4 :: String -> [Char]
drop4 input = drop 4 input

stringafter9 input = drop 9 input

get3 :: String -> Char
get3 input = head $ drop 2 input

getValue :: Int -> Char
getValue position = head $ drop position "Curry is awesome"

lengthStr :: String -> Int
lengthStr input = length input

rvrs :: String
rvrs = third ++ " " ++ second ++ " " ++ first
    
input :: String          
input = "Curry is awesome"

first :: String
first = take 5 input

second :: String
second = take 2 $ drop 6 input

third :: String
third = drop 9 input