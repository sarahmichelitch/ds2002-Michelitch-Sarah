USE world;
SELECT Name
FROM country
WHERE Continent = 'South America';

USE world;
SELECT Population
FROM country
WHERE Name = 'Germany';

USE world;
SELECT city.Name
FROM city JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Japan';

USE world;
SELECT Name, Population
FROM country
WHERE Continent = 'Africa'
ORDER BY Population DESC
LIMIT 3;

USE world;
SELECT Name, LifeExpectancy 
FROM country 
WHERE Population BETWEEN 1000000 AND 5000000;

USE world;
SELECT country.Name
FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'FRENCH' AND countrylanguage.IsOfficial = 'T';

USE Chinook_AutoIncrement;
SELECT Album.Title
FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC';

USE Chinook_AutoIncrement;
SELECT FirstName, LastName, Email
FROM Customer
WHERE Country = 'Brazil';

USE Chinook_AutoIncrement;
SELECT Name
FROM Playlist;

USE Chinook_AutoIncrement;
SELECT COUNT(*) AS TotalRockTracks
FROM Track JOIN Genre ON Track.TrackId = Genre.GenreId
WHERE Genre.Name = 'Rock';

USE Chinook_AutoIncrement;
SELECT Emp.FirstName, Emp.LastName
FROM Employee Emp JOIN Employee Manager ON Emp.ReportsTo = Manager.EmployeeId
WHERE Manager.FirstName = 'Nancy' AND Manager.LastName = 'Edwards';

USE Chinook_AutoIncrement;
SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales
FROM Customer JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;

CREATE DATABASE unt3qq;
USE unt3qq;
CREATE TABLE Menu (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    RestaurantAddress VARCHAR(100),
    RestaurantPhoneNumber VARCHAR(20),
    LastUpdated DATETIME,
    GeneralManager VARCHAR(80),
    ExecutiveChef VARCHAR(80),
    Name VARCHAR(100)
);
CREATE TABLE Menu_Food_Item (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MenuID INT,
    Name VARCHAR(80) NOT NULL,
    Course ENUM('Starter', 'Entree', 'Dessert', 'Side') NOT NULL,
    Price FLOAT NOT NULL,
    Calories INT,
    Allergies VARCHAR(100),
    FOREIGN KEY (MenuID) REFERENCES Menu(ID)
);
CREATE TABLE Menu_Drink_Item (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MenuID INT,
    Name VARCHAR(80) NOT NULL,
    IsAlcoholic ENUM('T', 'F') NOT NULL,
    Price FLOAT NOT NULL,
    IsHot ENUM('T', 'F') NOT NULL,
    FOREIGN KEY (MenuID) REFERENCES Menu(ID)
);


INSERT INTO Menu (
    RestaurantAddress,
    RestaurantPhoneNumber,
    LastUpdated,
    GeneralManager,
    ExecutiveChef,
    Name)
VALUES 
	('42920 Broadlands Blvd, Broadlands VA', 5712091200, NOW(), 'Ajay Bhatia', 'Adam Newton', 'Clydes Willow Creek Farm'),
	('45980 Waterview Plaza, Sterling VA', 5714346500, NOW(), 'Patrick Bates', 'Nelson Ford', 'SweetWater Tavern'),
	('44065 Ashburn Shopping Plaza, Ashburn, VA', 7037290100, NOW(), 'Lauren Turner', 'Giovanni Montise', 'Blue Ridge Grill'),
	('3236 M Street, NW, Washington, DC', 2023339180, NOW(), 'Bryan Trotter', 'Deigo Ramirez', 'Clydes of Georgetown'),
    ('707 7th Street, NW, Washington, DC', 2023493700, NOW(), 'Kali Zeka', 'Russ Ventimiglia', 'Clydes of Gallery Place');
    
INSERT INTO Menu_Drink_Item (
    MenuID,
	Name,
	IsAlcoholic,
	Price,
	IsHot)
VALUES 
	(1, 'Summer Spritz', 'T', 14.99, 'F'),
    (2, 'Texas Mule', 'T', 10.00, 'F'),
    (3, 'Pink Rabbit', 'T', 16.99, 'F'),
    (4, 'Diet Coke', 'F', 4.49, 'F'),
    (5, 'Americano', 'F', 4.49, 'T'),
    (1, 'Tea-Totaler', 'F', 10.99, 'F'),
    (1, 'Malbec', 'T', 12.99, 'F');
INSERT INTO Menu_Food_Item (
    MenuID,
    Name,
	Course,
	Price,
	Calories,
	Allergies)
VALUES 
	(1, 'Trout Parmesan', 'Entree', 24.99, 956, 'Gluten, Fish, Dairy'),
    (2, 'Summer Market Salad', 'Entree', 10.99, 467, 'Gluten'),
    (3, 'Elote Loco', 'Starter', 10.99, 691, 'Dairy'),
    (4, 'Three-Cheese Mac & Cheese', 'Side', 8.99, 790, 'Dairy, Gluten'),
    (5, 'Brownie Sundae', 'Dessert', 8.99, 990, 'Dairy, Gluten'),
    (2, 'Oyster Rockefeller', 'Starter', 15.99, 568, 'Shellfish'),
    (2, 'Crab & Artichoke Dip', 'Starter', 17.99, 620, 'Shellfish, Dairy, Gluten');

SELECT Menu_Food_Item.Name 
FROM Menu_Food_Item JOIN Menu ON Menu_Food_Item.MenuID = Menu.ID 
WHERE Menu.ID = 2 AND Menu_Food_Item.Course = 'Starter';

SELECT Menu_Drink_Item.Name, Menu_Drink_Item.Price 
FROM Menu_Drink_Item JOIN Menu ON Menu_Drink_Item.MenuID = Menu.ID 
WHERE Menu.ID = 1 
ORDER BY Menu_Drink_Item.Price DESC;

SELECT GeneralManager FROM Menu WHERE Name = 'Blue Ridge Grill';

