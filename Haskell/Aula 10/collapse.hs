data Tree t = NilT | 
              Node t (Tree t) (Tree t)

collapse :: Tree t -> [t]
collapse NilT         = []
collapse (Node x y z) = x : ((collapse y) ++ (collapse z))

{-
  Exemplo (percorrer uma árvore):
  -> collapse (Node 44 (Node 22 NilT NilT) (Node 12 (Node 25 NilT NilT) NilT))
     > Output [44,22,12,25]
-}