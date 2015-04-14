{-# OPTIONS_GHC -F -pgmF htfpp -fno-warn-type-defaults -fno-warn-missing-signatures #-}
module Halgebra.ExprTreeTests where
import Halgebra.ExprTree
import Test.Framework
import Data.Tree
{-# ANN module "HLint: ignore Use camelCase" #-}


test_parseTree = do
                assertEqual (parseTree "x") (leaf "x")
                assertEqual (parseTree "x a") (Node "x" [leaf "a"])
                assertEqual (parseTree "xx aa bb") (Node "xx" [leaf "aa", leaf "bb"])
