USE Northwind;

--CREATE TABLE <Name> (<Spalte1> <Typ1>, ...)
CREATE TABLE Test
(
	--primary key: Primärschlüssel, eindeutige Spalte, kann nicht null sein, häufig IDs, mehrere Primärschlüssel möglich (kombinierter Schlüssel)
	--identity: Erhöht die Spalte automatisch um 1 wenn ein neuer Wert geschrieben wird
	--identity(<Startwert>, <Inkrement>): Starte bei <Startwert>, erhöhe um <Inkrement>, identity(5, 3) -> 5, 8, 11, 14, 17, ...
	ID int identity primary key,
	Vorname varchar(20),
	Nachname varchar(20) not null --Es muss bei jedem Datensatz ein Wert enthalten sein
);

------------------------------------------------------------------

--INSERT INTO <Tabelle> VALUES (<Wert1>, <Wert2>, ...), (<Wert1>, <Wert2>, ...)
INSERT INTO Test VALUES
('Max', 'Muster')

--Mehrere Datensätze gleichzeitig einfügen
INSERT INTO Test VALUES
('Max', 'Muster'),
('Test', 'Test')

--Nur bestimmte Spalten in die Tabelle schreiben
INSERT INTO Customers(CustomerID, CompanyName) VALUES
('PPEDV', 'ppedv AG');

--Nicht möglich, da Nachname NOT NULL
INSERT INTO Test VALUES
('Max', NULL);

--Ergebnisse von SELECT direkt in eine Tabelle schreiben
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis einer SELECT Abfrage in eine NEUE Tabelle schreiben
SELECT FirstName, LastName INTO #EmpTest
FROM Employees; --funktioniert nicht, da EmpTest bereits existiert

------------------------------------------------------------------

--UPDATE <Tabellenname> SET <Spaltenname> = <Neuer Wert> WHERE <Bedingung>

UPDATE Test SET Nachname = 'Test';

--WHERE verwenden um nicht alle Daten zu verändern
UPDATE Test SET Nachname = 'Test2'
WHERE ID BETWEEN 5 AND 10;

--Spalte kann auch nach dem = verwendet werden
UPDATE Test SET Nachname = Nachname + '123';

------------------------------------------------------------------

--DELETE FROM <Tabelle>
--Löscht alle Daten ohne WHERE
DELETE FROM Test;

--Mit WHERE einschränken
DELETE FROM Test WHERE ID > 10;

--Löscht alle Daten wie DELETE FROM Test
--Kein WHERE möglich
--Programmierer wollte explizit alle Daten löschen
TRUNCATE TABLE Test;

------------------------------------------------------------------

--DROP <Typ> <Name>
--Datenbankobjekt löschen
DROP TABLE Test;

------------------------------------------------------------------

--CREATE SEQUENCE <Name> AS <Typ>
--Standardmäßig (1, 1)
CREATE SEQUENCE TestSeq AS INT;

--CREATE SEQUENCE <Name> AS <Typ>
--START WITH <Start> INCREMENT BY <Increment>
CREATE SEQUENCE TestSeq AS INT
START WITH 230000
INCREMENT BY 1;

--Nächsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT nächsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test');

--Sequenz zurücksetzen
ALTER SEQUENCE TestSeq RESTART WITH 230000;

------------------------------------------------------------------

--Transactions
BEGIN TRAN;
--Code
COMMIT;
ROLLBACK;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; --Nicht geschriebene Daten lesen