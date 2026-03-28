-- right associative fold. Base case that returns a value. Recursive case
-- takes the first element of the list and combines it with the rest of the folded list.
-- combining function takes in two inputs
myfoldr :: (a -> b -> b) -> b -> [a] -> b

-- so here, we have 3 arguments to myfolder:
-- 1. the function that takes in two args of type a, b, respectively  and produces a value of b.
-- 2. a base value of type b
-- 3. a list whose elements are type a
-- 4. the function will return a value of type b.

-- given an empty list, doesn't matter what func you have, just give the base val.
myfoldr _ initValue [] = initValue

-- so, we have a function f: f(a, b), an init value of type b, and a list of type a values.
-- we want to get, overall, a value of type b. So we must use the initValue.
-- we need to recurse over the list, so we need the initValue and the x.
myfoldr f initValue (x:xs) = f x (myfoldr f initValue xs)

-- notice that this would look, like, on a list of [a, b, c]
myfoldr f initValue [a1, a2, a3] = f a1 (myfoldr f initValue [a2, a3]) 
myfoldr f initValue [a2, a3] = f a2 (myfoldr f initValue [a3])
myfoldr f initValue

-- as an example, myfoldr (+) 0 [2, 1, 5, 2] = + (2) (myfoldr (+) 0 [1, 5, 2])
(2 + (1 + (5 + (2))))

-- left associative fold is: ((((2) + 1) + 5) + 2)
-- foldl :: (func) -> b -> [a] -> b
-- foldl :: (b -> a -> b) -> b -> [a] -> b
