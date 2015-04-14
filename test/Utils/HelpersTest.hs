{-# OPTIONS_GHC -F -pgmF htfpp #-}
module Utils.HelpersTest where
import Utils.Helpers
import Control.Exception


import Test.Framework

test_nonEmpty = do assertEqual [1] (myReverse [1])
                   assertEqual [3,2,1] (myReverse [1,2,3])

test_empty = assertEqual ([] :: [Int]) (myReverse [])

prop_reverse :: [Int] -> Bool
prop_reverse xs = xs == (myReverse (myReverse xs))

test_simpleSum = assertEqual 4 $ simpleSum 2

handleExc :: String -> SomeException -> Bool
handleExc s e = (show e) == s

test_myLast = do assertEqual 3 (myLast [1,2,3])
                 assertEqual 1 (myLast [1])
                 assertThrows (myLast []) (handleExc "List is empty.")

test_myLastButOne = do assertEqual 2 $ myLastButOne [1,2,3]
                       assertThrows (myLastButOne [1]) $ handleExc "List has only one element."
                       assertThrows (myLastButOne []) $ handleExc "List is empty."
                                           
test_myElementAt = do   assertEqual 3 $ myElementAt [1,2,3] 2
                        assertEqual 1 $ myElementAt [1,2,3] 0
                        assertEqual 1 $ myElementAt [1] 0
                        assertThrows (myElementAt [1,2,3] 3) $ handleExc "Out of bounds."
                        assertThrows (myElementAt [1,2,3] (-1)) $ handleExc "Out of bounds."
                        assertThrows (myElementAt [] 0) $ handleExc "Out of bounds."

test_primes = do assertEqual [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71] $ take 20 myPrimes
