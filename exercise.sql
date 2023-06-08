SELECT Count(City)
FROM Employees
GROUP BY Extension

SELECT City, Extension, COUNT([EmployeeID]) [Count]
FROM Employees
GROUP BY City,	Extension

SELECT Country, City, Title
FROM Employees
GROUP BY Country, City, Title
ORDER BY Country, City, Title

SELECT Country, City, Title FROM Employees
ORDER BY Country, City, Title

SELECT  DISTINCT  City , FirstName FROM Employees
SELECT City , FirstName
FROM Employees

INSERT INTO Employees VALUES
('Gozalov', 'Andrew', null, null, null, null, null, 'Tacoma', null, null, 'Azerbaijan', null, null, null, 'This guy is awesome', null, null)


SELECT CAST('44' AS INT)
FROM Employees


-- Lesson 2

SELECT Country, TitleOfCourtesy
FROM Employees
WHERE TitleOfCourtesy='Ms.' OR TitleOfCourtesy='Mrs.' AND Country='UK'

SELECT Country, TitleOfCourtesy
FROM Employees
WHERE /*TitleOfCourtesy='Ms.' AND Country='UK' OR */TitleOfCourtesy='Mrs.' 

SELECT Country, TitleOfCourtesy
FROM Employees
WHERE Country='UK' OR TitleOfCourtesy='Ms.' AND TitleOfCourtesy='Mrs.' 

SELECT Country, TitleOfCourtesy
FROM Employees
WHERE TitleOfCourtesy='Ms.' AND TitleOfCourtesy='Mrs.' or Country='UK'

SELECT  FirstName FROM Calisanlar
ORDER BY  1 

SELECT * FROM Calisanlar
ORDER BY 2, 3 DESC

SELECT * FROM Calisanlar
ORDER BY 2, 3 



-- Çalişanlari ünvanlarina göre , ünvanlari ayniysa yaşlarina göre büyükten küçüğe siralayiniz.
-- NOT -> Personel Azerbaijan doğumlu ise, yaşına -1 olarak hesaplayınız :)

SELECT TitleOfCourtesy, FirstName, LastName, Country, IIF(Country = 'Azerbaijan', YEAR(GETDATE()) - YEAR(BirthDate)-1, YEAR(GETDATE()) - YEAR(BirthDate)) AS Age from Employees
ORDER BY TitleOfCourtesy, Age DESC

UPDATE Employees set BirthDate = '1998-01-01' where Country = 'Azerbaijan'

SELECT FirstName, LastName FROM Employees
WHERE FirstName >= 'Janet' AND FirstName <= 'Robert'
--WHERE FirstName BETWEEN 'Janet' AND 'Robert'
ORDER BY FirstName



INSERT INTO Calisanlar VALUES
('Lana', 'Rey'),
('Lara', 'Croft'),
('Lnear', 'Fox'),
('Lnoster', 'Cock'),
('Aaron', 'Fight'),
('Aarti', 'Gen'),
('Anne', 'Hathaway'),
('Anna', 'Maria');








SELECT FirstName, LastName FROM Calisanlar
order by FirstName

-- 1) Adının ilk iki harfi LA, LN, AA veya AN olanlar
SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName LIKE '[LA][AN]%'
order by FirstName

-- 2) Adının içerisinde _ geçen isimleri listeleyiniz ( içeride kayıt yok diye yazmamazlık yapmayınız, bi zahmet 2 satır datayı güncelleyin :))

INSERT INTO Calisanlar VALUES
('_Lana', 'Rey'),
('La_na', 'Rey'),
('La_na_', 'Rey');

SELECT  FirstName, LastName FROM Calisanlar
WHERE FirstName LIKE '%[\_]%'

-- 3) Customers tablosundan CustomerID'sinin 2. harfi A, 4. harfi T olanların %10'luk kısmını getiren sorguyu yazınız.
SELECT  * FROM Customers
WHERE CustomerID LIKE '_a_T%'

-- 4) Adının 2. harfi A veya T olmayanlar
SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName  LIKE  '_[^AT]%'
SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName  LIKE  '_[AT]%'

SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName  LIKE  '_[^AN]%'

-- 5) Adının ilk harfi A ile I aralığında bulunmayanlar
SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName  LIKE  '[^a-i]%'
-- 6) Adı T ile bitmeyenler
SELECT FirstName, LastName FROM Calisanlar 
WHERE FirstName  LIKE  '%[^T]'




-- Lesson3

DECLARE 
@data      NVARCHAR(100) = 'mutalib.gozalov@code.edu.az',
@mail      NVARCHAR(100),
@firstName NVARCHAR(100),
@lastName  NVARCHAR(100),
@company   NVARCHAR(100),
@extention NVARCHAR(100)

