import Data.Maybe

-- Leetcode 1: Two Sum: given a list and a target int, return indices of the two numbers s.t they equal the target int
twoSum :: [Int] -> Int -> (Int, Int)
twoSum list target = twoSumMap (transformListToMap list) target

twoSumMap :: NMap Int Int -> Int -> (Int, Int)
twoSumMap (Cons (k, v) nmap) target = if (checkValueInMap (target - v) nmap)
                                      then (k, (fromJust (getKeyFromValue (target - v) nmap))) 
                                      else (twoSumMap nmap target)


-- map implementation; not a hashmap, just tuples put together, each tuple is (key, value)
data NMap k v = Nil | Cons (k, v) (NMap k v)

showMap :: (Show k, Show v) => NMap k v -> String
showMap Nil = "[]"
showMap (Cons (k, v) nmap) = ("[" ++ (showMapActual (Cons (k, v) nmap)) ++ "]")

showMapActual :: (Show k, Show v) => NMap k v -> String
showMapActual Nil = ""
showMapActual (Cons (k, v) nmap) = "(" ++ (show k) ++ "," ++ (show v) ++ ")" ++ "," ++ (showMapActual nmap)

checkKeyInMap :: (Eq k) => k -> NMap k v -> Bool
checkKeyInMap key nmap = case nmap of
    Nil -> False
    Cons (k, v) restOfMap -> if key == k then True else (checkKeyInMap key restOfMap)

checkValueInMap :: (Eq v) => v -> NMap k v -> Bool
checkValueInMap value nmap = case nmap of
    Nil -> False
    Cons (k, v) restOfMap -> if v == value then True else (checkValueInMap value restOfMap)

getKeyFromValue :: (Eq v) => v -> NMap k v -> Maybe k
getKeyFromValue value map = case map of
    Nil -> Nothing
    Cons (k, v) nmap -> if v == value then Just k else (getKeyFromValue value nmap)

getMapValue :: (Eq k) => k -> NMap k v -> Maybe v
getMapValue key map = case map of
    Nil -> Nothing
    Cons (k, v) nmap -> if key == k then Just v else (getMapValue key nmap)

addToMap :: k -> v -> NMap k v -> NMap k v
addToMap k v map = Cons (k, v) (map)

transformListToMap :: [a] -> NMap Int a
transformListToMap list = listToMapActual list 0

listToMapActual :: [a] -> Int -> NMap Int a
listToMapActual list index = case list of 
    [] -> Nil
    (x:xs) -> Cons (index, x) (listToMapActual xs (index + 1))
