{-# LANGUAGE FlexibleInstances #-}

import Data.Ratio
import Data.Word
import Unsafe.Coerce

newtype TString = MkTString ([Char]) -- deriving (Show)
newtype Replicator = MkReplicator (Int -> String) -- deriving (Show)

class Thing a where
  thing :: a

instance Thing Bool where thing = True
instance Thing Int where thing = 16
instance Thing String where thing = "hello, world"
instance Thing (Int -> String) where thing n = replicate n '*'
  
class Three a where
  three :: a

-- for base >= 4.10.0.0, can import GHC.Float (castWord64ToDouble)
-- more generally, we can use this unsafe coercion:
castWord64ToDouble :: Word64 -> Double
castWord64ToDouble w = unsafeCoerce w

instance Three Int where
  three = length "aaa"
instance Three Double where
  three = castWord64ToDouble (0x4008000000000000)
instance Three Rational where
  three = (6 :: Integer) % (2 :: Integer)

-- main = do
--   print (three :: Int)
--   print (three :: Double)
--   print (three :: Rational)
--   print $ take three "abcdef"
--   print $ (sqrt three :: Double)

