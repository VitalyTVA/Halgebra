module Utils.Helpers where

myPrimes :: (Integral a) => [a]
myPrimes = 2 : filter isPrime [3, 5 ..]
                where isPrime a = all (\ x -> a `mod` x /= 0) $ takeWhile (\ x -> x * x <= a) myPrimes


simpleSum :: Int -> Int
simpleSum x = x + x

myReverse :: [a] -> [a]
myReverse []     = []
myReverse [x]    = [x]
myReverse (x:xs) = myReverse xs ++ [x]

indicate :: String -> String
indicate "127.0.0.1" = "localhost"
indicate address     = address

myLast :: [a] -> a
myLast []     = error "List is empty."
myLast [x]    = x
myLast (_:xs) = myLast xs

myLastButOne :: [a] -> a
myLastButOne []     = error "List is empty."
myLastButOne [_]    = error "List has only one element."
myLastButOne [x,_]  = x
myLastButOne (_:xs) = myLastButOne xs

myElementAt :: [a] -> Int -> a
myElementAt (x:_) 0  = x
myElementAt (_:xs) i = xs `myElementAt` (i - 1)
myElementAt _ _      = error "Out of bounds."
