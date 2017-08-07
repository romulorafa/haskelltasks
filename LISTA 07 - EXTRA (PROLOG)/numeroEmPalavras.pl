%	LINGUAGEM DE PROGRAMAÇÃO 2017/ 1
%	PROFESSOR: Carlos Camarão
%	ALUNO: Rômulo Rafael da Silva

%	LISTA 1 - Ex. 1

numerosEmPalavras(X) :-
    converter_num(X, 9, L),
    reverse(L, Digits),
    full_words9(Digits).

unidades(0).
unidades(1) :- write(um).
unidades(2) :- write(dois).
unidades(3) :- write(três).
unidades(4) :- write(quatro).
unidades(5) :- write(cinco).
unidades(6) :- write(seis).
unidades(7) :- write(sete).
unidades(8) :- write(oito).
unidades(9) :- write(nove).

teens(0) :- write(dez).
teens(1) :- write(onze).
teens(2) :- write(doze).
teens(3) :- write(trez).
teens(4) :- write(quatroze).
teens(5) :- write(quize).
teens(6) :- write(dezesseis).
teens(7) :- write(dezessete).
teens(8) :- write(dezoito).
teens(9) :- write(dezenove).

dezenas(2) :- write(vinte).
dezenas(3) :- write(trinta).
dezenas(4) :- write(quarenta).
dezenas(5) :- write(cinquenta).
dezenas(6) :- write(sessenta).
dezenas(7) :- write(setenta).
dezenas(8) :- write(oitenta).
dezenas(9) :- write(noventa).

centenas(1) :- write(cem).
centenas(2) :- write(duzentos).
centenas(3) :- write(trezentos).
centenas(4) :- write(quatrocentos).
centenas(5) :- write(quinhentos).
centenas(6) :- write(seiscentos).
centenas(7) :- write(setecentos).
centenas(8) :- write(oitocentos).
centenas(9) :- write(novecentos).

% converter_words2 é a combinação de B e C
% para dois digitoss
converter_words2([B, C]) :-
    B = 0, !, unidades(C).
converter_words2([B, C]) :-
    B = 1, !, teens(C).
converter_words2([B, 0]) :-
    !, dezenas(B).
converter_words2([B, C]) :-
    dezenas(B), write(' '), write('e'), write(' '), unidades(C).

converter_words3([A, B, C]) :-
    A = 0, !, converter_words2([B, C]).
converter_words3([A, 0, 0]) :-
    !, centenas(A).
converter_words3([A, B, C]) :-
	A = 1, !, write('cento e '), converter_words2([B, C]).
converter_words3([A, B, C]) :-
    centenas(A), write(' e '), converter_words2([B, C]).

converter_words6([A, B, C, D, E, F]) :-
    A = 0, B = 0, C = 0, !,
    converter_words3([D, E, F]).
converter_words6([A, B, C, D, E, F]) :-
    converter_words3([A, B, C]),
    write(' mil, '),
    converter_words3([D, E, F]).

full_words9([A, B, C, D, E, F, G, H, I]) :-
    A = 0, B = 0, C = 0, !,
    converter_words6([D, E, F, G, H, I]).
full_words9([A, B, C, D, E, F, G, H, I]) :-
    converter_words3([A, B, C]),
    write(' milhões, '),
    converter_words6([D, E, F, G, H, I]).

converter_num(_, 0, []) :- !.
converter_num(X, N, L) :-
    Q is X // 10,
    R is X mod 10,
    N1 is N - 1,
    converter_num(Q, N1, L1),
    L = [R | L1].