{-  LINGUAGEM DE PROGRAMAÇÃO 
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012055308 -}

{- EXERCÍCIO 1 (SEÇÃO 1.1): mplemente instâncias de Functor para os construtores de tipos algébricos Id, Tres a b,
definidos abaixo:
data Id a = Id a
data Tres a b c = Tres a b c -}

instance Functor (Id a) where 
  fmap f (Id a) = Id ( f a ) 
 
instance Functor (Tres a b) where 
  fmap f (Tres a b c) = Tres a ( f b ) ( f c)