SELECT @mail = @data,
@firstName   = LEFT(@data, CHARINDEX('.', @data) -1),				     -- mutalib
@data        = SUBSTRING(@data, CHARINDEX('.', @data)  + 1, LEN(@data)), -- mutalib.gozalov@code.edu.az
@lastName    = LEFT(@data ,CHARINDEX('@', @data) -1),				     -- gozalov
@data        = SUBSTRING(@data, CHARINDEX('@', @data)  + 1, LEN(@data)), -- code.edu.az  
@company     = LEFT(@data, CHARINDEX('.', @data)-1),				     -- code
@data        = SUBSTRING(@data, CHARINDEX('.', @data)  + 1, LEN(@data)), -- edu.az
@company     += '.' +LEFT(@data, CHARINDEX('.', @data) -1),				 -- code.edu
@extention   = SUBSTRING(@data , CHARINDEX('.', @data), LEN(@data))		 -- .az

 print @extention
 

PRINT('
	Adı       : '+ UPPER(LEFT(@firstName,1)) + LOWER(SUBSTRING(@firstName, 2, LEN(@firstName))) +'
	Soyadı    : '+ UPPER(LEFT(@lastName,1)) + LOWER(SUBSTRING(@lastName, 2, LEN(@lastName))) +'
	Şirket    : '+ @company +'
    Mail      : '+ @mail +'
    Extention : '+ TRIM('.' FROM @extention))


SELECT [ValUE], value, VALUE AS ResultSonucu FROM STRING_SPLIT('ali.vuranok@code.edu.az','.')
-- all VALUE columns are same

SELECT COUNT(Region) AS [Toplam Personel Sayısı] FROM Employees
SELECT COUNT(*) AS [Toplam Personel Sayısı] FROM Employees
--not same bexause of NULL values in Region column


SELECT MIN(FirstName)[Maximum Değer], MAX(FirstName) [Minimum Değer] FROM Employees
-- MAX is name starts with last alphabetical char, MIN name starts with A


--IF, ELSE-IF
SELECT 
	EmployeeID, 
	FirstName, 
	LastName , 
	Country,
	IIF
	(Country = 'USA' , 'Amerike Birleşik Devletleri', IIF(Country = 'UK', 'İngiltere Birleşik Kırallığı', Country)) AS Ulke
FROM Employees

--SWITCH, CASE
SELECT 
	EmployeeID, 
	FirstName, 
	LastName , 
	Country,
	CASE (Country)
		WHEN 'UK'  THEN 'İngiltere Birleşik Kırallığı'
		WHEN 'USA' THEN 'Amerike Birleşik Devletleri'
		ELSE Country
	END AS 'Ülke'
FROM Employees


SELECT 
	EmployeeID, 
	FirstName, 
	LastName, 
	CASE 
	WHEN EmployeeID > 5 THEN '5''ten büyüktür'
	WHEN EmployeeID < 5 THEN '5''ten küçük'
	ELSE '5''e eşittir'
	END AS Result
FROM Employees


--Lesson 4

-- Employees Tablosundan; FirstName alanına göre, 
-- isimleri Asc olarak sıraladıktan sonra, sonuç kümesinin ilk beş kaydını ülkelerine göre gruplayın
SELECT Country, COUNT(*) AS Adet
FROM (SELECT TOP 5 * FROM Employees ORDER BY FirstName) AS Isciler -- NOTE: Table alias is neessery
GROUP BY Country

-- Ürün bedeli 35$'dan az olan ürünlerin kategorilerine göre gruplanması
SELECT CategoryID, COUNT(*)
FROM Products 
WHERE UnitPrice < 35
GROUP BY CategoryID
ORDER BY 2 DESC

-- BAŞ HARFI A-K ARALIĞINDA OLAN VE STOK MIKTARI 5 ILE 50 ARASINDA OLAN ÜRÜNLERI KATEGORILERINE GÖRE GRUPLAYINIZ. --
DECLARE @i INT = 65;
WHILE @i <= 90
	BEGIN
		PRINT char(@i);
		SET @i = @i + 1;
	END;
DECLARE @a_k VARCHAR = 'A, B, C, D, E, F, G, H, I, J, K'
DECLARE @l_z VARCHAR = 'L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z'

SELECT CategoryID, ProductName--, COUNT(*) AS Adet
FROM Products
WHERE ProductName LIKE '[A-K]%' AND UnitsInStock BETWEEN 5 AND 50
--GROUP BY CategoryID
ORDER BY 1

SELECT CategoryID, ProductName--, COUNT(*) AS Adet
FROM Products
WHERE LEFT(ProductName, 1) IN ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K') AND UnitsInStock BETWEEN 5 AND 50
--GROUP BY CategoryID
ORDER BY 1
------------------------------------------------------------------------------------
SELECT CategoryID, ProductName--, COUNT(*) AS Adet
FROM Products
WHERE ProductName LIKE '[^A-K]%' AND UnitsInStock BETWEEN 5 AND 50 -- NEGATION ^ NEGATE ALL CHARS INSIDE RANGE
--GROUP BY CategoryID
ORDER BY 1

SELECT CategoryID, ProductName--, COUNT(*) AS Adet
FROM Products
WHERE LEFT(ProductName, 1) IN ('L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z') AND UnitsInStock BETWEEN 5 AND 50
--GROUP BY CategoryID
ORDER BY 1




-- Her bir siparişteki toplam ürün sayısını bulunuz. 
SELECT OrderID, COUNT(OrderID) [Sifaris Sayi], SUM(Quantity) [Mehsul cemi]
FROM [Order Details]
GROUP BY OrderID
ORDER BY 1

--overcomplicated
SELECT O.OrderID, COUNT(OD.OrderID) [Sifaris Sayi], SUM(OD.Quantity) [Mehsul cemi]
FROM Orders O, [Order Details] OD
WHERE OD.OrderID = O.OrderID
GROUP BY O.OrderID
ORDER BY 1


-- Her bir siparişin tutarına göre listelenmesi
SELECT OrderID, CAST(CAST(SUM(UnitPrice*Quantity*(1-Discount)) AS DECIMAL(12 ,2)) AS NVARCHAR(100))+' $' Cost
FROM [Order Details]
GROUP BY OrderID

--sum of all Costs above
SELECT SUM(cost) [Totatl Cost :)]
FROM(SELECT OrderID, CAST(SUM(UnitPrice*Quantity*(1-Discount)) AS DECIMAL(12 ,2)) Cost
FROM [Order Details]
GROUP BY OrderID) AS whatever

