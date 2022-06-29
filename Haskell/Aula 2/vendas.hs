vendas :: Int -> Int
vendas 0 = 60
vendas 1 = 30
vendas 2 = 40
vendas 3 = 50
vendas 4 = 25
vendas 5 = 60
vendas n = 0

totalVendas :: Int -> Int 
totalVendas n | n == 0    = vendas 0
              | otherwise = totalVendas (n-1) + vendas n 

{-
Outra forma de escrever a função 'totalVendas' (casamento de padrões)

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n
-}

maxVendas :: Int -> Int
maxVendas n | n == 0    = vendas 0
            | otherwise = max (maxVendas (n-1)) (vendas n)

equalNumbers :: Int -> Int -> Bool
equalNumbers a b = (a == b)

checkVendas :: Int -> Int -> Int --Exercício 1 (checar quandas semanas de 0 até n tem vendas iguais a s)
checkVendas s 0 | equalNumbers s (vendas 0) = 1
                | otherwise = 0
checkVendas s n | equalNumbers s (vendas n) = 1 + checkVendas s (n-1) 
                | otherwise = checkVendas s (n-1)