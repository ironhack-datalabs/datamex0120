#!/usr/bin/env python
# coding: utf-8

# ## Challenge 2: Sets
# 
# There are a lot to learn about Python Sets and the information presented in the lesson is limited due to its length. To learn Python Sets in depth you are strongly encouraged to review the W3Schools tutorial on [Python Sets Examples and Methods](https://www.w3schools.com/python/python_sets.asp) before you work on this lab. Some difficult questions in this lab have their solutions in the W3Schools tutorial.
# 
# #### First, import the Python `random` libary

# In[2]:


import random


# #### In the cell below, create a list named `sample_list_1` with 80 random values. 
# 
# Requirements:
# 
# * Each value is an integer falling between 0 and 100.
# * Each value in the list is unique.
# 
# Print `sample_list_1` to review its values
# 
# *Hint: use `random.sample` ([reference](https://docs.python.org/3/library/random.html#random.sample)).*

# In[28]:


# Your code here
sample_list_1 = random.sample(range(1,100),k=80) 
print(sample_list_1)
set1 = set(sample_list_1)


# #### Convert `sample_list_1` to a set called `set1`. Print the length of the set. Is its length still 80?

# In[31]:


# Your code here
print(len(set(sample_list_1)))
if len(set1) == 80:
    print("yes, it is")
else:
    print("no, it's not")


# #### Create another list named `sample_list_2` with 80 random values.
# 
# Requirements:
# 
# * Each value is an integer falling between 0 and 100.
# * The values in the list don't have to be unique.
# 
# *Hint: Use a FOR loop.*

# In[30]:


# Your code here
sample_list_2 = [random.randint(1,100) for i in range (1,80)]
print(sample_list_2)


# #### Convert `sample_list_2` to a set called `set2`. Print the length of the set. Is its length still 80?

# In[26]:


# Your code here
set2 = set(sample_list_2)
print(len(set(sample_list_2)))
if len(set2) == 80:
    print("yes, it is")
else:
    print("no, it's not")


# #### Identify the elements present in `set1` but not in `set2`. Assign the elements to a new set named `set3`.

# In[32]:


# Your code here
set3 = set(set1.difference(set2))


# #### Identify the elements present in `set2` but not in `set1`. Assign the elements to a new set named `set4`.

# In[33]:


# Your code here
set4 = set(set2.difference(set1))


# #### Now Identify the elements shared between `set1` and `set2`. Assign the elements to a new set named `set5`.

# In[34]:


# Your code here
set5 = set(set1.intersection(set2))


# #### What is the relationship among the following values:
# 
# * len(set1)
# * len(set2)
# * len(set3)
# * len(set4)
# * len(set5)
# 
# Use a math formular to represent that relationship. Test your formular with Python code.

# In[35]:


# Your code here
print(len(set1),len(set2),len(set3),len(set4),len(set5))


# #### Create an empty set called `set6`.

# In[36]:


# Your code here
set6 = set()


# #### Add `set3` and `set5` to `set6` using the Python Set `update` method.

# In[37]:


# Your code here
set6.update(set3,set5)


# #### Check if `set1` and `set6` are equal.

# In[39]:


# Your code here
set1 == set6


# #### Check if `set1` contains `set2` using the Python Set `issubset` method. Then check if `set1` contains `set3`.*

# In[42]:


# Your code here
set2.issubset(set1)
set3.issubset(set1)


# #### Using the Python Set `union` method, aggregate `set3`, `set4`, and `set5`. Then aggregate `set1` and `set2`. 
# 
# #### Check if the aggregated values are equal.

# In[44]:


# Your code here
set3.union(set4,set5)
set1.union(set2)
set1==set3
print(set1)


# #### Using the `pop` method, remove the first element from `set1`.

# In[47]:


# Your code here


# #### Remove every element in the following list from `set1` if they are present in the set. Print the remaining elements.
# 
# ```
# list_to_remove = [1, 9, 11, 19, 21, 29, 31, 39, 41, 49, 51, 59, 61, 69, 71, 79, 81, 89, 91, 99]
# ```

# In[55]:


# Your code here
list_to_remove = [1,9,11,21,29,31,39,41,49,51,59,61,69,71,79,81,89,91,99]
set_list = set(list_to_remove)
set_n = set(set1.difference(set_list))
print(set_n)

