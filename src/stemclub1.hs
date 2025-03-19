module STEMCLUB1 where
import GHC.Real

primeFactors :: Integer -> [Integer] 
primeFactors n = go [2..] n
  where
    go primes num 
      | num == 1 = [] 
      | head primes * head primes > num = [num] 
      | num `mod` head primes == 0 = head primes : go primes (num `div` head primes) 
      | otherwise = go (tail primes) num

divides d n = rem n d == 0

data Color = Red | Yellow | Blue | Green deriving (Show,Read)

instance Eq Color where
  Red == Red = True      -- could also be (==) Red Red = True
  Yellow == Yellow = True
  Blue == Blue = True
  Green == Green = True
  _ == _ = False         -- by now anything else must be false

divisors :: Integer -> [Integer]
divisors n = [d | d <- [2..abs n], abs n `mod` d == 0]

ld :: Integral t => t -> t
ld n = ldf 2 n
ldf k n | divides k n = k
        | k^2 > n = n
        | otherwise = ldf (k+1) n

prime0 :: Integral a => a -> Bool
prime0 n | n < 1 = error "Not a positive integer"
         | n == 1 = False
         | otherwise = ld n == n

primesUpTo :: Int -> [Int]
primesUpTo n = sieve [2..n]
  where
    sieve :: [Int] -> [Int]
    sieve [] = []
    sieve (p:xs) = p : sieve (filter (\x -> x `mod` p /= 0) xs)
