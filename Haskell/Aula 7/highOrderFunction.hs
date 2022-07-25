applyBinOper :: (t -> t -> t) -> t -> t -> t
applyBinOper f x y = f x y 

{-- 
  Examplos:
  -> applyBinOper (+) 10 20        > 30
  -> applyBinOper (++) "abc" "def" > "abcdef" 
--}