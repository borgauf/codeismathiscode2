module NUMBERS1 where

uns1 list1 list2 = (length list1) - (length list2)
unsSub2 :: [a] -> [a] -> [a]
unsSub2 l1x l2x | null l1x = l2x
                | null l2x = l1x
unsSub2 (l1:l1x) (l2:l2x) = unsSub2 l1x l2x
-- unsSub3 :: [a] -> [a] -> [a]
unsSub3 l1x l2x | null l1x = (map negate l2x)
                | null l2x = l1x
unsSub3 (l1:l1x) (l2:l2x) = unsSub3 l1x l2x
list1 = [1,1,1,1]
list2 = [-1,1,1,1,1]
uns2 list1 list2 = list1 ++ list2

primeEnum n | (n < 11) && (n > 0) = case (n) of
                          1  -> 2
                          2  -> 3
                          3  -> 5
                          4  -> 7
                          5  -> 11
                          6  -> 13
                          7  -> 17
                          8  -> 19
                          9  -> 23
                          10 -> 29
            | otherwise = error "We only know the first ten primes."
            
data Color = Red | Yellow | Blue | Green deriving (Show,Read)
instance Eq Color where
  Red == Red = True      -- could also be (==) Red Red = True
  Yellow == Yellow = True
  Blue == Blue = True
  Green == Green = True
  _ == _ = False         -- anything getting to this point must be false
instance Ord Color where
  compare Red Red = EQ
  compare Red _ = GT
  compare _ Red = LT
  compare Yellow Yellow = EQ
  compare Yellow _ = GT
  compare _ Yellow = LT
  compare Blue Blue = EQ
  compare Blue _ = GT
  compare _ Blue = LT
  compare Green Green = EQ    
data Color2 = Green2 | Blue2 | Yellow2 | Red2 deriving (Show,Read,Eq,Ord)
data StreetShops a = Grant a | Lee a | Lincoln a deriving (Show,Read)
