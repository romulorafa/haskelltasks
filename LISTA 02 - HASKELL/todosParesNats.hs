{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 4 - Considere a definição:
todosParesNats = [(x,d-x) | d <- [0..], x <- [0..d]]
Reescreva todosParesNats sem usar essa notação especial de Haskell para
definição de listas, com geradores e filtragem.
Dica: use map.-}


todosParesNats :: Int -> [(Int, Int)]
todosParesNats d = fazPares (fazLista d) d ++ todosParesNats (d+1)

fazLista :: Int -> [Int]
fazLista 0 = [0]
fazLista n = fazLista (n-1) ++ [n]

fazPares :: [Int] -> Int -> [(Int, Int)]
fazPares [] _ = []
fazPares (x:xs) d 
    | x == d = [(x, d-x)] 
    | otherwise = [(x, d-x)] ++ fazPares xs d

main = print $ todosParesNats 0