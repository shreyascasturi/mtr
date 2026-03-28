isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome (x:xs) = if (x /= last xs) 
    then False 
    else isPalindrome (init (tail (x:xs)))

pack :: [Char] -> [[Char]]
pack [] = []
pack [a] = [[a]]
pack (x:xs) = if (x /= head xs) 
    then [[x]] ++ (pack (xs)) 
    else []
-- xyyz -> [['x'], ['y','y'], ['z']]
-- pack ('x', ['y', 'y', 'z']) -> 'x', 'y', ['y', 'z'] -> 'x', 'y', 'y', ['z']
-- yz = [['y'], ['z']]