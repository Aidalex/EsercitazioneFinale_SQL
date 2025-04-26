# EsercitazioneFinale_SQL

Il progetto si è basato nella creazione di un database e riempimento dello stesso con dati inventivi, di un'azienda 'ToysGroup', che si occupa della distribuzione di articoli (giocattoli) -classificati per categorie- in diverse aree geografiche del mondo -25 paesi (in due continenti Europa e America)-.

Sono stati caricati tre file script di MySQLWorkbench:
1. script della creazione del Database e le rispettive tabelle delle entità individuate (Categoroy, Product, Regionsales, Countrysales, Sales);
   Per la teballe Sales sono stati creati i seguenti campi: ID, orderNumber, orderDate DATE, salesDate, orderQuantity, listPrice, totalAmount, productID (dove ogni Transazione corrisponde ad un solo prodotto), countryID (ogni Transazione corrisponde ad un solo Paese (e zone)).
   Esempio per il caricamento di una vendita: ('ord-0000', '2023-03-23', '2023-03-25', 3, 39.99, 119.97, 10, 5);  
2. il dunmp della creazione del Database;
3. lo script per l'analisi sull'andamento delle vendite.
4. Schema E/R del database: visualizzazione delle tabelle relazionate e i rispettivi campi descrittivi.
