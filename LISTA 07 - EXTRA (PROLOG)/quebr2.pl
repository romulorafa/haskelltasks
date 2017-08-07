%	LINGUAGEM DE PROGRAMAÇÃO 2017/ 1
%	PROFESSOR: Carlos Camarão
%	ALUNO: Rômulo Rafael da Silva

%	LISTA 2 - Ex. 1

quebr2(L, A, B) :-
    append(A, B, L),
    length(A, N),
    N1 is N + 1,
    length(B, N1).

