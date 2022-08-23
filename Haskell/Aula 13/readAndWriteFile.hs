main :: IO ()
main = putStrLn "Escrevendo" >>
       writeFile "a.txt" "Hello world!" >>
       appendFile "a.txt" "\nIt's working :)\n\nAuthor: Mateus Elias" >>
       putStrLn "Lendo o arquivo" >>
       readFile "a.txt" >>= \x ->
       putStrLn x