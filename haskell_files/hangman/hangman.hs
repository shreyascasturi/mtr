import Data.List
import Data.Maybe
import System.IO

checkIfCharIsInString :: Char -> [Char] -> Bool
checkIfCharIsInString _ [] = False
checkIfCharIsInString x [y] = if x == y then True else False
checkIfCharIsInString x (y:ys) = if x == y then True else (checkIfCharIsInString x ys)

indexOfChar :: Char -> [Char]  -> Maybe Int
indexOfChar _ []  = Nothing
indexOfChar y [x] = if y == x then Just 0 else Nothing 
indexOfChar y (x:xs) = if y == x 
                       then Just 0 
                       else 
                        if (isNothing (indexOfChar y xs))
                        then Nothing
                        else Just (1 + fromMaybe 0 (indexOfChar y xs))


-- for a given index, replace the character at that index with a dash 
replaceCharAtIndexWithChar :: Int -> Char -> [Char] -> [Char]
replaceCharAtIndexWithChar 0 _ [] = []
replaceCharAtIndexWithChar index replaceChar (y:ys) = if index == 0 
                                                      then [replaceChar] ++ ys 
                                                      else [y] ++ replaceCharAtIndexWithChar (index - 1) replaceChar ys

-- this will be the "visualization" array, starting with all dashes and revealing the word.
createCharOfDashes :: Int -> [Char]
createCharOfDashes 0 = []
createCharOfDashes x = ['-'] ++ (createCharOfDashes (x - 1))

-- tryGuess takes a tuple (the character to guess, secret/vis string, real string, number of remaining chances)
-- returns a tuple (updated vis string, real string, updated number of remaining chances)
tryGuess :: Char -> [Char] -> [Char] -> Int -> ([Char], [Char], Int)
tryGuess guessChar visString realString remainingChances = if (checkIfCharIsInString guessChar realString) 
                                                           then ((replaceCharAtIndexWithChar (fromJust (indexOfChar guessChar realString)) guessChar visString), (replaceCharAtIndexWithChar (fromJust (indexOfChar guessChar realString)) '-' realString), remainingChances)
                                                           else (visString, realString, (remainingChances - 1))

firstElemOfTuple :: (a, b, c) -> a
firstElemOfTuple (a, _, _) = a

secondElemOfTuple :: (a, b, c) -> b
secondElemOfTuple (_, b, _) = b

thirdElemOfTuple :: (a, b, c) -> c
thirdElemOfTuple (_, _, c) = c

hasAllDashes :: [Char] -> Bool
hasAllDashes [] = False
hasAllDashes [x] = if x == '-' then True else False
hasAllDashes (y:ys) = if y == '-' then (hasAllDashes ys) else False

printTuple :: [Char] -> Int -> IO()
printTuple visString remGuesses = do 
    putStrLn ("(vis string: " ++ visString ++ ", remGuesses: " ++ (show remGuesses) ++ ")")

askForGuess :: [Char] -> [Char] -> Int -> IO()
askForGuess visString realString remChances = do
                                            putStrLn "please enter a character: "
                                            guessChar <- getChar
                                            putStrLn ("character entered was: " ++ (show guessChar))
                                            let newState = tryGuess guessChar visString realString remChances
                                            printTuple (firstElemOfTuple newState) (thirdElemOfTuple newState)
                                            if hasAllDashes (secondElemOfTuple newState) 
                                            then putStrLn "solved hangman!"
                                            else if thirdElemOfTuple newState == 0 
                                                 then putStrLn "you failed" 
                                                 else askForGuess (firstElemOfTuple newState) (secondElemOfTuple newState) (thirdElemOfTuple newState)
main :: IO ()
main = do
    putStrLn "please enter a word: "
    secretWord <- getLine 
    let lengthOfWord = (length (secretWord))
    let visString = (createCharOfDashes lengthOfWord)
    let numOfGuesses = 5
    askForGuess visString secretWord numOfGuesses