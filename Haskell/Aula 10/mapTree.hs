data Tree t = NilT | 
              Node t (Tree t) (Tree t)
              deriving(Eq, Show)

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f NilT         = NilT
mapTree f (Node x y z) = Node (f x) (mapTree f y) (mapTree f z) 

{-
  Exemplo (aplicar uma operação em todos os nós de uma árvore):
  -> mapTree (+20) (Node 44 (Node 22 NilT NilT) (Node 12 (Node 25 NilT NilT) NilT))
     > Output Node 64 (Node 42 NilT NilT) (Node 32 (Node 45 NilT NilT) NilT)
-}
