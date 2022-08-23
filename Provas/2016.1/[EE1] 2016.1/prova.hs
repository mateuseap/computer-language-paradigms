--Questão 1)
type Chave = [(Char, Char)]

rot13parcial :: Chave -- troca 'a' por 'n', 'b' por 'o' etc.
rot13parcial = [('a','n'),('b','o'),('c','p'),('d','q'),('e','r'),('f','s'),('g','t'),('h','u'),('i','v'),('j','w'),('k','x'),('l','y'), ('m','z')]

mapChar :: Chave -> Char -> Char
mapChar [] c                    = c
mapChar (x:xs) c | (fst x) == c = (snd x)
                 | otherwise    = (mapChar xs c) 

cipher :: Chave -> String -> String
cipher key []     = []
cipher key (x:xs) = [(mapChar key x)] ++ (cipher key xs) 

--Questão 2)
inverteChave :: Chave -> Chave
inverteChave []     = []
inverteChave (x:xs) = [((snd x), (fst x))] ++ (inverteChave xs)

--Questão 3) (duas implementações)
type FuncaoChave = (Char -> Char)

trocaSoLetraL :: FuncaoChave
trocaSoLetraL 'l' = 'b'
trocaSoLetraL c = c

cipherf :: FuncaoChave -> String -> String
cipherf f []     = []
cipherf f (x:xs) = [(f x)] ++ (cipherf f xs)

cipherf' :: FuncaoChave -> String -> String
cipherf' f []  = []
cipherf' f str = (map f str) 

--Questão 4) (duas implementações)
chaveToFuncaoChave :: Chave -> FuncaoChave
chaveToFuncaoChave key = \ch -> mapChar key ch --Retorna uma função que mapeia um char para um char

chaveToFuncaoChave' :: Chave -> FuncaoChave
chaveToFuncaoChave' = mapChar
 
--Questão 5)
data KeyTree = Node Char Char KeyTree KeyTree | Empty

chaveParcial :: KeyTree
chaveParcial = Node 'h' 'u' (Node 'c' 'p' (Node 'b' 'o' (Node 'a' 'n' Empty Empty) Empty) (Node 'e' 'r' Empty Empty)) (Node 'l' 'y' Empty (Node 'm' 'z' Empty Empty))

mapCipherT :: KeyTree -> Char -> Char
mapCipherT Empty c                      = c
mapCipherT (Node x y z w) c | x == c    = y
                            | x < c     = (mapCipherT w c)
                            | otherwise = (mapCipherT z c)

cipherT :: KeyTree -> String -> String
cipherT tree []     = []
cipherT tree (x:xs) = [(mapCipherT tree x)] ++ (cipherT tree xs)