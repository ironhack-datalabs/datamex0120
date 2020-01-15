/***** Challenge 1 *****/
/*Step 1 */
SELECT	titleauthor.title_id AS TITLE_ID,
		titleauthor.au_id AS AUTHOR_ID,
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTY
FROM	titleauthor
JOIN	titles ON titleauthor.title_id = titles.title_id
JOIN	sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID;

/* Step 2 */
SELECT TITLE_ID, AUTHOR_ID, SUM(SALES_ROYALTY) AS TOTAL_ROYALTY
FROM	(
			SELECT	titleauthor.title_id AS TITLE_ID,
					titleauthor.au_id AS AUTHOR_ID,
					titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTY
			FROM	titleauthor
			JOIN	titles ON titleauthor.title_id = titles.title_id
			JOIN	sales ON titleauthor.title_id = sales.title_id
			ORDER BY TITLE_ID
		) royalties
GROUP BY TITLE_ID, AUTHOR_ID;

/* Step 3 */
SELECT 	AUTHOR_ID, TOTAL_ROYALTY + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM	(
			SELECT TITLE_ID, AUTHOR_ID, SUM(SALES_ROYALTY) AS TOTAL_ROYALTY, ADVANCE, ROYALTYPER
			FROM	(
						SELECT	titleauthor.title_id AS TITLE_ID,
								titleauthor.au_id AS AUTHOR_ID,
								titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTY,
                                titles.advance AS ADVANCE,
                                titleauthor.royaltyper AS ROYALTYPER
						FROM	titleauthor
						JOIN	titles ON titleauthor.title_id = titles.title_id
						JOIN	sales ON titleauthor.title_id = sales.title_id
						ORDER BY TITLE_ID
					) royalties
			GROUP BY TITLE_ID, AUTHOR_ID
		) authors_profit
ORDER BY PROFITS DESC
LIMIT 3;

/***** Challenge 2 *****/
DROP TABLE IF EXISTS Royalties;
CREATE TEMPORARY TABLE Royalties
SELECT	titleauthor.title_id AS TITLE_ID,
		titleauthor.au_id AS AUTHOR_ID,
        titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS SALES_ROYALTY,
        titles.advance AS ADVANCE,
		titleauthor.royaltyper AS ROYALTYPER
FROM	titleauthor
JOIN	titles ON titleauthor.title_id = titles.title_id
JOIN	sales ON titleauthor.title_id = sales.title_id
ORDER BY TITLE_ID;

SELECT * FROM Royalties;

DROP TABLE IF EXISTS AuthorsProfit;
CREATE TEMPORARY TABLE AuthorsProfit
SELECT TITLE_ID, AUTHOR_ID, SUM(SALES_ROYALTY) AS TOTAL_ROYALTY, ADVANCE, ROYALTYPER
FROM Royalties
GROUP BY TITLE_ID, AUTHOR_ID, ADVANCE, ROYALTYPER;

SELECT * FROM AuthorsProfit;

SELECT 	AUTHOR_ID, TOTAL_ROYALTY + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM AuthorsProfit
ORDER BY PROFITS DESC
LIMIT 3;

/***** Challenge 3 *****/
DROP TABLE IF EXISTS most_profiting_authors;
CREATE TABLE most_profiting_authors
SELECT 	AUTHOR_ID, TOTAL_ROYALTY + ADVANCE * ROYALTYPER / 100 AS PROFITS
FROM AuthorsProfit
ORDER BY PROFITS DESC
LIMIT 3;

SELECT * FROM most_profiting_authors;

