USE publications;
/*---- CHALLENGE 1 ----*/
/*PASO 1 y 2*/
DROP TEMPORARY TABLE IF EXISTS authorroyalties;
CREATE TEMPORARY TABLE publications.authorroyalties
(SELECT ta.title_id, ta.au_id,t.price,t.royalty, (t.price * s.qty*t.royalty/100*ta.royaltyper/100) as sales_royalty
FROM 
	titleauthor AS ta
INNER JOIN 
	titles AS t
	ON 
		t.title_id = ta.title_id
INNER JOIN
	sales AS s
    ON
		t.title_id = s.title_id
);

/*PASO 3*/

(SELECT au_id,sum(sales_royalty)FROM authorroyalties
GROUP BY au_id
ORDER BY sum(sales_royalty) DESC
LIMIT 3
);
