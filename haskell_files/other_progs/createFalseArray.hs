createFalseTupleArray :: [Char] -> [(Char, Bool)]
createFalseTupleArray [] = []
createFalseTupleArray (y:ys) = [(y, False)] ++ createFalseTupleArray (ys)