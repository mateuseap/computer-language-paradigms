-- K. Árvore de busca binária 2
-- Link: https://www.dikastis.com.br/problems/01EK8F2B8KV7XJC1BTB1AQ7R1Q

data Tree t = Nilt |
               Node t (Tree t) (Tree t)
               deriving (Read, Show)

insertOneElement :: Ord t => Tree t -> t -> Tree t
insertOneElement Nilt k                             = Node k Nilt Nilt
insertOneElement (Node x y z) k   | x > k           = Node x (insertOneElement y k) z
                                  | otherwise       = Node x y (insertOneElement z k)

insertList :: Ord t => Tree t -> [t] -> Tree t
insertList tree []     = tree
insertList tree (x:xs) = insertList (insertOneElement tree x) xs

main = do
       a <- getLine
       b <- getLine
       let result = insertList (read a::Tree Int) (read b)
       print result