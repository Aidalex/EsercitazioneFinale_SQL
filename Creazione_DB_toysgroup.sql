CREATE DATABASE toysgroup;
SHOW DATABASES;
USE toysgroup;

-- Creazione delle tabelle Entità. Partendo dalle entità forti in cui è presente la PK da inserire come FK nelle tabelle figlie.

CREATE TABLE Category (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    typeCateg VARCHAR(50) NOT NULL,
    themeGame VARCHAR(50)
);
    
CREATE TABLE Product (									          
	ID INT AUTO_INCREMENT PRIMARY KEY,
	nameProduct VARCHAR(50) NOT NULL,
    recommendedAge VARCHAR(3),
	listPrice DECIMAL(10,2) NOT NULL,
    categoryID INT,
    FOREIGN KEY(categoryID) REFERENCES Category(ID)
);

CREATE TABLE Salesregion (									   					-- All'entità madre Region (zona) possono appartenere più Paesi.  
	ID INT AUTO_INCREMENT PRIMARY KEY,
    continent VARCHAR(50),									    				
    geoArea VARCHAR(50)										       			    -- zone.
);

CREATE TABLE Country (								        				    -- L'entità figlia Country (Paese).
	ID INT AUTO_INCREMENT PRIMARY KEY,						
    country VARCHAR(50),									        			
    salesregionID INT,															
    FOREIGN KEY(salesregionID) REFERENCES Salesregion(ID)
);

CREATE TABLE Sales (				                       
	ID INT AUTO_INCREMENT PRIMARY KEY,
    orderNumber VARCHAR(5) NOT NULL,
    orderDate DATE,
    salesDate DATE NOT NULL,
    orderQuantity SMALLINT NOT NULL,
    listPrice DECIMAL(10,2) NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    productID INT,
    countryID INT,
    FOREIGN KEY(productID) REFERENCES Product(ID),		            			-- Ogni Transazione corrisponde ad un solo prodotto
    FOREIGN KEY(countryID) REFERENCES Country(ID)     				            -- Ogni Transazione corrisponde ad un solo Paese (e zone).
);
    
    
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Salesregion;
SELECT * FROM Country;
SELECT * FROM Sales;

    
INSERT INTO Category (typeCateg, themeGame) VALUES
('Peluche', 'Animali selvatici'),									
('Peluche', 'Personaggi dei cartoni animati'),
('Peluche', 'Peluche interattivi'),
('Costruzione', 'Città futuristiche'),		
('Costruzione', 'Veicoli spaziali e astronavi'),   
('Gioco da esterno', 'Sport all\'aria aperta'),	   
('Gioco da esterno', 'Acqua e divertimento estivo'),  
('Elettronico', 'Robot e intelligenza artificiale'),  
('Elettronico', 'Giocattoli STEM'),    
('Istruzione', 'Arte e creatività'),							
('Istruzione', 'Geometria e matematica'); 

SELECT * FROM Category;

INSERT INTO Product (nameProduct, recommendedAge, listPrice, categoryID)	       -- 30 prodotti in totale
VALUES				
('Peluche Leone', '3+', 22.99, 1),								  		      	   -- Peluche
('Peluche Elefante', '4+', 25.99, 1),						  
('Peluche Giraffa', '3+', 22.99, 1),
('Peluche Interattivo Orso', '4+', 34.99, 3),
('Peluche Interattivo Robot', '5+', 29.99, 3),
('Peluche Mickey Mouse', '2+', 14.99, 2),
('Peluche Minnie Mouse', '2+', 14.99, 2),
('Peluche Bugs Bunny', '4+', 16.99, 2),
('Peluche Superman', '5+', 24.99, 2),							
('Costruzione Città Futuristica', '7+', 39.99, 4),								   -- Costruzione
('Costruzione Astronave', '8+', 49.99, 5),
('Costruzione Torre', '6+', 29.99, 4),			 			   
('Costruzione Robot', '8+', 55.99, 5),
('Gioco da Esterno Frisbee', '5+', 12.99, 6),					     			   -- Gioco da Esterno
('Gioco Esterno Skateboard', '8+', 34.99, 6),
('Gioco da Esterno Avventura', '7+', 19.99, 7),
('Gioco da Esterno Piscina', '6+', 25.99, 7),
('Robot Interattivo', '8+', 79.99, 8),											   -- Elettronico
('Drone Giocattolo', '10+', 99.99, 8),
('Giocattolo STEM', '10+', 59.99, 9),
('Giocattolo STEM Scienza', '10+', 41.99, 9),
('Kit Coding', '10+', 45.99, 9),
('Kit di Robotica', '10+', 59.99, 9),
('Macchina da corsa RC', '9+', 39.99, 8),	
('Set Arte Creatività', '3+', 17.99, 10),										   -- Istruzione
('Kit Pittura', '4+', 14.99, 10),
('Libri di Geometria', '6+', 12.99, 11),
('Puzzle Matematico', '7+', 9.99, 11),
('Gioco di Geometria 3D', '10+', 34.99, 11),
('Set Creativo per Bambini', '4+', 19.99, 10);					 

