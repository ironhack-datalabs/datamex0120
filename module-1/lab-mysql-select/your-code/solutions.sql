-- CHALLENGE #1
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as TITLE, publishers.pub_name as 'PUBLISHER' from authors
right join titleauthor on authors.au_id  = titleauthor.au_id
inner join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
order by authors.au_id ASC

-- CHALLENGE #2
select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(TITLE) as 'TITLE COUNT'
from
(select authors.au_id as 'AUTHOR_ID', authors.au_lname as 'LAST_NAME', authors.au_fname as 'FIRST_NAME', titles.title as TITLE, publishers.pub_name as 'PUBLISHER' from authors
right join titleauthor on authors.au_id  = titleauthor.au_id
inner join titles on titles.title_id = titleauthor.title_id
left join publishers on publishers.pub_id = titles.pub_id
order by authors.au_id ASC) as chall1
group by AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY AUTHOR_ID DESC, PUBLISHER DESC;

-- CHALLENGE #3
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname FIRST_NAME, sum(sales.qty) as TOTAL
from titleauthor
inner join `authors`
on authors.au_id = titleauthor.au_id
inner join sales
on sales.title_id = titleauthor.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc
limit 3;

-- CHALLENGE #4
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname FIRST_NAME, COALESCE(sum(sales.qty), 0 ) as TOTAL
from titleauthor
right join `authors`
on authors.au_id = titleauthor.au_id
left join sales
on sales.title_id = titleauthor.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc;

-- BONUS ( Considering there is no advance. )
select AUTHOR_ID, LAST_NAME, FIRST_NAME, COALESCE(SUM((ROYALTYPER/100)*(SALES)*ROYALTY),0) AS PROFIT
from
(select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titleauthor.title_id as TITLE_ID, titleauthor.royaltyper as ROYALTYPER, sum(COALESCE(sales.qty, 0 )) as SALES, roysched.lorange as Low_RANGE, roysched.hirange as Hi_RANGE, roysched.royalty as ROYALTY
from authors
left join titleauthor on titleauthor.au_id = authors.au_id
left join sales on sales.title_id = titleauthor.title_id
left join roysched on roysched.title_id = titleauthor.title_id
group by authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id, titleauthor.royaltyper, roysched.lorange, roysched.hirange, roysched.royalty) as sales_distr
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by PROFIT DESC
LIMIT 3;
