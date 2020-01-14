-- Para corregir error de update (safe mode)
-- SET SQL_SAFE_UPDATES=0; 

update Salespersons set Store = 'Miami' where STAFF_ID = 5;
update Customers set Email = 'ppicasso@gmail.com' where CUSTOMER_ID = 10001;
update Customers set Email = 'lincoln@us.gov' where CUSTOMER_ID = 20001;
update Customers set Email = 'hello@napoleon.me' where CUSTOMER_ID = 30001;

-- SET SQL_SAFE_UPDATES=1;