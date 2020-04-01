sayhello :: String -> IO()
sayhello inputString = putStrLn("Hello," ++ inputString ++ "!")

square :: Integer -> Integer
square input = input * input

pieMultiplication :: (Float, Float) -> Float
pieMultiplication (input1, input2) = pi * (input1 * input2)

headCode1 = x
    where x = 5

headCode2 = x * x
    where x = 5

headCode3 = x * y
    where x = 5
          y = 6
        
headCode4 = x + 3
    where x = 3
          y = 1000

mainCode1 = x * 3 + y
    where x = 3
          y = 1000

mainCode2 = x * 5
    where y = 10
          x = 10 * 5 + y
        
mainCode3 = z / x + y
    where x = 7
          y = negate x
          z = y * 10

waxOn = x * 5
    where x = y ^ 2
          y = z + 8
          z = 7

triple :: Integer -> Integer
triple x = x * 3

waxOff x = triple x

main = do
    print(headCode1)
    print(headCode2)
    print(headCode3)
    print(headCode4)
    print(mainCode1)
    print(mainCode2)
    print(mainCode3)