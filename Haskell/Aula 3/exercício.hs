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

maxVendas :: Int -> Int
maxVendas n | n == 0    = vendas 0
            | otherwise = max (maxVendas (n-1)) (vendas n)

addEspacos :: Int -> String
addEspacos n | n == 0     = string
             | otherwise  = addEspacos (n-1) ++ " "
             where string = ""

paraDireita :: Int -> String -> String
paraDireita n string = addEspacos n ++ string

mediaVendas :: Int -> Float
mediaVendas n = fromIntegral (totalVendas n)/ fromIntegral (n+1) --fromIntegral -> função que converte Int para Float--

cabecalho :: String
cabecalho = "Semana    Vendas\n"

imprimeSemanas :: Int -> String
imprimeSemanas 0 = imprimeSemana 0
imprimeSemanas n = imprimeSemanas (n-1) ++ imprimeSemana n

imprimeSemana :: Int -> String
imprimeSemana n = addEspacos 3 ++ show n ++ addEspacos 8 ++ show (vendas n) ++ "\n"

imprimeTotal :: Int -> String
imprimeTotal n = "Total" ++ addEspacos 1 ++ show (totalVendas n) ++ "\n"

imprimeMedia :: Int -> String
imprimeMedia n = "Media" ++ addEspacos 1 ++ show (mediaVendas n) ++ "\n"

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr(cabecalho ++ imprimeSemanas n ++ imprimeTotal n ++ imprimeMedia n)