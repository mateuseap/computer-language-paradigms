-- Definindo a assinatura de uma classe
class Visible t where
  toString :: t -> String
  size :: t -> Int

-- Definindo a instância de uma classe
instance Visible Char where
  toString ch = [ch]
  size _ = 1

{- Classes predefinidas

  -> show ::
  -> read ::
-}