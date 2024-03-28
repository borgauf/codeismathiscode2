module NUMBERS1 where
import Data.Set (Set, lookupMin, lookupMax)
import qualified Data.Set as Set
import Data.Ratio

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
