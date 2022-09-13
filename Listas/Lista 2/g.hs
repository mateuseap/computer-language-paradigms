-- G. Calculadora arbórea
-- Link: https://www.dikastis.com.br/problems/01EK7TQ1WC7BHVT5P5MPAHVS74

data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt x)       = x
evalTree (Node MUL y z) = (evalTree y) * (evalTree z)
evalTree (Node SUM y z) = (evalTree y) + (evalTree z)
evalTree (Node SUB y z) = (evalTree y) - (evalTree z)

main = do
    s <- getLine
    let result = evalTree (read s)
    print result