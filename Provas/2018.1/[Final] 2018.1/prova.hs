-- Questão 1:
insere :: Ord t => t -> [t] -> [t]
insere n []                      = [n]
insere n list@(x:xs) | n > x     = x : insere n xs
                     | otherwise = n : list

-- Questão 2 (três soluções possíveis): 
insSort :: Ord t => [t] -> [t]
insSort [] = []
insSort (a:as) = insere a (insSort as)

insSort' :: Ord t => [t] -> [t]
insSort' list = foldr insere [] list

insSort'' :: Ord t => [t] -> [t]
insSort'' list = foldl (\x -> \y -> insere y x) [] list