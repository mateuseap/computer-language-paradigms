qs :: [Int] -> [Int]
qs []     = []
qs (x:xs) = qs [y | y <- xs, y <= x] ++ [x] ++ qs [y | y <- xs, y > x]

--Algoritmo QuickSort utilizando compressão de lista