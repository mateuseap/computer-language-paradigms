double :: [Int] -> [Int]
double [] = []
double (a:as) = (a+2) : double as

repeat' :: [Int] -> [Int]
repeat' [] = []
repeat' (a:as) = a:(a:repeat' as)

repeat'' :: [Int] -> [Int]
repeat'' [] = []
repeat'' xs = head xs : head xs : repeat'' (tail xs)

member :: [Int] -> Int -> Bool
member [] x = False
member (a:as) z | a == z = True 
                | otherwise = member as z

digits :: String -> String
digits [] = []
digits (ch:chs) | ch >= '0' && ch <= '9' = ch : digits chs
                | otherwise = digits chs

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs (x:xs) (y:ys) = (x+y) : sumPairs xs ys 
sumPairs [] ys = []
sumPairs xs [] = xs

maiorElemento :: [Int] -> Int
maiorElemento [] = minBound :: Int
maiorElemento [x] = x
maiorElemento (x:xs) = max x (maiorElemento xs)