numberFactorial :: Num a => a -> a
numberFactorial number = number * numberFactorial (number - 1)