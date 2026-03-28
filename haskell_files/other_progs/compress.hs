compress :: String -> String
compress [] = ""
compress [x] = [x]
compress (x:xs) = if (x /= (head xs)) 
    then [x] ++ (compress xs) 
    else (compress xs)

pack :: [Char] -> [[Char]]
pack [] = [[]]
pack [a] = [[a]]
pack (x:xs) = if (x == head xs) 
    then [[x] ++ (head (pack xs))] ++ (tail (pack xs))
    else [[x]] ++ (pack xs)

-- ['x', 'x', 'y', 'z'] 'x' == 'x', then [['x'] ++ (head (pack ['x', 'y', 'z']))]
-- ['x', 'x', 'y'] -> ["xx", "y"]

-- pack ['x', 'y', 'z'] -> 'x' != 'y', then: [['x']] ++ 
-- incrementCountOfChars :: (Int, Char) -> (Int, Char)
-- incrementCountOfChars (x, y) = ((x + 1), y)

-- pack :: [Char] -> [[Char]] -- "aaab" = ['a', 'a', 'a', 'b'] -> ["aa", "b"]
-- pack [] = []               -- "abb" = ['a', 'b', 'b'] -> ["a", "bb"]
-- pack [x] = [[x]]
-- pack (x:xs) = if (x /= head xs) then -- [[Char]] ++ [[Char]]
--     [[x]] ++ (pack xs)
--     else [[x] ++ [(head xs)]] ++ (pack (tail xs))

-- pack "yyyy" -> ['y', 'y', 'y', 'y'] -> 'y' == 'y', so: "yy" ++ 
-- "ayyyybbb" -> ["a", "yyyy", "bbb"]
-- pack "ayyyy" = pack 'a':"yyyy" -> 'a' /= 'y', so [['a'] + pack "yyyy"]
-- encode :: String -> [(Int, Char)]
-- encode [] = [(0, '')]
-- encode [x] = [(1, x)]
-- -- what am i doing here?
-- -- "abcc" -> 'a':['a'] -> [(1, 'a'), (1, 'b'), (3, 'c')]
-- -- "abccc" -> 'a':['b': ['c': ['c': ['c']]]]]
-- encode (x:xs) = if (x /= (head xs))
--     then [(1, x)] ++ (encode xs)
--     else [(1, x)]

--     --if (x /= (head xs)) 
--     --then [(1, x)] ++ (encode xs) 
--     --else [()]