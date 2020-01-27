select step2.au_id , step2.advance
from
(select sum(sales_royalty) as total_royalties, step1.title_id, step1.au_id, step1.advance
from
(select s.title_id, t.title, ta.au_id, t.advance,t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100) as sales_royalty
from sales s 
left join titles t
on s.title_id = t.title_id
left join titleauthor ta
on t.title_id = ta.title_id
group by au_id )
 as step1
 )as step2
limit 3;


select 
ta.author_id,
ste.total_royalties,
t.advance
from step2 ste
limit 3;
create temporary table step2
select 
st.title_id,
ta.author_id,
sum(sales_royalty) as total_royalties
from step1 st
left join titleauthor ta
on s.title_id = ta.title_id
group by ta.author_id;
create temporary table step1 
(select
s.title_id,
t.title,
t.price * s.qty * (t.royalty / 100) * (ta.royaltyper / 100) as sales_royalty
from sales as s
left join titles as t
on s.title_id = t.title_id
left join titleauthor ta
on t.title_id = ta.title_id
group by t.title_id);


