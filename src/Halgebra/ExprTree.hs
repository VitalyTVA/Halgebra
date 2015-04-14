module Halgebra.ExprTree where

import Data.Tree
import Utils.Helpers

simpleTree = Node "A" [Node "B" [], Node "C" [Node "D" [], Node "E" []]]

myPrimes2 = myPrimes