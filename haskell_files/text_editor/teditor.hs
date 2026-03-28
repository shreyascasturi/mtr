addBack :: [a] -> a -> [a]
addBack [] x = [x]
addBack (x:xs) y = x:(addBack xs y)
