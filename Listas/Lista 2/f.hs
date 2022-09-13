-- F. Maior diâmetro
-- Link: https://www.dikastis.com.br/problems/01GAMBR9JE3DB64QZN133VAH6S

data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

depth :: Tree t -> Int
depth Nilt         = 0
depth (Node x y z) = 1 + (max (depth y) (depth z))

maiorDiametro :: Ord t => Tree t -> Int
maiorDiametro Nilt         = 0
maiorDiametro (Node x y z) = (max (max (1 + (depth y) + (depth z)) (maiorDiametro y)) (maiorDiametro z))

main = do
       s <- getLine
       let result = maiorDiametro (read s::Tree Int)
       print result