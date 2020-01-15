/*Challenge 1*/
USE publications;
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name FROM authors a
INNER JOIN titleauthor ta ON ta.au_id = a.au_id
INNER JOIN titles t ON t.title_id = ta.title_id
INNER JOIN publishers p ON p.pub_id = t.pub_id;

/*Challenge 2*/
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(p.pub_name) as titlecount FROM authors a
INNER JOIN titleauthor ta ON ta.au_id = a.au_id
INNER JOIN titles t ON t.title_id = ta.title_id
INNER JOIN publishers p ON p.pub_id = t.pub_id
GROUP BY p.pub_name,a.au_id;

/*Challenge 3*/
SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3;

/*Challenge 4*/
SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) FROM authors a
INNER JOIN titleauthor ta ON a.au_id = ta.au_id
INNER JOIN sales s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC;

/*Bonus Challenege*/

SELECT au_id, au_lname, au_fname, sum(profit) 
FROM(
	SELECT a.au_id, a.au_lname, a.au_fname,
	(t.advance*ta.royaltyper/100 + (t.price * s.qty*t.royalty/100*ta.royaltyper/100)) AS profit
	FROM authors AS a
	INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
	INNER JOIN titles AS t ON t.title_id = ta.title_id
	INNER JOIN sales AS s ON t.title_id = s.title_id) AS PROFIT_TABLE
GROUP BY au_id
ORDER BY sum(profit) DESC;