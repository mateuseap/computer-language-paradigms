module Set (Set, mkSet) where

data Set t = Set [t]
  deriving (Show)

instance Eq t => Eq (Set t) where
  (Set []) == (Set []) = True
  (Set (x:xs)) == (Set (y:ys)) = eqSet (x:xs) (y:ys)
  _ == _ = False

mkSet :: [t] -> Set t
mkSet lista = Set lista

eqSet :: Eq t => [t] -> [t] -> Bool
eqSet set1 set2 = subSet set1 set2 && subSet set2 set1

subSet :: Eq t => [t] -> [t] -> Bool
subSet set1 []     = True
subSet set1 (y:ys) = elem y set1 && subSet set1 ys