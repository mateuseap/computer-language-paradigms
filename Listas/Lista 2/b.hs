-- B. DNA2
-- Link: https://www.dikastis.com.br/problems/01GAMAV0ZXGV86Z8BFXTQTDD4E

first :: (x,y,z) -> x
first (x,_,_) = x

second :: (x,y,z) -> y
second (_,y,_) = y

third :: (x,y,z) -> z
third (_,_,z) = z

vecProduct :: String -> String -> Float
vecProduct [] []                     = 0.0
vecProduct str1 []                   = 0.0
vecProduct [] str2                   = 0.0
vecProduct (x:xs) (y:ys) | x == y    = 1.0 + (vecProduct xs ys)
                         | otherwise = (vecProduct xs ys)

prob :: [String] -> [String] -> [Float]
prob [] []         = []
prob strList1 []   = []
prob [] srtList2   = []
prob (x:xs) (y:ys) = [((vecProduct x y)/(fromIntegral (max (length x) (length y))))] ++ (prob xs ys)

defineDna :: [Float] -> (Int,Int,Int) -> (Int,Int,Int)
defineDna [] triple                             = triple
defineDna (x:xs) (y,z,w) | x >= 0.8             = (defineDna xs (y,z,w+1))
                         | x >= 0.4 && x <= 0.7 = (defineDna xs (y,z+1,w))
                         | x >= 0.1 && x <= 0.3 = (defineDna xs (y+1,z,w))
                         | otherwise            = (defineDna xs (y,z,w))


result :: [String] -> [String] -> [Int]
result strList1 strList2 = [(first (defineDna (prob strList1 strList2) (0,0,0)))] ++ [(second (defineDna (prob strList1 strList2) (0,0,0)))] ++ [(third (defineDna (prob strList1 strList2) (0,0,0)))]

dna2 :: [String] -> [String] -> [Int]
dna2 strList1 strList2 = (result strList1 strList2)

main = do
  firstExtract <- words <$> getLine                       -- equivalente a (read firstExtract :: [String])
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result