-- E. Fatura do cartão
-- Link: https://www.dikastis.com.br/problems/01EJ6XQ48PTRB83YYD35Q7PB0E

getName :: String -> String
getName x      | x == []   = []
getName (x:xs) | x == ';'  = ans  
               | otherwise = ans ++ [x] ++ getName xs
               where ans = ""

dropLength :: String -> String -> String
dropLength x y = drop (length y + 1) (drop 7 x)

getNumInLine :: String -> (Double, String, String)
getNumInLine str = (read (getName (dropLength str (getName (drop 7 str)))), drop (length (getName (dropLength str (getName (drop 7 str)))) + 1) (dropLength str (getName (drop 7 str))), getName (drop 3 str))

first :: (x,y,z) -> x
first (x,_,_) = x

second :: (x,y,z) -> y
second (_,y,_) = y

third :: (x,y,z) -> z
third (_,_,z) = z

saveNumbers :: String -> String -> [Double]
saveNumbers str month | str == []                         = []
                      | month /= third (getNumInLine str) = [] ++ (saveNumbers (second (getNumInLine str)) month)
                      | otherwise                         = [first (getNumInLine str)] ++ (saveNumbers (second (getNumInLine str)) month)

logMes :: String -> String -> Double
logMes month str = sum (saveNumbers str month)

main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result