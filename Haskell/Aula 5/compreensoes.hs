doubleList :: [Int] -> [Int]
doubleList xs = [2*a|a <- xs]

isEven :: Int -> Bool
isEven 0 = False 
isEven x | (x `div` 2) == 0 = True
         | otherwise        = False

doubleIfEven :: [Int] -> [Int]
doubleIfEven xs = [2*a|a <- xs, isEven a]

sumPairs :: [(Int,Int)] -> [Int]
sumPairs lp = [a+b|(a,b) <- lp]