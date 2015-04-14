{-# OPTIONS_GHC -F -pgmF htfpp #-}
module HalgebraTests where


import Test.Framework

import {-@ HTF_TESTS @-} Halgebra.ExprTreeTests
import {-@ HTF_TESTS @-} Utils.HelpersTest

mainTests :: IO()
mainTests = htfMain htf_importedTests
