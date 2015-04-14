{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
import HalgebraTests
import Utils.Helpers
--import Halgebra.ExprTree
import Data.Tree

{-
indicate :: String -> String
indicate address =
        if address == "127.0.0.1" then "localhost" else address
-}


main = mainRun >> mainTests

simpleTree = Node "A" [Node "B" [], Node "C" [Node "D" [], Node "E" []]]

mainRun = do
        putStrLn $ drawTree (fmap (++ "xx") simpleTree)
        putStrLn $ drawForest $ subForest simpleTree
        print $ take 20 (myPrimes :: [Int])
        print $ replicate 3 "127.1.0.0"
        print (show (simpleSum 4))
        print $ map indicate ["127.1.0.1", "127.0.0.1"]
