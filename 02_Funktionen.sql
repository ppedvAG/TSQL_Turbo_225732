USE Northwind;

--Datumsfunktionen

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau

SELECT YEAR(GETDATE()); --Jahr von einem Datum zurückgeben
SELECT MONTH(GETDATE()); --Monat von einem Datum zurückgeben
SELECT DAY(GETDATE()); --Tag von einem Datum zurückgeben

SELECT YEAR(HireDate) FROM Employees; --Datumsfunktion auf Datumsspalte anwenden

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

--DATEPART: Gibt einen Teil eines Datums zurück
SELECT DATEPART(HOUR, GETDATE()); --Stundenteil vom heutigem Datum
SELECT DATEPART(HH, GETDATE()); --Kurzform von HOUR -> HH

SELECT DATEPART(QQ, GETDATE()); --Quartal vom heutigen Datum
SELECT DATEPART(DY, GETDATE()); --Tag vom 01.01. weg (24)
SELECT DATEPART(DW, GETDATE()); --Tag vom Montag weg (2)

--DATEDIFF: Gibt die Differenz zwischen zwei Datumswerten zurück mit Intervall
SELECT DATEDIFF(YEAR, '2000-12-31', GETDATE()); --Schaut nur auf den Jahresteil
SELECT DATEDIFF(DAY, '2000-12-31', GETDATE()) / 365.25; --Jahresabstand über Tage berechnen (.25 für Schaltjahr)

--DATENAME: Gibt den Namen eines Intervalls aus
SELECT DATENAME(MONTH, GETDATE()); --Schöner Name vom heutigen Monat (Januar)
SELECT DATENAME(WEEKDAY, GETDATE()); --Schöner Name vom heutigen Tag (Dienstag)

--Stringfunktionen

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Strings zusammenbauen

--CONCAT: Baut beliebig viele Spalten zusammen
SELECT CONCAT(CompanyName, Address, City, PostalCode, Country) FROM Customers; --Selbes Ergebnis wie oben nur besser lesbar

--CONCAT_WS: Baut beliebig viele Spalten zusammen mit einem Seperator (WS = with seperator)
SELECT CONCAT_WS(' ', CompanyName, Address, City, PostalCode, Country) FROM Customers;
SELECT CONCAT_WS(' ', CompanyName, Address, City) + ', ' + CONCAT_WS(' ', PostalCode, Country) FROM Customers;

--TRIM, RTRIM, LTRIM: Abstände wegschneiden
SELECT TRIM(' Test '); --Auf beiden Seiten
SELECT LTRIM(' Test '); --Nur Links
SELECT RTRIM(' Test '); --Nur Rechts

--LOWER, UPPER: Ganzer Text kleingeschrieben/großgeschrieben
SELECT LOWER('Test');
SELECT UPPER('Test');

--LEN: Gibt die Länge vom Text zurück, macht automatisch ein RTRIM
SELECT LEN(' Test ');
SELECT LEN(' Test');
SELECT LEN('Test ');

SELECT DATALENGTH(' Test '); --DATALENGTH verwenden um RTRIM zu verhindern

--Konvertierungsfunktionen

--CAST: Wandelt einen Wert in einen anderen Typen um
SELECT CAST(GETDATE() AS DATE); --Schneidet die Zeit weg
SELECT CAST(GETDATE() AS TIME); --Schneidet das Datum weg

SELECT HireDate, CAST(HireDate AS DATE) FROM Employees; --Bei Spalte Zeitteil abschneiden

SELECT '123' + 4; --123 konnte zu einer Zahl umgewandelt werden
SELECT '123.4' + 4; --Kommazahl kann nicht automatisch konvertiert werden

SELECT CAST('123.4' AS FLOAT) + 4; --Konvertierung erzwingen

--Datumsformate
--Verschiedene Datumsformate weltweit
--Deutsches Datum: DD.MM.YYYY
--Amerikanisches Datum: MM/DD/YYYY
--ISO-8601 Datum: YYYY-MM-DD (funktioniert immer)

SELECT CAST('24.01.2023' AS DATE); --funktioniert
SELECT CAST('24/01/2023' AS DATE); --funktioniert auch
SELECT CAST('01/24/2023' AS DATE); --funktioniert hier nicht (aber möglicherweise auf Server der in Amerika steht)
SELECT CAST('2023-01-24' AS DATE); --ISO-8601 funktioniert immer

-------------------------------------------------

--CONVERT: Selbiges wie CAST, aber alt

SELECT CONVERT(DATE, GETDATE()); --funktioniert wie CAST, nur andere Schreibweise

--https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles

SELECT HireDate, CONVERT(VARCHAR, HireDate, 4) FROM Employees; --kurzes deutsches Datum
SELECT HireDate, CONVERT(VARCHAR, HireDate, 104) FROM Employees; --langes deutsches Datum

-------------------------------------------------

--FORMAT: Wandelt den Input in ein anderes Format um

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy'); --Datumformatierung mit FORMAT
SELECT FORMAT(GETDATE(), 'hh:m'); --Nur Stunde und Minute

SELECT FORMAT(GETDATE(), 'dd'); --Tag als Zahl (24)
SELECT FORMAT(GETDATE(), 'ddd'); --Tag als Text Kurzform (Di)
SELECT FORMAT(GETDATE(), 'dddd'); --Tag als Text Langform (Dienstag)

SELECT FORMAT(GETDATE(), 'MM'); --Monat als Zahl (01)
SELECT FORMAT(GETDATE(), 'MMM'); --Monat als Text Kurzform (Jan)
SELECT FORMAT(GETDATE(), 'MMMM'); --Monat als Text Langform (Januar)

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönstes deutsches Datum

SELECT FORMAT(GETDATE(), 'd'); --24.01.2023 (kurzes deutsches Datum)
SELECT FORMAT(GETDATE(), 'D'); --Dienstag, 24. Januar 2023 (langes deutsches Datum)

SELECT HireDate, FORMAT(HireDate, 'D') FROM Employees;