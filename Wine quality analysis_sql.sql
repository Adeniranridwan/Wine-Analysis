SELECT * FROM `wine-analysis`.red;

SELECT * FROM red;
SELECT * FROM rose;
SELECT * FROM white;
SELECT * FROM sparkling;

#Data preparation

#temporarily disable safe update mode
SET SQL_SAFE_UPDATES = 0;

#changing n.n to vintage
UPDATE sparkling
SET Year = 'Non-Vintage'
WHERE Year = 'N.V.';

# re-able safe update mode
SET SQL_SAFE_UPDATES = 1;

select count(*) AS COUNT from sparkling where Year = 'Non-Vintage';

#create a new view for joining the wines together  
CREATE VIEW Wines AS
SELECT * FROM Red
UNION ALL
SELECT * FROM White
UNION ALL
SELECT * FROM Rose
UNION ALL
SELECT * FROM Sparkling;

#view the new table
SELECT * FROM Wines;

#Checking the number of rows in the data
select count(*) AS count from wines;

#check for duplicate value
SELECT Name, Country, Region, Winery, Rating, NumberOfRatings, Price, Year, COUNT(*)
FROM wines
GROUP BY Name, Country, Region, Winery, Rating, NumberOfRatings, Price, Year
HAVING COUNT(*) > 1;

SELECT COUNT(DISTINCT Name) AS unique_count, COUNT(*) AS total_count
FROM wines;

#Check the present of null values
SELECT * FROM Wines WHERE Name IS NULL OR Country IS NULL OR Rating IS NULL OR 
Price IS NULL OR Year IS NULL;

#......................................... Exploratory Analysis....................................
#checking the top Rated Wines
SELECT * FROM (
    SELECT Name, Country, Region, Winery, Rating, 'Red Wine' AS WineType FROM red
    UNION ALL
    SELECT Name, Country, Region, Winery, Rating, 'White Wine' FROM white
    UNION ALL
    SELECT Name, Country, Region, Winery, Rating, 'Rose Wine' FROM rose
    UNION ALL
    SELECT Name, Country, Region, Winery, Rating, 'Sparkling Wine' FROM sparkling
) AS AllWines
ORDER BY Rating DESC
LIMIT 3;

#Wines demand based on number of ratings
SELECT 
    Name,
    WineType,
    AVG(Rating) AS AvgRating,
    COUNT(*) AS RatingCount
FROM (
    SELECT Name, 'Red Wine' AS WineType, Rating FROM Red WHERE Year >= '2015'
    UNION ALL
    SELECT Name, 'White Wine', Rating FROM White WHERE Year >= '2015'
    UNION ALL
    SELECT Name, 'Rose Wine', Rating FROM Rose WHERE Year >= '2015'
    UNION ALL
    SELECT Name, 'Sparkling Wine', Rating FROM Sparkling WHERE Year >= '2015'
) AS RecentWines
GROUP BY Name, WineType
HAVING RatingCount >= 10
ORDER BY AvgRating DESC, RatingCount DESC;

#the number of wines, average price and rating of wines grouped by country
SELECT 
    Country,
    AVG(Price) AS AvgPrice,
    AVG(Rating) AS AvgRating,
    COUNT(*) AS NumberOfWines
FROM (
    SELECT Country, Price, Rating FROM Red
    UNION ALL
    SELECT Country, Price, Rating FROM White
    UNION ALL
    SELECT Country, Price, Rating FROM Rose
    UNION ALL
    SELECT Country, Price, Rating FROM Sparkling
) AS AllWines
GROUP BY Country;

# finding wines from the same winery across different wine types:
SELECT rw.Name AS RedWineName, ww.Name AS WhiteWineName, rw.Winery
FROM Red rw
JOIN White ww ON rw.Winery = ww.Winery
WHERE rw.Winery = 'Château Mont-Redon';

#Segmenting Wines by Price Range
SELECT 
    WineType,
    CASE 
        WHEN Price < 10 THEN 'Budget'
        WHEN Price BETWEEN 10 AND 20 THEN 'Mid-Range'
        WHEN Price BETWEEN 20 AND 50 THEN 'Premium'
        ELSE 'Luxury'
    END AS PriceSegment,
    COUNT(*) AS NumberOfWines,
    AVG(Rating) AS AvgRating
FROM (
    SELECT 'Red Wine' AS WineType, Price, Rating FROM Red
    UNION ALL
    SELECT 'White Wine', Price, Rating FROM White
    UNION ALL
    SELECT 'Rose Wine', Price, Rating FROM Rose
    UNION ALL
    SELECT 'Sparkling Wine', Price, Rating FROM Sparkling
) AS AllWines
GROUP BY WineType, PriceSegment
ORDER BY WineType, PriceSegment;

