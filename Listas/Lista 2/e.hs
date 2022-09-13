-- E. Somar Listas
-- Link: https://www.dikastis.com.br/problems/01GAMCJAHA72Y6E6C3QH254M34

charToInt :: Char -> Int
charToInt n | n == '0' = 0
            | n == '1' = 1
            | n == '2' = 2
            | n == '3' = 3
            | n == '4' = 4
            | n == '5' = 5
            | n == '6' = 6
            | n == '7' = 7
            | n == '8' = 8
            | n == '9' = 9

intToChar :: Int -> Char
intToChar n | n == 0 = '0'
            | n == 1 = '1'
            | n == 2 = '2'
            | n == 3 = '3'
            | n == 4 = '4'
            | n == 5 = '5'
            | n == 6 = '6'
            | n == 7 = '7'
            | n == 8 = '8'
            | n == 9 = '9'

listToString :: [Int] -> String
listToString []     = []
listToString (x:xs) = [(intToChar x)] ++ listToString xs

stringToList :: String -> [Int]
stringToList []     = []
stringToList (x:xs) = [(charToInt x)] ++ stringToList xs

funcCall :: [Int] -> [Int] -> [Int]
funcCall [] [] = []
funcCall l1 [] = l1
funcCall [] l2 = l2
funcCall l1 l2 = stringToList (show ((read (listToString l1)) + (read (listToString l2))))

main :: IO ()
main = do
    sa <- getLine
    sb <- getLine
    let result = funcCall (read sa :: [Int]) (read sb :: [Int])
    print result 