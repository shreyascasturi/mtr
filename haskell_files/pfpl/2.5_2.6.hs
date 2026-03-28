data BinNum = Zero | TwiceBinNum BinNum | TwicePlusOne BinNum

binToInt :: BinNum -> Int
binToInt x = case x of 
    Zero -> 0
    TwiceBinNum y -> 2 * (binToInt y)
    TwicePlusOne z -> (2 * (binToInt z)) + 1

-- add two bin numbers
-- addTwoBin x, y.
-- analyze by cases.
-- Case 1: x zero, y zero
-- Case 2a: x zero, y non-zero (TwiceBinNum)
-- Case 2b: x zero, y non-zero (TwicePlusOne)
-- Case 3a: x non-zero (TwiceBinNum), y zero
-- Case 3b: x non-zero (TwicePlusOne), y zero
-- Case 4a - 4d: x non-zero , y non-zero (handle all constructors)
-- 
addTwoBin :: BinNum -> (BinNum -> BinNum)
addTwoBin x = case x of
    Zero -> (\y -> case y of
                        Zero -> Zero
                        TwiceBinNum z -> y
                        TwicePlusOne z -> y)
    TwiceBinNum a -> (\y -> case y of 
                            Zero -> x
                            TwiceBinNum z -> TwiceBinNum (addTwoBin a z)
                            TwicePlusOne z -> TwicePlusOne (addTwoBin a z))
    TwicePlusOne a -> (\y -> case y of
                            Zero -> x
                            TwiceBinNum z -> TwicePlusOne (addTwoBin a z)
                            TwicePlusOne z -> TwiceBinNum (addTwoBin (addTwoBin a z) (TwicePlusOne Zero)))

addTwoBin' :: BinNum -> BinNum -> BinNum
addTwoBin' x y = case x of
                    Zero -> y
                    TwiceBinNum a -> (
                                        case y of
                                            Zero -> x
                                            TwiceBinNum b -> TwiceBinNum (addTwoBin' a b)
                                            TwicePlusOne b -> TwicePlusOne (addTwoBin' a b)
                                    )
                    TwicePlusOne a -> (
                                        case y of
                                            Zero -> x
                                            TwiceBinNum b -> TwicePlusOne (addTwoBin' a b)
                                            TwicePlusOne b -> TwiceBinNum (addTwoBin' (addTwoBin' a b) (TwicePlusOne Zero))
                                    )

addTwoBin'' :: BinNum -> BinNum -> BinNum
addTwoBin'' Zero Zero = Zero
addTwoBin'' Zero y = y
addTwoBin'' x Zero = x
addTwoBin'' (TwiceBinNum a) (TwiceBinNum b) = TwiceBinNum (addTwoBin'' a b)
addTwoBin'' (TwiceBinNum a) (TwicePlusOne b) = TwicePlusOne (addTwoBin'' a b)
addTwoBin'' (TwicePlusOne a) (TwiceBinNum b) = TwicePlusOne (addTwoBin'' a b)
addTwoBin'' (TwicePlusOne a) (TwicePlusOne b) = TwiceBinNum (addTwoBin'' (addTwoBin'' a b) (TwicePlusOne Zero))