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
