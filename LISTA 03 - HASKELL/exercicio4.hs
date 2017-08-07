{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 4 - Escreva, usando foldl ou foldr , uma função que recebe uma lista de cadeias de caracteres
(valores do tipo String) e retorna uma cadeia de caracteres que contém os 3 primeiros carac-
teres de cada cadeia removidos se não forem letras, ou com as letras em caixa alta se forem
letras, e com os demais caracteres depois dos 3 primeiros sem alteração.
Por exemplo, ao receber ["Abcde", "1Abcde", "12Abcde", "123Abcde"] deve retornar
"ABCdeABcdeAbcdeAbcde".-}

{-	PSEUDO IMPLEMENTAÇÃO
	Seriam construidas três funções para realizar as operações:
		1. Definir uma função que recebe uma lista de String que retorna uma String, formada pelos elementos da lista de string
			(definição a partir de foldr ou foldl e implementar com operador de concatenação ++ ou de construção de listas : );
		2. Definir uma função que recebe cada string da lista de string passadas como argumento
			(definição a partir de foldr ou foldl);
		3. Definir uma função que recebe que verifique os 3 primeiros caracteres da string se são letras ou não. Utilizar as funções
		padrões existentes isLetter (verificar se é letra), isDigit (verifica se é número) e toUpper para converter os caracteres necessários
		para caixa alta, maiúsculas;
			(definição utilizando funções pré-existentes isLetter, isDigit e toUpper).
 -}

import Data.Char

retornaString :: [String] -> String
retornaString x = foldr ((++) . alteraString) "" x

alteraString :: [Char] -> [Char]
alteraString y = s 
    where (i, s) = foldl alteraChar (0, "") y

alteraChar :: (Int, [Char]) -> Char -> (Int, [Char])
alteraChar (i, s) c
    | i < 3 && isLetter c = (i+1, s++[toUpper c]) 
    | i < 3 && isDigit c = (i+1, s++[])
    | otherwise = (i, s++[c])