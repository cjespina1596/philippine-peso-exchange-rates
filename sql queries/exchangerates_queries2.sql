-- delete all null entries from cleaneddata2 table

delete from exchangerates.cleaneddata2
where php_exchange_rate is null;

-- check if i did it right

select count(*) from exchangerates.cleaneddata2;

select * from exchangerates.cleaneddata2
where php_exchange_rate is null;

-- I didn't do it right

-- change all blank cells on column php_exchange_rate to NULL

update exchangerates.cleaneddata2
set php_exchange_rate = NULL
where php_exchange_rate = '';

-- run previous queries again then check

-- select all from cleaneddata2 table

select * from exchangerates.cleaneddata2;

-- change column name of column 'Date' to avoid confusion

alter table exchangerates.cleaneddata2
rename column Date to record_date;

alter table exchangerates.cleaneddata
rename column Date to record_date;

-- see change from previous day. doing this per currency. First test on usd

select
	record_date, Currency, php_exchange_rate,
    php_exchange_rate/(lag(php_exchange_rate) over (order by record_date asc)) as 'change_from_previous_day'
from exchangerates.cleaneddata2
where Currency = 'US Dollar';

select
	record_date, currency, php_exchange_rate,
    case
		when lag(currency) over (partition by currency order by record_date) = currency
        then php_exchange_rate/lag(php_exchange_rate) over (partition by Currency order by record_date)
        else null
	end as 'change_from_previous_day'
from exchangerates.cleaneddata2
order by ID;

