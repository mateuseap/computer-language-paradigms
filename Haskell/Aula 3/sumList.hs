sumList :: [Int] -> Int
sumList as | as == [] = 0
           | otherwise = (head as) + sumList (tail as)