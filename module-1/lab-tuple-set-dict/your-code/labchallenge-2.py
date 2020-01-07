import random

# In the cell below, create a list named sample_list_1 with 80 random values.
sample_list_1 = random.sample(range(100),80)

print("numero de elementos en la lista: ", len(sample_list_1), "\n" , sample_list_1)

print("-"*200)
# Convert sample_list_1 to a set called set1. Print the length of the set. Is its length still 80?

set1 = set(sample_list_1)

print("el numero de elemenos en el set es de :", len(set1))

# Create another list named sample_list_2 with 80 random values.

print("-"*200)
sample_list_2 = []

for i in range(80):
	sample_list_2.append(random.randint(0,100))

print("el numero de elementos es", len(sample_list_2),"\n", sample_list_2)

print("-"*200)

# Convert sample_list_2 to a set called set2. Print the length of the set. Is its length still 80?

set2 = set(sample_list_2)

print("el numero de elementos es :", len(set2))

# // el tamaño cuando se convierte a set no es el mismo
print("-"*200)
# Identify the elements present in set1 but not in set2. Assign the elements to a new set named set3.
set3 = []
for i in set1:
	if i in set2:
		pass
	else:
		set3.append(i)
set3 = set(set3)
print(set3)

print("-"*200)
# Identify the elements present in set2 but not in set1. Assign the elements to a new set named set4.

set4 = []

for i in set2:
	if i in set1:
		pass
	else:
		set4.append(i)
set4 = set(set4)
print(set4)

print("-"*200)
# Now Identify the elements shared between set1 and set2. Assign the elements to a new set named set5.
set5= []

for i in set1:
	if i in set2:
		set5.append(i)
set5 = set(set5)
print("los elementos compartidos entre set1 u set2 son: ",set5)

# What is the relationship among the following values:

print(len(set1))
print(len(set2))
print(len(set3))
print(len(set4))
print(len(set5))

# Create an empty set called set6.

set6 = set()


# Add set3 and set5 to set6 using the Python Set update method.

set6.update(set3,set5)

print(set6)

# Check if set1 and set6 are equal.

print("-"*200)

if len(set1) == len(set6):
	if set1 == set6:
		print("los sets son iguales")
	else:
		print("no son iguales")

print("-"*200)
# Check if set1 contains set2 using the Python Set issubset method. Then check if set1 contains set3. 

if set2.issubset(set1):
	print("el set 1 contiene al set2")
	if set3.issubset(set1):
		print("el set 1 tambien contiene a set3")
else:
	print("el set1 no contiene al set2 \n")
	if set3.issubset(set1):
		print("pero si contiene al set 3")

# Using the Python Set union method, aggregate set3, set4, and set5. Then aggregate set1 and set2.

set7 = set3.union(set4,set5)

print("tamaño de el set7: ",len(set7),"\n", set7)

set8 = set7.union(set1,set2)

print("tamaño de el set8: " ,len(set8),"\n", set8)

# Check if the aggregated values are equal

if len(set7) == len(set8):
	print("el tamaño de de los sets es el mismo")
	if set7 == set8:
		print("los dos sets son iguales") 
else:
	print("el tamaño de los sets no son lo mismo")

# Using the pop method, remove the first element from set1.

print(set1)

print("-" *200)
set1.pop()

print(set1)


# Remove every element in the following list from set1 if they are present in the set. Print the remaining elements.

list_to_remove = [1, 9, 11, 19, 21, 29, 31, 39, 41, 49, 51, 59, 61, 69, 71, 79, 81, 89, 91, 99]

for i in list_to_remove:
	set1.remove(str(list_to_remove))