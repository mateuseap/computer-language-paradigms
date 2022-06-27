{-Definição de Funções-}

square :: Int -> Int {-declaração da função > tipos dos parâmetros + resultado-}
square x = x * x {-função > parâmetro > resultado-}

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

maxi :: Int -> Int -> Int
maxi n m | n >= m = n {-a barra representa um teste (if)-}
         | otherwise = m