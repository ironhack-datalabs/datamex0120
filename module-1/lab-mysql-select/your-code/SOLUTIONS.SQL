# 1
select au.au_id as Author_ID,
 au.au_lname as LAST_NAME,
 au.au_fname as FIRST_NAME,
 titles.title as TITLE,
 publishers.pub_name as PUBLISHER
from authors as au
left join titleauthor
on au.au_id=titleauthor.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on publishers.pub_id=titles.pub_id;

# 2
select au.au_id as Author_ID,
 au.au_lname as LAST_NAME,
 au.au_fname as FIRST_NAME,
 publishers.pub_name as PUBLISHER,
 count(titles.title) as TITLE_COUNT
from authors as au
left join titleauthor
on au.au_id=titleauthor.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on publishers.pub_id=titles.pub_id
group by au.au_id,au.au_lname, au.au_fname,publishers.pub_name
order by count(titles.title) desc;

# 3
select ta.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
sum(s.qty) as TOTAL
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join sales as s
on s.title_id=ta.title_id
group by ta.au_id
order by SUM(s.qty) desc;

# 4
select ta.au_id as AUTHOR_ID,
a.au_lname as LAST_NAME,
a.au_fname as FIRST_NAME,
SUM(s.qty) as TOTAL
from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join sales as s
on s.title_id=ta.title_id
group by ta.au_id
order by SUM(s.qty) desc
limit 3;
