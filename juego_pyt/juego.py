
import time

## obtiene los datos del jugador
name = input("cual es tu nombre?: ")
print ("Hola, ",name , "vamos a jugar ahorcados")
#wespera durante 0.5 segundos
time.sleep(0.5)
print ("Empieza a adivinar")
time.sleep(0.5)

# se ingresa la palabra secreta
palabra = input('ingresa una palabra para adivinar: ')

# variable vacia que almacena las palabras adivinadas
adivinadas = ''

#turnos disponibles
turnos = 10


#si turnos mayor que cero
while turnos > 0:         
    fallos = 0                
    for i in palabra:      

    # si el jugador acierta, imprime el caracter acertado
        if i in adivinadas:
            print (i)
    # si el jugador falla se sigue imprimiendo el dash y se suma 1 fallo a fallos 
        else:
            print ("_")     
            fallos += 1    
    # si fallos se mantiene en cero, imprime tu ganas y abandona el juego
    if fallos == 0:        
        print('tu ganas')
        break              
    # le pide al usuario adivinar las letras
    adivinar = input("adivina una letra: ") 

    # suma la letra que ingresa el usuario al string vacio
    adivinadas += adivinar                    

    # si la palabra no se encuentra en la palabra resta 1 a turnos e imprime error, tambien imprime el numero de turnos disponibles, y resta 1 a turnos
    if adivinar not in palabra:  
        turnos -= 1       
        print ('error')
        print ("tienes", turnos, 'turnos disponibles') 
        print('\n')
    # si los turnos 
        if turnos == 0:           
            print ("perdiste")
            print('la palabra era', palabra)  
