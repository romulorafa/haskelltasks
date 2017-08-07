{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 3 - Escreva, usando foldr ou foldl , uma função que recebe uma lista de valores de tipo Item, da
definição acima, e retorna o nome da pessoa mais nova da lista..-}


data Item = Item { nome :: Nome
                 , idade :: Idade
                 , rg :: RG
                 }
type Nome = String
type Idade = Int
type RG = String


retornaMaisNovo :: [Item] -> Nome
retornaMaisNovo x = selecionaNome (foldl pesquisaMaisNovo ("", maxBound) x)
    where pesquisaMaisNovo (y, z) a
                            | idade a < z = (nome a, idade a)
                            | otherwise = (y, z)

selecionaNome :: (Nome, Idade) -> Nome
selecionaNome (nome, _) = nome

{-
COLA:	Module: 	Prelude
		Function: 	maxBound
		Type: 	Bounded a => a
		Class: 	Bounded
		Description: 	
		Related:
		--> Bounded: são os tipos que possuem limites - máximo e mínimo. 	

DÚVIDA: Quanto a implementação da função PesquisaMaisNovo, pensei
em tentar realizar uma implementação informando o seu tipo. Haveria
então, um bloco da função pesquisaMaisNovo, com seu tipo e suas
construções. Não tive sucesso. Seria possível tal implementação? 
E não dentro do where-}