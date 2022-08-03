data Tree t = NilT | 
              Node t (Tree t) (Tree t)

depth :: Tree t -> Int
depth NilT         = 0
depth (Node x y z) = 1 + (max (depth y) (depth z))

{-
  Exemplo (altura de uma árvore):
  -> depth (Node 44 (Node 22 NilT NilT) (Node 12 (Node 25 NilT NilT) NilT))
     > Output 3
-}