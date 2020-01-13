
import random


codigo =[]
tirada =[]
solucion=[]
columna =[]

for i in range(4):codigo.append(random.randrange(8))
for i in range(4): tirada.append(0)
for i in range(4): solucion.append(False)
for i in range(4): columna.append(False)


#flujo del juego
#print(codigo)
print('*****Mastermind*****')
print('Descifre una combinación de 4 números')
print(codigo)

#cliclo principal

for i in range(10):
    
    inputok = False #Inicializacion de la comprobacion de entrada
    
    while inputok == False:
        print('Intento número',i+1,'de 10')
        temp = input()
        if str.isnumeric(temp) and int(temp) < 10000 and int(temp) >= 0:#Comprobacion de la entrada numerica y dentro del rango
            inputok = True
        else:
            print('La entrada debe ser una combinacion de 4 numeros, intente otra vez')
    
    
    #Generacion de la cadena de 4 numeros en numeros conmenos de 4 digitos que son validos
    temp_str=str(temp)
    
    for i in range(4-len(temp_str)):
        temp_str='0'+temp_str
    
    #Generacion de lista de 4 digitos
    for i in range(4):
        tirada[i]=int(temp_str[i])
        
    #Entrada valida - comparaciones
    
    # Pistas de valor y lugar correcto
    numok_lugok = 0
    
    for i in range(4):
        if codigo[i] == tirada[i]: 
            numok_lugok =numok_lugok + 1
            solucion[i] = True
        else:
            solucion[i] = False
         
    # Pista de valores corretos en lugar incorrecto
    numok_lugnok=0
    for i in range(4): columna[i]=False
    for x in range(4):
        for y in range (4):
            #print(codigo[x], ' - ' ,tirada[y])
            if x!=y and solucion[x] == False and columna[y] == False:
                if codigo[x] == tirada[y]:
                    numok_lugnok = numok_lugnok +1
                    solucion[x] = True
                    columna[y] = True
                    #print('Aqui')
        #print('-')
    print(numok_lugok, 'bien ubicado', numok_lugnok, 'mal ubicados')
    
    if numok_lugok == 4: 
        print('Ganaste! el código era: ', codigo)
        break
if numok_lugok !=4:
    print('Perdiste :( la combinación era:', codigo )
    