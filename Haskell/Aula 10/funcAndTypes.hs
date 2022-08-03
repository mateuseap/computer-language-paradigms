-- Tipos de dados recursivos:
data Expr = Lit Int       |
            Add Expr Expr |
            Sub Expr Expr

-- Funções definidas recursivamente:
eval :: Expr -> Int
eval (Lit n)     = n
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)

-- Tipos de dados polimórficos:
data Pairs t = Pair t t

-- Listas:
data List t = Nil | Cons t (List t)

-- Árvores:
data Tree t = NilT | 
              Node t (Tree t) (Tree t)
