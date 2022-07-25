takeWhile' :: (t -> Bool) -> [t] -> [t]
takeWhile' p []                 = []
takeWhile' p (x:xs) | p x       = x : takeWhile' p xs
                    | otherwise = []

dropWhile' :: (t -> Bool) -> [t] -> [t]
dropWhile' p []                 = []
dropWhile' p list@(x:xs) | p x       = dropWhile' p xs
                         | otherwise = list