{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 4 - Usando a função reverse, defina no prelúdio, escreva função palin, que
testa se uma cadeia de caracteres é ou não um palı́ndromo, considerando
apenas caracteres que são letras ou números, e desconsiderando a caixa
de letras. Por exemplo, "A cara rajada da jararaca" e "Madam I’m
Adam" devem ser consideradas como palı́ndromos. Você pode usar isLetter
e isDigit, definidas em Data.Char.-}


import Data.Char (isLetter, isDigit, toLower)


palin :: [Char] -> Bool
palin s = (converterLowerCase s == reverse (converterLowerCase s))

converterLowerCase :: [Char] -> [Char]
converterLowerCase s = [ c | c <- (map toLower s), isLetter c || isDigit c ]