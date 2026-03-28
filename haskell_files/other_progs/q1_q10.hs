-- Problem 1: Find the last element of a list
-- We'll use Maybe a this time around.
myLast :: [a] -> Maybe a
myLast [] = Nothing
myLast [x] = Just x
myLast (x:xs) = myLast xs

-- given basic solution 
myLast' :: [a] -> a
myLast' [] = error "No end for empty lists!"
myLast' [x] = x
myLast'(_:xs) = myLast' xs

-- using foldr1, foldr without basecase
-- foldr1 :: (a -> b -> a)