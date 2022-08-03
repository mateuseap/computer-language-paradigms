data Expr = Lit Int       |
            Add Expr Expr |
            Sub Expr Expr |
            Mul Expr Expr

showExpr :: Expr -> String
showExpr (Lit n)     = show n
showExpr (Mul e1 e2) = "(" ++ (showExpr e1) ++ "*" ++ (showExpr e2) ++ ")"
showExpr (Add e1 e2) = "(" ++ (showExpr e1) ++ "+" ++ (showExpr e2) ++ ")"
showExpr (Sub e1 e2) = "(" ++ (showExpr e1) ++ "-" ++ (showExpr e2) ++ ")"

{-
  Exemplo:
  -> showExpr (Add (Mul (Lit 5) (Lit 4)) (Lit 5))
     > Output ((5*4)+5)
-}