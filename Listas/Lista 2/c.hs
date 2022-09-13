-- C. Lista de novos alunos
-- Link: https://www.dikastis.com.br/problems/01GAMBHHQWP02P97HNRE4RPJT5

qs :: [String] -> [String]
qs []     = []
qs (x:xs) = qs [y | y <- xs, y <= x] ++ [x] ++ qs [y | y <- xs, y > x]

bSort :: [String] -> [String]
bSort str = qs str

main = do
       a <- getLine
       let result = bSort (read a :: [String])
       print result