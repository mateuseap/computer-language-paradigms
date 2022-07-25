agroupLists :: [[t]] -> [t]
agroupLists []     = []
agroupLists (x:xs) = x ++ agroupLists xs 

countElement :: (Eq t) => t -> [t] -> Int
countElement t list   | list == [] = 0
countElement t (x:xs) | t == x     = 1 + countElement t xs
                      | otherwise  = countElement t xs

pairElementCount :: (Eq t) => t -> [t] -> (t, Int)
pairElementCount t list   | list == [] = (t, 0)
pairElementCount t list = (t, countElement t list)

removeElement :: (Eq t) => t -> [t] -> [t]
removeElement t list   | list == [] = []
removeElement t (x:xs) | t == x     = removeElement t xs
                       | otherwise  = removeElement t (x:xs)

agroup :: (Eq t) => [[t]] -> [(t, Int)]
agroup []   = []
agroup list@(x:xs) = [(pairElementCount (head x) (agroupLists list))] ++ agroup xs