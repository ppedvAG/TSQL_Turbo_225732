USE Northwind;

--ORDER BY: Sortiert das Ergebnis

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Ergebnis nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Primär: Country, Sekundär: City)

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> Absteigend, ASC -> Aufsteigend, Standard)

SELECT * FROM Customers ORDER BY 2; --Nach Spaltenindex sortieren (hier CompanyName)

SELECT CompanyName, ContactName, Address, Phone FROM Customers ORDER BY 1; --Nach ContactName sortieren nach gezieltem SELECT

SELECT * FROM Customers ORDER BY 9, 6; --Sortieren der Spalten nach mehreren Indizes

SELECT CONCAT_WS(' ', TitleOfCourtesy, LastName, FirstName) AS FullName FROM Employees ORDER BY FullName; --Nach Spaltenalias sortieren

SELECT CONCAT_WS(' ', TitleOfCourtesy, LastName, FirstName) AS [Full Name] FROM Employees ORDER BY [Full Name];

-----------------------------------------------------------------------

--DISTINCT: Macht das Ergebnis eindeutig

SELECT Country FROM Customers ORDER BY 1; --Duplikate

SELECT DISTINCT Country FROM Customers; --Keine Duplikate mehr (91 -> 22)

SELECT DISTINCT Country, City FROM Customers; --Duplikate von Kombinationen (z.B.: Argentina, Buenos Aires)

SELECT COUNT(*) FROM Customers; --Datensätze in einer Tabelle zählen

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl einzigartiger Länder zählen

-----------------------------------------------------------------------

--TOP: Gibt die obersten X Datensätze aus

SELECT TOP 10 *
FROM Orders; --Obersten 10 Datensätze der Tabelle

SELECT TOP 10 * --TOP macht nur wirklich Sinn mit ORDER BY und/oder WHERE
FROM Orders
ORDER BY Freight; --10 billigsten Bestellungen

SELECT TOP 10 *
FROM Orders
ORDER BY Freight DESC; --10 teuersten Bestellungen

SELECT TOP 2 PERCENT *
FROM Orders
ORDER BY Freight; --Die 2% der billigsten Bestellungen anhand der Anzahl der Datensätze

SELECT TOP 2 PERCENT *
FROM Orders
WHERE Freight >= 50
ORDER BY Freight; --Nurnoch 8 Rows statt 17 -> 360 Datensätze statt 830

SELECT *
FROM [Order Details]
ORDER BY Quantity; --Die kleinsten Bestellungen

SELECT TOP 2 PERCENT *
FROM [Order Details]
ORDER BY Quantity; --2er Quantities werden abgeschnitten

SELECT TOP 2 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity; --Unentschieden miteinbeziehen, ergänzt Datensätze die ohne WITH TIES abgeschnitten werden