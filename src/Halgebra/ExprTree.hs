module Halgebra.ExprTree where

import Data.Tree

leaf :: a -> Tree a
leaf a = Node a []

node :: a -> [a] -> Tree a
node a ts = Node a $ fmap leaf ts

parseTree :: String -> Tree String
parseTree a = node (head ws) (tail ws)
                where ws = words a