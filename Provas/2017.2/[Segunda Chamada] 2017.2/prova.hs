import Data.Char

-- Questão 1:
f :: [Int] -> [Int] -> Int
f l1 [] = 0
f [] l2 = 0
f (x:xs) (y:ys) | mod x y == 0 = x + f xs ys
                | otherwise    = f xs ys
{-
  Exemplos:
   -> f [6,9,2,7] [2,3,5,1] = 22
   -> f [6,9,2] [2,3,5,1] = 15
   -> f [1,2,3,4,5] [5,4,3,2,1] = 12
   -> f [10,20,30,40] [3,4,5,6,7] = 50
-}

--Questão 2:
p :: String -> Int
p [] = 0
p (x:xs) | x >= '0' && x <= '9' = (max ((ord x) - 48) (p xs))
         | otherwise            = p xs
{-
  Exemplos:
   -> p "Inf1-FP" = 1
   -> p "Functional" = 0
   -> p "1+1=2" = 2
   -> p "3.157/3 > 19" = 9
-}

--Questão 3:
data Command = Go Int -- move o robô na direção em que estiver
    | Turn -- inverte a direção
    deriving Show

type Position = Int

data Direction = L -- Left
               | R -- Right
               deriving Show

type State = (Position, Direction)

----a)
move :: Command -> State -> State
move (Go 0) (y, z) = (y, z)
move (Go x) (y, R) = move (Go (x-1)) (y+1, R)
move (Go x) (y, L) = move (Go (x-1)) (y-1, L)
move Turn (y, R)   = (y, L)
move Turn (y, L)   = (y, R)
{-
  Exemplos:
   -> move (Go 3) (0,R) = (3,R)
   -> move (Go 3) (0,L) = (-3,L)
   -> move Turn (-2,L) = (-2,R)
-}

----b) (três soluções possíveis)
multimove :: [Command] -> State -> State
multimove [] (y, z)     = (y, z)
multimove (x:xs) (y, z) = multimove xs (move x (y, z))

multimove' list st   = foldr move st (reverse list)

flip' f x y = f y x --Função que inverte a ordem dos parâmetros passados p/ uma função
multimove'' list st = foldl (flip' move) st list
{-
  Exemplos:
   -> multimove [] (3,R) = (3,R)
   -> multimove [Go 3, Turn, Go 4] (0,L) = (1,R)
   -> multimove [Go 3, Turn, Turn] (0,R) = (3,R)
   -> multimove [Go 3, Turn, Go 2, Go 1, Turn, Go 4] (4,L) = (0,L)
-}