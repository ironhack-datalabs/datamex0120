USE lab_mysql;
# El campo vin es entero, por lo que el valor correspondiente
# al del texto del ejercicio (DAM41UDN3CHU2WVF6) es 240600
DELETE FROM cars
WHERE vin = 240600;