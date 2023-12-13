-- 2.
select count(*) from invoice
select * from invoice

-- 3.
select * from customers where cus_balance >= 500.00

-- 4.
select c.cus_code, i.inv_number, i.inv_date, p.p_descript, l.line_units, l.line_price  
from customers c join invoice i on c.cus_code = i.cus_code
join line l on i.inv_number = l.inv_number
join product p on p.p_code = l.p_code
order by c.cus_code

-- 5.
select c.cus_code, i.inv_number, p.p_descript, l.line_units as 'Units bought', l.line_price as 'Unit price', l.line_units*l.line_price as 'Subtotal' 
from customers c join invoice i on c.cus_code = i.cus_code
join line l on i.inv_number = l.inv_number
join product p on p.p_code = l.p_code
order by c.cus_code

-- 6.
SELECT
    c.cus_code,
    c.cus_balance,
    SUM(l.line_units * l.line_price) AS total_spent
FROM
    customers c
JOIN
    invoice i ON c.cus_code = i.cus_code
JOIN
    line l ON i.inv_number = l.inv_number
GROUP BY
    c.cus_code, c.cus_fname, c.cus_initial, c.cus_balance;


-- 7.
SELECT
    c.cus_code,
    c.cus_balance,
    cast(SUM(l.line_units * l.line_price) as decimal(10, 2)) AS total_spent,
    COUNT(l.p_code) as 'Number of purchases'
FROM
    customers c
JOIN
    invoice i ON c.cus_code = i.cus_code
JOIN
    line l ON i.inv_number = l.inv_number
GROUP BY
    c.cus_code, c.cus_fname, c.cus_initial, c.cus_balance;


-- 8.
SELECT
    c.cus_code,
    c.cus_balance,
    CAST(SUM(l.line_units * l.line_price) AS DECIMAL(10, 2)) AS total_spent,
    COUNT(l.p_code) AS 'Number of purchases',
    CAST(SUM(l.line_units * l.line_price) / COUNT(l.p_code) AS DECIMAL(10, 2)) AS 'Average purchase amount'
FROM
    customers c
JOIN
    invoice i ON c.cus_code = i.cus_code
JOIN
    line l ON i.inv_number = l.inv_number
GROUP BY
    c.cus_code, c.cus_fname, c.cus_initial, c.cus_balance;


-- 9.
SELECT
    i.inv_number,
    cast(SUM(l.line_units * l.line_price) as decimal (10, 2)) AS total_spent_on_invoice
FROM
    invoice i
JOIN
    line l ON i.inv_number = l.inv_number
GROUP BY
    i.inv_number;

-- 10.
SELECT
    c.cus_code,
    i.inv_number,
    cast(SUM(l.line_units * l.line_price) as decimal (10, 2)) AS total_spent_on_invoice
FROM
    invoice i
JOIN
    line l ON i.inv_number = l.inv_number
join 
    customers c on c.cus_code = i.cus_code
GROUP BY
    i.inv_number, c.cus_code
order by c.cus_code
;