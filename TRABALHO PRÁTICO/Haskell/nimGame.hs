{-	LINGUAGEM DE PROGRAMAÇÃO - 2017/1
	PROFESSOR: Carlos Camarão
	ALUNO: Rômulo Rafael da Silva (2012055308)-}

import Data.Char -- digitToInt e isDigit

-- Nim Game
jogar :: Board -> Int -> IO ()
jogar board player =
   do novaLinha
      quadro board
      if finalizar board then
         do novaLinha
            putStr "Jogador "
            putStr (show (proximo player))
            putStrLn " Venceu!"
      else
         do novaLinha
            putStr "Jogador " 
            putStrLn (show player)
            row <- isDigito "Entre com o Numero da Linha: "
            num <- isDigito "Palitos para remover:        "
            if validar board row num then
               jogar (mover board row num) (proximo player)
            else
               do novaLinha
                  putStrLn "ERROR: Movimento Invalido"
                  jogar board player
nim :: IO ()
nim = jogar iniciar 1

{- A funcção abaixo implementa o número dos jogadores do game para identificação.
Para representar, os números inteiros "1" e "2" foram utilizados, por ser mais simples -}
proximo :: Int -> Int
proximo 1 = 2
proximo 2 = 1

{- O quadro do game foi implementado através de uma lista que apresenta o número de 
palitos que permanecem em cada linha. O quadro inicial é representado através da lista
[5,4,3,2,1] -} 
type Board = [Int]

iniciar :: Board
iniciar = [5,4,3,2,1]

{- Função para finalizar o jogo. No Nim Game, o jogo é finalizado quando todas as linhas 
não possue palitos restantes -}
finalizar :: Board -> Bool
finalizar = all (== 0)

{- Um movimento no jogo é especificado por um número de linha e o número de palitos a 
serem removidas e é válido se a linha contém pelo menos um palito.
Exemplo:	(i)  A primeira linha contém pelo menos 3 estrelas 
			     > validar iniciar 1 3
			     Verdade
			(ii) A 4ª linha contém menos de 3 estrelas
			     > validar inital 4 3
			     Falso -}
validar :: Board -> Int -> Int -> Bool
validar board row num = board !! (row - 1) >= num

{- Um movimento válido pode ser aplicado a uma linha, gerando uma nova linhsta usando
lista de compreensão para atualizar o número de palitos que permanecem em cada fila
Exemplo: (i) 3 palitos foram removidas na 1 linha
			 > mover iniciar 1 3
             [2,4,3,2,1] -}
mover :: Board -> Int -> Int -> Board
mover board row num = [update r n | (r, n) <- zip [1..] board]
   where update r n = if r == row then (n - num) else n


-- IO 

linha :: Int -> Int -> IO ()
linha row num = do putStr (show row)
                   putStr ": "
                   putStrLn (concat (replicate num "| "))

quadro :: Board -> IO ()
quadro [a,b,c,d,e] = do linha 1 a
                        linha 2 b
                        linha 3 c
                        linha 4 d
                        linha 5 e

isDigito :: String -> IO Int
isDigito prompt = do putStr prompt
                     x <- getChar
                     novaLinha 
                     if isDigit x then
                        return (digitToInt x)
                     else
                        do putStrLn "ERROR: Digito Invalido"
                           isDigito prompt

novaLinha :: IO ()
novaLinha = putChar '\n'