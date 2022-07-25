maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = max (maxFun f (n-1)) (f n)

zeroInRange :: (Int -> Int) -> Int -> Bool
zeroInRange f 0 = (f 0 == 0)
zeroInRange f n = (||) (zeroInRange f (n-1)) (f n == 0)

-- Folding:

sumList :: [Int] -> Int
sumList []     = 0
sumList (x:xs) = x + sumList xs

sumList' l = fold (+) l

fold :: (t -> t -> t) -> [t] -> t
fold f [a]    = a
fold f (a:as) = f a (fold f as)

{-- 
  Examplos:
  -> fold (||) [False, True, True]
  -> fold (++) [“Bom“, “ “, “Dia“]
--}

-- Exemplos utilizando o folding:

and' :: [Bool] -> Bool
and' xs = fold (&&) xs

concat' :: [[t]] -> [t]
concat' xs = fold (++) xs

maximum' :: [Int] -> Int
maximum' xs = fold max xs