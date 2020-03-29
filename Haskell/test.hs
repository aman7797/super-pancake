sayhello :: String -> IO()
sayhello inputString = putStrLn("Hello," ++ inputString ++ "!")

square :: Integer -> Integer
square input = input * input

pieMultiplication :: (Float, Float) -> Float
pieMultiplication (input1, input2) = pi * (input1 * input2)