/***** Challenge 1 *****/
/*Step 1 */
SELECT	titleauthor.title_id AS TITLE_ID,
		titleauthor.au_id AS AUTHOR_ID,
        titleauthor.royaltyper,
        titles.price, titles.royalty,
        sales.qty,
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
		) authors_profit;

