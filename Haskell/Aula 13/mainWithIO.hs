module MainWithIO where

main :: IO ()
main = do putStrLn "entre com o primeiro conjunto"
          s1 <- getLine
          putStrLn (show s1)
          putStrLn "entre com o segundo conjunto"
          s2 <- getLine
          putStrLn (show s2)
          putStrLn (if (s1 == s2) then "iguais" else "diferentes")

putNtimes :: Int -> String -> IO ()
putNtimes n str
  = if n <= 1
      then putStr str
      else do putStr str
              putNtimes (n-1) str