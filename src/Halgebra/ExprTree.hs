module Halgebra.ExprTree where

myPrimes2 :: (Integral a) => [a]
myPrimes2 = 2 : (filter isPrime [3,5 ..])
                where isPrime = \a -> all (\x -> a `mod` x /= 0) $ takeWhile (\x -> x * x <= a) myPrimes2