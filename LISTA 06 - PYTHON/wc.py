#	LINGUAGEM DE PROGRAMAÇÃO 2017/1
#	PROFESSOR: Carlos Camarão
#	ALUNO: Rômulo Rafael da Silva - 2012055308

# Implementação 1: input arquivo texto

def fileCount(filename):
    txt=open(filename).read()
    countline=len(txt.split("\n"))
    countword=len(txt.split())
    countchar=len(txt.replace("\n","")) # para não contar o '\n'
    return (countchar, countword, countline)	

# Implementação 2: input padrão

def wc (texto):
	countchar = 0
	countword = 0
	countline = 0
	ehstring = False
	naochar = False
	for n in texto:
		countchar += 1
		if (not(n.isspace())):
			ehstring = True
		if (n == "\n" and ehstring):
			countword += 1
			naochar = True
			ehstring = False
		elif (n.isspace() and ehstring):
			countword += 1
			ehstring = False
		elif (n == "\n"):
			naochar = True
			countline += 1
		elif (naochar):
			naochar = False
			countline += 1
	if (ehstring):
		countword += 1
	return (countchar, countword, countline)