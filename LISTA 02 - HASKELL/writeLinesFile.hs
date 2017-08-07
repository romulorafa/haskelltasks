{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 3 - Usando lines, words e map, defina função que leia um arquivo
texto de entrada e imprima em um arquivo de saı́da de mesmo nome mas 
extensão ".sai" a primeira palavra de cada linha do arquivo de entrada.
Para ler um arquivo, use: readFile:: FilePath -> IO String; o (primeiro) argumento de readFile é o nome do arquivo.
Para imprimir, use writeFile:: FilePath -> String -> IO ().
Nota: writeFile arq s escreve s no arquivo de nome arq.
Use notação do para escrever ações (valores construı́dos com o construtor
de tipos IO).-}

import System.FilePath
import Data.Char
import Data.List

writeLinesFile :: FilePath -> IO ()
writeLinesFile arquivo = do {texto <- (readFile arquivo);
                             writeFile (addExtension arquivo ".sai") (alteraText(lines texto))}

alteraText :: [String] -> String
alteraText [] = []
alteraText (x:xs) = head (words x) ++ "\n" ++ alteraText xs
