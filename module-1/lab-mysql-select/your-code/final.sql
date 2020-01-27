USE publications;

--Challenge 1

SELECT ta.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name,
t.title AS Title, pb.pub_name AS Publisher
FROM authors aut
RIGHT JOIN titleauthor ta
ON ta.au_id=aut.au_id
JOIN titles t
ON t.title_id=ta.title_id
JOIN publishers pb
ON pb.pub_id=t.pub_id;

--Challenge 2

SELECT Author_ID, Last_Name, First_Name, Publisher, COUNT(Title) AS Title_Count FROM 
(SELECT ta.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name,
t.title AS Title, pb.pub_name AS Publisher
FROM authors aut
RIGHT JOIN titleauthor ta
ON ta.au_id=aut.au_id
JOIN titles t
ON t.title_id=ta.title_id
JOIN publishers pb
ON pb.pub_id=t.pub_id
) AS Titles_per_Author
GROUP BY Author_ID;

-- Challenge 3

SELECT ta.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name, SUM(s.qty) AS Total
FROM authors aut
RIGHT JOIN  titleauthor ta
ON ta.au_id=aut.au_id
JOIN titles t
ON t.title_id=ta.title_id
JOIN sales s
ON s.title_id=t.title_id
GROUP BY Author_ID
ORDER BY Total DESC LIMIT 3;

-- Challenge 4

SELECT ta.au_id AS Author_ID, aut.au_lname AS Last_Name, aut.au_fname AS First_Name, SUM(s.qty) AS Total
FROM authors aut
RIGHT JOIN  titleauthor ta
ON ta.au_id=aut.au_id
JOIN titles t
ON t.title_id=ta.title_id
JOIN sales s
ON s.title_id=t.title_id
GROUP BY Author_ID
ORDER BY Total DESC LIMIT 23;