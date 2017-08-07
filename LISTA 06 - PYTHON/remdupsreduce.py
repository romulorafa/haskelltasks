#	LINGUAGEM DE PROGRAMAÇÃO 2017/1
#	PROFESSOR: Carlos Camarão
#	ALUNO: Rômulo Rafael da Silva - 2012055308

def remdupsb (texto): return reduce((lambda l,e: l+[e] if (l==[] or l[-1]!=e) else l), texto, [])