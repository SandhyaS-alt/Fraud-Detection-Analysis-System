# Create schema named finance
Create schema finance;

# Set schema as default
use finannce;

select * from cc_data_dec19;
select * from location_data;


## Data Exploration with SQL 


# [4.1] Calculate the total no. of transactions in the cc_data table
select count(*) as total_transactions from cc_data_dec19;


# [4.2] Identify the top 10 most frequent merchants in the cc_data table
select merchant, count(*) as transactions_count
from cc_data_dec19
group by merchant
order by transactions_count desc
limit 10;


# [4.3] Find the average transaction amount for each category of transactions in the cc_data table

select category, avg(amt) as average_transactions_amount
from cc_data_dec19
group by category;


# [4.4] Determine the number of fraudlent transactions and the percentage of total transactions that they represent
select 
   sum(case when is_fraud = 1 then 1 else 0 end) as fraudulent_transactions,
   (sum( case when is_fraud = 1 then 1 else 0 end)/count(*))* 100 as percentage_of_total
from cc_data_dec19;


# [4.5] Join the cc_data and location_data tables to identify the latitude and longitude of each transaction

select cc.*, ld.lat,ld.long
from cc_data_dec19 cc
join location_data ld on cc.cc_num=ld.cc_num;


# [4.6] Identify the city with the highest population in the location_data table

select city, max(city_pop) as highest_population
from cc_data_dec19
group by city
order by highest_population desc
limit 1;


# [4.7] Find the earliest and latest transaction dates in the cc_data table

select 
   min(str_to_date(trans_date_trans_time, '%d-%m-%Y %H:%i')) as earliest,
   max(str_to_date(trans_date_trans_time, '%d-%m-%Y %H:%i')) as latest
from cc_data_dec19;



## Data Aggregation with SQL:


# [5.1] What is the total amount spent across all transactions in the cc_data table

select sum(amt) as total_amount_spent
from cc_data_dec19;



# [5.2] How many transactions occurred in each category in the cc_data table

select category, count(*) as transactions_count
from cc_data_dec19
group by category;



# [5.3] What is the average transcation amount for each gender in the cc_data table


select gender, avg(amt) as avg_transaction_amount
from cc_data_dec19
group by gender
order by gender;


# [5.4] Which day of the week has the highest average transaction amount in the cc_data table

select
   dayname(str_to_date(trans_date_trans_time, '%d-%m-%Y %H:%i')) as day_of_week,
   avg(amt) as avg_transaction_amount
from cc_data_dec19
group by day_of_week
order by avg_transaction_amount desc
limit 1;














