-- 1. Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query per determinare
-- l’univocità dei valori di ciascuna PK (una query per tabella implementata).

SHOW KEYS FROM Category;									-- Visualizza la PK di Category
SELECT DISTINCT ID AS numeroCategorie FROM Category;		-- Mi restituisce 11 righe, pari agli ID
SELECT COUNT(ID) AS numeroCategorie FROM Category;			-- Mi restituisce una "conta", un numero unico: 11

SHOW KEYS FROM Product;										-- Visualizza la PK e FK di Product
SELECT DISTINCT ID AS numeroProdotti FROM Product;			-- 30 righe
SELECT COUNT(ID) AS numeroProdotti FROM Product;			-- 30 prodotti

SHOW KEYS FROM Salesregion;									-- Visualizza la PK di Regionsales
SELECT DISTINCT ID AS numeroRegioni FROM Salesregion;		-- 8 righe
SELECT COUNT(ID) AS numeroRegioni FROM Salesregion;			-- 8 regioni

SHOW KEYS FROM Country;										-- Visualizza la PK e FK di Countrysales
SELECT DISTINCT ID AS numeroPaesi FROM Country;				-- 25 righe
SELECT COUNT(ID) AS numeroPaesi FROM Country;				-- 25 Paesi

SHOW KEYS FROM Sales;										-- Visualizza la PK e le FK di Sales
SELECT DISTINCT ID AS numeroVendite FROM Sales;				-- 40 righe
SELECT COUNT(ID) AS numeroVendite FROM Sales;				-- 40 vendite


-- 2. Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data,
-- il nome del prodotto, la categoria del prodotto, il nome dello stato, il nome della regione di vendita
-- e un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno
-- (>180 -> True, <= 180 -> False)

SELECT S.orderNumber AS codDocumento, S.salesDate AS dataVendita, P.nameProduct, C.typeCateg, CS.country, R.geoArea,
IF(DATEDIFF(CURDATE(), S.salesDate) > 180, 'True', 'False') AS 'maggDi_180gg'
FROM Category AS C
JOIN Product AS P ON C.ID = P.categoryID
LEFT JOIN Sales AS S ON P.ID = S.productID
JOIN Country AS CS ON S.countryID = CS.ID		
JOIN Salesregion AS R ON CS.salesregionID = R.ID
ORDER BY S.salesDate;


-- 3. Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità 
-- maggiore della media delle vendite realizzate nell’ultimo anno censito.
-- (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano).
-- Nel result set devono comparire solo il codice prodotto e il totale venduto. 

SELECT productID, SUM(totalAmount) AS totalAmount_prodotto
FROM Sales 
WHERE YEAR(salesDate) = (SELECT MAX(YEAR(salesDate)) FROM Sales)	
GROUP BY productID
HAVING SUM(totalAmount) > (SELECT ROUND(AVG(totalAmount), 2) FROM Sales WHERE YEAR(salesDate) = (SELECT MAX(YEAR(salesDate)) FROM Sales))
ORDER BY totalAmount_prodotto DESC;																							-- Restituisce i productID: 19, 18, 23, 10, 21.

-- ---------- Si esegue un controllo delle medie
SELECT YEAR(salesDate) AS anno, ROUND(AVG(totalAmount), 2) AS avg_totaleVendita FROM Sales	    	                        -- Medie annuali. 148,97  del 2025.
GROUP BY anno;

SELECT productID, totalAmount FROM Sales 																					-- Sopra la media (di 148) sono i product ID: 10, 23, 21, 18, 19.
WHERE YEAR(salesDate) = 2025
ORDER BY totalAmount DESC;
					

-- 4. Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.
SELECT P.nameProduct, YEAR(S.salesDate) AS annoVendita, SUM(totalAmount) AS totale_annuale
FROM Product AS P
JOIN Sales AS S ON P.ID = S.productID
GROUP BY P.ID, annoVendita
ORDER BY P.nameProduct;																		
		

-- 5. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

SELECT C.country, YEAR(S.salesDate) AS annoVendita, SUM(S.totalAmount) AS totale_annuale
FROM Country AS C
JOIN Sales AS S ON C.ID = S.countryID
GROUP BY C.country, annoVendita
ORDER BY annoVendita DESC, totale_annuale DESC;


-- 6. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

SELECT C.typeCateg, SUM(S.orderQuantity) AS sommaQuantita
FROM Category AS C
JOIN Product AS P ON C.ID = P.categoryID
JOIN Sales AS S ON P.ID = S.productID
GROUP BY C.typeCateg
ORDER BY sommaQuantita DESC LIMIT 1;																-- Ritorna una sola riga. Categoria: Peluche con 45 quantità.

-- ---------- Si esegue un controllo delle categoria vendute
SELECT C.ID, C.typeCateg, C.themeGame, P.ID, SUM(S.orderQuantity) AS sommaQuantita			
FROM Category AS C
JOIN Product AS P ON C.ID = P.categoryID
JOIN Sales AS S ON P.ID = S.productID
GROUP BY C.ID, C.typeCateg, P.ID
ORDER BY C.typeCateg, C.themeGame, sommaQuantita DESC;	


-- 7. Rispondere alla seguente domanda: quali sono i prodotti invenduti?
-- Proponi due approcci risolutivi differenti.
SELECT P.ID, P.nameProduct FROM Product AS P						         						-- Prima versione di query con LEFT JOIN: per avere i prductID che non sono presenti nella tabella Sales (dove non c'è una corrispondenza).
LEFT JOIN Sales AS S ON P.ID = S.productID
WHERE S.productID IS NULL;

SELECT P.ID, P.nameProduct, IFNULL(orderNumber, 'Non venduto') AS codDocumento FROM Product AS P	-- Seconda versione con IFNULL e ORDER BY.
LEFT JOIN Sales AS S ON P.ID = S.productID
ORDER BY IFNULL(orderNumber, 'Non venduto') LIKE 'Non venduto' DESC;

SELECT Product.ID, Product.nameProduct FROM Product 												-- Terza versione con una subquery.
WHERE Product.ID NOT IN(SELECT Sales.productID FROM Sales);


-- 8. Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” 
-- delle informazioni utili (codice prodotto, nome prodotto, nome categoria)

CREATE VIEW infoUtili AS (
	SELECT P.ID, P.nameProduct, C.typeCateg FROM Product AS P
	JOIN Category AS C ON P.categoryID = C.ID
);
SELECT * FROM infoUtili;


-- 9. Creare una vista per le informazioni geografiche

CREATE VIEW infoGeo AS (
	SELECT CS.country, R.geoArea, P.nameProduct, C.typeCateg, S.totalAmount, S.orderQuantity FROM Salesregion AS R
	JOIN Country AS CS ON R.ID = CS.salesregionID
	JOIN Sales AS S ON CS.ID = S.countryID
    JOIN Product AS P ON S.productID = P.ID
    JOIN Category AS C ON P.categoryID = C.ID
);
SELECT * FROM infoGeo
ORDER BY geoArea;




