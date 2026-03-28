-- 3.1 combinators are inductively defined by
-- 1. no premises -> S comb
-- 2. no premises -> K comb
-- 3. a1 comb, a2 comb -> ap(a1; a2) comb
-- Question: Give an inductive definition of the length of the combinator
-- defined as the number of occurrences of S and K within it.

data Comb = S | K | Ap Comb Comb

lenComb :: Comb -> Int
lenComb comb = case comb of 
                    S -> 1
                    K -> 1
                    Ap comb1 comb2 -> (lenComb comb1) + (lenComb comb2)


-- when your type has no base case and is strictly inductive
-- this type has no elements whatsoever.
data PNat = PSucc PNat

PtoB :: PNat -> a
PtoB x = case x of
            PSucc n = (PtoB n)



