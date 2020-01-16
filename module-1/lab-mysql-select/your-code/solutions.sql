SELECT a.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname as "FIRST NAME", title as "TITLE", pub_name as "PUBLISHER"
FROM
    authors AS a
    INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
    INNER JOIN
    titles AS t ON ta.title_id = t.title_id
    INNER JOIN
    publishers AS p ON t.pub_id = p.pub_id;

SELECT a.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname as "FIRST NAME", pub_name as "PUBLISHER", COUNT(title) as "TITLE COUNT"
FROM
    authors AS a
    INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
    INNER JOIN
    titles AS t ON ta.title_id = t.title_id
    INNER JOIN
    publishers AS p ON t.pub_id = p.pub_id
    GROUP BY a.au_id, au_lname, au_fname, pub_name
    ORDER BY a.au_id DESC, pub_name DESC;

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(qty) AS TOTAL
FROM
authors AS a
INNER JOIN
titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN
titles AS t ON ta.title_id = t.title_id
INNER JOIN
sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", IFNULL(sum(qty),0) AS TOTAL
FROM
authors AS a
LEFT JOIN
titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN
titles AS t ON ta.title_id = t.title_id
LEFT JOIN
sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", SUM(qty*royaltyper*0.01*(advance + (royalty*0.01*price))) AS PROFIT
FROM authors AS a, titleauthor AS ta, titles AS t, sales AS s
WHERE a.au_id = ta.au_id AND ta.title_id = t.title_id AND t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY PROFIT DESC
LIMIT 3;