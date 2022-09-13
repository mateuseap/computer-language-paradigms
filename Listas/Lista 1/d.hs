-- D. Decifre o enigma
-- Link: https://www.dikastis.com.br/problems/01EJ4Y3C6A2GF5FHM2Z74M79RT

checkChar :: Char -> [(Char, Char)] -> String
checkChar chr list   | list == []     = []
checkChar chr (y:ys) | chr == (fst y) = [(snd y)]
                     | otherwise      = [] ++ checkChar chr ys

decEnigma :: String -> [(Char, Char)] -> String
decEnigma str list    | str == [] = []
decEnigma (x:xs) list = (checkChar x list) ++ decEnigma xs list

main = do
    a <- getLine
    b <- getLine
    let result = decEnigma a (read b)
    print result