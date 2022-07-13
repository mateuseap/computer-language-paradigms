fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

listFib :: Int -> [Int]
listFib 0 = [fib 0]
listFib n = listFib (n-1) ++ [fib n]