# Philippine Peso Exchange Rates January 2000 - March 2023

### [Click here to view data visualization on Tableau Public](https://public.tableau.com/views/PhilippinePesoExchangeRates2000-2023/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)


![Screenshot (30)](https://user-images.githubusercontent.com/108065595/233992967-9cc16026-5245-4376-83b2-9d20b4a34e99.png)

## Introduction

A project about exchange rates has been on my mind ever since I started delving into Data Analytics in December of 2022. During that time, the exchange rate between the Philippine Peso and the US Dollar was at a high. This made people like online freelancers happy since most of them got paid in USD, but it also hurt some sectors of the economy. Imports effectively got more expensive, for example. At that time I didn't know how to use Tableau or any data visualization tool yet (other than Excel, if I'm being stubborn), and it seems like with the dataset I have, it's impractical for me to spend so much time on Excel to make a visualization when I could spend that time learning more tools and make the visualization easier to create. So I did that. Fast forward to April 2023, I have more free time due to my job changing schedules. I now know some Tableau and SQL and I can finally make the project

This visualization takes publicly available data from Bangko Sentral ng Pilipinas, the Philippine central bank, and is transformed to show the exchange rates between the Philippine Peso (Php) and various currencies from January 2000 up to March 2023, its trends as well as the average exchange rates for each country on a selected month and year.

## Methodology

1. I first downloaded the data from the BSP website (https://www.bsp.gov.ph/SitePages/Statistics/ExchangeRate.aspx). The downloaded table is named 'dailycrossrates.xlsx' found in the 'original data from BSP' folder.
2. I transformed the data into a table more readable by SQL and Tableau. This is done by putting all various exchange rates in one column instead of having the various currencies have their own column. I also added a 'currency' column to identify the rates. This file is named 'cleaneddata.csv' ('cleaneddata.xlsx' for an excel file) found in the 'pre sql cleaning' folder.
3. I created a new table to connect the currencies into their respective countries, as well as putting in their respective abbreviations which would be handy in some graphs. This file is called 'Countries and Currencies.csv' in the 'pre sql cleaning' folder.
4. I imported both 'cleaneddata.csv' and 'Countries and Currencies.csv' into mySQL for further cleaning. The sql query for importing 'cleaneddata.csv' can be found on the 'exchangerates_queries1.sql' file in the 'sql queries' folder. For importing the 'Countries and Currencies.csv' file, I used the Table Import Wizard feature in mySQL Workbench, which does not involve me writing a query.
5. Removed all rows where exchange rates are not available. There are certain days where the BSP do not publish exchange rates and they are not useful for my intended visualization.
6. Added a 'change from previous day' column that indicates the change from the exchange rate on that day with its previous day (or the previous day with a published rate). This is done by dividing the current exchange rate by the previous one.
7. Removed outliers from the dataset. Most of these look like typographical errors that result in exchange rates of above 100,000 Php per unit of foreign currency (for example) then going back to its normal rate the next day.
8. Repeat steps 6 and 7 whenever I notice more outliers. These queries (from steps 5-7) can be found in 'exchangerates_queries2.sql' in the 'sql queries' folder.
9. Exported the table with the 'change from previous day' column as 'changefrompreviousday.csv' (in the 'sql generated csv' folder)
10. Imported the data to Tableau for visualization.

## Additional Notes

1. My sql queries, especially the 'exchangerates_queries2' file will look convoluted, as I opted to retain mistakes, notes and decisions in the final sql file. This way, my full thought process is shown which could be useful for the reader and especially useful for me if I decide to review my code.
2. In the Tableau visualization Map View, the European Union is shown as just Belgium instead of the whole portion of the Union that uses Euro, as Tableau does not have an easy way to highlight the EU yet, while also highlighting other countries individually. (There are ways but I am not that good yet).
