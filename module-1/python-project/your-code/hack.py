#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import random #Importamos la libreria

def adivina_numero():
	print ('Bienvenido\nTienes 5 oportunidades para adivinar un nuemro entre 0 y 100')
	numero_secreto=random.randrange(0,101)
	numero_intentos=0
	numero_oportunidades=5
	
	while numero_intentos<5: 
		print ('Dime un numero')
		intento = input()
		numero_intentos+=1
		if intento > numero_secreto:
			numero_oportunidades-=1
			print ('El numero es mas chico. Te quedan ' + str(numero_oportunidades) + ' oportunidades')
		if intento < numero_secreto:
			numero_oportunidades-=1
			print ('El numero es mas grande. Te quedan ' +str(numero_oportunidades)  + ' oportunidades')
		if intento == numero_secreto:
			break 
	if intento == numero_secreto:
		print ('Numero correcto')
		print ('Despues de '+ str(numero_intentos) +' intentos lo has logrado.')
	if intento != numero_secreto:
		print ('Despues de '+ str(numero_intentos) +' intentos has fallado.')
		print ('El numero era ' + str(numero_secreto) + ' .')
try: 
	print (z)
except:	
	adivina_numero()
	raise NameError('define z')

