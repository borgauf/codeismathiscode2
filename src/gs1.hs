module GS1 where


crossMult = \a b d -> ((a * d) / b) -- a/b = x/d ... solve for unknown
  
crossMult2 :: Integer -> Integer -> Integer -> Integer  
crossMult2 = \a b d -> ((a * d) `div` b)
