#1. Import the NUMPY package under the name np.
import numpy as np



#2. Print the NUMPY version and the configuration.
print(np.version.version)


#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
a=np.random.random((2,3,5))



#4. Print a.
print(a)


#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
b=np.ones([5,3,2])


#6. Print b.
print(b)


#7. Do a and b have the same size? How do you prove that in Python code?
if a.shape==b.shape:
    print('\n')
    print('viendo si pueden sumarse')
    print('\n')
else:
    print('\n')
    print('No se puede')
    print('\n')
    
    



#8. Are you able to add a and b? Why or why not?
try:
    d=np.add(a,b)
except:
    print('No se puden sumar las matrices a y b \n')
    print(' a: ',a.shape, ' b: ',b.shape)
    
    


#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
c=b.T
print('\n')
print('Matriz C: \n')
print('c shape: ',c.shape)
print('\n')
print(c)
print('\n')




#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
d=np.add(a,c)


#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print('Matriz A: \n')
print(a)
print('\n')

print('Matriz C: \n')
print(c)
print('\n')

print('Matriz D: \n')
print(d)
print('\n')



#12. Multiply a and c. Assign the result to e.
e=np.multiply(a,c)

print('Matriz e: \n')
print(e)
print('\n')



#13. Does e equal to a? Why or why not?
if np.array_equal(a, e):
    print('Si, son matrices iguales, porque fue una multiplicacion elemento por elemento')
    print('La matriz C está rellena de unos')
    
    



#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
d_max=np.max(d)
d_min=np.min(d)
d_mean=np.mean(d)

print('Máximo: ',d_max)
print('Minimo: ',d_min)
print('Promedio: ',d_mean)





#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
f=np.empty((2,3,5))



"""
