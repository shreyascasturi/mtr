-- toDigits: given an integer, return the digits of the number
-- as a list.
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x = if x < 0 then [] else (toDigits (x `div` 10)) ++ [(x `mod` 10)]

-- toDigitsRev: given an integer, return the digits of the number as a list, reversed
toDigitsRev :: Integer -> [Integer]
toDigitsRev x = reverse (toDigits x)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther x = reverse (reverse ())