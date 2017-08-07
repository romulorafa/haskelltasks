{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 2 - Escreva função splitWith tal que splitWith p x retorna a lista
xs que quebra a lista x em elementos para os quais o predicado p é False.
Por exemplo, words poderia ser definida como splitWith isSpace.-}

import Data.Char

splitWith :: [a] -> (a -> Bool) -> [[a]]
splitWith [] _ = [[]]
splitWith x p
    | null x2' = [x1] 
    | otherwise = x1:xs
    where (x1, x2) = break p x'
          xs = splitWith x2' p
          x' = dropWhile p x
          x2' = dropWhile p x2