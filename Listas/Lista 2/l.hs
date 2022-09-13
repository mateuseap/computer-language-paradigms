-- L. Calculadora
-- Link: https://www.dikastis.com.br/problems/01EJ4TJV7XT8F6XFQMMNFZT445

type Comando = String
type Valor = Int

executaComando :: Int -> Comando -> Int -> Int
executaComando x "Divide" 0                    = -666
executaComando x cmnd y | cmnd == "Multiplica" = x * y
                        | cmnd == "Soma"       = x + y
                        | cmnd == "Subtrai"    = x - y
                        | cmnd == "Divide"     = div x y

executaTodosComandos :: [(Comando, Valor)] -> Int -> Int
executaTodosComandos list actualValue | actualValue == -666 = -666
executaTodosComandos [] actualValue     = actualValue
executaTodosComandos (x:xs) actualValue = executaTodosComandos xs (executaComando actualValue (fst x) (snd x))

executa :: [(Comando, Valor)] -> Int
executa list = executaTodosComandos list 0

main = do
    a <- getLine
    let result = executa (read a)
    print result
