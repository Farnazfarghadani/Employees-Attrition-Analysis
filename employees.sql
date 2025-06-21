#Which departments or job roles have the highest attrition?
select department, count(*) as "Total employees", 
sum(case
when attrition="True" then 1
else 0
end) as "Attrition count",
round(sum(case
when attrition="True" then 1
else 0
end) /count(*) * 100,2) as "attrition rate"
from `clean_employees (2)`
group by department
order by `attrition rate` desc
;

select jobrole, count(*) as "Total employees",
sum(case
when attrition="True" then 1
else 0
end) as "Atrittion count",
round(sum(case
when attrition="True" then 1
else 0
end)/count(*)*100,2) as "Attrition rate"
from `clean_employees (2)`
group by jobrole
order by `Attrition rate` desc
; 

#Is attrition higher for certain age groups or education levels?
select 
case
when age between 18 and 25 then '18-25'
when age between 26 and 32 then '26-32'
when age between 33 and 40 then '33-40'
when age between 41 and 50 then '41-50'
else '50+'
end as `Age range`,
count(*) as `Total employees`,
sum(
case
when attrition='True' then 1
else 0
end
) as `Attrition count`,
round(sum(
case
when attrition='True' then 1
else 0
end
)/count(*)*100,2) as `Attrition rate`
from `clean_employees (2)`
group by `Age range`
order by `Age range`
;

select education as `#`,
case
when education=1 then 'Bellow College'
when education=2 then 'College'
when education=3 then 'Bachelor'
when education=4 then 'Master'
else 'Doctor'
end as `Education`,
count(*) as `Total employees`,
sum(
case
when attrition='True' then 1
else 0
end
) as `Attrition count`,
round(sum(
case
when attrition='True' then 1
else 0
end
)/count(*)*100,2) as `Attrition rate`
from `clean_employees (2)`
group by `Education`
order by `#`
;


#Do job satisfaction, workload, or income correlate with leaving?
select jobsatisfaction as `#`,
case
when jobsatisfaction=1 then 'Low'
when jobsatisfaction=2 then 'Medium'
when jobsatisfaction=3 then 'High'
else 'Very High'
end as `Job satisfaction`,
count(*) as `Total employees`,
sum(
case
when attrition='True' then 1
else 0
end
) as `Attrition count`,
round(sum(
case
when attrition='True' then 1
else 0
end
)/count(*)*100,2) as `Attrition rate`
from `clean_employees (2)`
group by `#` 
order by `#` asc
;

select 
overtime ,
count(*) as `Total employees`,
sum(
case
when attrition='True' then 1
else 0
end
) as `Attrition count`,
round(sum(
case
when attrition='True' then 1
else 0
end
)/count(*)*100,2) as `Attrition rate`
from `clean_employees (2)`
group by overtime 
;

select 
case
when monthlyincome between 1000 and 3000 then '1: 1-3 K'
when monthlyincome between 3001 and 5000 then '2: 3-5 K'
when monthlyincome between 5001 and 10000 then '3: 5-10 K'
when monthlyincome between 10001 and 15000 then '4: 10-15 K'
else '5: +15 K'
end as `Monthly income`,
count(*) as `Total employees`,
sum(
case
when attrition='True' then 1
else 0
end
) as `Attrition count`,
round(sum(
case
when attrition='True' then 1
else 0
end
)/count(*)*100,2) as `Attrition rate`
from `clean_employees (2)`
group by `monthly income`
order by `monthly income` asc
;
