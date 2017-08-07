#   LINGUAGEM DE PROGRAMAÇÃO - 2017/1
#   PROFESSOR: Carlos Camarão
#   ALUNO: Rômulo Rafael da Silva - 2012055308

import random

print("""************ NIM GAME ***********""")

jogador1= str(input("Digite seu nome: "))
jogador2= "Computador"
numPalitosRemover= 0
fimGame= False
numeroPalitos=random.randint(10,20)

if (numeroPalitos%4)==1:
    numeroPalitos+=1

def removerPalitosComputador():
    removerNumPalitos=random.randint(1,3)
    global numeroPalitos
    while removerNumPalitos>numeroPalitos:
    removerNumPalitos=random.randint(1,3)
    numeroPalitos-=removerNumPalitos
    return numeroPalitos

def removerPalitosJogador():
    global numeroPalitos
    numeroPalitos-=numPalitosRemover
    return numeroPalitos

def fazerMovimentoJogador():
    global numPalitosRemover
    verificaMovimento=False
    while not verificaMovimento:
        print("Sua vez, ",jogador1)
        numPalitosRemover=int(input("Digite quantos palitos quer remover (1 a 3)?: "))
        if  numPalitosRemover>3 or numPalitosRemover<1:
            print("ERRO: Numero invalido. Digite um numero entre 1 e 3.")
        else:
            verificaMovimento=True
    while numPalitosRemover>numeroPalitos:
        print("O numero de palitos atuais eh menor que o numero inserido.")
        numPalitosRemover=int(input("Digite quantos palitos quer remover?"))
    return numPalitosRemover

def verificarVencedor(player):
    if numeroPalitos==0:
        print("Vencedor: ", player)
        global fimGame
        fimGame=True
        return fimGame

def reiniciarJogo():
    global fimGame
    fimGame=False
    return fimGame

def nimGame():
    global numeroPalitos
    numeroPalitos=random.randint(10,20)
    while fimGame==False:
        print("É a vez do ",jogador2, "Total de palitos atuais: ",removerPalitosComputador())
        verificarVencedor(jogador1)
        if fimGame==True:
            break
        fazerMovimentoJogador()        
        print("O numero de palitos sao: ",removerPalitosJogador())
        verificarVencedor(jogador2)

def jogarNovamente():
    resposta=input("Jogar novamente (s/n)?: ")
    reiniciarJogo()
    while resposta=="s":
        nimGame()
    else:
        print("Jogo finalizado.")
        resposta=input("Jogar novamente (s/n)?: ")

nimGame()
jogarNovamente()