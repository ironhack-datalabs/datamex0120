La limpieza siguió el siguiente partón:

-Eliminacion duplicados
-Relleno de valores nulos dependiendo de la columna
-Limpieza de columnas segun el orden

Se crearon dos funciones importantes para la depuracion de los datos

La funcion isinlist()

isinlist(x,keylist,strrep = '',repwith = False,replace = True,secref=False,listref=[]): 

Funcion general para buscar en una cadena varios elementos en una lista y regresar el elemento encontrado y regresar una cadena configurable
La funcion puede recibir los siguientes argumentos:

x- elemento a comprobar, 
keylist - lista de comparacion, 
strrep - cadena de caracteres para asignar a los elementos no encontrados (default ='') 
repwith: cierto para reemplazar con la cadena strrep (default =False)
replace - cierto reemplaza con strrep los elementos no encontrados, falso solo reemplaza lo encontrado (default = True)
secref - cierto para recibir una segunda referencia para asignar (default = false)
lstref - lista de referencia a asignar - debe tener la misma longitud de elementos de keylist

Return: cadena de caracteres en la lista o cadena de excepcion al no encontrarla o la misma cadena en caso de replace = False

Y la funcion typefromrange(x,tipos,rangos,nullrange='UNKNOWN') que asigna una catergoria a rangos de valores

Recibe:
x como elemento a comparar
tipos: una lista con los tipos a asignar
rangos : lista de rangos a comprar en una lista de listas dos elementos donde debe estar ingresado el limite menor y el limite mayor
nullrange: en caso de no estar contenido el valor en los rangos o ser un valor fuera de los elementos comprables sera la cadena que seregrese para completar el elemento


-Se importaron bases de datos para la clasificacion de especies y paises usando la funcion "isinlist".

Se crearon columnas adicionales en donde se calculo la estacion del año y se separaron los dias y los meses y el año extraido de la columna "Date"

No se consideraron relevantes las coulmnas de nombre, region y area por lo que quedaron igual

Se asignó un numero de caso único segun el orden de la base de datos