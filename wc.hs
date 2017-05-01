{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 3 - Escreva função wc que recebe cadeia de caracteres (valor de tipo String) e
retorne uma tripla contendo o número de caracteres, o número de palavras
e o número de linhas da cadeia.
Use a função isSpace, definida em Data.Char, para testar se um caractere
é um espaço (separador de palavras).
Veja a definição da função words, no prelúdio, mas como exercı́cio no uso
da linguagem Haskell calcule o número de palavras, carateres e linhas em
um único passo sobre o texto (cadeia de caracteres)-}


import Data.Char (isSpace)


wc :: [Char] -> (Int, Int, Int)
wc s = (c, w, l)
    where (inWord, inLine, c, w, l) = foldl toUpdateCount (False, True, 0, 0, 1) s

toUpdateCount :: (Bool, Bool, Int, Int, Int) -> Char -> (Bool, Bool, Int, Int, Int)
toUpdateCount (inWord, inLine, c, w, l) s | s == '\n' && inLine == True = (inWord, False, c+1, w, l)
                                                           | s == '\n' && inLine == False = (inWord, False, c+1, w, l+1)
                                                           | isSpace s && inLine == False = (False, True, c+1, w, l+1)
                                                           | isSpace s && inLine == True && inWord == True = (False, inLine, c+1, w, l)
                                                           | isSpace s && inLine == True && inWord == False = (inWord, inLine, c+1, w, l)
                                                           | inWord == False = (True, True, c+1, w+1, l)
                                                           | otherwise = (True, True, c+1, w, l)


{- BASELINE: Função que usei para comparar os resultados -}
count :: String -> (Int, Int, Int)
count str = (length str, length $ words str, length $ lines str)

