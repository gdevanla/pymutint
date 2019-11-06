module Operators.Mothra

where

import Language.Python.Common

--type Parser = String -> String -> Either ParseError (ModuleSpan, [Token])


applyOpModule (Module stmts) = Module $ applyOpStatements stmts


applyOpStatements stmts = map applyOpStatement stmts

applyOpStatement :: Statement a -> Statement a
applyOpStatement a@(Assign _ expr _) = a {assign_expr=applyOpExpr expr}
applyOpStatement a@(_) = a

applyOpExpr b@(BinaryOp operator _ _ _) =  b {operator=Minus (annot operator)}
