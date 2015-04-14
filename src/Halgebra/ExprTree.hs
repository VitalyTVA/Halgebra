module Halgebra.ExprTree (parseTree, leaf) where

import Data.Tree

leaf :: a -> Tree a
leaf a = Node a []

--node :: a -> [a] -> Tree a
--node a ts = Node a $ fmap leaf ts

parseTree :: String -> Tree String
parseTree a = snd (parseTreeCore $ words a)
                
parseTreeCore :: [String] -> ([String], Tree String)
parseTreeCore (x:xs) = ((fst forest), Node x (snd forest))
                        where forest = parseForest (xs, []) 
parseTreeCore _ = error "No leaf"

parseForest :: ([String], Forest String) -> ([String], Forest String)
parseForest ([], forest) = ([], forest)
parseForest ([x], forest) = ([], (forest ++ [(leaf x)]))
parseForest ((")":xs), forest) = (xs, forest)
parseForest (("(":xs), forest) = parseForest (fst tree, (forest ++ [snd tree]))
                        where tree = parseTreeCore xs
parseForest ((x:xs), forest) = parseForest (xs, (forest ++ [(leaf x)]))