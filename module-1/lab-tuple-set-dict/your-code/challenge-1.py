#!/usr/bin/env python
# coding: utf-8

# ## Challenge 1: Tuples
# 
# #### Do you know you can create tuples with only one element?
# 
# **In the cell below, define a variable `tup` with a single element `"I"`.**
# 
# *Hint: you need to add a comma (`,`) after the single element.*

# In[57]:


# Your code here
tup = ("I",)


# #### Print the type of `tup`. 
# 
# Make sure its type is correct (i.e. *tuple* instead of *str*).

# In[58]:


# Your code here
type(tup)
print(tup)

#### Now try to append the following elements to `tup`. 

Are you able to do it? Explain.

```
"r", "o", "n", "h", "a", "c", "k',
```
# In[81]:


# Your code here
rest = ('r','o','n','h','a','c','k')
#comp = [i in for i in rest]
comp.append(tup[0])
comp = [i for i in  tup for i in rest]
#for i in rest:
    #comp.append(i)
print(comp)
# Your explanation here
#Only adding the two tuples on an empty list


# #### How about re-assign a new value to an existing tuple?
# 
# Re-assign the following elements to `tup`. Are you able to do it? Explain.
# 
# ```
# "I", "r", "o", "n", "h", "a", "c", "k"
# ```

# In[55]:


# Your code here
tup = (comp[0],comp[1],comp[2],comp[3],comp[4],comp[5],comp[6],comp[7])
print(tup)
# Your explanation here


# #### Split `tup` into `tup1` and `tup2` with 4 elements in each. 
# 
# `tup1` should be `("I", "r", "o", "n")` and `tup2` should be `("h", "a", "c", "k")`.
# 
# *Hint: use positive index numbers for `tup1` assignment and use negative index numbers for `tup2` assignment. Positive index numbers count from the beginning whereas negative index numbers count from the end of the sequence.*
# 
# Also print `tup1` and `tup2`.

# In[56]:


# Your code here
tup1 = (tup[0],tup[1],tup[2],tup[3])
tup2 = (tup[-4],tup[-3],tup[-2],tup[-1])


# #### Add `tup1` and `tup2` into `tup3` using the `+` operator.
# 
# Then print `tup3` and check if `tup3` equals to `tup`.

# In[62]:


# Your code here
tup3 = tup1 + tup2
print(tup3)
if tup3 == tup:
    print('OK')


# #### Count the number of elements in `tup1` and `tup2`. Then add the two counts together and check if the sum is the same as the number of elements in `tup3`

# In[66]:


# Your code here


# #### What is the index number of `"h"` in `tup3`?

# In[69]:


# Your code here
tup3.index('h')


# #### Now, use a FOR loop to check whether each letter in the following list is present in `tup3`:
# 
# ```
# letters = ["a", "b", "c", "d", "e"]
# ```
# 
# For each letter you check, print `True` if it is present in `tup3` otherwise print `False`.
# 
# *Hint: you only need to loop `letters`. You don't need to loop `tup3` because there is a Python operator `in` you can use. See [reference](https://stackoverflow.com/questions/17920147/how-to-check-if-a-tuple-contains-an-element-in-python).*

# In[71]:


# Your code here
letters = ["a","b","c","d","e"]
for i in letters:
    if i in tup3:
        print(i,'True')
    else:
        print(i,'False')


# #### How many times does each letter in `letters` appear in `tup3`?
# 
# Print out the number of occurrence of each letter.

# In[76]:


# Your code here
count = 0
for i in letters:
    if i in tup3:
        count = count +1
        print(i[0],count)
    

