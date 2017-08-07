{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 2 - Escreva, usando foldr ou foldl , uma função que recebe uma lista de itens (valores de tipo
Item, veja definição a seguir) e retorna a soma das idades (valores do campo Idade) de todos
os elementos da lista.
data Item Pessoa Nome Idade RG
type Nome = String 
type Idade = Integer
type RG = String -}

data Item = Item { nome :: Nome
                 , idade :: Idade
                 , rg :: RG
                 }
type Nome = String
type Idade = Integer
type RG = String

retornaSomaIdades :: [Item] -> Idade
retornaSomaIdades x = foldr ((+) . idade) 0 x