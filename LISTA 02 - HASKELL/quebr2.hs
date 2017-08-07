{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 1 - Defina uma função quebr2 que separe uma lista x em duas
metades (x 1 , x 2 ), tais que x 1 ++ x 2 = x e o comprimento de x 1 é igual
ao de x 2 (se o tamanho de x for par) e um a menos do que o de x 2 caso
contrário.
Por exemplo:
quebr2 [1,2,3,4,5,6] = ([1,2,3],[4,5,6])
quebr2 [1,2,3,4,5,6,7] = ([1,2,3],[4,5,6,7])-}

quebr2 :: [a] -> ([a], [a])
quebr2 myList = splitAt (((length myList)) `div` 2) myList
main = do
        print $ quebr2 [1]

