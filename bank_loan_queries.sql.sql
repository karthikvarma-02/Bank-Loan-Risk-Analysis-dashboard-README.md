select * from financial_loan_full;

select count(*) from financial_loan_full;

---- MTD LOAN APPLICATIONS
select count(*) from financial_loan_full where month(issue_date)=12;

---- How Many Loan Applications bank has received in november ?
select count(*) from financial_loan_full where month(issue_date)=11;

--- FIND OUT THE TOTAL FUNDED AMOUNT ?
SELECT SUM(loan_amount) as total_funded_amount from financial_loan_full;

---FIND OUT THE TOTAL FUNDED AMOUNT IN DECEMBER ?
SELECT SUM(loan_amount) as total_funded_amount from financial_loan_full WHERE MONTH(issue_date)=12;

--- FIND OUT THE TOTAL AMOUNT RECEIVED BY THE BANK ?
SELECT SUM(total_payment) as total_fun_amount from financial_loan_full;


--- WHAT IS THE AVERAGE INTREST RATE
select round(avg(int_rate)*100,2) as avg_int_rate from financial_loan_full;

--- WHAT IS THE AVERAGE INTREST RATE OF DECEMBER MONTH ?
select round(avg(int_rate)*100,2) as avg_int_rate from financial_loan_full where month(issue_date)=12;

 --- WHAT IS THE AVERAGE DET TO INTREST (DTI) ?
select round(avg(dti)*100,2) as avg_int_rate from financial_loan_full;

--- FIND OUT THE TOTAL BAD LOAN APPLICATIONS 
select count(*) from financial_loan_full where loan_status='charged off';

--- FIND OUT THE TOTAL GOOD LOAN APPLICATIONS 
select count(*) from financial_loan_full where loan_status='current'or loan_status='fully paid';

--- HOW MUCH AMOUNT IS FUNDED FOR GOOD LOAN APPLICATIONS 
SELECT SUM(loan_amount) from financial_loan_full where loan_status='current' or loan_status='fully paid';

--- HOW MUCH AMOUNT IS RECEIVED FOR GOOD LOAN APPLICATIONS 
SELECT SUM(total_payment) from financial_loan_full where loan_status='current' or loan_status='fully paid';

--- HOW MUCH AMOUNT IS FUNDED FOR BAD LOAN APPLICATIONS 
SELECT SUM(loan_amount) from financial_loan_full where loan_status='charged off';

--- HOW MUCH AMOUNT IS RECEIVED FOR BAD LOAN APPLICATIONS 
SELECT SUM(total_payment) from financial_loan_full where loan_status='charged off';

--- LOAN APPLICATIONS BY LOAN STATUS

select loan_status,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
avg(int_rate*100) as avg_int_rate,
avg(dti*100) as DTI
from financial_loan_full
where month(issue_date)=12
group by loan_status;


--- GROUP BY MONTH
select
month(issue_date) as month_number,
datename(month,issue_date) as month_name,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
avg(int_rate*100) as avg_int_rate,
avg(dti*100) as DTI
from financial_loan_full
group by month(issue_date),datename(month,issue_date)
order by month(issue_date)

--- GROUP BY STATE 

select
address_state as state,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received,
avg(int_rate*100) as avg_int_rate,
avg(dti*100) as DTI
from financial_loan_full
group by address_state
order by total_loan_applications desc;

--- GROUP BY TERM 
select
term as term,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan_full
group by term;

--- GROUP BY EMP LENGTH 
select
emp_length as emp_length,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan_full
group by emp_length
order by total_loan_applications desc;

--- GROUP BY PURPOSE 
select
purpose as purpose,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan_full
group by purpose
order by total_loan_applications desc;

















