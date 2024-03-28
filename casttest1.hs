{-# LANGUAGE GeneralisedNewtypeDeriving #-}

import Data.Ratio
import GHC.Float (castWord64ToDouble)

newtype TString = MkTString ([Char]) -- deriving (Show)
newtype Replicator = MkReplicator (Int -> String) -- deriving (Show)

class ThingsAbout a where
  thingsAbout :: a

instance ThingsAbout Bool where thingAbout = True
instance ThingsAbout Int where thingAbout = 16
-- instance ThingsAbout TString where thing = MkTString ("hello, world")
-- instance ThingsAbout Replicator where thing = MkReplicator (\n -> replicate n '*')
  
-- class Three a where
--   three :: a

-- instance Three Int where
--   three = length "aaa"
-- instance Three Double where
--   three = castWord64ToDouble 0x4008000000000000
-- instance Three Rational where
--   three = (6 :: Integer) % (2 :: Integer)