#Average Rating by Wine Type
SELECT 'Red Wine' AS WineType, AVG(Rating) AS AvgRating FROM Red
UNION
SELECT 'White Wine', AVG(Rating) FROM White
UNION
SELECT 'Rose Wine', AVG(Rating) FROM Rose
UNION
SELECT 'Sparkling Wine', AVG(Rating) FROM Sparkling;

#yearly trend
SELECT 
    Year,
    WineType,
    AVG(Rating) AS AvgRating,
    AVG(Price) AS AvgPrice
FROM (
    SELECT Year, 'Red Wine' AS WineType, Rating, Price FROM Red WHERE YEAR >= 2016 
    UNION ALL
    SELECT Year, 'White Wine', Rating, Price FROM White YEAR WHERE YEAR >= 2016
    UNION ALL
    SELECT Year, 'Rose Wine', Rating, Price FROM Rose WHERE YEAR >= 2016
    UNION ALL
    SELECT Year, 'Sparkling Wine', Rating, Price FROM Sparkling WHERE YEAR >= 2016
) AS AllWines
GROUP BY Year, WineType
ORDER BY Year ASC, WineType;


#identify wines that offer the best value (high rating at a low price):
SELECT 
    Name,
    WineType,
    Price,
    Rating,
    ROUND(Rating / Price, 2) AS ValueScore
FROM (
    SELECT Name, 'Red Wine' AS WineType, Price, Rating FROM Red
    UNION ALL
    SELECT Name, 'White Wine', Price, Rating FROM White
    UNION ALL
    SELECT Name, 'Rose Wine', Price, Rating FROM Rose
    UNION ALL
    SELECT Name, 'Sparkling Wine', Price, Rating FROM Sparkling
) AS AllWines
ORDER BY ValueScore DESC
LIMIT 10;

#identify wines that might be underperforming based on the number of ratings
SELECT 
    Name,
    WineType,
    NumberOfRatings,
    Rating,
    Price
FROM (
    SELECT Name, 'Red Wine' AS WineType, NumberOfRatings, Rating, Price FROM Red
    UNION ALL
    SELECT Name, 'White Wine', NumberOfRatings, Rating, Price FROM White
    UNION ALL
    SELECT Name, 'Rose Wine', NumberOfRatings, Rating, Price FROM Rose
    UNION ALL
    SELECT Name, 'Sparkling Wine', NumberOfRatings, Rating, Price FROM Sparkling
) AS AllWines
WHERE NumberOfRatings < 50
ORDER BY NumberOfRatings ASC, Rating DESC LIMIT 15;

#check for the popular Winery
SELECT 
    Winery,
    Country,
    AVG(Price) AS AvgPrice,
    AVG(Rating) AS AvgRating,
    COUNT(*) AS NumberOfWinery
FROM (
    SELECT Winery,Country, Price, Rating FROM Red
    UNION ALL
    SELECT Winery,Country, Price, Rating FROM White
    UNION ALL
    SELECT Winery, Country, Price, Rating FROM Rose
    UNION ALL
    SELECT Winery,Country, Price, Rating FROM Sparkling
) AS AllWines
GROUP BY Winery, Country order by AvgRating desc limit 10;


#------------------------------------EXPLORATORY ANALYSIS ON RED WINES-------------------------------------------
#check for the top rated wines
select Name, Country, rating from red order by rating desc limit 10;

#check for the red wines that are maxmum
SELECT * FROM red WHERE NumberOfRatings = (SELECT max(NumberOfRatings) from red);

# average price of wine per country
SELECT Country, Avg(price) AS average_price from red group by country; 

#Which wines are priced below the average but have high ratings?
SELECT Name, Price, Rating FROM red WHERE Price < (SELECT Avg(Price) FROM red) AND rating >= 4.5
Order by Rating desc;

#Which wines have low ratings but high prices?
SELECT Name, Price, Rating FROM red WHERE Rating < (SELECT Avg(rating) FROM red) 
AND Price >= (SELECT Avg(Price) FROM red)
Order by Price desc LIMIT 10;

#How do different wineries compare in terms of average ratings and number of ratings?
SELECT Winery, Avg(Rating) AS AvgRating, sum(NumberOfRatings) AS TotalNumRating
FROM red group by Winery order by TotalNumRating desc; 

#How do wine ratings and prices vary by year or vintage?
SELECT Year, AVG(Rating) AS AvgRating, AVG(Price) AS AvgPrice FROM red
 WHERE Year >= "2000" GROUP BY Year ORDER BY Year



