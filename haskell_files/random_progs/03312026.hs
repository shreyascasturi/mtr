addOneToList :: [Int] -> [Int]
addOneToList [] = []
addOneToList (x:xs) = (x + 1):(addOneToList xs)

addOne :: Int -> Int
addOne x = x + 1

addOneToList' :: [Int] -> [Int]
addOneToList' [] = []
addOneToList' (x:xs) = (addOne x):(addOneToList' xs)

addOneToList'' :: [Int] -> [Int]
addOneToList'' [] = []
addOneToList'' y = map (+ 1) y

addOneToList''' :: [Int] -> [Int]
addOneToList''' [] = []
addOneToList''' (x:xs) = ((\y -> y + 1) x):(addOneToList''' xs)

modList :: [a] -> (a -> a) -> [a]
modList [] _ = []
modList (x:xs) f = map f (x:xs)

modList' :: [a] -> (a -> b) -> [b]
modList' [] _ = []
modList' (x:xs) f = (f x):(modList' xs f)

addOneAndSq :: Int -> Int
addOneAndSq x = let a = x + 1
                    f = \x -> x * x
                in (f a)

data TrashCan a = FullCan a | EmptyCan
instance Functor TrashCan where 
    fmap f (FullCan a) = FullCan (f a)
    fmap f (EmptyCan) = EmptyCan

emptyTrash :: TrashCan a -> Maybe a
emptyTrash tcan = 
    case tcan of
        EmptyCan -> Nothing
        FullCan a -> Just a