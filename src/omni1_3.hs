module OMNI1_3 where

-- first come import statements
import Data.List
import Data.Int  

--then everything else  
a = [1,2,3,4]
b = [1,2,3,4,2,1]
c = [3,4,2,1]
data Colors = Reds | Yellows | Blues | Greens | Purples | Oranges | Browns deriving (Show,Eq,Enum)
data ColorInt = RedI Int | YellowI Int | BlueI Int | GreenI Int | PurpleI Int | OrangeI Int | BrownI Int deriving (Show,Eq)  


myUnion :: Eq a => [a] -> [a] -> [a]
myUnion [] ys = ys
myUnion (x:xs) ys = if (elem x xs) || (elem x ys)
                    then x : myUnion (filter (/=x) xs) (filter (/=x) ys)
                    else x : myUnion xs ys

myUnion2 :: Eq a => [a] -> [a] -> [a]
myUnion2 [] ys = nub ys
myUnion2 (x:xs) ys = if (elem x xs) || (elem x ys)
                    then x : myUnion2 (filter (/= x) xs) (filter (/=x) ys)
                    else x : myUnion2 xs ys

data O13Color = O13Red | O13Yellow | O13Blue | O13Green | O13Purple | O13Orange | O13Brown deriving (Show,Eq,Enum)
