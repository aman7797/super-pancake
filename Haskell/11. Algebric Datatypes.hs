{-# LANGUAGE FlexibleInstances #-}

import Data.Char

class TooMany a where
  tooMany :: a -> Bool

instance TooMany (Int, String) where
  tooMany (n,_) = n > 42
  
-- Why condition? as instance return type is Bool 
instance TooMany (Int, Int) where
  tooMany (n,m) = (n + m) > 4

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany (x + y)


data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Price = Price Integer deriving (Eq, Show)
data Vehicle = Car Manufacturer Price | Plane Airline deriving (Eq, Show)

data Industry = AirlineType Airline | ManufacturerType Manufacturer deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars input = map isCar input

areCars' :: [Vehicle] -> [Bool]
areCars' [] = []
areCars' (x:xa) = isCar x : areCars' xa

getManu :: Vehicle -> Manufacturer
getManu (Car manufacturer _) = manufacturer
getManu (Car _ _) = error "Unknown Manufacturer"

getManu' :: Vehicle -> Maybe Manufacturer
getManu' (Car manufacturer _) = Just $ manufacturer
getManu' (Car _ _) = Nothing

getManuIndustry :: Vehicle -> Industry
getManuIndustry (Car manufacturer _) = ManufacturerType manufacturer
getManuIndustry (Plane airline) = AirlineType airline

data Example = MakeExample deriving Show

data Example' = MakeExample' Int deriving Show


data OperatingSystem = GnuPlusLinux | OpenBSDPlusNevermindJustBSDStill | Mac | Windows deriving (Eq, Show)

data ProgrammingLanguage = Haskell | Agda | Idris | PureScript deriving (Eq, Show)

data Programmer = Programmer { os :: OperatingSystem
                             , lang :: ProgrammingLanguage }
                  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer os lang | os <- allOperatingSystems, lang <- allLanguages]

data Quantum =
    Yes
  | No
  | Both
  deriving (Eq, Show)

convert1 :: Quantum -> Bool
convert1 _ = True

convert2 :: Quantum -> Bool
convert2 Yes = True
convert2 _   = False

convert3 :: Quantum -> Bool
convert3 No = True
convert3 _  = False

convert4 :: Quantum -> Bool
convert4 Both = True
convert4 _    = False

convert5 :: Quantum -> Bool
convert5 Yes = False
convert5 _   = True

convert6 :: Quantum -> Bool
convert6 No = False
convert6 _  = True

convert7 :: Quantum -> Bool
convert7 Both = False
convert7 _    = True

convert8 :: Quantum -> Bool
convert8 _ = False

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: BinaryTree Integer
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

mapOkay :: IO ()
mapOkay =
  if mapTree (+1) testTree' == mapExpected
  then print "yup okay!"
  else error "test failed!"

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = [a] ++ (preorder left) ++ (preorder right)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = (inorder left) ++ [a] ++ (inorder right)

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = (postorder left) ++ (postorder right) ++ [a]

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
    if preorder testTree == [2, 1, 3]
    then putStrLn "Preorder fine!"
    else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
    if inorder testTree == [1, 2, 3]
    then putStrLn "Inorder fine!"
    else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
    if postorder testTree == [1, 3, 2]
    then putStrLn "Postorder fine!"
    else putStrLn "postorder failed check"
  
testFoldTree :: IO ()
testFoldTree =
  if foldTree max 2 testTree' == 4
    then putStrLn "Fold Tree fine!"
    else putStrLn "Fold Tree failed"

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ input Leaf = input
foldTree f input bt = foldr f input $ postorder bt

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf _ [] = False
isSubsequenceOf [] _ = True
isSubsequenceOf firstInput@(x:xa) secondInput@(y:ya)
  | x == y = isSubsequenceOf xa secondInput
  | otherwise = isSubsequenceOf firstInput ya

capitalizeWords :: String -> [(String, String)]
capitalizeWords = map capitalizeWord' . words
  where
    capitalizeWord' :: String -> (String, String)
    capitalizeWord' []          = ([],[])
    capitalizeWord' word@(w:ws) = (word, (toUpper w):ws)

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xa)= (toUpper x) : xa

capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph input = concat $ map capitalizeWord $ myWords input 

-- output ["aman","lalpuria"]
-- can retrive using map
myWords :: [Char] -> [[Char]]
myWords input
    | input == [] = []
    | otherwise = (takeWhile (/=' ') input ++ " "):(myWords $ (dropWhile (==' ') . dropWhile (/=' ')) input)

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder
  testFoldTree

data Expr = Lit Integer | Add Expr Expr deriving Show

eval :: Expr -> Integer
eval (Lit a) = a
eval (Add a b) = (+) (eval a) (eval b)

printExpr :: Expr -> String
printExpr (Lit a) = show a      -- show to convert int to string
printExpr (Add a b) = printExpr a ++ "+" ++ printExpr b