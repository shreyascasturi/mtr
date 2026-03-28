import Data.List
data Nat = Zero | Succ Nat

natToInt :: Nat -> Int
natToInt Zero = 0
natToInt (Succ y) = 1 + (natToInt y)

natToList :: Nat -> [Int]
natToList Zero = []
natToList (Succ y) = 1:(natToList y)

fold' :: (a -> b -> b) -> b -> [a] -> b
fold' f acc [] = acc
fold' f acc (x:xz) = (fold' f (f x acc) xz)

natToInt' :: Nat -> Int
natToInt' Zero = 0
natToInt' z = (fold' (+) 0 (natToList z))

convListAToB :: [a] -> (a -> b) -> [b]
convListAToB [] f = []
convListAToB (x:xz) f = (f x):(convListAToB xz f)

charToInt :: Char -> Int
