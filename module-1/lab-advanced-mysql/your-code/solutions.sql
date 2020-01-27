# CHALLENGE 1

# CHALLENGE 1: STEP 1
SELECT titleauthor.title_id AS TITLE_ID, titleauthor.au_id AS AUTHOR_ID, price * qty * royalty / 100 * royaltyper / 100 AS ROYALTIES
FROM titleauthor
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID;

# CHALLENGE 1: STEP 2
SELECT TITLE_ID, AUTHOR_ID, SUM(ROYALTIES) AS TOTAL_ROYALTIES
FROM (SELECT titleauthor.title_id AS TITLE_ID, titleauthor.au_id AS AUTHOR_ID, price * qty * royalty / 100 * royaltyper / 100 AS ROYALTIES
FROM titleauthor
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID) Q_ROYALTIES
GROUP BY TITLE_ID, AUTHOR_ID;

# CHALLENGE 1: STEP 3
SELECT AUTHOR_ID, TOTAL_ROYALTIES + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM (SELECT TITLE_ID, AUTHOR_ID, SUM(ROYALTIES) AS TOTAL_ROYALTIES, ADVANCE, ROYALTYPER
FROM (SELECT titleauthor.title_id AS TITLE_ID, titleauthor.au_id AS AUTHOR_ID, price * qty * royalty / 100 * royaltyper / 100 AS ROYALTIES, advance AS ADVANCE, royaltyper AS ROYALTYPER
FROM titleauthor
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID) Q_ROYALTIES
GROUP BY TITLE_ID, AUTHOR_ID) Q_PROFIT
ORDER BY PROFITS DESC
LIMIT 3;

# CHALLENGE 2

CREATE TEMPORARY TABLE ROYALTIES
SELECT titleauthor.title_id AS TITLE_ID, titleauthor.au_id AS AUTHOR_ID, price * qty * royalty / 100 * royaltyper / 100 AS ROYALTIES, advance AS ADVANCE, royaltyper AS ROYALTYPER
FROM titleauthor
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID;

SELECT * FROM ROYALTIES;

CREATE TEMPORARY TABLE PROFIT
SELECT TITLE_ID, AUTHOR_ID, SUM(ROYALTIES) AS TOTAL_ROYALTIES, ADVANCE, ROYALTYPER
FROM ROYALTIES
GROUP BY TITLE_ID, AUTHOR_ID, ADVANCE, ROYALTYPER
ORDER BY TITLE_ID;

SELECT * FROM PROFIT;

SELECT AUTHOR_ID, TOTAL_ROYALTIES + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM PROFIT
ORDER BY PROFITS DESC
LIMIT 3;

# CHALLENGE 3

CREATE TABLE most_profiting_authors
SELECT AUTHOR_ID, TOTAL_ROYALTIES + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM PROFIT
ORDER BY PROFITS DESC
LIMIT 3;

SELECT * FROM most_profiting_authors;