SELECT * FROM Product;

INSERT INTO Salesregion (continent, geoArea) 					 				  -- 8 Regioni per due continenti.
VALUES
('Europa', 'Western Europe'),
('Europa', 'Northern Europe'),
('Europa', 'Southern Europe'),
('Europa', 'Eastern Europe'),
('America', 'North America'),
('America', 'Central America'),
('America', 'South America'),
('America', 'Caribbean');

SELECT * FROM Salesregion;

INSERT INTO Country (country, salesregionID) VALUES			 					 -- 25 Paesi. Il DB è stato popolato solamente da Paesi verso cui si è venduto.
('Italia', 1),           -- Western Europe 
('Francia', 1),          
('Germania', 1),         
('Belgio', 1),           
('Paesi Bassi', 1),      
('Svizzera', 1),         
('Regno Unito', 2),      -- Northern Europe 
('Finlandia', 2),        
('Danimarca', 2),        
('Polonia', 4),          -- Eastern Europe   
('Repubblica Ceca', 4),  
('Ungheria', 4),         
('Spagna', 3),           -- Southern Europe  
('Portogallo', 3),       
('Grecia', 3),           
('Italia', 3),           
('Brasile', 7),          -- South America    
('Argentina', 7),        
('Cile', 7),             
('Perù', 7),             
('Colombia', 7),         
('Stati Uniti', 5),      -- North America    
('Canada', 5),           
('Messico', 5),          
('Cuba', 8);             -- Caribbean     

SELECT * FROM Country;

