module Main where

import Language.Python.Common
import Language.Python.Version3 as V3
import System.Exit
import System.Environment

import qualified Mutants as Mut

main :: IO ()
main = do
   args <- getArgs
   case args of
      (inFile:_rest) -> do
        contents <- readFile inFile
        case Mut.parseAndApply inFile contents of
          Left _error -> putStrLn $ prettyText _error
          Right ast -> putStrLn $ prettyText ast
      _other -> putStrLn "Incorrect command line. Expected: inputFileName"
