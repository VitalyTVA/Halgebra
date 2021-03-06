module Halgebra.ExprTree (parseTree, evalExpression, leaf) where

import Data.Tree
import Control.Applicative
--import Debug.Trace


type EvalResult = Integer

data Term = Term { 
        name :: String,
        eval :: [EvalResult] -> EvalResult
        }
        
instance Show Term where
    show = name

evalExpression :: String -> EvalResult
evalExpression = evalTree.parseTerms

evalTree :: Tree Term -> EvalResult
evalTree (Node x xs) = eval x $ fmap evalTree xs

parseTerm :: String -> Term
parseTerm "+" = Term "+" sum
parseTerm "*" = Term "*" product
parseTerm a = Term a (\_ -> read a)

parseTerms :: String -> Tree Term
parseTerms a = parseTerm <$> parseTree a

leaf :: a -> Tree a
leaf a = Node a [] 

parseTree :: String -> Tree String
parseTree a = snd (parseTreeCore $ words a)
                
parseTreeCore :: [String] -> ([String], Tree String)
parseTreeCore (x:xs) = (left, Node x forest)
                        where (left, forest) = parseForest (xs, []) 
parseTreeCore _ = error "No leaf"

parseForest :: ([String], Forest String) -> ([String], Forest String)
parseForest ([], forest) = ([], forest)
parseForest ([")"], forest) = ([], forest)
parseForest ([x], forest) = ([], forest ++ [leaf x])
parseForest (")" : xs, forest) = (xs, forest)
parseForest ("(" : xs, forest) = parseForest (left, forest ++ [subTree])
                        where (left, subTree) = parseTreeCore xs
parseForest (x : xs, forest) = parseForest (xs, forest ++ [leaf x])