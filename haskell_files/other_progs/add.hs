fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

data Shape = Circle Float Float Float | Rectangle Float Float Float Float
testShape = Circle .5 1.2 1.4

printCircCoords :: Shape -> IO ()
printCircCoords x y z = putStrLn ""