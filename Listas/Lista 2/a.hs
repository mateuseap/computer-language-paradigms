-- A. DNA1
-- Link: https://www.dikastis.com.br/problems/01GAMANBTZB1CZ1YD1EP8JEAVY

data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

strConc :: String -> [String] -> (String, Int)
strConc str []                         = (str, (length str))
strConc str (x:xs) | (length str) >= 8 = (str, (length str))
                   | otherwise         = strConc (str ++ x) xs

removeFromList :: Int -> [String] -> [String]
removeFromList n [] = []
removeFromList n list@(x:xs) | n == 0    = list
                             | otherwise = removeFromList (n-1) xs

treeToList :: Tree Int -> [String]
treeToList Nilt                          = []
treeToList (Node x y z) | (mod x 5) == 0 = (treeToList y) ++ ["E"] ++ (treeToList z)
                        | (mod x 5) == 1 = (treeToList y) ++ ["M"] ++ (treeToList z)
                        | (mod x 5) == 2 = (treeToList y) ++ ["A"] ++ (treeToList z)
                        | (mod x 5) == 3 = (treeToList y) ++ ["C"] ++ (treeToList z)
                        | (mod x 5) == 4 = (treeToList y) ++ ["S"] ++ (treeToList z)

adjustList :: [String] -> [String] 
adjustList []        = []
adjustList listOfStr = [(fst (strConc [] listOfStr))] ++ (adjustList (removeFromList (snd (strConc [] listOfStr)) listOfStr))

dna1 :: Tree Int -> [String]
dna1 tree = adjustList (treeToList tree)

main :: IO ()
main = do
  input <- getLine
  let result = dna1 (read input :: Tree Int)
  print result