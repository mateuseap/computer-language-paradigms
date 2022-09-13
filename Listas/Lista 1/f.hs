-- F. Binário para inteiro
-- Link: https://www.dikastis.com.br/problems/01EJ4RW7VX84CGDP1WR22PDSVN

btoi :: String -> Int
btoi x      | x == []   = 0
btoi (x:xs) | x == '0'  = (btoi xs) + 0
            | otherwise = (btoi xs) + 2^(length xs)

main = do
    s <- getLine
    let result = btoi s
    print result