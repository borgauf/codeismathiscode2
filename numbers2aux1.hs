module NUMBERS2AUX1 where

stepsAltCalc steps =
  let stepinches = 8 -- 8 inch step height basealt
      basealt = 800 -- 800 feet base altitude
  in ((stepinches * steps) / 12) + basealt -- divide by 12 for feet
  
fac :: (Integral a) => a -> a
fac 0 = 1
fac n = n * fac (n - 1)
stepsAltCalc2 steps =
  let basealt = 800
      stepasfeet = 8/12
  in
    let feethigh =  stepasfeet * steps
    in feethigh + basealt

round' :: Double -> Integer -> Double
round' num sg = (fromIntegral . round $ num * f) / f
    where f = 10^sg

data Nat = Zero | Succ Nat
