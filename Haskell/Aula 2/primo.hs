primeNumber :: Int -> Bool --Exercício 2 (checar se um determinado número é primo)
primeNumber 1 = False
primeNumber n = indivisible n (n-1)

indivisible a 1 = True
indivisible a b = (a `mod` b /= 0) && indivisible a (b-1)