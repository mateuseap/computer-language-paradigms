-- Map functtions (funções de mapeamento):

doubleList :: [Int] -> [Int]
doubleList []    = []
doubleList (a:x) = (2*a) : doubleList x

sqrList :: [Int] -> [Int]
sqrList []    = []
sqrList (a:x) = (a*a) : sqrList x

mapFunc :: (t -> u) -> [t] -> [u]
mapFunc f []     = []
mapFunc f (x:xs) = f x : mapFunc f xs

mapFunc' f l = [f a | a <- l] -- Outra definição para a map function

-- Exemplos do uso de mapeamento:

doubleList' xs = mapFunc times2 xs

sqrList' xs = mapFunc sqr xs

seconds :: [(t,u)] -> [u]
seconds xs = mapFunc snd xs

-- Funções de transformação de elementos:

times2 :: Int -> Int
times2 n = 2 * n

sqr :: Int -> Int
sqr n = n * n