-- yorum satýrý

select * from customers

-- eklemek (insert)
insert into customers ([NAMESURNAME],[GENDER],[BIRTHDATE],[CITY],[TOWN],[TELNR],[TCNUMBER])

values
('Hamza Demirkýran','E','1976-08-01','Giresun','Dereli','123123123','4321432142')

-- güncellemek (update)
update CUSTOMERS set [AGE]=DATEDIFF(YEAR,BIRTHDATE,GETDATE())


-- silmek (delete)

delete from customers

-- *********************************************

-- where koþulu uygulamalarý

-- ýd ye göre getirme
select * from customers
where ýd=1

-- adý arif olan
select * from customers
where namesurname='Arif Eker'

-- cinsiyeti "E" olmayan
select * from customers
where [gender] <> 'E'

-- bir tarihten büyük doðanlar
select * from customers
where BIRTHDATE > '1990-10-11'

-- ismi verilen harfle baþlayan kiþiler
select * from customers
where namesurname like 'ç%'


-- isminde verilen harfle geçenler
select * from customers
where namesurname like '%hak%'

-- sonu verilen harflerle bitenler
select * from customers
where namesurname like '%ar'

-- þehri verilen lsitede olanlar gelsin
select * from customers
where CITY in ('Ýzmir','Ýstanbul','Bursa')

-- þehri bu olmayanlar
select * from customers
where CITY not in ('Ýzmir','Ýstanbul','Bursa')

select * from customers
where not CITY in ('Ýzmir','Ýstanbul','Bursa')


--***********************************************

-- AND ve OR Operatörleri Uygulamalarý


-- þehri bursa olan ve yaþý 25 olanlar
select * from customers
where CITY = 'Bursa' and [age]<=25


-- þehri bursa olan ve yaþý 22 ya da 61 olanlar
select * from customers
where CITY='Bursa' and (AGE=22 or AGE=61)



-- kaç cinsiyet var
select distinct gender from customers

-- kaç farklý þehir var
select distinct CITY from customers

-- ayný günde doðan kaç kiþi var 
select distinct BIRTHDATE from customers

-- sýralama yapmak (order by)

select NAMESURNAME,AGE from customers
where age <=30
order by age desc


select NAMESURNAME,AGE from customers
where age <=30
order by age asc


select NAMESURNAME,AGE from customers
where age <=30
Order By BIRTHDATE desc,NAMESURNAME desc

--*************************************************

--yeni database oluþturmak

create database TEST2

-- oluþturulan database yi kullanmak
USE TEST2

-- oluþturulan databasete tablo oluþturmak

create table CUSTOMERS (ID INT IDENTITY (1,1),NAMESURNAME Varchar(100),EMAIL varchar(100))

-- primary key eklemek
alter table customers 
add primary key (ID)

-- yeni kolon eklemek
alter table customers
add BIRTHDATE date

-- kolon silmek
alter table customers 
drop column BIRTHDATE


-- AGGREGATION Functions

-- Etrade database

select count(*) as satirsayisi,
min(UNITPRICE) as EnDusukFiyat, 
max(UNITPRICE) as EnYuksekFiyat,
avg(UNITPRICE) as OrtalamaFiyat,
sum(AMOUNT) as ToplasSatisSayisi,
sum(LINETOTAL) as ToplamCiro,
avg(LINETOTAL) as OrtalamaCiro
from SALEORDERS

--*************************************************
-- Group By Uygulamalarý

-- þehre göre toplam ciro
select CITY as SEHIR, sum(LINETOTAL) as CIRO
from SALEORDERS
GROUP BY CITY
ORDER BY sum(LINETOTAL) desc



select CITY as SEHIR, ORDERDATE as TARIH, sum(LINETOTAL)
from SALEORDERS
where CITY = 'ANKARA' and ORDERDATE<'2020'
GROUP BY CITY, ORDERDATE
Order By ORDERDATE

-- maðazalarýn aylara göre satýþlarýný getirme

select 
CITY as Magaza,
DATEPART(MONTH,ORDERDATE) as [Tarih/Ay],
sum(LINETOTAL) as ToplamCiro
from SALEORDERS
where ORDERDATE< '2020'
group by CITY, DATEPART(MONTH,ORDERDATE)
order by cýty, MONTH(ORDERDATE)


-- **************************************************

-- JOIN Kullanýmý

select 
A.ID, A.ADDRESSTEXT, C.CITY,T.TOWN
from ADDRESS A
JOIN CITIES C ON C.ID = A.CITYID
join TOWNS T on T.ID = A.TOWNID

WHERE A.USERID = 1

--******************************************
-- Inner Join

-- Left Join

-- Right Join

-- Full Join

