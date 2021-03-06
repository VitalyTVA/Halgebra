{-# OPTIONS_GHC -F -pgmF htfpp -fno-warn-type-defaults -fno-warn-missing-signatures #-}
module Halgebra.ExprTreeTests where
import Halgebra.ExprTree
import Test.Framework
import Data.Tree
{-# ANN module "HLint: ignore Use camelCase" #-}


test_parseTree = do
                assertEqual (leaf "x") (parseTree "x") 
                assertEqual (Node "x" [leaf "a"]) (parseTree "x a")
                assertEqual (Node "xx" [leaf "aa", leaf "bb"]) (parseTree "xx aa bb")
                assertEqual (Node "xx" [Node "aa" [leaf "bb"], leaf "cc"]) (parseTree "xx ( aa bb ) cc")
                assertEqual (Node "xx" [Node "aa" [leaf "bb"]]) (parseTree "xx ( aa bb )")
                assertEqual (Node "xx" [leaf "ee", Node "aa" [leaf "dd", Node "bb" [leaf "ff"]], leaf "cc"]) (parseTree "xx ee ( aa dd ( bb ff ) ) cc")
                
test_evalTree = do
                assertEqual 1 $ evalExpression "1"
                assertEqual 100 $ evalExpression "100"
                assertEqual 3 $ evalExpression "+ 3"
                assertEqual 3 $ evalExpression "+ 1 2"
                assertEqual 8 $ evalExpression "+ 1 ( 5 ) 2"
                assertEqual 10 $ evalExpression "+ 1 ( + 5 ( + -1 3 ) ) 2"
                assertEqual 21 $ evalExpression "+ 2 ( * 3 5 ) 4"
