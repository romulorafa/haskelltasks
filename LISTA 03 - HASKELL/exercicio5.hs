{- LINGUAGEM DE PROGRAMAÇÃO 2017/01º
   PROFESSOR: Carlos Camarão
   ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 5 - Explique porque foldr f x pode não percorrer toda a lista x, ao passo que toda a lista x é
sempre percorrida, no caso de foldl.-}

module Main where

respfoldr = putStrLn "\nfoldr :: (a -> b -> b) -> b -> [a] -> b\nfoldr _ z [] = z\nfoldr f z (a:x) = f a (foldr f z a)\n\n'foldr' é uma função de alta ordem, ou seja, pode retornar ou receber outras funções como parâmetros. É o que ocorre na função 'f a' que é uma função não-estrita, i.e., é uma função não-estrita no segundo argumento, ou seja, este argumento não é completamente avaliado antes da função ser aplicada. Um exemplo típico ocorre, por exemplo, no foldr sobre uma lista infinita de elementos do tipo boolenado [True, False, False,...], aplicando a operação (&&). Quando da primeira ocorrência de False, como não é necessária a construção do segundo argumento, a execução da função termina. Esse fato é denominado 'lazy argument', onde havendo uma construção infinita, é possível gerar um resultado (retorno direto) sem a haver a construção completa.\n"
respfoldl = putStrLn "\nfoldl :: (b -> a -> b) -> b -> [a] -> b\nfoldl _ z [] = z\nfoldl f z (a:x) = foldl f (f z a) x\n\n'foldl' é uma função de alta ordem, com recursividade na cauda. Diferencia de 'foldr', pois é uma função estrita, ou seja, em 'f (f z a)' os argumentos da função são completamente avaliados, então, no caso de 'foldl' a função necessita aguardar o resultado direto da execução 'f z a', permitindo, no caso, percorrer uma lista infinita.\n"