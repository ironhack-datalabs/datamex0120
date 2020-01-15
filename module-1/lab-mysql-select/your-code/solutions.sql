# Challenge 1 
SELECT au.au_id, au.au_lname, au.au_fname, ti.title, publishers.pub_name
FROM authors as au
LEFT JOIN titleauthor as tia
ON au.au_id = tia.au_id
LEFT JOIN titles as ti
ON tia.title_id = ti.title_id
LEFT JOIN publishers
ON ti.pub_id = publishers.pub_id;

# Challenge 2 
SELECT au.au_id, au.au_lname, au.au_fname,count(au.au_id) AS title_count
FROM authors as au
LEFT JOIN titleauthor as tia
ON au.au_id = tia.au_id
LEFT JOIN titles as ti
ON tia.title_id = ti.title_id
LEFT JOIN publishers as pub
ON ti.pub_id = pub.pub_id
GROUP BY au.au_id
ORDER BY title_count DESC;

# challenge 3
SELECT au.au_id, au.au_lname, au.au_fname
FROM authors as au



