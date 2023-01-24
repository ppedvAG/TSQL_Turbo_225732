USE Northwind;

-- <, >, <=, >= kleiner, größer, kleiner-gleich, größer-gleich
-- =, !=, <>: gleich, ungleich, ungleich
-- BETWEEN, IN: BETWEEN: zwischen X und Y (Grenzen inkludiert), IN: Liste von validen Werten und schauen ob der Wert enthalten ist
-- AND, OR: Bedingungen verbinden (beide Bedingungen, mindestens eine Bedingung)
-- NOT: Bedingung invertieren

SELECT * FROM Orders WHERE Freight <= 50; --Order mit Freight weniger als 50 oder genau 50

SELECT * FROM Orders WHERE Freight >= 50; --Order mit Freight mindestens 50

SELECT * FROM Orders WHERE EmployeeID = 1 AND Freight <= 50; --Beide Bedingungen müssen erfüllt sein (AND)

SELECT * FROM Orders WHERE EmployeeID = 1 OR Freight <= 50; --Mindestens eine von beiden Bedingungen muss erfüllt sein (OR)

--BETWEEN

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --BETWEEN: zwischen zwei Werten (1, 2, 3), Grenzen inkludiert

SELECT * FROM Orders WHERE ShippedDate BETWEEN '19970101' AND '19971231'; --Datumsvergleiche müssen ohne Sonderzeichen gemacht werden (nur numerisch)
SELECT * FROM Orders WHERE ShippedDate BETWEEN '1997-01-01' AND '1997-12-31'; --funktioniert hier nicht

--Funktionen

SELECT * FROM Orders WHERE YEAR(ShippedDate) = 1997; --Funktionen auch im WHERE möglich

SELECT * FROM Orders WHERE DATEPART(DAY, OrderDate) = 12; --DATEPART auch möglich

SELECT * FROM Orders WHERE LEN(ShipName) <= 10; --Finde alle Bestellungen bei denen der Kunde maximal 10 Zeichen im Namen hat

--IN

SELECT * FROM Orders WHERE ShipCountry = 'Italy' OR ShipCountry = 'Spain' OR ShipCountry = 'UK'; --Lang

SELECT * FROM Orders WHERE ShipCountry IN('Italy', 'Spain', 'UK'); --Obiges Statement verkürzt mit IN

SELECT * FROM Orders WHERE EmployeeID IN(1, 3, 6); --Alle Bestellungen von den Mitarbeitern 1, 3 oder 6

--NULL

--NULL: Kein Wert in der Zelle, muss bei WHERE gesondert behandelt werden

SELECT * FROM Customers WHERE Fax = NULL; --Nicht möglich

SELECT * FROM Customers WHERE Fax IS NULL; --NULL Vergleiche müssen mit IS gemacht werden

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS NOT NULL um zu schauen welche Datensätze nicht leer sind

SELECT * FROM Orders WHERE Freight NOT BETWEEN 50 AND 100; --Mit NOT BETWEEN invertieren

SELECT * FROM Orders WHERE EmployeeID NOT IN(1, 3, 6); -- Mit NOT IN invertieren

SELECT * FROM Orders WHERE NOT Freight <= 50; --Einzelne Bedingung invertieren
SELECT * FROM Orders WHERE Freight > 50; --Selbes Ergebnis wie oben