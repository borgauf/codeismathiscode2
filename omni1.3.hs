module OMNI1_3 where

-- first come import statements
import Data.List
import Data.Int  

--then everything else  
a = [1,2,3,4]
b = [1,2,3,4,2,1]
c = [3,4,2,1]
data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown deriving (Show,Eq,Enum)
data ColorInt = RedI Int | YellowI Int | BlueI Int | GreenI Int | PurpleI Int | OrangeI Int | BrownI Int deriving (Show,Eq)
