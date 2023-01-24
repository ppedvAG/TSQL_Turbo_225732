USE Northwind; --USE: Datenbank die angesprochen wird festlegen, lohnt sich immer oben im Skript zu haben

--Kommentar

/*
Mehrzeilige
Kommentar
*/

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Text'; --Texte mit einzelnen Hochkommas (')

--Markieren, Strg + E: Einzelnes Statement ausführen

SELECT 100 * 3; --Berechnen

SELECT '100 * 3'; --Text wird nicht berechnet

--Strg + R: Ergebnisansicht schließen

SELECT 'Test' AS Text; --AS: Spalte einen Namen geben

SELECT 'Test', 123; --Mit Beistrich getrennt mehrere Spalten ausgeben

SELECT 10.5; --Kommazahl mit Punkt statt mit Beistrich



SELECT * FROM Customers; --Alle Daten aus der Tabelle holen mit *

SELECT CompanyName FROM Customers; --Einzelne Spalte auswählen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten auswählen

SELECT Freight * 2 AS FreightMal2 FROM Orders; --Auf Spalte Berechnung ausführen, mit AS Namen geben

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Spalten verbinden mit + (unschön)

SELECT CompanyName + ' ' + Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers;
--Strings verbinden mit Leerzeichen dazwischen
--Namen mit Leerzeichen drinnen müssen mit [] oder "" umgeben sein