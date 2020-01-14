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
