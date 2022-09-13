type Urna = (Int, [(String, Int)])

teste :: [Urna]
teste = [(99, [("Cand1",89), ("Cand2",93), ("Cand3",99), ("Cand4",91)]),
         (98, [("Cand1",85), ("Cand2",98), ("Cand3",89), ("Cand4",90)]),
         (97, [("Cand1",97), ("Cand2",93), ("Cand3",99), ("Cand4",92)])]

separaCandidatos :: Urna -> [String]
separaCandidatos (x,[])     = []
separaCandidatos (x,(y:ys)) = [(fst y)] ++ (separaCandidatos (x,ys))

acessaCandidato :: [String] -> String
acessaCandidato (x:xs) = x

removeCandidato :: [String] -> [String]
removeCandidato (x:xs) = xs 

separaUrna :: String -> Urna -> Int
separaUrna str (x, [])                     = 0
separaUrna str (x,(y:ys)) | str == (fst y) = (snd y) + (separaUrna str (x,ys))
                          | otherwise      = (separaUrna str (x,ys))

separaVotos :: String -> [Urna] -> [(String, Int)]
separaVotos candidato []     = []
separaVotos candidato (x:xs) = [(candidato, (separaUrna candidato x))] ++ (separaVotos candidato xs)

somaVotos :: [(String, Int)] -> Int
somaVotos []     = 0
somaVotos (x:xs) = (snd x) + (somaVotos xs)

contaTodosOsVotos :: [Urna] -> [String] -> [(String, Int)]
contaTodosOsVotos urna []                       = []
contaTodosOsVotos urna@(x:xs) candidatos@(y:ys) = [(y, (somaVotos (separaVotos y urna)))] ++ (contaTodosOsVotos urna (removeCandidato candidatos)) 

-- 1) (todas as funções acima foram utilizadas para a solução da primeira questão)
totalize :: [Urna] -> [(String, Int)]
totalize urna@(x:xs) = (contaTodosOsVotos urna (separaCandidatos x))


removeMaior :: [(String, Int)] -> (String, Int) -> [(String, Int)]
removeMaior [] maior                                       = []
removeMaior cand@((x,y):xs) maior@(l,m) | x == l && y == m = xs
                                        | otherwise        = [(x,y)] ++ (removeMaior xs (l,m))

salvaMaior :: [(String, Int)] -> (String, Int) -> Int -> (String, Int)
salvaMaior [] (l,m) maior                     = (l,m)
salvaMaior ((x,y):xs) (l,m) maior | y > maior = (salvaMaior xs (x,y) y)
                                  | otherwise = (salvaMaior xs (l,m) m)

-- 2) (as funções acima foram utilizadas para a solução da segunda questão)
ordena :: [(String, Int)] -> [(String, Int)]
ordena []   = []
ordena cand = [(salvaMaior cand ("", 0) 0)] ++ (ordena (removeMaior cand (salvaMaior cand ("", 0) 0)))

pegaDois :: String -> String
pegaDois str = (take 2 str)

quebraStr :: String -> [String]
quebraStr []  = []
quebraStr str = [(pegaDois str)] ++ (quebraStr (drop 1 str))

checaQtd :: [String] -> String -> Int
checaQtd [] twoChar                    = 0
checaQtd (x:xs) twoChar | x == twoChar = 1 + (checaQtd xs twoChar)
                        | otherwise    = 0 + (checaQtd xs twoChar)

removeDaLista :: [String] -> String -> [String]
removeDaLista [] str                 = []                
removeDaLista (x:xs) str | x == str  = (removeDaLista xs str)
                         | otherwise = [x] ++ (removeDaLista xs str) 

retornaQtd :: [String] -> String -> [(String, Int)]
retornaQtd strQuebrada twoChar = [(twoChar, (checaQtd strQuebrada twoChar))]

calculaTodasFreq :: String -> [String] -> [(String, Int)]
calculaTodasFreq str []                 = []
calculaTodasFreq str strQuebrada@(x:xs) = (retornaQtd (quebraStr str) x) ++ (calculaTodasFreq str (removeDaLista strQuebrada x))

filtraFreq :: [(String, Int)] -> [(String, Int)]
filtraFreq []                     = []
filtraFreq ((x,y):xs) | y < 2     = (filtraFreq xs) 
                      | otherwise = [(x,y)] ++ (filtraFreq xs)

-- 3) (as funções acima foram utilizadas para a solução da terceira questão)
frequencia :: String -> [(String, Int)]
frequencia str = (filtraFreq (calculaTodasFreq str (quebraStr str)))

data Chaves = No Int String Chaves Chaves | Folha

chaveTeste :: Chaves 
chaveTeste = No 6 "te" (No 4 " t" Folha (No 5 "m " Folha Folha))
                       (No 8 "st" (No 7 "es" Folha Folha) Folha)

varreESubstitui :: Int -> String -> String -> String
varreESubstitui num strSubstituta []                         = []
varreESubstitui num strSubstituta (x:xs) | (show num) == [x] = strSubstituta ++ (varreESubstitui num strSubstituta xs)
                                         | otherwise         = [x] ++ (varreESubstitui num strSubstituta xs)

quebraChaves :: Chaves -> [(Int, String)] 
quebraChaves Folha                          = []
quebraChaves (No num strSubstituta esq dir) = [(num, strSubstituta)] ++ (quebraChaves esq) ++ (quebraChaves dir)

ajustaString :: [(Int, String)] -> String -> String
ajustaString [] str                   = str
ajustaString chaveQuebrada@(x:xs) str = ajustaString xs (varreESubstitui (fst x) (snd x) str)

-- 4) (as funções acima foram utilizadas para a solução da quarta questão)
descompacta :: Chaves -> String -> String
descompacta chaves str = (ajustaString (quebraChaves chaves) str)