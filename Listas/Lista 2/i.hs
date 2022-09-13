-- I. Editor de texto
-- Link: https://www.dikastis.com.br/problems/01EK8KZDTMK13T8RGSVMJ0NBE0

data Cmd = Cursor Int
           | Backspace Int
           | Delete Int
           | Insert String
           deriving (Read)

backspaceCmd :: String -> Int -> Int -> String
backspaceCmd str bckCount curPos = (take (curPos-bckCount) str) ++ (drop curPos str)

insertCmd :: String -> Int -> String -> String
insertCmd [] curPos strToBeInsert                          = strToBeInsert 
insertCmd strBase@(x:xs) curPos strToBeInsert | curPos > 0 = [x] ++ (insertCmd xs (curPos-1) strToBeInsert)
                                              | otherwise  = strToBeInsert ++ strBase
deleteCmd :: String -> Int -> Int -> String
deleteCmd [] curPos dltCount     = []
deleteCmd str 0 0                = str
deleteCmd (x:xs) 0 dltCount      = (deleteCmd xs 0 (dltCount-1))
deleteCmd (x:xs) curPos dltCount = [x] ++ (deleteCmd xs (curPos-1) dltCount)

executCmd :: String -> Int -> [Cmd] -> String
executCmd str curPos []                 = str 
executCmd str curPos ((Cursor x):ys)    = executCmd str (curPos+x) ys
executCmd str curPos ((Backspace x):ys) = executCmd (backspaceCmd str x curPos) (curPos-x) ys
executCmd str curPos ((Delete x):ys)    = executCmd (deleteCmd str curPos x) curPos ys
executCmd str curPos ((Insert x):ys)    = executCmd (insertCmd str curPos x) curPos ys
 
editText :: String -> [Cmd] -> String
editText str commands = (executCmd str 0 commands)

main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result