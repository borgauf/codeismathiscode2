module RECURSION1 where


subdivq :: Integer -> Integer -> Integer
subdivq n d | n <= 0 = 0
           | otherwise = 1 + subdivq (n - d) d
