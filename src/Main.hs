import RealTests
import Utils.Helpers
import Halgebra.ExprTree
--import Data.Text

{-
indicate :: String -> String
indicate address =
        if address == "127.0.0.1" then "localhost" else address
-}


main = mainTests

mainRun = do
        print $ take 20 myPrimes2
        print $ replicate 3 "127.1.0.0"
        print (show (simpleSum 4))
        print $ map indicate ["127.1.0.1", "127.0.0.1"]
