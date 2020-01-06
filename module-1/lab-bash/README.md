# Bash exercices


## Intro

Vamos a practicar con `bash`, un lenguaje de programación que se ejecuta en la línea de comandos!

## Setup
1. Ubícate en la carpeta en la que ejecutando en el terminal. Al ejecutar `ls` 
```console
$ ls
```

2. Deberías ver: 
```console
exercices  inputs  lorem  lorem-copy  modules  outputs  README.md
```
3. Intenta hacer todos los ejercicios sin cambiar de directorio. 

## Ejercicios

* Imprime en consola "Hello World".

```console
$ echo "hello world"
```

* Crea un directorio nuevo llamado `new_dir`.

```console
$ mkdir new_dir
```

* Elimina ese directorio.

```console
$ rm -r new_dir
```

* Copia el archivo `sed.txt` dentro de la carpeta lorem a la carpeta lorem-copy.

```console
$ cp lorem/sed.txt lorem-copy
```

* Copia los otros dos archivos de la carpeta lorem a la carpeta lorem-copy en una sola linea mediante el pipe `;`.

```console
$ cp lorem/at.txt lorem-copy/; cp lorem/lorem.txt lorem-copy/
```

* Muestra el contenido del archivo `sed.txt` dentro de la carpeta lorem.

```console
$ cat lorem/sed.txt
```

* Muestra el contenido de los archivos `at.txt` y `lorem.txt` dentro de la carpeta lorem.

```console
$ cat lorem/at.txt; cat lorem/lorem.txt
```

* Visualiza las primeras 3 linas del archivo `sed.txt` dentro de la carpeta lorem-copy

```console
$ head -3 lorem-copy/sed.txt
```

* Visualiza las ultimas 3 linas del archivo `sed.txt` dentro de la carpeta lorem-copy

```console
$ tail -3 lorem-copy/sed.txt
```

* Añade `Homo homini lupus.` al final de archivo `sed.txt` dentro de la carpeta lorem-copy.

```console
$ echo "Homo homini lupus." >> lorem-copy/sed.txt
```

* Visualiza las últimas 3 linas del archivo `sed.txt` dentro de la carpeta lorem-copy. Deberías ver ahora `Homo homini lupus.`.

```console
$ tail -3 lorem-copy/sed.txt
```

* Sustituye todas las apariciones de `et` por `ET` del archivo `at.txt` dentro de la carpeta lorem a la carpeta lorem-copy. Deberás usar `sed`.

- https://myshittycode.com/2014/07/24/os-x-sed-extra-characters-at-the-end-of-l-command-error/

```console
$ sed -i '' 's/et/ET/g' lorem/sed.txt; sed -i '' 's/et/ET/g' lorem-copy/sed.txt
```

* Encuentra al usuario activo en el sistema.

```console
$ who
```

* Encuentra dónde estás en tu sistema de ficheros.

```console
$ pwd
```

* Lista los archivos que terminan por `.txt` en la carpeta lorem.

```console
$ ls *.txt
```

* Cuenta el número de lineas que tiene el archivo `sed.txt` dentro de la carpeta lorem. Tendrás que encadenar `cat` y `wc` mediante el pipe `|`.

```console
$ wc -l lorem/sed.txt
``` 

* Cuenta el número de **archivos** que empiezan por `lorem` que están en este directorio y en directorios internos

- ¿Por qué se tiene que usar la pipa?

```console
$ ls -dq *lorem* | wc -l
``` 

* Encuentra todas las apariciones de `et` en `at.txt` dentro de la carpeta lorem.

```console
$ grep -c "et" lorem/at.txt
``` 


* Cuenta el número de apariciones del string `et` en `at.txt` dentro de la carpeta lorem. Para ello debes obtener sólo los string buscados y contar las lineas. 

```console
$ grep -c "et" lorem/at.txt
```


*  Cuenta el número de apariciones del string `et` en todos los archivos del directorio lorem-copy. 

```console
$ grep -c "et" lorem-copy/*
```


## Ficheros bash

Manual vi: https://www.howtogeek.com/102468/a-beginners-guide-to-editing-text-files-with-vi/

Cualquier comandos o comandos de bash se pueden almacenar en un fichero y ejecutar cuando queramos. Obviamente puedes utilizar tu editor preferido. Creamos el fichero: 
```console
$ vi list_files.sh
```
E incluimos el contenido que queramos. En este caso listar ficheros
```python
#!/bin/bash
ls
```

Una vez con los permisos adecuados podemos ejecutar el script `$ chmod a+x list_files.sh`
```console
$ bash list_files.sh
```
Y veremos por consola el siguiente output. 
```console
exercices  inputs  lorem  lorem-copy  modules  outputs  README.md
```

## Bonus

* Almacena en una variable `name` tu nombre mediante el comando `read`.

```console
$ read name
```

* Imprime esa variable.

```console
$ echo $name
```

* Crea un directorio nuevo que se llame como el contenido de la variable `name`.

```console
$ mkdir $name
```

* Elimina ese directorio.

```console
$ rm -r $name
```

* Por cada archivo dentro de la carpeta `lorem` imprime el número de carácteres que tienen sus nombres. Intenta primero mostrar los archivos mediante un bucle for. Luego calcula la longitud de cada elemento de la iteración. 
1. Imprime los ficheros
2. Imprime las longitudes de los nombres de los ficheros. 