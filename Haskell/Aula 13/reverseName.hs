module Reverse where

main :: IO ()
main = putStr "Digite seu nome: " >>
       getLine >>=  
       \st ->
         putStr "Ao contrário fica: " >>
         putStrLn (reverse st)