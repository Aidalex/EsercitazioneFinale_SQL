# EsercitazioneFinale_SQL


**IT**  
# **Database Gestionale per ToysGroup**  
Il progetto si è basato nella creazione di un database e riempimento dello stesso con dati inventivi, di un'azienda 'ToysGroup', che si occupa della distribuzione di articoli (giocattoli) -classificati per categorie- in diverse aree geografiche del mondo -25 paesi (in due continenti Europa e America)-.

Sono stati caricati tre file script di MySQLWorkbench:
1. Script della creazione del Database e le rispettive tabelle delle entità individuate (Categoroy, Product, Regionsales, Countrysales, Sales);
   Per la teballe Sales sono stati creati i seguenti campi: ID, orderNumber, orderDate DATE, salesDate, orderQuantity, listPrice, totalAmount, productID (dove ogni Transazione corrisponde ad un solo prodotto), countryID (ogni Transazione corrisponde ad un solo Paese (e zone)).
   Esempio per il caricamento di una vendita: ('ord-0000', '2023-03-23', '2023-03-25', 3, 39.99, 119.97, 10, 5);  
2. Il dunmp della creazione del Database;
3. Lo script per l'analisi sull'andamento delle vendite.
4. Schema E/R del database: visualizzazione delle tabelle relazionate e i rispettivi campi descrittivi.



**EN**  
# **ToysGroup Inventory Management Database**  
This project involved designing and populating a relational database for *ToysGroup*, a global distributor of toys across 25 countries (Europe and Americas). The database categorizes products and tracks regional sales performance.  
 **Database Scripts (MySQL Workbench)**
1. **Database Creation Script**  
   - Tables: `Category`, `Product`, `RegionSales`, `CountrySales`, `Sales`
   - productID INT,  -- 1 product per transaction  
       countryID INT   -- 1 country (and region) per transaction  
       *Sample data insert*:  
     `('ord-0000', '2023-03-23', '2023-03-25', 3, 39.99, 119.97, 10, 5)` 
2. **Database Dump**  
   - Complete backup with sample data  

3. **Sales Trend Analysis Script**  
   - Performance queries  

4. **ER Diagram**  
   - Visual schema with table relationships
  
**Technical Stack:**  

- **Database**: MySQL
- **Tools**: MySQL Workbench
- **Key Features**: Referential integrity, automated sales calculations
