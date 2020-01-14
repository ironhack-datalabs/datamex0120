#Challenge 1 - Most Profiting Authors
create temporary table profit_books
select titles.title_id, titles.price, titles.advance, titles.royalty, (titles.price*titles.royalty/100) as royalti_T, 
	SUM(sales.qty), (titles.advance+(SUM(sales.qty)*titles.price*titles.royalty/100)) as profit
from titles
left join sales
on sales.title_id=titles.title_id
group by (titles.title_id)
order by (titles.advance+(SUM(sales.qty)*titles.price*titles.royalty/100)) DESC;

select * from profit_books;

create temporary table profit_books2
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(profit_books.profit) AS PROFIT
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN profit_books
ON profit_books.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(profit_books.profit) DESC;

select * from profit_books2;

#Challenge 2 - Alternative solution... Derived Tables...

select * from
(select titles.title_id, titles.price, titles.advance, titles.royalty, (titles.price*titles.royalty/100) as royalti_T, 
	SUM(sales.qty), (titles.advance+(SUM(sales.qty)*titles.price*titles.royalty/100)) as profit
from titles
left join sales
on sales.title_id=titles.title_id
group by (titles.title_id)
order by (titles.advance+(SUM(sales.qty)*titles.price*titles.royalty/100)) DESC
) as profit_books3;

select * from
(SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(profit_books.profit) AS PROFIT
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN profit_books
ON profit_books.title_id=titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(profit_books.profit) DESC
) as profit_books4;



#Challenge 3
CREATE TABLE most_profiting_authors
SELECT AUTHOR_ID, PROFIT
FROM profit_books2
;