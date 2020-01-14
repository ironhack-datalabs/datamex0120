from palitosb import *
import random
from os import system

nom1 = input("Enter Player1's name: ")
nom2 = input("Enter Player2's name: ")

jug1 = manos(nom1)
jug2 = manos(nom2)

lista_jug = [jug1,jug2]
turn = random.randint(1,2)

print('\n'+score(jug1, jug2))

while True:
    print("\nTurno de {}!".format(lista_jug[turn%2].nombre))

    while True:
        mano_at = int(input("Mano de ataque\n('0' para I,'1' para D)? "))
        mano_def = int(input("Mano de oponente\n('0' para I,'1' para D)? "))
        if (mano_at in [0,1]) and (mano_def in [0,1]):
            break
        else:
            print("Please choose '0' or '1'!")
    system('clear')

    print(lista_jug[turn%2].ataque(lista_jug[(turn+1)%2], mano_at, mano_def))
    print(score(jug1, jug2))
    
    if check_win(jug1, jug2):
        winner = check_who_win(jug1, jug2)
        print("\nGAME OVER\nWinner is {}".format(winner))
        break
    turn+=1
    