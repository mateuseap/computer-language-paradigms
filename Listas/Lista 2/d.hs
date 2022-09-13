-- D. Fatores Primos
-- Link: https://www.dikastis.com.br/problems/01GAMBA01GY7W30W58P4E2MYQ7

calc_primes :: [Int] -> [Int]
calc_primes (x:xs) = x : calc_primes [y | y <- xs, mod y x /= 0] 

leastPrimeFactor :: Int -> [Int] -> Int
leastPrimeFactor n (x:xs) | mod n x == 0 = x
                          | otherwise    = leastPrimeFactor n xs

primeFactorsList :: Int -> [Int]
primeFactorsList n | n == 1 = []
primeFactorsList n          = [(leastPrimeFactor n (calc_primes [2..n]))] ++ primeFactorsList (div n (leastPrimeFactor n (calc_primes [2..n])))

checkExistingTuple :: Int -> [(Int, Int)] -> [(Int, Int)]
checkExistingTuple n []                    = [(n, 1)]
checkExistingTuple n (x:xs) | n == (fst x) = [((fst x), (snd x)+1)] ++ xs
                            | n > (fst x)  = [x] ++ checkExistingTuple n xs
                            | n < (fst x)  = [(n, 1)] ++ [x] ++ xs

primeFactorsAppears :: [Int] -> [(Int, Int)] -> [(Int, Int)]
primeFactorsAppears [] tupleList     = tupleList
primeFactorsAppears (x:xs) []        = primeFactorsAppears xs (checkExistingTuple x []) 
primeFactorsAppears (x:xs) tupleList = primeFactorsAppears xs (checkExistingTuple x tupleList)

fatPrime :: Int -> [(Int, Int)]
fatPrime n | n == 0  = []
fatPrime n | n == 1  = [(1, 1)]
fatPrime n           = primeFactorsAppears (primeFactorsList n) []

main = do
    sa <- getLine
    let a = read sa :: Int
    let result = fatPrime a
    print result