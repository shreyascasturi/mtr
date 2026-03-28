-- snoc 5 [1, 2, 3] = [1, 2, 3, 5]
snoc :: a -> [a] -> [a]
snoc a [] = [a]
snoc a (y:ys) = y : (snoc a ys)

-- get last element of list
getLast :: [a] -> Maybe a 
getLast [] = Nothing
getLast [a] = Just a 
getLast (y:ys) = getLast ys

-- basic add oeprator
myappend :: [a] -> [a] -> [a]
myappend [] (y:ys) = (y:ys)
myappend (y:ys) [] = (y:ys)
myappend [x] [y] = x:[y]
myappend (x:xs) (y:ys) = x:(myappend xs (y:ys))

myreverse :: [a] -> [a]
myreverse [] = []
myreverse [x] = [x]
myreverse (y:ys) = myappend (myreverse ys) [y]


(+++) :: [a] -> [a] -> [a]
[] +++ b = b 
a +++ [] = a
[a] +++ (b:bs) = [] +++ bs 

-- [1, 2, 3, 4] +++ [5, 6, 7, 8]
-- [1,2,3,4] : [5] +++ bs