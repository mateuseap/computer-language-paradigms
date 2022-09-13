-- H. Cálculo seguro
-- Link: https://www.dikastis.com.br/problems/01EMBWYKP4KNJR1X64N8017Z9K

removingZeros :: String -> String
removingZeros []                      = "0"
removingZeros str@(x:xs) | x == '0'   = removingZeros xs
                         | otherwise  = str

validIntPart :: String -> String
validIntPart []                            = []
validIntPart (x:xs) | x >= '0' && x <= '9' = [x] ++ (validIntPart xs)
                    | otherwise            = []

getOperation :: String -> String -> String
getOperation [] str | (head str) < '0' || (head str) > '9' = [(head str)] ++ (getOperation [] (tail str))
                    | otherwise                            = []
getOperation firstNumber str | head (drop (length firstNumber) str) < '0' || head (drop (length firstNumber) str) > '9' = [(head (drop (length firstNumber) str))] ++ (getOperation [] (tail (drop (length firstNumber) str)))
                             | otherwise = []

executeOperation :: Int -> String -> Int -> String
executeOperation n1 "div" 0                               = "Nothing"
executeOperation n1 op n2 | op == "div" && div n1 n2 >= 0 = "Just " ++ (show (div n1 n2))
                          | op == "div" && div n1 n2 < 0  = "Just " ++ "(" ++ (show (div n1 n2)) ++ ")"
                          | op == "mul" && n1*n2 >= 0     = "Just " ++ (show (n1*n2))
                          | op == "mul" && n1*n2 < 0      = "Just " ++ "(" ++ (show (n1*n2)) ++ ")"
                          | op == "sum" && n1+n2 >= 0     = "Just " ++ (show (n1+n2))
                          | op == "sum" && n1+n2 < 0      = "Just " ++ "(" ++ (show (n1+n2)) ++ ")"
                          | op == "sub" && n1-n2 >= 0     = "Just " ++ (show (n1-n2))
                          | op == "sub" && n1-n2 < 0      = "Just " ++ "(" ++ (show (n1-n2)) ++ ")"

safeCalc :: String -> IO ()
safeCalc str = putStrLn (executeOperation (read (removingZeros (validIntPart str))) (getOperation (validIntPart str) str) (read (removingZeros (drop 3 (drop (length (validIntPart str)) str)))))

main = do
       a <- getLine
       safeCalc a