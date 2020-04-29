{-# LANGUAGE FlexibleInstances #-}

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

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder
  testFoldTree

newtype VKeyword  = VKeyword String deriving Show
newtype VPlain    = VPlain  { unVPlain :: String } deriving (Show, Eq)
newtype VCipher   = VCipher { unVCipher :: String } deriving Show

ceaserShift :: Int -> Char -> Char
ceaserShift i c
  | elem c ['0'..'9'] = shift (ord '0') (length ['0'..'9']) i c
  | elem c ['a'..'z'] = shift (ord 'a') (length ['a'..'z']) i c
  | elem c ['A'..'Z'] = shift (ord 'A') (length ['A'..'Z']) i c
  | otherwise         = c
  where
    shift :: Int -- Base Int
          -> Int -- Length of character set
          -> Int -- Right shift amount
          -> Char -- Source character to shift
          -> Char -- Output character
    shift b l i' c' = chr (b + (((ord c') - b) + (i' `mod` l)) `mod` l)
    
vEncode :: VKeyword -> VPlain -> VCipher
vEncode (VKeyword []) (VPlain plain)  = VCipher plain
vEncode (VKeyword key) (VPlain plain) = VCipher (vEncode' key plain)
  where
    vEncode' _      []     = []
    vEncode' []     plain' = vEncode' key plain'
    vEncode' (k:ks) (p:ps) = (ceaserShift (ord k) p):(vEncode' ks ps)

vDecode:: VKeyword -> VCipher -> VPlain
vDecode (VKeyword []) (VCipher cipher)  = VPlain cipher
vDecode (VKeyword key) (VCipher cipher) = VPlain (vEncode' key cipher)
  where
    vEncode' _      []     = []
    vEncode' []     cipher' = vEncode' key cipher'
    vEncode' (k:ks) (c:cs) = (ceaserShift (negate $ ord k) c):(vEncode' ks cs)
