data List t = Nil | Cons t (List t)

toList :: List t -> [t]
toList Nil         = []
toList (Cons x xs) = x:(toList xs)

{-
  Exemplo:
  -> toList (Cons 5 (Cons 6 (Cons 7 (Cons 2 Nil))))
     > Output [5,6,7,2]
-}