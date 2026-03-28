-- Implementation of basic list methods, assuming list exists
length' :: [a] -> Int
length' xs = case xs of
    [] -> 0
    (x:xs) -> 1 + length' xs

-- Get first element of list
head' :: [a] -> Maybe a
head' xs = case xs of
    [] -> Nothing
    x:xs -> Just x

-- Get last element of list
last' :: [a] -> Maybe a
last' [] = Nothing
last' [x] = Just x
last' (x:xs) = last' xs

-- get everything but the first element
tail' :: [a] -> [a]
tail' [] = []
tail' [a] = tail' []
tail' (x:xs) = xs 

-- get everything but the last element
init' :: [a] -> [a]
init' [] = []
init' [a] = init' []
init' (x:xs) = x:(init' xs)

get' :: Int -> [a] -> Maybe a
get' _ [] = Nothing
get' 0 (y:ys) = Just y
get' a (y:ys) = if a < 0 then Nothing else get' (a - 1) ys

-- Get a value out of a Maybe
justTransform :: Maybe a -> a
justTransform (Just a) = a
justTransform Nothing = undefined

-- reverse a list
reverse' :: [a] -> [a]
reverse' [] = []
reverse' [a] = [a]
reverse' (x:xs) = (justTransform (last' (x:xs))):(reverse' (init' (x:xs)))

-- given two lists, add them together
-- [1,2,3,4], [5] = reverse (5:[4,3,2,1])
-- [1,2,3,4,5], [6, 7, 8] 
concat' :: [a] -> [a] -> [a]
concat' [] [] = []
concat' [] b = b
concat' a [] = concat' ([]) (a)
concat' a [b] = reverse' (b:(reverse' a))
concat' a b = concat' (concat' (a) ([justTransform(head' (b))])) (tail' b) 


-- given a list, get an n-element sublist from the k-th index
-- getNSubsetFromK :: Int -> Int -> [a] -> [a]
-- getNSubsetFromK _ _ [] = []
-- getNSubsetFromK _ _ [a] = [a]
-- getNSubsetFromK n k (y:ys) =
--     if (n > (length' (y:ys))) then
--         []
--     else if (k <= 0) then
--         []
--     else if (k >= (length' (y:ys))) then
--         []
--     else
--         [(justTransform (get' k (y:ys)))] ++ (getNSubsetFromK (n - 1) (k + 1) ys)




--map' :: (a -> b) -> [a] -> [b]

-- given a list and an index, 
-- divide the list into two lists
-- after/at the index
splitList :: Int -> [a] -> ([a], [a])
splitList 0 a = ([justTransform(head' a)], (tail' a))
splitList n (y:ys) = 
    if (n >= ((length' (y:ys)) - 1))
        then ((y:ys), [])
    else if (n < 0) 
        then ([], (y:ys))
    else 
        ((concat' [y] (fst (splitList (n - 1) (ys)))), snd (splitList (n - 1) (ys)))

-- given a starting index, get the rest of the list
getSublistFromN :: Int -> [a] -> [a]
getSublistFromN 0 a = a
getSublistFromN _ [] = []
getSublistFromN n b = 
    if (n > length' (b) || (n < 0)) 
        then [] 
    else
        concat' [(justTransform (last' (fst (splitList n b))))] (snd (splitList n b))

-- given a starting index, ending index, and list,
-- get a sublist of [index .. end index - 1]
-- getSublist 2 4 [1,2,3,4,5,6] => [3,4]
-- getSublist 2 4 [1,2,3,4,5,6] 
    -- getSublist 0 2 [3,4,5,6]
getSublist :: Int -> Int -> [a] -> [a] 
getSublist 0 0 a = []
getSublist _ _ [] = []
getSublist 0 k a = fst (splitList (k - 1) a)  
getSublist n k (y:ys) =
    if (n < 0 || k < 0) then []
    else getSublist 0 (k - n) (getSublistFromN n (y:ys))

-- a = [1,2,3,4,5,6]
-- getSublist 0 4 -> [1,2,3]
-- getSublist 0 (length' a) a -> [1,2,3,4,5,6]
-- getSublist base -> we get the n-th element
-- getSublist n k a -> get n-th element... 
-- given a list, determine if its contents are palindrome
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome [a, b] = if a == b then True else False 
isPalindrome a = 
    if (justTransform(head' a) /= justTransform(last' a)) 
        then False
    else 
        isPalindrome (getSublist 1 ((length' a) - 1) a)


-- do a cons/uncons
uncons' :: [a] -> Maybe(a, [a])
uncons' x = case x of
    [] -> Nothing
    (x:xs) -> Just(x, xs)

-- non parameterized type
-- "data" <TypeName> = <ConstructorName> [List of Types]
data Task1 = 
    BasicTask1 String Int 
    | ComplexTask1 String Int Double 

a :: Task1
a = BasicTask1 "test" 90

-- how do we make task objects?
-- have expressions of that object type
-- DIFFERENT FROM FUNCTIONS!
assignment1 :: Task1
assignment1 = BasicTask1 "Do assignment 1" 60

-- what's the difference between writing
-- a constructor function and a direct cons
-- invocation (the former feels cleaerer...)
constructBasicTask :: String -> Int -> Task1
constructBasicTask a b = BasicTask1 a b 


complexTaskFirst :: Task1
complexTaskFirst = ComplexTask1 "make complex" 50 42.5

getFloatFromTask :: Task1 -> Maybe Double
getFloatFromTask task = case task of
    BasicTask1 _ _ -> Nothing 
    ComplexTask1 a b c -> Just c

--data PolymorphicTask a =
 --   BasicTaskPoly a 

-- Problem 8 - elimnate consecutive duplicates of list elements
compressList :: [a] -> [a]
compressList [] = []
compressList [a] = [a]
compressList (y:ys) 
 
 -- [1,1,2,3,3,3,4] -> newList = [1], oldList = [1,2,3,3,3,4]
 -- compressList [1,1,2,3,3,3,4]
 -- => concat (compressList [y])
-- 
-- assume we had a blank list
-- we check the first element and trivially add it
-- for the next elements
-- if the next element(s) are equivalent to the last
    -- element of the new list (i.e., equiv to last')
    -- then skip and do: concat newList (compressList ys)
    -- otherwise concat (concat newList [y]) (compressList ys)