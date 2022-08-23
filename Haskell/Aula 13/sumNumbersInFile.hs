import Data.Char

main :: IO ()
main = do putStrLn "Lendo os números do arquivo..." >>
          str <- readFile "x.txt"
          putStrLn (sumList (strToList str))

strToList :: [Char] -> [Int]
strToList [] = []
strToList x  = array ++ [( (ord (head x)) - 48 )] ++ strToList (tail x)
                where array = []

sumList :: [Int] -> Int
sumList []     = 0
sumList (x:xs) = x + sumList xs


