{-# LANGUAGE FlexibleInstances #-}
module NUMBERS1AUX1 where

import Data.Ratio
import Data.Word
import Unsafe.Coerce

class Thing a where
  thing :: a

instance Thing Bool where thing = True
instance Thing Int where thing = 16
instance Thing String where thing = "hello, world"
instance Thing (Int -> String) where thing n = replicate n '*'  

main1 = do
  print (thing :: Bool)
  print (thing :: Int)
  print (thing :: String)
  print $ (thing :: Int -> String) 15

class Three a where
  three :: a

-- we use this unsafe coercion:
castWord64ToDouble :: Word64 -> Double
castWord64ToDouble w = unsafeCoerce w

instance Three Int where
  three = length "aaa"
instance Three Double where
  three = castWord64ToDouble 0x4008000000000000
instance Three Rational where
  three = (6 :: Integer) % (2 :: Integer)

main2 = do
  print (three :: Int)
  print (three :: Double)
  print (three :: Rational)
  print $ take three "abcdef"
  print $ (sqrt three :: Double)
