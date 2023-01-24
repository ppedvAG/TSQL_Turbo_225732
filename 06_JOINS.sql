USE Northwind;

--JOINs: Tabellen anhand gemeinsamer Schl�ssel zusammenbauen
--Werden verwendet um Daten die �ber mehrere Tabellen verteilt sind zusammenzubauen

SELECT * FROM Orders; --Mehrere IDs aus anderen Tabellen: CustomerID (Customers), EmployeeID (Employees), ShipVia (Shippers)
SELECT * FROM Employees; --Datens�tze kombinieren �ber EmployeeID

SELECT * FROM Orders
INNER JOIN Employees --Andere Tabelle angeben
ON Orders.EmployeeID = Employees.EmployeeID; --Gemeinsame Spalte angeben

SELECT 
Orders.EmployeeID, --Ambiguous column name 'EmployeeID': hier m�ssen wir eine Spalte aus einer Tabelle ausw�hlen die angezeigt werden soll
Employees.EmployeeID, --gleicher Inhalt, deswegen egal welche Spalte genommen wird
FirstName + ' ' + LastName AS FullName,
Freight,
ShipName,
ShipAddress
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;

SELECT * FROM Orders AS o --Tabelle einen Namen geben (hier o)
INNER JOIN Employees e --Tabelle einen Namen geben ohne AS (selbiges wie dar�ber)
ON o.EmployeeID = e.EmployeeID; --Hier unten Aliases benutzen

SELECT 
o.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
o.Freight,
o.ShipName,
o.ShipAddress
FROM Orders AS o
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID;


--Order und Customer joinen
SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;

--Reihenfolge von Customers und Orders vertauschen um Ausgabe umzudrehen
SELECT * FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--JOIN mit mehreren Tabellen
SELECT * FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID --Erster JOIN
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID; --Zweiter Join

SELECT
o.OrderID,
o.Freight,
o.RequiredDate,
o.ShippedDate,
e.FirstName + ' ' + e.LastName AS FullName,
c.CompanyName,
c.ContactName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID; --Sinnvolle Spalten ausw�hlen

---------------------------------------------------------------

--OUTER JOINs: Nehmen bei NULL Werten auf der anderen Seite den Datensatz trotzdem mit (INNER JOINs verwerfen diese Datens�tze)

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --830 Rows

SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID; --832 Rows, NULL Werte werden auf der Seite ohne Match erg�nzt

SELECT * FROM Customers c
LEFT JOIN Orders o --Hier LEFT JOIN machen, da die Tabellen vertauscht werden
ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Hier alle Datens�tze filtern die kein Match haben

--CROSS JOIN: Verkn�pft alle Datens�tze aus T1 mit allen Datens�tzen aus T2

SELECT * FROM Orders
CROSS JOIN Customers; --Verbinde alle Order mit allen Customers