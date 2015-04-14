module Halgebra.ExprTree where

import Data.Tree

leaf :: a -> Tree a
leaf a = Node a []

node :: a -> [a] -> Tree a
node a ts = Node a $ fmap leaf ts

parseTree :: String -> Tree String
parseTree a = parseTreeCore $ words a
                
parseTreeCore :: [String] -> Tree String
parseTreeCore (x:xs) = Node x (snd (parseForest (xs, [])))
parseTreeCore _ = error "No leaf"

parseForest :: ([String], Forest String) -> ([String], Forest String)
parseForest ([], forest) = ([], forest)
parseForest ([x], forest) = ([], (forest ++ [(leaf x)]))
parseForest ((x:xs), forest) = parseForest (xs, (forest ++ [(leaf x)]))