INSERT INTO Sales (orderNumber, orderDate, salesDate, orderQuantity, listPrice, totalAmount, productID, countryID) 			--  40 vendite
VALUES																	     	
('ord-0000', '2023-03-23', '2023-03-25', 3, 39.99, 119.97, 10, 5),
('ord-0001', '2023-03-29', '2023-03-31', 2, 29.99, 59.98, 5, 18),							
('ord-0002', '2023-04-17', '2023-04-20', 4, 14.99, 59.96, 7, 14),
('ord-0003', '2023-06-07', '2023-06-08', 1, 34.99, 34.99, 4, 20),
('ord-0004', '2023-12-17', '2023-12-22', 2, 22.99, 45.98, 3, 6),							
('ord-0005', '2024-01-17', '2024-01-22', 3, 24.99, 74.97, 9, 7),			 	-- X -- ID 6 (Prodotto non venduto)
('ord-0006', '2024-01-25', '2024-01-25', 5, 22.99, 114.95, 1, 2),
('ord-0007', '2024-01-30', '2024-01-31', 2, 14.99, 329.98, 6, 1),
('ord-0008', '2024-02-02', '2024-02-04', 4, 25.99, 103.96, 2, 16),		
('ord-0009', '2024-02-22', '2024-02-23', 3, 16.99, 50.97, 8, 15),
('ord-0010', '2024-02-29', '2024-02-29', 2, 34.99, 69.98, 15, 12),
('ord-0011', '2024-03-01', '2024-03-02', 1, 59.99, 59.99, 20, 17),
('ord-0012', '2024-04-15', '2024-04-17', 5, 99.99, 499.95, 19, 7),
('ord-0013', '2024-05-17', '2024-05-17', 4, 55.99, 223.96, 13, 23),
('ord-0014', '2024-05-30', '2024-06-02', 2, 17.99, 35.98, 25, 10),
('ord-0015', '2024-06-06', '2024-06-08', 3, 25.99, 77.97, 17, 25),
('ord-0016', '2024-06-07', '2024-06-09', 1, 29.99, 29.99, 12, 8),		
('ord-0017', '2024-06-24', '2024-06-26', 2, 12.99, 25.98, 14, 4),			    -- X -- ID 18 (Prodotto non venduto)
('ord-0018', '2024-07-16', '2024-07-19', 4, 49.99, 199.96, 11, 9),
('ord-0019', '2024-07-31', '2024-08-02', 3, 79.99, 239.97, 18, 22),
('ord-0020', '2024-08-05', '2024-08-08', 2, 19.99, 39.98, 16, 21),
('ord-0021', '2024-09-18', '2024-09-18', 1, 45.99, 45.99, 22, 19),
('ord-0022', '2024-10-10', '2024-10-12', 5, 22.99, 114.95, 3, 17),							
('ord-0023', '2024-11-20', '2024-11-24', 3, 29.99, 89.97, 5, 13),
('ord-0024', '2024-12-20', '2024-12-23', 4, 59.99, 239.96, 23, 11),
('ord-0025', '2025-01-20', '2025-01-20', 2, 39.99, 79.98, 10, 23),
('ord-0026', '2025-01-22', '2025-01-23', 1, 12.99, 12.99, 27, 5),								
('ord-0027', '2025-01-25', '2025-01-26', 3, 34.99, 104.97, 29, 15),
('ord-0028', '2025-01-28', '2025-01-29', 4, 34.99, 139.96, 4, 24),
('ord-0029', '2025-01-31', '2025-02-02', 5, 41.99, 209.95, 21, 18),							
('ord-0030', '2025-02-01', '2025-02-01', 2, 19.99, 39.98, 30, 3),			
('ord-0031', '2025-02-04', '2025-02-06', 3, 22.99, 68.97, 1, 5),
('ord-0032', '2025-02-07', '2025-02-08', 2, 59.99, 119.98, 23, 1),
('ord-0033', '2025-02-12', '2025-02-13', 5, 79.99, 399.95, 18, 2),
('ord-0034', '2025-02-13', '2025-02-13', 3, 19.99, 59.97, 16, 15),
('ord-0035', '2025-02-15', '2025-02-18', 4, 39.99, 159.96, 10, 23),
('ord-0036', '2025-02-18', '2025-02-18', 3, 45.99, 137.97, 22, 22),
('ord-0037', '2025-02-19', '2025-02-21', 4, 99.99, 399.96, 19, 11),
('ord-0038', '2025-02-20', '2025-02-20', 3, 59.99, 179.97, 23, 13),
('ord-0039', '2025-02-21', '2025-02-21', 4, 29.99, 119.96, 5, 24);				

ALTER TABLE Sales MODIFY orderNumber VARCHAR(8) NOT NULL;								-- Restituiva un errore per la lunghezza del VARCHAR 

SELECT * FROM Sales;

-- Si sostituiscono a 2 ordini il productID, così che rimangano 5 prodotti invenduti: i productID: 24, 26, 28, 9 e 14.

START TRANSACTION;																     	-- Cambio il Prodotto 9 con il 7
UPDATE Sales SET listPrice = 14.99, totalAmount = 44.97, productID = 7
	WHERE ID = 6;
SELECT * FROM Sales;
COMMIT;


START TRANSACTION;																		 -- Cambio il Prodotto 14 con il 17
UPDATE Sales SET listPrice = 25.99, totalAmount = 51.98, productID = 17
	WHERE ID = 18;
SELECT * FROM Sales;
COMMIT;

