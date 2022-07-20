menorMaior :: Int -> Int -> Int -> (Int,Int)
menorMaior x y z | x >= y && y >= z = (x,z)
                 | x <= y && y <= z = (z,x)
                 | x >= z && z >= y = (x,y)
                 | z >= x && x >= y = (z,y)
                 | y >= x && x >= z = (y,z)
                 | y >= z && z >= x = (y,x)

first :: (x,y,z) -> x
first (x,_,_) = x

second :: (x,y,z) -> y
second (_,y,_) = y

third :: (x,y,z) -> z
third (_,_,z) = z

ordenaTripla :: (Int,Int,Int) -> (Int,Int,Int)
ordenaTripla (x,y,z) = (menor,
                        (x+y+z)-menor-maior,
                        maior)
  where
    (maior,menor) = menorMaior x y z