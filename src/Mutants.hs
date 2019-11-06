module Mutants (
  parseAndApply
  )

  where

import Language.Python.Common
import Language.Python.Version3 as V3

import Operators.Mothra as Mot

-- type Parser = String -> String -> Either ParseError (ModuleSpan, [Token])

parseAndApply :: FilePath -> String -> Either ParseError ModuleSpan
parseAndApply  fileName contents =
   case V3.parseModule contents fileName of
      Left e -> Left e
      Right (ast, _comments) -> Right $ Mot.applyOpModule ast
