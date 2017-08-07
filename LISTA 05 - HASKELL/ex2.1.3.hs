{-  LINGUAGEM DE PROGRAMAÇÃO 
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012055308 -}

{- EXERCÍCIO 3 (SEÇÃO 2.1) Considere o registro e a função definidas a seguir: 

data InfoPessoa = InfoP { nome :: String ,
                          ocup :: String ,
                          area :: String }

getInfoP :: [( String , Maybe String )] -> Maybe InfoPessoa
getInfoP x = case lookup " nome " x of
               Just ( Just nome@ ( _ : _ )) ->
                 case lookup " ocup " x of
                   Just ( Just ocup@ ( _ : _ )) ->
                     case lookup " area " x of
                       Just ( Just area@ ( _ : _ )) ->
                         Just ( InfoP nome ocup area )
                       _ -> Nothing -- falta area
                   _ -> Nothing -- falta ocup
               _ -> Nothing -- falta nome

Redefina getInfoP usando a instância de Maybe para Applicative, de modo a evitar
o código com testes seguidos acima, um após o outro. Use a função liftA3. -}

import Control.Applicative (liftA3)
import Data.Maybe (fromJust)

data InfoPessoa = InfoP { nome :: String ,
                          ocup :: String ,
						              area :: String }
  deriving (Show)

getInfoP :: [( String , String )] -> Maybe InfoPessoa
getInfoP x = case lookup " nome " x of
               Just (nome@(_:_)) ->
                 case lookup " ocup " x of
                   Just (ocup@(_:_)) ->
                     case lookup " area " x of
                        Just (area@(_:_)) ->
                          Just ( InfoP nome ocup area )
                        _ -> Nothing -- falta area
                    _ -> Nothing -- falta ocup
                _ -> Nothing -- falta nome						  
						  
{-
getInfoP' :: [(String, Maybe String)] -> Maybe InfoPessoa
getInfoP' x = liftA3 (\mNome mOcup mArea -> InfoP (fromJust mNome) (from Just mOcup) (fromJust mArea))
				     (lookup "nome" x) (lookup "ocup" x) (lookup "area" x) {- lookup pega uma lista de pares
e tem tipo lookup :: [(a,b] --> Maybe b -}
main = print "" -}

f x = pure InfoP <*> (lookup "nome" x) <*> (lookup "ocup" x) <*> (lookup "area" x)
g x = liftA3 InfoP (lookup "nome" x) (lookup "ocup" x) (lookup "area" x)