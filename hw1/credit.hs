toDigits :: Integer -> [Integer]
toDigits n
  | n <= 0 = []
  | otherwise = toDigits (n `div` 10) ++ [n `mod` 10]


-- helper
reverseList :: [Integer] -> [Integer]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]  -- said to be slow, O(n)


toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverseList (toDigits n)


-- helper: this function doubles from the first element
doubleEveryOtherRev :: [Integer] -> [Integer]
doubleEveryOtherRev [] = []
doubleEveryOtherRev (x:[]) = [x]
doubleEveryOtherRev (x:y:xs) = x:(y*2):doubleEveryOtherRev xs


-- this function doubles from the last element
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = reverseList (doubleEveryOtherRev (reverseList xs))


-- assume no negative value
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:[])
  | x < 10 = x  -- can't divide, no further recursion
  | otherwise = sumDigits (toDigits x)
sumDigits (x:xs) = sumDigits (toDigits x) + sumDigits xs


validate :: Integer -> Bool
validate n = sumDigits (doubleEveryOther (toDigits n)) `mod` 10 == 0
