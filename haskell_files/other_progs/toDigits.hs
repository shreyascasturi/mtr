toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits n = if n <= 0 then [] else (toDigits (n `div` 10)) ++ [(n `mod` 10)]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [(2 * x)]
doubleEveryOther (x:(y:ys)) = (2*x) : (y : (doubleEveryOther ys))

detNumOfDigits :: Integer -> Integer
detNumOfDigits 0 = 0
detNumOfDigits x = 1 + (detNumOfDigits (x `div` 10))

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) = if ((detNumOfDigits x) >= 2) then (sumDigits (toDigits x)) + (sumDigits xs) else x + (sumDigits xs)
