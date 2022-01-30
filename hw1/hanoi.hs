
-- type synonym
type Peg = String
type Move = (Peg, Peg)


-- To move n discs (stacked in increasing size) from peg a to peg b
-- using peg c as temporary storage,
-- 1. move n − 1 discs from a to c using b as temporary storage
-- 2. move the top disc from a to b
-- 3. move n − 1 discs from c to b using a as temporary storage.
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n a b c
  | n == 0 = []
  | n == 1 = [(a, b)]
  | otherwise = hanoi (n-1) a c b ++ [(a, b)] ++ hanoi (n-1) c b a


countMoves :: [Move] -> Integer
countMoves [] = 0
countMoves (_:xs) = 1 + countMoves xs
