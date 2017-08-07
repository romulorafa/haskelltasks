{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 1 - Escreva, usando foldl ou foldr uma função que recebe uma lista de cadeias de caracteres (va-
lores do tipo String) e retorna uma cadeia de caracteres que contém os 3 primeiros caracteres
de cada cadeia.
Por exemplo, ao receber ["Abcde", "1Abcde", "12Abcde", "123Abcde"] deve retornar
"Abc1Ab12A123". -}

retorna3PrimeirosCaracteres :: [String] -> String
retorna3PrimeirosCaracteres x = foldr ((++) . take 3) "" x

retorna3PrimeirosCaracteres' :: [String] -> String
retorna3PrimeirosCaracteres' [] = ""
retorna3PrimeirosCaracteres' (x:xs) = (take 3 x) ++ retorna3PrimeirosCaracteres' xs