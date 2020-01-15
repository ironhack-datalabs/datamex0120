CREATE TEMPORARY TABLE royalty_per_au
select titleauthor.title_id as TITLE_ID, titleauthor.au_id as AUTHOR_ID, (titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as sales_royalty, titles.price as PRICE, sales.qty as QTY, titles.royalty as ROYALTY, titleauthor.royaltyper as ROYALTYPER, titles.advance*(titleauthor.royaltyper/100) as ADVANCE
from titleauthor
inner join titles
on titles.title_id = titleauthor.title_id
inner join sales
on sales.title_id = titleauthor.title_id


-- --STEP 2
select AUTHOR_ID, sum((sales_royalty + ADVANCE)) as PROFIT
from royalty_per_au
group by AUTHOR_ID
ORDER BY PROFIT DESC
LIMIT 3

-- CHALLENGE #3
-- --STEP 1
create table most_profiting_authors
as
select AUTHOR_ID, sum((sales_royalty + ADVANCE)) as PROFIT from royalty_per_au
group by AUTHOR_ID
ORDER BY PROFIT DESC


select * from most_profiting_authors
limit 3