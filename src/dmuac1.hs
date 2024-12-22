module DMUAC1 where

myfact :: Integer -> Integer
myfact 0 = 1
myfact n = n * myfact (n-1)
bin2dec :: String -> Int
bin2dec = foldl (\x y -> if y=='1' then x*2 + 1 else x*2) 0
(+++) :: [a] -> [a] -> [a]
[] +++ ys = ys
(x:xs) +++ ys = x : (xs +++ ys)
mycopy :: [a] -> [a]
mycopy [] = []
mycopy (x:xs) = x : mycopy xs
-- myinverse :: [a] -> [a]
myinverse :: [(b1, b2)] -> [(b2, b1)]
myinverse [] = []
myinverse (x:xs) = (snd x, fst x) : myinverse xs
mymerge :: Ord a => [a] -> [a] -> [a]
mymerge xs [] = xs
mymerge [] xs = xs
mymerge a@(h:first) b@(c:second)
  | h <= c = h : mymerge first b
  | otherwise = c : mymerge a second
safeIndx :: Eq t => [t] -> t -> Maybe t
safeIndx [] _ = Nothing
safeIndx (x:xs) n
  | x == n = Just x
  | otherwise = safeIndx xs n
mylookup :: Eq t => t -> [(t, a)] -> Maybe a
mylookup _ [] = Nothing
mylookup n ((a,b):xs)
  | a == n = Just b
  | otherwise = mylookup n xs
mylookup2 :: (Eq a) => a -> [(a,b)] -> Maybe b
mylookup2 _ [] = Nothing
mylookup2 x ((a,b):xs) =
  if x == a then Just b else mylookup2 x xs
count1 :: Eq a => a -> [a] -> Int
count1 x = length . filter (x==)
count2 :: (Foldable t, Eq a, Num b) => a -> t a -> b
count2 needle haystack =
  foldl (\acc lelem -> if lelem == needle
                       then acc+1
                       else acc) 0 haystack
count3 :: (Foldable t, Eq a, Num b) => a -> t a -> b
count3 needle =
  foldl (\acc lelem ->
           if lelem == needle
           then acc+1
           else acc) 0
myremove :: Eq a => a -> [a] -> [a]
myremove _ [] = []
myremove e (x:xs)
  | e == x = myremove e xs
  | otherwise = x : myremove e xs
remAlt :: [a] -> [a]
remAlt (x:y:zs) = y : remAlt zs
remAlt x = []
fake :: [a] -> [a]
fake [] = []
fake (x:y:zs) = zs
fake [x] = [x]
myExtract :: [Maybe a] -> [a]
myExtract [] = []
myExtract ((Just a):xs) =  a : myExtract xs
myExtract (Nothing:xs) = myExtract xs
findInString :: String -> String -> Maybe Int
findInString [] _ = Just 1
findInString _ [] = Nothing
findInString (s1:sx1) (s2:sx2)
  | s1 == s2 = findInString sx1 sx2
  | otherwise = findInString (s1:sx1) sx2
findInString2 :: String -> String -> Maybe Int
findInString2 [] _ = Just 1
findInString2 _ [] = Nothing
findInString2 (s1:sx1) (s2:sx2)
  | s1 /= s2 = findInString2 (s1:sx1) sx2
  | otherwise = findInString2 sx1 sx2
