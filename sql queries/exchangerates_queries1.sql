# Load Data from csv to database. Use this for large databases

LOAD DATA INFILE 'D:\cleaneddata.csv' INTO TABLE exchangerates.cleaneddata
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(ID,Date,Currency,php_exchange_rate);

-- secure-file-priv stuff

SHOW VARIABLES LIKE "secure_file_priv";

-- checking if i did the import right

select count(*)
from exchangerates.cleaneddata2;

select avg(php_exchange_rate)
from exchangerates.cleaneddata2;