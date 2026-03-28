-- Redoing the hangman game.

-- Declare a State type consisting of (remaining chances, WordItself, UserFacingString)
data State = Constructor Int [Char] [Char]

getWordItself :: State -> [Char]
getWordItself (Constructor _ wordItself _) = wordItself 

-- given a char, an array, and an index,
-- replace the char at the index in the array with the supplied char.
-- return the new array.
replaceCharInString :: Char -> [Char] -> Int -> [Char]
replaceCharInString char (head:arr) 0 = char:arr
replaceCharInString char (head:arr) index = head : replaceCharInString char arr (index - 1)

-- check if an array has all dashes.
-- This is to terminate the game, 
-- as this means the WordItself is fully solved.
checkIfAllDashes :: [Char] -> Bool
checkIfAllDashes [char] = char == '-'
checkIfAllDashes (head:arr) = if head /= '-' 
                              then False 
                              else checkIfAllDashes arr 

-- check if a character is contained in a string.
-- if it is, then return a tuple with (True, index)
-- otherwise, return (False, Nothing)
-- the idea of passing an int 
-- as a counter to the method: https://stackoverflow.com/questions/40434698/how-to-find-occurrences-of-char-in-an-input-string-in-haskell
contains :: Char -> Int -> [Char] -> (Bool, Maybe Int)
contains _ _ [] = (False, Nothing)
contains char currIndex (head:arr) = if char == head
                                     then (True, Just currIndex)
                                     else contains char (currIndex + 1) arr

