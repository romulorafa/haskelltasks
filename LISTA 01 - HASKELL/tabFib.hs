{-	LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 2 - Defina função tabFib, que recebe inteiro n e retorna tabela (cadeia de
caracteres) com n linhas, cada linha contendo i e (fib i), para i de 1 a n.
A complexidade da função da função fib definida deve ser linear.-}


tabFib :: Integer -> IO()
tabFib n = putStrLn(toListFib n 0)

toListFib :: Integer -> Integer -> String
toListFib n i 
    | i == 0 = "i\tfibonacci(i)\n" ++ toListFib n (i+1)
    | i > 0 && i <= n = show i ++ "\t" ++ show (fib i)  ++ "\n" ++ toListFib n (i+1) 
    | otherwise = ""

fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

