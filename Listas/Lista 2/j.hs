-- J. Árvore de busca binária 1
-- Link: https://www.dikastis.com.br/problems/01EK7WFHV0SPW3XXB9AJ4HP5TC

data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

checkLeftSubtree :: Ord t => Tree t -> t -> Bool
checkLeftSubtree Nilt n                     = True
checkLeftSubtree (Node x y z) n | x < n     = True && (checkLeftSubtree y n) && (checkLeftSubtree z n)
                                | otherwise = False

checkRightSubtree :: Ord t => Tree t -> t -> Bool
checkRightSubtree Nilt n                     = True
checkRightSubtree (Node x y z) n | x > n     = True && (checkRightSubtree y n) && (checkRightSubtree z n)
                                 | otherwise = False
                                
isBST :: Ord t => Tree t -> Bool
isBST Nilt         = True
isBST (Node x y z) = (checkLeftSubtree y x) && (checkRightSubtree z x) && (isBST y) && (isBST z)

main = do
       s <- getLine
       let result = isBST (read s::Tree Int)
       print result