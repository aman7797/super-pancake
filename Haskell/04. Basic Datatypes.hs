data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood Woot = Blah

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse(x)

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f a b = ((snd(a),snd(b)),(fst(a),fst(b)))