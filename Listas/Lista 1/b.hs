-- B. Multiplicação de listas
-- Link: https://www.dikastis.com.br/problems/01EJ26F4BV5PJFXC6KWN0X2618

mul2 :: [Int] -> [Int] -> [Int]
mul2 [] []         = [] 
mul2 (x:xs) []     = (x * 0) : mul2 xs []
mul2 [] (y:ys)     = (0 * y) : mul2 [] ys
mul2 (x:xs) (y:ys) = (x * y) : mul2 xs ys

main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result