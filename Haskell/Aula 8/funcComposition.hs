(...) :: (u -> v) -> (t -> u) -> (t -> v)
(...) f g x = f (g x)

-- Função que retorna uma função aplicada 2x:
twice :: (t -> t) -> (t -> t)
twice f = f . f
{-
  Exemplo:
  -> (twice succ) 12:
     [] (succ . succ) 12
     [] succ (succ 12)
     [] 14
-}

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f) . f
{-
  Exemplo:
  -> (iter 10 double) 3
-}