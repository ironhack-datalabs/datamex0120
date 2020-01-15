SELECT authors.au_id AS AUTHOR_ID, 
titleauthor.au_id AS TITLEAU_AUTHOR_ID, 
titleauthor.title_id AS TITLEAU_TITLE_ID,
titleauthor.royaltyper AS TITLEAU_ROYATYP,
titles.title_id AS TITLES_TITLE_ID,
titles.price AS TITLES_PRICE,
titles.royalty AS TITLES_ROYALTY,
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM authors 
RIGHT JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
RIGHT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id, titleauthor.au_id, titleauthor.title_id, titles.title_id, sales.qty
ORDER BY sales_royalty DESC
LIMIT 3;

