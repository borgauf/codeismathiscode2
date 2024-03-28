#!/usr/bin/env stack
{- stack script --resolver=nightly-2021-10-24
  --package diagrams
  --package diagrams-lib
  --package diagrams-svg
-} -- https://docs.haskellstack.org/en/stable/GUIDE/#script-interpreter

-- $ ./prog.hs -o a.svg

{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

myCircle :: Diagram B
myCircle = circle 100

main = mainWith myCircle
