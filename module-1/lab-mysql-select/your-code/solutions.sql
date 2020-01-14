/* Challenge 1 */
/*
SELECT  authors.au_id AS AUTHOR_ID,
        authors.au_lname AS LAST_NAME,
        authors.au_fname AS FIRST_NAME,
        title AS TITLE,
        pub_name AS PUBLISHER
FROM titleauthor
  JOIN authors
  ON titleauthor.au_id = authors.au_id
  JOIN titles
  ON titleauthor.title_id = titles.title_id
  JOIN publishers
  ON titles.pub_id = publishers.pub_id;
*/

/* Challenge 2 */
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(*) AS TITLE_COUNT
FROM (
	SELECT  authors.au_id AS AUTHOR_ID,
			authors.au_lname AS LAST_NAME,
			authors.au_fname AS FIRST_NAME,
			title AS TITLE,
			pub_name AS PUBLISHER
	FROM titleauthor
	  JOIN authors
	  ON titleauthor.au_id = authors.au_id
	  JOIN titles
	  ON titleauthor.title_id = titles.title_id
	  JOIN publishers
	  ON titles.pub_id = publishers.pub_id) summary
GROUP BY AUTHOR_ID, PUBLISHER;

/* Challenge 3 */
SELECT	authors.au_id AS AUTHOR_ID,
		au_lname AS LAST_NAME,
        au_fname AS FIRST_NAME,
        SUM(sales.qty) AS TOTAL 
FROM sales
	JOIN titleauthor
	ON sales.title_id = titleauthor.title_id
    JOIN authors
    ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC 
LIMIT 3;


/* Challenge 4 *//*
SELECT	authors.au_id AS AUTHOR_ID,
		au_lname AS LAST_NAME,
        au_fname AS FIRST_NAME,
        IFNULL(COUNT(sales.title_id), 0) AS TOTAL
FROM titleauthor
	RIGHT JOIN authors
	ON titleauthor.au_id = authors.au_id
    LEFT JOIN sales
    ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

/* Bonus */
/*
SELECT	authors.au_id AS AUTHOR_ID,
		au_lname AS LAST_NAME,
        au_fname AS FIRST_NAME,
        IFNULL(COUNT(sales.title_id), 0) AS TOTAL
        /*AS PROFIT*/
/*
FROM titleauthor
	RIGHT JOIN authors
	ON titleauthor.au_id = authors.au_id
    LEFT JOIN sales
    ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;