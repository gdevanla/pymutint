{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings#-}

import Data.Map as M
import Data.List as L
import Data.Vector as V
import GHC.Generics as G
import Data.Data

import Test.Tasty
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

import Language.Python.Common

import Mutants as Mut
import Operators.Mothra

testBasicOp = testCase "testList" $ do
  case Mut.parseAndApply "/tmp/dummy.py" "x = x + 1" of
    Left _error -> assertBool ("Failed parsing :" L.++ (show _error)) False
    Right ast -> let
      str = prettyText ast
      in
        assertEqual "testing basic op" str "x = x + 1"


tests :: TestTree
tests = testGroup "Tests" [
  testBasicOp
  ]

main = defaultMain tests
