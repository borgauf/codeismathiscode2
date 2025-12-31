{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-type-defaults #-}
module LRAFC1 where

infix 1 ==>

(==>) :: Bool -> Bool -> Bool
x ==> y = (not x) || y

infix 1 <=>

(<=>) :: Bool -> Bool -> Bool
x <=> y = x == y 

infixr 2 <+>

(<+>) :: Bool -> Bool -> Bool
x <+> y = x /= y 

testp :: Bool  
testp = True
testq :: Bool  
testq = False

formula1 :: Bool  
formula1 = (not testp) && (testp ==> testq) <=> not (testq && (not testp))

formula2 :: Bool -> Bool -> Bool  
formula2 p q = ((not p) && (p ==> q) <=> not (q && (not p)))

valid1 :: (Bool -> Bool) -> Bool
valid1 bf =  (bf True) && (bf False)

excluded_middle :: Bool -> Bool
excluded_middle p = p || not p

valid2 :: (Bool -> Bool -> Bool)  -> Bool
valid2 bf =   (bf True  True)  
           && (bf True  False) 
           && (bf False True) 
           && (bf False False)

form1 :: Bool -> Bool -> Bool  
form1 p q = p ==> (q ==> p)

form2 :: Bool -> Bool -> Bool  
form2 p q = (p ==> q) ==> p

valid3 :: (Bool -> Bool -> Bool -> Bool) -> Bool
valid3 bf = and [ bf p q r | p <- [True,False], 
                             q <- [True,False], 
                             r <- [True,False]] 

valid4 :: (Bool -> Bool -> Bool -> Bool -> Bool) -> Bool
valid4 bf = and [ bf p q r s | p <- [True,False], 
                               q <- [True,False], 
                               r <- [True,False], 
                               s <- [True,False]] 

logEquiv1 ::  (Bool -> Bool) -> (Bool -> Bool) -> Bool
logEquiv1 bf1 bf2 =  
    (bf1 True  <=> bf2 True) && (bf1 False <=> bf2 False) 

logEquiv2 :: (Bool -> Bool -> Bool) -> 
                    (Bool -> Bool -> Bool) -> Bool
logEquiv2 bf1 bf2 = 
  and [(bf1 p q) <=> (bf2 p q)  |  p <- [True,False], 
                                   q <- [True,False]]

logEquiv3 :: (Bool -> Bool -> Bool -> Bool) ->
                 (Bool -> Bool -> Bool -> Bool) -> Bool
logEquiv3 bf1 bf2 = 
  and [(bf1 p q r) <=> (bf2 p q r) |  p <- [True,False], 
                                      q <- [True,False], 
                                      r <- [True,False]]

formula3 :: p1 -> p2 -> p1
formula3 p _q = p -- formula3 p _ = p

formula4 :: Bool -> Bool -> Bool
formula4 p q = (p <+> q) <+> q

formula5 :: Bool -> Bool -> Bool  
formula5 p q = p <=> ((p <+> q) <+> q)

class TF p where 
  valid :: p -> Bool
  lequiv :: p -> p -> Bool

instance TF Bool
 where
  valid  = id
  lequiv f g = f == g

instance TF p => TF (Bool -> p)
 where
  valid f = valid (f True) && valid (f False)
  lequiv f g = (f True) `lequiv` (g True)
               && (f False) `lequiv` (g False)

test1, test2a, test2b, test3a, test3b, test4a, test4b, test4c,
  test5a, test5b, test6a, test6b, test7a, test7b, test8a,
  test8b, test9a, test9b :: Bool
test1  = lequiv id (\ p -> not (not p))
test2a = lequiv id (\ p -> p && p) 
test2b = lequiv id (\ p -> p || p) 
test3a = lequiv (\ p q -> p ==> q) (\ p q -> not p || q)
test3b = lequiv (\ p q -> not (p ==> q)) (\ p q -> p && not q)
test4a = lequiv (\ p q -> not p ==> not q) (\ p q -> q ==> p)
test4b = lequiv (\ p q -> p ==> not q) (\ p q -> q ==> not p)
test4c = lequiv (\ p q -> not p ==> q) (\ p q -> not q ==> p)
test5a = lequiv (\ p q -> p <=> q) 
                (\ p q -> (p ==> q) && (q ==> p))
test5b = lequiv (\ p q -> p <=> q) 
                (\ p q -> (p && q) || (not p && not q))
test6a = lequiv (\ p q -> p && q) (\ p q -> q && p)
test6b = lequiv (\ p q -> p || q) (\ p q -> q || p)
test7a = lequiv (\ p q -> not (p && q)) 
                (\ p q -> not p || not q)
test7b = lequiv (\ p q -> not (p || q)) 
                (\ p q -> not p && not q)
test8a = lequiv (\ p q r -> p && (q && r)) 
                (\ p q r -> (p && q) && r)
test8b = lequiv (\ p q r -> p || (q || r)) 
                (\ p q r -> (p || q) || r)
test9a = lequiv (\ p q r -> p && (q || r)) 
                (\ p q r -> (p && q) || (p && r))
test9b = lequiv (\ p q r ->  p || (q && r)) 
                (\ p q r -> (p || q) && (p || r))

square1 :: Integer -> Integer
square1 x = x^2 

square2 :: Integer -> Integer 
square2 = \ x -> x^2

m1 :: Integer -> Integer -> Integer 
m1 = \ x -> \ y -> x*y

m2 :: Integer -> Integer -> Integer 
m2 = \ x y -> x*y

solveQdr :: (Float,Float,Float) -> (Float,Float) 
solveQdr =  \ (a,b,c) -> if a == 0 then error "not quadratic"
                         else let d = b^2 - 4*a*c in 
                         if d < 0 then error "no real solutions"
                         else 
                           ((- b + sqrt d) / 2*a,
                            (- b - sqrt d) / 2*a)

every, some :: [a] -> (a -> Bool) -> Bool
every xs p = all p xs 
some  xs p = any p xs
