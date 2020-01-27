#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random
AHORCADO = ['''
      +---+
      |   |
          |
          |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
          |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|   |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
          |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
     /    |
          |
    =========''', '''
      +---+
      |   |
      O   |
     /|\  |
     / \  |
          |
    =========''']

palabraSecreta = ''
palabraSecreta = input('Dime una palabra: ')

for num in range(30):
    print ('')

def displayBoard(AHORCADO, letraIncorrecta, letraCorrecta, palabraSecreta):
    intentos=6
    print(AHORCADO[len(letraIncorrecta)])
    print ("")	
    for letra in letraIncorrecta:
	intentos-=1
	print ('Cuentas con: ' + str(intentos) +' intentos ')
        print (letra)#, fin)
    print ("")
    espacio = '_' * len(palabraSecreta)
    for i in range(len(palabraSecreta)): #reemplaza los espacios en blanco por la letra bien escrita
        if palabraSecreta[i] in letraCorrecta:
            espacio = espacio[:i] + palabraSecreta[i] + espacio[i+1:]
    print ('Palabra de ' + str(len(palabraSecreta)) + ' letras')#, fin)
    for letra in espacio:
	 #mostrará la palabra secreta con espacios entre letras
        print (letra)#, fin)
    print ("")

def elijeLetra(algunaLetra):
    # En esta parte se devuelve la letra que el jugador ingresó. Esta función hace que el jugador ingrese una letra y no cualquier otra cosa
    while True:
        print ('Adivina una letra:')
        letra = input()
        letra = letra.lower()
        if len(letra) != 1:
            print ('Introduce una letra a la vez.') 
        elif letra in algunaLetra:
            print ('Ya nombraste esa letra ¿Qué tal si pruebas con una diferente?')
        elif letra not in 'abcdefghijklmnopqrstuvwxyz':
            print ('Ingresa una letra.')
        else:
            return letra

def empezar():
    # Esta funcion devuelve True si el jugador quiere volver a jugar, de lo contrario devuelve False
    print ('Quieres jugar de nuevo? (Si o No)')
    return input().lower().startswith('s')



letraIncorrecta = ""
letraCorrecta = ""
finJuego = False
while True:
    for num in range(20):
    	print ('')
    print ('A H O R C A D O')
    displayBoard(AHORCADO, letraIncorrecta, letraCorrecta, palabraSecreta)
    # El usuario elije una letra.
    letra = elijeLetra(letraIncorrecta + letraCorrecta)
    if letra in palabraSecreta:
        letraCorrecta = letraCorrecta + letra
        # Se fija si el jugador ganó
        letrasEncontradas = True
        for i in range(len(palabraSecreta)):
            if palabraSecreta[i] not in letraCorrecta:
                letrasEncontradas = False
                break
        if letrasEncontradas:
            print ('¡Muy bien! La palabra secreta es "' + palabraSecreta + '"! ¡Has ganado!')
            finJuego = True
    else:
	#displayBoard(AHORCADO, letraIncorrecta, letraCorrecta, palabraSecreta)
        letraIncorrecta = letraIncorrecta + letra
        # Comprueba la cantidad de letras que ha ingresado el jugador y si perdió
        if len(letraIncorrecta) == len(AHORCADO) - 1:
            displayBoard(AHORCADO, letraIncorrecta, letraCorrecta, palabraSecreta)
            print ('¡Has perdido!\nDespues de ' + str(len(letraIncorrecta)) + ' intentos, la palabra era "' + palabraSecreta + '"')
            finJuego = True
    # Pregunta al jugador si quiere jugar de nuevo
    if finJuego:
        if empezar():
	    print ('A H O R C A D O')
            letraIncorrecta = ""
            letraCorrecta = ""
            finJuego = False
            palabraSecreta = input('Dime una palabra: ')
	    for num in range(30):
   	    	print ('')
        else:
            break
