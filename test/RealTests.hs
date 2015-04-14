{-# OPTIONS_GHC -F -pgmF htfpp #-}
module RealTests where


import Test.Framework

import {-@ HTF_TESTS @-} Utils.HelpersTest

mainTests :: IO()
mainTests = htfMain htf_importedTests
