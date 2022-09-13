-- A. Detecção de réplica
-- Link: https://www.dikastis.com.br/problems/01EJ50KMHA1Z6AXFSX5CQHFEEN

charToString :: Char -> String
charToString c = [c]

cloneString :: Int -> String -> String
cloneString n l | n == 0     = ""
                | otherwise  = cloneString (n-1) l ++ string
                where string = l

isReplica :: String -> Int -> Char -> Bool
isReplica str num ch = cloneString num (charToString ch) == str 

main = do
    a <- getLine
    b <- getLine
    c <- getChar
    let result = isReplica a (read b) c
    print result