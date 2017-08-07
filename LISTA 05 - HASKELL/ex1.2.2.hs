{-  LINGUAGEM DE PROGRAMAÇÃO 
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012055308 -}

{- EXERCÍCIO 2 (SEÇÃO 1.1): Prove as propriedades id_funtor e 
comp_funtor, definidas no exercı́cio resolvido 3 da subseção 
anterior, para os construtores de tipos algébricos definidos 
no exercı́cio acima. -}

id_funtor :: ( Functor f , Eq ( f a )) = > f a -> Bool
id_funtor x = fmap id x == x

	 fmap id ( Id a)
= { def. fmap para Id }
	 Id ( id a ) (
= { def. id }
	 Id a 
	 fmap ( f . g ) ( Id a)
= { def. fmap para Id }
	 Id (( f . g ) a ) 
= { def. (.) }
	 Id( f ( g a )) 
= { def. fmap para Id }
	 fmap f ( Id ( g a ))
= { def. fmap para Id }
	 fmap f ( fmap g ( Id a ))


comp_funtor ::( Functor f , Eq ( f c ))= >( a - > b ) - >(b - > c ) - > f a - > Bool
comp_funtor f g x = fmap g ( fmap f x ) == fmap ( f . g ) x

	 fmap id ( Tres a b c )
= { def. fmap para Tres }
	 Par ( id a ) ( id b) ( id c )
= { def. id }
	 Tres a b c
	 fmap ( f . g ) ( Tres a b c)
= { def. fmap para Tres }
	 Tres (( f . g ) a ) (( f . g ) b ) (( f . g ) c )
= { def. (.) }
	 Tres ( f ( g a )) ( f ( g b )) ( f ( g c ))
= { def. fmap para Tres }
	 fmap f ( Tres ( g a ) ( g b ) ( g b ))
= { def. fmap para Tres }
	 fmap f ( fmap g ( Tres a b c ))