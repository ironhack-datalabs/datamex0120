#Select
#	a.au_id as Author_ID,
#	a.au_fname as FIRST_NAME,
#	a.au_lname as LAST_NAME,
#	t.title as Title,
#	p.pub_name as Publisher
#from 
# authors a
#left join titleauthor ta
#on a.au_id = ta.au_id
#left join titles t 
#on ta.title_id = t.title_id
#left join publishers p
#on t.pub_id = p.pub_id;

# How may published
#Select
#	a.au_id as Author_ID,
#	a.au_fname as FIRST_NAME,
#	a.au_lname as LAST_NAME,
#	count(t.title) as Title_COUNT,
#	p.pub_name as Publisher
#from 
# authors a
#left join titleauthor ta
#on a.au_id = ta.au_id
#left join titles t 
#on ta.title_id = t.title_id
#left join publishers p
#on t.pub_id = p.pub_id
#group by t.title;


###Best Selling Authors
#Select 
#	a.au_id as Author_ID,
 #   a.au_fname as First_Name,
 #   a.au_lname as Last_Name,
 #   count(t.title) as title 
#from 
#	authors a
    
#left join titleauthor ta
#on a.au_id = ta.au_id
#left join titles t
#on ta.title_id = t.title_id
#group by title > 2;

#Best Selling authors ranking
Select 
	a.au_id as Author_ID,
   a.au_fname as First_Name,
   a.au_lname as Last_Name,
   count(t.title) as title 
from 
	authors a    
left join titleauthor ta
on a.au_id = ta.au_id
left join titles t
on ta.title_id = t.title_id
group by title;