USE Northwind;

--Wildcards: Eine Bedingung im WHERE ungef�hr vergleichen
--Braucht den LIKE Operator

--%: beliebig viele Zeichen

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer in L�ndern die mit A anfangen -> A und danach beliebig viele Zeichen

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case-Insensitive (selbes Ergebnis wie oben)

SELECT * FROM Customers WHERE Country LIKE '%a'; --Alle L�nder die mit a oder A enden

SELECT * FROM Customers WHERE Country LIKE '%a%'; --Alle L�nder mit A drinnen (A am Anfang und A am Ende z�hlt auch)

SELECT * FROM Customers WHERE Country LIKE '%a%a%'; --Alle L�nder mit zwei A drinnen

SELECT * FROM Customers WHERE Country LIKE 'An%'; --Mehrere Zeichen im Wildcardstring

SELECT * FROM Customers WHERE ContactName LIKE '%maria%'; --Alle Customer finden die eine Ansprechperson namens Maria haben

--_: Genau ein beliebiges Zeichen suchen

SELECT * FROM Customers WHERE City LIKE '_�nchen'; --Alle Cities die mit �nchen enden

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Alle 4-Stelligen Postleitzahlen finden (suche genau 4 beliebige Zeichen)

SELECT * FROM Customers WHERE PostalCode LIKE '1___'; --Alle Postleitzahlen finden die mit einer 1 anfangen und genau 4 Zeichen lang sind

--[]: Suche genau ein Zeichen aus der gegebenen Liste
-- -: Gibt einen Bereich an in den Klammern

SELECT * FROM Customers WHERE Country LIKE '[abc]%'; --Suche genau A, B oder C und danach beliebig viele Zeichen

SELECT * FROM Customers WHERE Country LIKE '[a-g]%'; --Suche genau A bis G und danach beliebig viele Zeichen

--^: Suche nicht genau die gegebenen Zeichen

SELECT * FROM Customers WHERE Country LIKE '[^abc]%'; --Suche alle L�nder die nicht mit A, B oder C anfangen

SELECT * FROM Customers WHERE Country LIKE '[^a-g]%'; --Suche alle L�nder die nicht mit A bis G anfangen

--|: Kombiniere zwei Bereiche innerhalb []

SELECT * FROM Customers WHERE Country LIKE '[a-c|v-z]%'; --Suche alle L�nder die mit A bis C oder V bis Z anfangen

SELECT * FROM Customers WHERE Country LIKE '[^a-c|v-z]%'; --^ invertiert hier die ganze Klammer

--Sonderf�lle

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Prozent im Namen suchen

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Hochkomma im Namen suchen

SELECT * FROM Customers WHERE CompanyName LIKE '%''%'; --Auch m�glich