-- Toplam tutari 2500 ile 3500 arasinda olan siparişlerin gruplanması
SELECT OrderID, CAST(SUM(UnitPrice*Quantity*(1-Discount)) AS DECIMAL(12 ,2)) Cost
FROM [Order Details]
GROUP BY OrderID
HAVING SUM((Quantity * UnitPrice)*(1-Discount)) between 2500 and 3500 -- NOTE: HAVING filters datas after grouping them where WHERE does it before
ORDER BY 2

-- Her bir siparişteki toplam ürün sayisi 200'den az olanlar
SELECT OrderID, COUNT(OrderID) [Sifaris Sayi], SUM(Quantity) [Mehsul cemi]
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) < 200
ORDER BY [Mehsul cemi] DESC


/*
	1) Inner Join
	2) Left Outer Join
	3) Right Outer Join
	4) Full Join
	5) Cross Join
	6) Self Join
	7) Where Join
	8) Union
	9) Union All 
*/

								------------------- JOIN IŞLEMLERI -----------------
-- 1) Inner Join: Bir tablodaki her bir kaydın diğer tabloda bir karşılığı olan kayıtlar listelenir. 
--    Inner Join ifadesini yazarken Inner cümlesini yazmazsak da (sadece Join yazarsak) bu yine Inner Join olarak işleme alınır.

SELECT CategoryName, ProductName
FROM Products 
INNER JOIN Categories 
	ON Categories.CategoryID = Products.CategoryID

-- Hangi sipariş, hangi çalışan tarafından, hangi müşteriye yapılmış
-- Employees
-- Orders
-- Customers

SELECT O.OrderID, E.FirstName Employee, C.ContactName Customer
FROM Employees E
JOIN Orders O
	ON O.EmployeeID = O.EmployeeID
JOIN Customers C
	ON O.CustomerID = C.CustomerID
-- Sorguyu kısaltmak amacıyla tablo isimlerine de takma isim verilebilir, ancak dikkat edilmesi gereken
-- nokta bir tabloya takma isim verildikten sonra artık her yerde o ismin kullanılması gerektiğidir.



-- Suppliers tablosundan CompanyName, ContactName
-- Products tablosundan ProductName, UnitPrice
-- Categories tablosundan CategoryName
-- CompanyName sütununa göre artan sırada sıralayınız.

SELECT SP.[CompanyName], SP.[ContactName], P.ProductName, P.UnitPrice, C.CategoryName
FROM Products P
JOIN Suppliers SP
	ON P.SupplierID = SP.SupplierID
JOIN Categories C
	ON P.CategoryID = C.CategoryID
ORDER BY 1


