-- C. Estatísticas da fatura do cartão
-- Link: https://www.dikastis.com.br/problems/01EJ6YNXGMRZC31AQ90AFFK5V6

getName :: String -> String
getName x      | x == []   = []
getName (x:xs) | x == ';'  = ans  
               | otherwise = ans ++ [x] ++ getName xs
               where ans = ""

dropLength :: String -> String -> String
dropLength x y = drop (length y + 1) (drop 7 x)

getNumInLine :: String -> (Double, String)
getNumInLine str = (read (getName (dropLength str (getName (drop 7 str)))), drop (length (getName (dropLength str (getName (drop 7 str)))) + 1) (dropLength str (getName (drop 7 str))))

saveNumbers :: String -> [Double]
saveNumbers str | str == [] = []
                | otherwise = [fst (getNumInLine str)] ++ saveNumbers (snd (getNumInLine str))

minMaxCartao :: String -> (Double, Double)
minMaxCartao str = (foldr1 min (saveNumbers str), foldr1 max (saveNumbers str))

main = do
    a <- getLine
    let result = minMaxCartao a
    print result