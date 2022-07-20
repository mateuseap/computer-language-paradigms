type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Andre","Duna"),("Otavio","Harry Potter"),("Otavio","Superbad")]

livros :: BancoDados -> Pessoa -> [Livro]
livros info name = [snd a|a <- info, fst a == name]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos info book = [fst a|a <- info, snd a == book]

emprestado :: BancoDados -> Livro -> Bool
emprestado info book | emprestimos info book /= [] = True
                     | otherwise                   = False

qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos info name | livros info name /= [] = length(livros info name)
                         | otherwise              = 0

emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar info name book = info++[(name,book)]

devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] name book                        = []
devolver (x:xs) name book | x /= (name,book) = x:(devolver xs name book)
                          | otherwise        = devolver xs name book