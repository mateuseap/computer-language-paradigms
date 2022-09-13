data Time = Australia | Dinamarca | Franca | Peru 
          | Argentina | Croacia | Islandia | Nigeria | None
          deriving(Eq, Show)

type Jogo = (Time, Int, Time, Int) 

jogos1 :: [Jogo]
jogos1 = [(Australia, 1, Dinamarca, 3), (Franca, 2, Peru, 0), 
          (Australia, 0, Franca, 2),(Dinamarca, 0, Peru, 0), 
          (Dinamarca, 0, Franca, 1), (Australia, 0, Peru, 0), 
          (Argentina, 1, Croacia, 0), (Islandia, 0, Nigeria, 1), 
          (Argentina, 1, Islandia, 0), (Argentina, 1, Nigeria, 1), 
          (Croacia, 0, Islandia, 0), (Croacia, 1, Nigeria, 2)]

-- Questão 1) a)

gols :: Time -> [Jogo] -> Int
gols time []                         = 0
gols time ((i,j,w,k):ys) | time == i = j + (gols time ys)
                         | time == w = k + (gols time ys)
                         | otherwise = gols time ys

-- Questão 1) b)

saldo :: Time -> [Jogo] -> Int
saldo time []                         = 0
saldo time ((i,j,w,k):ys) | time == i = (j-k) + (saldo time ys)
                          | time == w = (k-j) + (saldo time ys)
                          | otherwise = saldo time ys

-- Questão 1) c)

pontos :: Time -> [Jogo] -> Int
pontos time []                                   = 0
pontos time ((i,j,w,k):ys) | time == i && j > k  = 3 + (pontos time ys)
                           | time == i && j == k = 1 + (pontos time ys)
                           | time == w && k > j  = 3 + (pontos time ys)
                           | time == w && k == j = 1 + (pontos time ys)
                           | otherwise           = pontos time ys

-- Questão 1) d)

data Grupo = Grupo Char Time Time Time Time
             deriving(Eq,Show)

-- Questão 1) e) (solução do professor André)

classificados :: Grupo -> [Jogo] -> (Time, Time)
classificados (Grupo name t1 t2 t3 t4) games = (time r1,time r2)
  where
    getData time = (time,pontos time games, saldo time games, gols time games)
    ordena [] = []
    ordena (time1:times) = ordena [x | x <- times, x `gte` time1] ++ [time1] ++ 
                           ordena [y | y <- times, y `lt` time1]
    lt (t1,ponto1,saldo1,gols1) (t2,ponto2,saldo2,gols2) 
        | ponto1 < ponto2 = True
        | ponto1 > ponto2 = False
        | saldo1 < saldo2 = True
        | saldo1 > saldo2 = False
        | gols1 < gols2 = True
        | gols1 >= gols2 = False
    gte dado1 dado2 = not (dado1 `lt` dado2)
    time (t,_,_,_) = t
    (r1:r2:resto) = ordena (map getData [t1,t2,t3,t4])