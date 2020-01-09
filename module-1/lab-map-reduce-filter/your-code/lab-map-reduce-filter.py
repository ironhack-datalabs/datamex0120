from functools import reduce
import pandas as pd
import numpy as np
import re

# in the following cell, we will read a text file containing the book The Prophet by Khalil Gibran.
location = '../58585-0.txt'
with open(location, 'r', encoding="utf8") as f:
    prophet = f.read().split(' ')
# Let's remove the first 568 words since they contain information about the book but are not part of the book itself.


prophet[569:]


#If you look through the words, you will find that many words have a reference attached to them. For example, let's look at words 1 through 10.

# Your code here:

prophet[0:11]

# The next step is to create a function that will remove references.

# We will do this by splitting the string on the { character and keeping only the part before this character. Write your function below.

p = prophet

def listToString(x):
	string = ""

	for i in x:
		string = string+i

	return string

a = listToString(p)

print(a.split('{'))
#def reference(x):