-- Tüm bilgilerini ekleyin, ünvan adı soyadı 
-- Her bir çalışan toplam ne kadarlık (PUL) :) satış yapmıştır.
SELECT Employees.[EmployeeID], SUM(Freight) [Total sale], '$' [-], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [ReportsTo]
FROM Employees
JOIN Orders
	ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.[EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [ReportsTo]
ORDER BY 1




--LESSON 5

SELECT ProductID
     , ProductName
     , UnitPrice
     , UnitsInStock
     , C.Description
	 , S.CompanyName
	 , S.ContactTitle
	 , S.ContactName
FROM Products P
    JOIN Categories C
        ON P.CategoryID = C.CategoryID
    JOIN Suppliers  S
        ON P.SupplierID = S.SupplierID
--  	 JOIN VS SUBQUERY      --
SELECT ProductID
     , ProductName
     , UnitPrice
     , UnitsInStock
     , (
           SELECT CONCAT(CategoryName, ' - ', [Description])
           FROM Categories C
           Where C.CategoryID = P.CategoryID
       )           AS Category
     , (
           SELECT CONCAT(S.CompanyName, ' - ',S.ContactTitle, ' - ',  S.ContactName) 
           FROM Suppliers S WHERE S.SupplierID = P.SupplierID 
       ) AS Supplier
FROM Products P



-- Fiyatı ortalama fiyatın üstünde olan ürünler
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY 2


-- Ürünler tablosudaki satılan ürünlerin listesi
SELECT DISTINCT P.ProductName
FROM Products P
JOIN [Order Details] OD
	ON OD.ProductID = P.ProductID
-- VS
SELECT ProductName
FROM  Products
WHERE ProductID IN (SELECT DISTINCT ProductID FROM [Order Details])
ORDER BY 1



-- kargo şirketlerinin taşıdıkları sipariş sayıları
SELECT S.CompanyName, COUNT(O.OrderID) [Order count]
FROM Shippers S
JOIN Orders O
	ON S.ShipperID = O.ShipVia
GROUP BY S.CompanyName
-- VS
SELECT (SELECT CompanyName FROM Shippers S WHERE O.ShipVia = S.ShipperID) AS CompanyName, COUNT(O.OrderID) [Order count]
FROM Orders O
GROUP BY O.ShipVia




--TWO SITUATIONS WITH SUBQUERIES AFTER SELECT STATEMENT(SUBQUERY AS COLUMN)
SELECT FirstName, (SELECT MAX(EmployeeID) FROM Employees ) as 'Max', 'Arbitrary' as Ar
FROM Employees
------
SELECT ShipVia, (SELECT CompanyName 
				FROM Shippers S 
				WHERE O.ShipVia = S.ShipperID) AS CompanyName
FROM Orders O
GROUP BY O.ShipVia


								--PROBLEM
SELECT P.ProductName, (SELECT CategoryName FROM Categories C WHERE P.CategoryID = C.CategoryID)
FROM Products P					-- WORKS
--GROUP BY P.CategoryID

SELECT C.CategoryName, (SELECT ProductName FROM Products p WHERE P.CategoryID = C.CategoryID) as CN
FROM Categories C				-- WON'T WORK
--GROUP BY C.CategoryName


-- EXPLANATION
/*
corelated subqueries executes every time one loop of outer query executed.
When one row of dat fetched from database the subquery will run on that data by checking given reltaion
in our case is TableMany.TableOneId of current data row table data should be equal to TableOne.Id of
subquery table. And very time a data row comes from outer table one corresponding data will be queried 
by subquery.
If in subquery there are more than one value for current outer data row then db will give multiple row
error, which is usual among one-to-many relationships where one data from one side table will have multible
datas from many side table. But if only by chance each one_table datas has 1 related data from many_table
then our query will not give an error.

REFERENCE: https://www.ibm.com/docs/en/informix-servers/14.10?topic=documentation-sql-programming

INSERT INTO TableOne VALUES
('Name_1'),
('Name_2'),
('Name_3'),
('Name_4'),
('Name_5'),
('Name_6'),
('Name_7'),
('Name_8'),
('Name_9')

INSERT INTO TableMany VALUES
(1, 'Many_1'),
(1, 'Many_2'),
(2, 'Many_3'),
(3, 'Many_4')
*/


SELECT TM.Name, (SELECT T1.Name FROM TableOne T1 WHERE T1.Id = TM.TableOneId) Table1
FROM TableMany TM
--AND
SELECT T1.Name, (SELECT TM.Name FROM TableMany TM WHERE TM.TableOneId = T1.Id)
FROM TableOne T1
--WHERE T1.Name != 'Name_1' --WILL WORK






-- Sipariş Alan Çalışanları Listeleyiniz