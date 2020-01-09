#!/usr/bin/env python
# coding: utf-8

# # Before your start:
# - Read the README.md file
# - Comment as much as you can and use the resources in the README.md file
# - Happy learning!

# # Challenge 1 - Functions. 
# 
# A function is a block of organized, reusable code that is used to perform a single, related action. Functions provide better modularity for your application and a high degree of code reusing. Create a function to find the summation of the number of every number from 1 to num.

# In[1]:


num=76


# In[2]:


def summation(num):
    # This function returns 1+2+3+....+num
    suma = 0
    for i in (0,num):
        suma = suma + (i)
    return suma 


# In[3]:


print(summation(num))


# # Challenge 2 - Positional arguments, Args and Kwargs.
# 
# The syntax *args and **kwargs in function definitions is used to pass a variable number of arguments to a function. The single asterisk form (*args) is used to pass a non-keyworded, variable-length argument list, and the double asterisk form is used to pass a keyworded, variable-length argument list. Create a function to find the summation of all elements of the array.

# In[4]:


array=[3, 8, 16]


# In[5]:


def summation2(*args):
    # This function returns the sum of *args    
    # Your code here:
    print(*args)
    return sum(*args)


# In[6]:


print(summation2(array))


# Now, do the same thing with positional arguments.

# In[7]:


def summation3(a, b, c): 
    return a+b+c


# In[8]:


array = [3,8,16]
a,b,c = array
summation3(*array)


# Given the next dictionary of M&Ms, create a function to sum all non red M&Ms.

# In[9]:


dictionary={'red':3, 'blue':8, 'green':24, 'orange':12, 'purple':10}


# In[10]:


def summation4(**kwargs):
    # This function returns the sum of all M&Ms, except the red ones
    return sum(dictionary.values())
    # Your code here:


# In[11]:


summation4(**dictionary)


# Below, create a function to sum all following elements.

# In[12]:


a=4
b=6
c=15
d=[48, 465, 23, 96]
e={'A':16, 'B':32, 'C':64}


# In[13]:


y = 0
x = 0
def summation5(a,b,c,*d,**e):
    # This function returns the sum of a,b,c,d and e
    y = sum(e.values())
    x = sum(*d)
    return a+b+c+y+x


# In[18]:


summation4(a,b,c,y,x)


# # Challenge 3 - Iterators, Generators and `yield`. 
# 
# In iterator in Python is an object that represents a stream of data. However, iterators contain a countable number of values. We traverse through the iterator and return one value at a time. All iterators support a `next` function that allows us to traverse through the iterator. We can create an iterator using the `iter` function that comes with the base package of Python. Below is an example of an iterator.

# In[19]:


# We first define our iterator:

iterator = iter([1,2,3])

# We can now iterate through the object using the next function

print(next(iterator))


# In[20]:


# We continue to iterate through the iterator.

print(next(iterator))


# In[23]:


print(next(iterator))


# In[24]:


# After we have iterated through all elements, we will get a StopIteration Error

print(next(iterator))


# In[25]:


# We can also iterate through an iterator using a for loop like this:
# Note: we cannot go back directly in an iterator once we have traversed through the elements. 
# This is why we are redefining the iterator below

iterator = iter([1,2,3])

for i in iterator:
    print(i)


# In the cell below, write a function that takes an iterator and returns the first element in the iterator and returns the first element in the iterator that is divisible by 2. Assume that all iterators contain only numeric data. If we have not found a single element that is divisible by 2, return zero.

# In[26]:


iterator=iter([1,2,3])
def divisible2(iterator):
    # This function takes an iterable and returns the first element that is divisible by 2 and zero otherwise
    # Input: Iterable
    # Output: Integer
   # y = iterator
    #for i in iterator:
     #   print(i)
    for j in iterator:
        if j %2==0:
            yield j      
    # Sample Input: iter([1,2,3])
    # Sample Output: 2
    
    # Your code here:


# In[27]:


print(next(divisible2(iterator)))


# ### Generators
# 
# It is quite difficult to create your own iterator since you would have to implement a `next` function. Generators are functions that enable us to create iterators. The difference between a function and a generator is that instead of using `return`, we use `yield`. For example, below we have a function that returns an iterator containing the numbers 0 through n:

# In[28]:


def firstn(n):
     number = 0
     while number < n:
         yield number
         number = number + 1


# If we pass 5 to the function, we will see that we have a iterator containing the numbers 0 through 4.

# In[29]:


iterator = firstn(5)

for i in iterator:
    print(i)


# In the cell below, create a generator that takes a number and returns an iterator containing all even numbers between 0 and the number you passed to the generator.

# In[32]:


def even_iterator(n):
     number = 0
     while number <= n:
         yield number
         number = number + 1


# In[33]:


iterator = even_iterator(5)

for i in iterator:
    print(i)


# In[ ]:




