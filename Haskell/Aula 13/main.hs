module Main where
import Set

main :: IO ()
main = do putStrLn (show testes1)
          putStrLn (show testes2)
          putStrLn (if (testes1 == testes2) then "iguais" else "diferentes")

testes1 :: Set Int
testes1 = mkSet [1,2,3,4,5,9]

testes2 :: Set Int
testes2 = mkSet [1,1,2,2,3,3,9,5,4]