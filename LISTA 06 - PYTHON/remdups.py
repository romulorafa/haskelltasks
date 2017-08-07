#	LINGUAGEM DE PROGRAMAÇÃO 2017/1
#	PROFESSOR: Carlos Camarão
#	ALUNO: Rômulo Rafael da Silva - 2012055308

def remdups (texto):

	n = len(texto)-1
	
	while (n>0):
	
		if (texto[n] == texto[n-1]):
			texto.pop(n-1)
		n -= 1
	
	return texto
