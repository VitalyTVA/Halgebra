{-# OPTIONS_GHC -F -pgmF htfpp #-}
module Halgebra.ExprTreeTests where
import Halgebra.ExprTree
import Control.Exception
import Test.Framework

test_primes2 = do assertEqual [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71] $ take 20 myPrimes2
