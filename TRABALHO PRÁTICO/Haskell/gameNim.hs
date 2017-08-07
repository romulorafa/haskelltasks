{-  LINGUAGEM DE PROGRAMAÇÃO - 2017/1
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva (2012055308)-}

import System.IO
import Data.Char
import Data.List
import Text.Show

{-  Game Nim 
    O jogo finaliza quando as linhas estão vazias / zeradas -}
nimPc :: [Int] -> IO [Int] -- jogo com o computador
nimPc [] = return []
nimPc [0,0,0] = return []
nimPc xs =  do
             a <- jogador1 xs
             exibirJogoPc a 1
             b <- pc a
             exibirJogoPc b 2
             nimPc b

nim :: [Int] -> IO [Int] -- jogo entre dois jogadores
nim [] = return [] 
nim [0,0,0] = return []
nim xs =  do
             a <- jogador1 xs
             exibirJogo a 1
             b <- jogador2 a
             exibirJogo b 2
             nim b

-- -----------------------------------------------------------------------------------------------
{- Carregamento inicial do jogo com o estado inicial do jogo -}
iniciarJogo = [3,4,5]

main = do putStrLn " Jogador 1 ou Jogador 2: "
          opcao <- readLn
          exibirJogo iniciarJogo 3
          if opcao == 1 then nimPc iniciarJogo
                         else nim  iniciarJogo

{- Processamento da jogada do jogador 1 -}
jogador1 :: [Int] -> IO [Int]
jogador1 xs =  do
                   putStrLn "\nJogador 1 \n"
                   putStrLn "Digite a linha da proxima jogada: "
                   linhaJogador1 <- readLn
                   putStrLn "Digite o valor da proxima jogada: "
                   valorJogador1 <- readLn
                   putStrLn "\nNim Game Status: \n"
                   return $ atualizaJogo xs linhaJogador1 valorJogador1

{- Processamento da jogada do jogador 2 -}
jogador2 :: [Int] -> IO [Int]
jogador2 [0,0,0] = return []
jogador2 xs =  do
                   putStrLn "\nJogador 2 \n"
                   putStrLn "Digite a linha da proxima jogada: "
                   linhaJogador2 <- readLn
                   putStrLn "\nDigite o valor da proxima jogada: "
                   valorJogador2 <- readLn
                   putStrLn "\nNim Game Status: \n"
                   return $ atualizaJogo xs linhaJogador2 valorJogador2

{- Processamento da jogada automática do computador -}
pc :: [Int] -> IO [Int]
pc [0,0,0] = return []
pc xs =  do
             putStrLn "\nNim Game Status: \n"
             linhaPc <- linePc xs
             valorPc <- valuePc xs linhaPc
             return $ atualizaJogo xs linhaPc valorPc

linePc :: [Int] -> IO Int -- gera qual linha da jogada para tirar o palito
linePc (x:xs) = do
                   if x > head xs && x > last xs
                     then return $ 1
                     else if head xs > x && head xs > last xs
                         then return $ 2
                         else if last xs > head xs && last xs > x
                             then return $ 3
                             else return $ 1

valuePc :: [Int] -> Int -> IO Int -- gera quantos palistos serão retirados na linha da jogada
valuePc (x:xs) row_picked = do
                           if row_picked == 1 && head xs == 0 && last xs == 0
                             then return $ x
                             else if row_picked == 2 && x == 0 && last xs == 0
                                 then return $ head xs
                                 else if row_picked == 3 && x == 0 && head xs == 0
                                     then return $ last xs
                                     else if row_picked == 1 && head xs == 1 && last xs == 1
                                         then return $ x
                                         else if row_picked == 2 && x == 1 && last xs == 1
                                             then return $ head xs
                                             else if row_picked == 3 && x == 1 && head xs == 1
                                                 then return $ last xs
                                                 else return $ 1

{- Exibi o status do jogo atual, o caso de algum jogador ganhar no modo dois jogadores e, quando aplicálve, 
finaliza o jogo -}
exibirJogo :: [Int] -> Int -> IO ()
exibirJogo [] _ = return()
exibirJogo xs player | sum xs == 0 && player == 1 = putStrLn $ "Vencedor: Jogador 1"
                       | sum xs == 0 && player == 2 = putStrLn $ "Vencedor: Jogador 2"
exibirJogo xs player = do
                    putStrLn $ show (length xs) ++ " -> " ++ replicate (last xs) '|'
                    exibirJogo (init xs) 0

{- Exibi o status do jogo atual, o caso de algum jogador ganhar no modo jogador vs. PC e, quando aplicálve, 
finaliza o jogo -}
exibirJogoPc :: [Int] -> Int -> IO ()
exibirJogoPc [] _ = return()
exibirJogoPc xs player | sum xs == 0 && player == 1 = putStrLn $ "Vencedor: Jogador 1"
                       | sum xs == 0 && player == 2 = putStrLn $ "Vencedor: Computador"
exibirJogoPc xs player = do
                    putStrLn $ show (length xs) ++ " -> " ++ replicate (last xs) '|'
                    exibirJogoPc (init xs) 0

{- Atualiza o estado atual -}
atualizaJogo :: [Int] -> Int -> Int -> [Int]
atualizaJogo [] _ _ = []
atualizaJogo [0,0,0] _ _ = []
atualizaJogo (x:xs) row take_amnt | sum(x:xs) == 0 = []
                                 | row == 1 = x - take_amnt:xs
                                 | row == 2 = x : head(xs) - take_amnt : tail(xs)
                                 | row == 3 = x : head(xs) : [last(xs) - take_amnt]
-- ------------------------------------------------------------------------------------------------------------------