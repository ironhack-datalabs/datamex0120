# define a variable tup with a single element

tup = ("I")

# print tup

print (tup)

# append to a tup
#tup.append("r", "o", "n", "h", "a", "c", "k")
# // no se puede hacer append a una tupla ya que no cuenta con el atributo append y ademas las tuplas son inmutables

# tup reassign

tup = ("I", "r", "o", "n", "h", "a", "c", "k")

# // si ya que la reasignacion de elementos a una tupla es totalmente posible mientras que no se intente modificar los valores de la tupla

# split up tup with 4 elements each

tup1 = tup[0:4]

tup2 = tup[4:]
print(tup1, tup2)

# Add tup1 and tup2 into tup3 using the + operator
tup3 = tup1 + tup2

print(tup3)

# Count the number of elements in tup1 and tup2. Then add the two counts together and check if the sum is the same as the number of elements in tup3


tup3 = len(tup1) + len(tup2)

print("el numero de elementos en tup1 es {} en el tup2 es {} y la suma de los valores de las 2 tuplas es {}".format(len(tup1),len(tup2),tup3)) 

# What is the index number of "h" in tup3?

tup3 = tup1 + tup2

print(tup3.index("h"))

# Now, use a FOR loop to check whether each letter in the following list is present in tup3

letters = ["a", "b", "c", "d", "e"]

for each_letter in letters:
	if each_letter in tup3:
		print(each_letter,True)
	else:
		print(each_letter, False)

# How many times does each letter in letters appear in tup3? 

print("------------------------------------------------------")

for each_letter in letters:
	if each_letter in tup3:
		print(each_letter, tup3.count(each_letter))

	else:
		print(each_letter, "la letra no existe en la tupla")



