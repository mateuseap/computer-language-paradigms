-- H. Some até...
-- Link: https://www.dikastis.com.br/problems/01EJ1RWY5SK0QQH1S4HRBN9D5V

sumListElements :: [Int] -> Int
sumListElements (x:xs) | xs == []  = x
                       | otherwise = x + sumListElements xs

sumTo :: Int -> Int
sumTo y = sumListElements [1..y]

main :: IO()
main = interact $ show . sumTo . read