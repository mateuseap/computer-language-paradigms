quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (x:xs) = quickSort (menores xs) ++ [x] ++ quickSort (maiores xs)
  where 
    menores [] = []
    menores (a:as) | a < x     = a : menores as
                   | otherwise = menores as
    maiores [] = []
    maiores (a:as) | a >= x    = a : maiores as
                   | otherwise = maiores as
    