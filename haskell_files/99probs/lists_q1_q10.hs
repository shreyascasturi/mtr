
-- Optional/others

-- Get the first element of a list
head' :: [a] -> Maybe a
head' x = case x of 
    [] -> Nothing
    (y:ys) -> Just y

-- Return list sans first element
tail' :: [a] -> [a]
tail' (x:xs) = xs

-- Return all elements of list except the last one
init' :: [a] -> [a]
init' x = case x of 
    [] -> []
    [x] -> []
    (y:ys) -> y:(init' ys)

-- Problem 1: Find the last element of a list
myLast :: [a] -> Maybe a
myLast x = case x of
    [] -> Nothing
    (y:ys) -> case ys of
            [] -> Just y
            (z:zs) -> myLast (z:zs)

myLast' :: [a] -> Maybe a
myLast' [] = Nothing
myLast' [x] = Just x
myLast' (x:xs) = myLast' xs

-- Problem 2: Find the last but one or second-last element of a list
myButLast :: [a] -> Maybe a
myButLast [] = Nothing
myButLast [x] = Nothing
myButLast (x:y:ys) = case ys of
    [] -> Just x
    (z:zs) -> myButLast (y:ys)

-- Problem 2: Using init, tail, head, myLast etc...
-- Fails with a 2 element list.
-- myButLast' :: [a] -> Maybe a
-- myButLast' [] = Nothing
-- myButLast' [x] = Nothing
-- myButLast' (x:xs) = myLast (init' (tail' (x:xs)))

-- Problem 3: Find the k'th element of a list. It's 1-indexed
elementAt :: [a] -> Int -> Maybe a
elementAt list 0 = Nothing
elementAt list 1 = head' list
elementAt [] n = Nothing
elementAt (x:xs) n = elementAt xs (n - 1)
    
-- Problem 4: Find the number of elements
myLength :: [a] -> Int
myLength list = case list of
    [] -> 0
    (x:xs) -> 1 + (myLength xs)

-- Problem 5: Reverse a list
myReverse :: [a] -> [a]
myReverse list = case list of
    [] -> []
    (x:xs) -> (myReverse xs) ++ [x]


            
