{-	LINGUAGEM DE PROGRAMAÇÃO 2017/1
	PROFESSOR: Carlos Camarão
	ALUNO: Rômulo Rafael da Silva - 2012055308 -}

{- EXERCÍCIO 1 (Seção 3.3.2). Defina a versão dual da combinador de composição-Kleisli, de tipo:
( <= <):: Monad m = > (b - > m c ) - >(a - > m b ) - >(a - > m c ) -}

(.)    ::              (b ->   c) -> (a ->   b) -> (a ->   c)
(<=<)  :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)

{-  Para compor ações, as mônadas foram introduzidas e elas vieram com seus próprios 
operadores de composição. Compare os tipos desses dois operadores de composição: (.) e (<=<).
A única diferença é a adição do m com a restrição Monad . Este é o operador de composição 
para mônadas, é mais restritivo e poderoso do que o operador "."" Operador, o que 
significa que ele pode fazer mais, como seqüenciamento e execução de ações de IO, mas 
também significa que ele funciona com menos tipos.

(<=<)       :: Monad m => (b -> m c) -> (a -> m b) -> (a -> m c)
(<=<)       = flip (>=>)
-}