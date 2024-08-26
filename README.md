Wine Data Analysis Report

1. Introduction
This report provides an analysis of a wine datasets, including red, white, rosé, and sparkling wines, with attributes such as name, country, region, winery, rating, number of ratings, price, and year. The goal is to derive actionable business insights related to product performance, pricing strategies, market segmentation, and customer preferences. This data set was obtained from kaggle. Link….

2. About Data 
The datasets consists of four categories of wines:
Red Wine: Includes premium varieties like Pomerol 2011 from France.
White Wine: Features wines such as Vermentino 2017 from Italy.
Rosé Wine: Contains wines like Mad Méditerranée Rosé 2019 from France.
Sparkling Wine: Includes a mix of vintage and non-vintage wines like Crémant de Loire Brut 2017 from France.
Key columns in the dataset:
Name: The name of the wine.
Country: Country of origin.
Region: Specific region within the country.
Winery: Producer of the wine.
Rating: Average customer rating.
NumberOfRatings: Total number of customer ratings.
Price: Price of the wine.
Year: Vintage or production year.

3. Data Cleaning and Preprocessing
To ensure the data is ready for analysis, the following steps were taken:
Handling Missing Values: Missing value was checked for in each of the columns in the datasets.
Temporary disabling the update mode: This was done to replace value in a specific column
Handling Inconsistent Year Formats: The ‘N.V.’ in the column year was replaced with ‘ non-vintage’.
Removing Duplicates: duplicate value was checked for.
Check for Null Value: nulls values were checked for
Converting Data Types: Ensured numerical fields (Price, Rating, NumberOfRatings) are stored in the correct data types.
Join: The three tables were combined together using ‘union all ‘

4. Key Findings and Business Insights From Exploratory Analysis
4.1 Product Performance
Highest-Rated Wines:
oThe three top rated wine among the red,white, rose, sparkling wines are
A.Montrachet Grand Cru Marquis de Laguiche 2017
B.Barolo Riserva Monfortino 2013
C.Toscana 2016

Most Popular Wines (by Number of Ratings):
o The result shows a slight increase in the rating count of wines as the average rating decreases. This indicates that there are more orders for premium wines. In addition, it was noticed that red wines have more a quite number of higher ratings compared to orders, indicating higher customer engagement.


4.2 Pricing and Sales Strategy
Best Value Wines:
o'Frizzantino Dolce N.V.', 'Lambrusco dell’Emilia Dolce N.V.', and 'Nero d''Avola 2018' top the table of wines with good ratings at a low price, which  represents excellent value for budget-conscious consumers. Moreover, the shows how customer values the non vintage wines (sparkling wines) as its appear in the first 2 top.
o

On the order hand, 
4.3 Market Segmentation
Regional Performance:
oFrench wines are the top rated among all country present in the datasets, suggesting a strong market presence. This is followed by the wines from the Italy a good performing too.

Subsequent analysis shows that  the ones from  Pomerol, Lirac, France region have the highest ratings.

Wine Type Comparison:

oRed wines have a wide range of numbers, with the most of it having a price segment of premium and mid-range. This is followed by the white wine which also have a high record of wines with price segment of MID-Range.


4.4 Customer Preferences: Past analysis shows that
Preferred Price Range:
oMid-Range and premium price segment are more popular by customer preference with a price range between 10 and 20 for mid range and 20 and 50 for premium. Moreover, several wines in this category receives strong average ratings.
Preferred Regions:
oFrench and Italian wines dominate the top ratings, indicating strong customer preferences for wines from these regions.
4.6 Product Development
Characteristics of High-Rated Wines:
oThe highest-rated wines typically come from established regions like Pomerol, Lirac (France) and Toscana (Italy) have a good numbers, suggesting a focus on these regions and price points for future product development.
4.7 Competitive Analysis
Top Performing Wineries:
oMasseto and Pétrus winery from Italy and France respectively are standout producers, consistently delivering high-rated wines.

5. Conclusion
The analysis of the wine datasets provide several actionable insights:
Focus on marketing high-rated wines from established regions like France and Italy.
Leverage the identified value wines for price-sensitive segments.
Consider product development opportunities in underrepresented categories such as Rosé wines.
Review and optimize pricing and sales strategies, particularly for wines that are highly rated yet priced competitively.
These insights can guide strategic decisions in marketing, sales, product development, and inventory management, helping to optimize the wine portfolio and improve business outcomes.

6. Recommendations
Enhance Marketing Campaigns: Highlight top-rated and value wines in promotional materials to boost sales.
Optimize Inventory: Focus on stocking high-performing wines and consider discontinuing or reducing the supply of the under performing ones.
Refine Pricing Strategy: Adjust pricing based on customer perceptions of value, particularly in the Premium segment.
