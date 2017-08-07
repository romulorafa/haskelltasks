{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 6 - A função remdups remove elementos iguais adjacentes de uma lista, conservando só um dos
elementos. Por exemplo, remdups [1,2,2,3,3,3,1,1] = [1,2,3,1].
Defina remdups usando foldr ou foldl ..-}

remdupsr :: Eq a => [a] -> [a]
remdupsr [] = []
remdupsr ys = foldr juntar [] ys

juntar :: Eq a => a -> [a] -> [a]
juntar x [] = [x]
juntar x xs
    | x == head xs = xs
    | otherwise    = x:xs