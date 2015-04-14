module Halgebra.ExprTree where

import Data.Tree

leaf :: a -> Tree a
leaf a = Node a []

parseTree :: String -> Tree String
parseTree a = leaf a 