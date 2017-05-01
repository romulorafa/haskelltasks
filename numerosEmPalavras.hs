{-  LINGUAGEM DE PROGRAMAÇÃO 2017/01º
    PROFESSOR: Carlos Camarão
    ALUNO: Rômulo Rafael da Silva - 2012053308

EXERCÍCIO 1 - Defina função numerosEmPalavras, que converte um número inteiro, que
representa uma quantia em dinheiro usado no Brasil, isto é, em reais, em
palavras.
Exemplos:
numerosEmPalavras 1000 retorna "mil reais".
numerosEmPalavras 1024 retorna "mil e vinte e quatro reais".
numerosEmPalavras 1324 retorna "mil, cento e vinte e quatro reais"-}


import Data.Map


numerosEmPalavras :: Int -> String
numerosEmPalavras n = converterThousands n ++ " reais"

units = fromList[(0, "zero"), (1, "um"), (2, "dois"), (3, "tres"), (4, "quatro"), (5, "cinco"), (6, "seis"), (7, "sete"), (8, "oito"), (9, "nove")]
teens = fromList[(0, "dez"), (1, "onze"), (2, "doze"), (3, "treze"), (4, "quatorze"), (5, "quinze"), (6, "dezesseis"), (7, "dezessete"), (8, "dezoito"), (9, "dezenove")]
tens = fromList[(2, "vinte"), (3, "trinta"), (4, "quarenta"), (5, "cinquenta"), (6, "sessenta"), (7, "setenta"), (8, "oitenta"), (9, "noventa")]
hundreds = fromList[(1, "cento"), (2, "duzentos"), (3, "trezentos"), (4, "quatrocentos"), (5, "quinhentos"), (6, "seiscentos"), (7, "setecentos"), (8, "oitocentos"), (9, "novecentos")]

converterUnits :: Int -> String
converterUnits n = units!n

converterTens :: Int -> String
converterTens n
    |d == 0 = converterUnits u
    |d == 1 = teens!u
    |d >= 2 && u == 0 = tens!d  
    |d >= 2 && u /= 0 = tens!d ++ " e " ++ converterUnits u
    where (d, u) = (div n 10, mod n 10)

converterHundreds :: Int -> String
converterHundreds n
    |c == 0 = converterTens (mod n 100)
    |c == 1 && converterTens (mod n 100) == "zero" = "cem"
    |c > 1 && converterTens (mod n 100) == "zero" = hundreds!c
    |c >= 1 = hundreds!c ++ " e " ++ converterTens (mod n 100)
    where (c, d, u) = (div n 100, div (mod n 100) 10, mod n 10)

converterThousands :: Int -> String
converterThousands n
    |m == 0 = converterHundreds (mod n 1000)
    |m == 1 && converterHundreds (mod n 1000) == "zero" = "mil"
    |m == 1 && c /= 0 && (d /= 0 || u /= 0) = "mil, " ++ converterHundreds (mod n 1000) 
    |m == 1 = "mil e " ++ converterHundreds (mod n 1000)
    |m > 1 && converterHundreds (mod n 1000) == "zero" = converterHundreds m ++ " mil"
    |m > 1 && c /= 0 && (d /= 0 || u /= 0) = converterHundreds m ++ " mil, " ++ converterHundreds (mod n 1000) 
    |m > 1 = converterHundreds m ++ " mil e " ++ converterHundreds (mod n 1000)
    where (m, c, d, u) = (div n 1000, div (mod n 1000) 100, div (mod n 100) 10, mod n 10)