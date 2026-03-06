module HID1 where


data Direction = North | East | South | West
  deriving (Eq, Enum, Bounded, Show)
data Turn = TNone | TLeft | TRight | TAround
  deriving (Eq, Enum, Bounded, Show)
