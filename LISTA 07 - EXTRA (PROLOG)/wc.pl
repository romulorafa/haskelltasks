%	LINGUAGEM DE PROGRAMAÇÃO 2017/ 1
%	PROFESSOR: Carlos Camarão
%	ALUNO: Rômulo Rafael da Silva

%	LISTA 1 - Ex. 4

countchar([ ],0).
countchar([_| Cauda], N) :-
countchar(Cauda, N1),
N is N1 + 1.

countword(Elem,[ ],0).
countword(Elem,[Elem|Y],N) :-
countword(Elem,Y,N1),
N is N1 + 1.
countword(Elem,[Elem1|Y], N) :-
Elem \== Elem1,
countword(Elem,Y,N)
N is N1 + 1.

countline(Elem,[ ],0).
countline(Elem,[Elem|Y],N) :-
countline(Elem,Y,N1),
N is N1 + 1.
countline(Elem,[Elem1|Y], N) :-
Elem \== Elem1,
countline(Elem,Y,N)
N is N1 + 1.

wc(X) :-
	write('('), countchar(X), write(' '),
	countword(' ',X), write(' '), countline('\l', X).