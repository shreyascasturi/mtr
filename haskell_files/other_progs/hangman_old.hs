removeFromList :: Char -> Int -> [Char] -> (Int, [Char])
removeFromList _ [] = []
removeFromList x [y] = if (x == y) then [] else [y]
removeFromList x (y:ys) = if (x == y) then ys else [y] ++ (removeFromList x (ys))

isEmpty :: [Char] -> Bool 
isEmpty [] = True
isEmpty (y:ys) = False

x = 1
printX
-- ['b','o','o','s','t'] -> [x,x,x,x,x] -> with each correct guess -> [y, y, y, y, y]... 
-- I must make a method that takes in a char, both arrays, and then checks if the letter is in the array.
-- True if letter is in array and has not been found already
-- False if letter is not in array or letter has already been found. 