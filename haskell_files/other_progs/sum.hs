sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + (sumList xs)

mul' :: Int -> Int -> Int 
mul' _ 0 = 0
mul' 0 _ = 0
mul' x y = (x * y)

mul'' :: [Int] -> Int
mul'' [] = 0
mul'' (x:xs) = foldr (mul') 1 (x:xs)

-- determining if int is even or not
isEven :: Int -> Bool
isEven x = ((x `mod` 2) == 0)

-- given a list of ints, get list of bools for evenness
-- naive solution: iterate from the left, run isEven on int,
-- and then run isEvenList on rest of list, and concatenate.
isEvenList :: [Int] -> [Bool]
isEvenList [] = [False]
isEvenList [x] = [isEven x]
isEvenList (x:xs) = [isEven x] ++ (isEvenList xs)

-- for foldr -> given an int and list of bools, 
-- add isEven int
-- to bool list.
-- ex: [2, 7]
-- iES 2 [] -> [True]
-- iES 7 [True] -> [False, True]
-- this is incorrect. Foldr is right-associative...
-- so really, for [2, 7], we'd have:
-- iEL [2, 7] -> 2 iES (7 iES [])
-- i.e, -> iES 2 (iES 7 []) -> iES 2 ([False]) -> [True, False]
isEvenSingleton :: Int -> [Bool] -> [Bool]
isEvenSingleton x [] = [(isEven x)]
isEvenSingleton x [y] = [(isEven x)] ++ [y]
isEvenSingleton x (y:ys) = [(isEven x)] ++ (y:ys)

-- isEvenList with foldr and isEvenSingleton
isEvenList' :: [Int] -> [Bool]
isEvenList' [] = [False]
isEvenList' (x:xs) = foldr (isEvenSingleton) [] (x:xs)

isEven'' :: [Int] -> [Bool]
isEven'' [] = []
isEven'' x = map (isEven) x