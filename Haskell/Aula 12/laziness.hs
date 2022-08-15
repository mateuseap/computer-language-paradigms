-- Laziness (avalia apenas o que é necessário e só quando é necessário)

f :: Int -> Int -> Int
f a b = a + b
{-
  Exemplo da execução de uma chamada da função 'f':
    1º > f (9-3) (f 3 5) = (9-3) + (f 3 5)
    2º > = 6 + 8
    3º > = 14
-}

f' :: Int -> Int -> Int
f' a b = a + 12

g :: Int -> Int
g c = c + g c
{-
  Exemplos:
    -> f' 3 (g 0) = 15 | a função g não precisa ser computada para o resultado final dessa chamada da função f' ser calculada, logo, conseguimos obter um resultado.
    -> f' (g 0) 3 = undefined | g é uma função que dado um parâmetro, ela entra em loop infinito. Nesse caso a entramos num loop restrito, já que o valor de (g 0) é necessário para calcular o resultado dessa chamada da função f'. 
-}

f'' :: [Int] -> [Int] -> Int
f'' (a:as) (b:bs) = a + b
{-
  Exemplos:
    -> f'' [1..] [2..] = 3 | apesar das listas serem infinitas, a função f'' não monta elas por completo já que apenas o head de ambas está sendo utilizado
-}