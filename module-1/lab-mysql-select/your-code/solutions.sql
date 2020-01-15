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
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) as total
FROM authors
RIGHT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
RIGHT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total desc
LIMIT 3;

#challenge 4

SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty),0) as total
FROM authors
RIGHT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
RIGHT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total desc
LIMIT 23;

# BONUS 
SELECT authors.author_id, authors.au_lname, authors.au_fname, 
titles.advance + IFNULL(sales.qty,0)* IFNULL(titles.price,0)*titleauthor.royaltyper/100) as profit
FROM authors
RIGHT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
RIGHT JOIN titles
ON titleauthor.title_id = titles.title_id
RIGHT JOIN roysched
ON titles.title_id = roysched.title_id
GROUP BY authors.author_id 
ORDER BY profit
LIMIT 3;

SELECT authors.au_id AUTHORS_ID, authors.au_lname AS AUTHORS_LNAME, authors.au_fname AS AU_FNAME,
ROUND((titles.price + IFNULL(SUM(sales.qty), 0) * titles.royalty)/100 * titleauthor.royaltyper /100,5)  AS PROFIT
FROM authors 
RIGHT JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
RIGHT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id, titleauthor.au_id, titleauthor.title_id, titles.title_id, sales.qty
ORDER BY PROFIT DESC
LIMIT 3;



