data List t = Nil | Cons t (List t)
              deriving(Eq, Show)

fromList :: [t] -> List t
fromList []     = Nil
fromList (x:xs) = Cons x (fromList xs)

{-
  Exemplo:
  -> fromList [5,6,7,2]
     > Output Cons 5 (Cons 6 (Cons 7 (Cons 2 Nil)))
-}