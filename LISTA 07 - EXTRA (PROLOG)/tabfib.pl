%	LINGUAGEM DE PROGRAMAÇÃO 2017/ 1
%	PROFESSOR: Carlos Camarão
%	ALUNO: Rômulo Rafael da Silva

%	LISTA 1 - Ex, 2

tabfib(A) :-
	write(A), write(' '), fib(A, X),
	(A >= 0 -> tabfib(A-1), write('\l');
		write('\l') 
	).

fib(0,0).
fib(1,1).
fib(X, Ans) :- Xm1 is X – 1 ,Xm2 is X – 2 ,
fib(Xm1, Sub1), fib(Xm2, Sub2),
Ans is Sub1 + Sub2.


