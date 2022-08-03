{-
  Realizar uma função que:
  -> Receba uma função de dois parâmetros (ex: div);
  -> Receba os dois parâmetros dessa função (ex: 10 20);
  -> Por fim, inverta a ordem dos parâmetros recebidos e depois aplique a função.
     [] inv div 2 10
     [] div (10 2)
     [] 5
-}

inv :: (t -> u -> v) -> (t -> u -> v)
inv f y x = f x y