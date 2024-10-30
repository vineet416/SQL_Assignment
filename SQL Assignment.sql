create database pw;
use pw;
/*
1. Create a table called employees with the following structure;
 emp_id (integer, should not be NULL and should be a primary key)`
 emp_name (text, should not be NULL)`
 age (integer, should have a check constraint to ensure the age is at least 18)`
 email (text, should be unique for each employee)`
 salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.
*/

create table employees (
	emp_id int primary key,
    emp_name varchar(30) not null,
    age int check(age >= 18),
    email varchar(30) unique not null,
    salary int default 30000
);
 
/*
2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.

Ans: Constraints are the limiting needs put on a database so that it ensures correct and precise information is always entered into it. 
	Constraints help prevent errors because they specify how data is going into the database, and consequently, how it is being maintained.
    
Examples: 
- NOT NULL: There is a field like "name cannot be empty." 
- UNIQUE: Avoids duplication, such as two staff members using the same email. 
- PRIMARY KEY: it assigns a unique number to each row in such a way that can be used to identify each row from the table, for example, the employee ID. 
- FOREIGN KEY: They provide integrity in the involved tables; they make sure that data like department IDs exist in tables involved. 
- CHECK: It ensures the data met certain requirements, for example that age is 18 years or more. 
- DEFAULT: This is a default value which is taken if no value has been provided; for example, the salary will get defaulted to 30,000. 

Constraints ensure that data is based on certain rules, thus the quality of a database. 
*/

/*
3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

Ans: Use the NOT NULL constraint if you want a column to always have some value, thereby avoiding empty or missing data. 
A primary key cannot have NULL values since its only job is to uniquely identify each record. 
If the primary key were NULL, then we would not know where the row was since NULL signifies missing data. 
*/

/*
4. Explain the steps and SQL commands used to add or remove constraints on an existing table. 
Provide an example for both adding and removing a constraint.

Ans: To add a constraint to an existing table, you'd use `ALTER TABLE`. Here's how you might add a NOT NULL constraint: 

ALTER TABLE employees 
MODIFY emp_name VARCHAR(50) NOT NULL; 

To drop a constraint, you use `ALTER TABLE` with `DROP`. For example, to drop a UNIQUE constraint you do: 

ALTER TABLE employees 
DROP CONSTRAINT email; 

All these statements modify the structure of the table but modify nothing in data. 
*/

/*
5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.

Ans: he database would block such an operation and return an error when attempting to insert, update, or delete data violating a constraint. 
	It does guarantee valid data. 
For example, trying to insert a duplicate value into a column with a UNIQUE constraint could throw an error like this: 

ERROR: duplicate key value violates unique constraint "email" 

These errors leave no data that may have been invalid or inconsistent. 
*/

/*
6. You created a products table without constraints as follows:

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
    
Now, you realise that;
 The product_id should be a primary key`
 The price should have a default value of 50.00
*/

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
    
alter table products
modify product_id int primary key,
modify price DECIMAL(10, 2) default 50.00;

/*
9. Given the following tables:
Sales
Products
*/

create table sales(
	sale_id int,
    product_id int,
    amount int
);
insert into sales values (1,101,500), (2,102,300), (3,101,700);

drop table if exists products;
create table products(
	product_id int,
    product_name varchar(20)
);
insert into products values (101, 'Laptop'), (102, 'Phone');

-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

select p.product_name, sum(s.amount)
from sales s 
inner join products p on s.product_id = p.product_id
group by p.product_name;


/*
10. You are given three tables:
Orders:
Customers:
Order_Details:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.

Note - The above-mentioned questions don't require any dataset
*/

select o.order_id, c.customer_name, sum(od.quantity)
from Orders o
join Customers c on c.customer_id = o.customer_id
join Order_Details od on od.order_id = o.order_id
group by o.order_id, c.customer_name;


-- SQL Commands

/*
2- List all details of actors
*/

SELECT *
FROM actor;

/*
3 -List all customer information from DB.
*/

SELECT *
FROM customer;


/*
4 -List different countries.
*/

SELECT DISTINCT country
FROM country;

/*
5 -Display all active customers.
*/

SELECT *
FROM customer
WHERE active = 1; 


/*
6 -List of all rental IDs for customer with ID 1.
*/

SELECT rental_id
FROM rental
WHERE customer_id = 1;


/*
7 - Display all the films whose rental duration is greater than 5 .
*/

SELECT *
FROM film
WHERE rental_duration > 5;


/*
8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
*/

SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;


/*
9 - Display the count of unique first names of actors.
*/

SELECT COUNT(DISTINCT first_name) AS unique_first_name_count
FROM actor;


/*
10- Display the first 10 records from the customer table .
*/

SELECT *
FROM customer
LIMIT 10;

/*
11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
*/

SELECT *
FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;


/*
12 -Display the names of the first 5 movies which are rated as ‘G’.
*/

SELECT title
FROM film
WHERE rating = 'G'
LIMIT 5;

/*
13-Find all customers whose first name starts with "a".
*/

SELECT *
FROM customer
WHERE first_name LIKE 'A%';


/*
14- Find all customers whose first name ends with "a".
*/

SELECT *
FROM customer
WHERE first_name LIKE '%a';


/*
15- Display the list of first 4 cities which start and end with ‘a’ .
*/
SELECT *
FROM city
WHERE city LIKE 'a%' AND city LIKE '%a'
LIMIT 4;


/*
16- Find all customers whose first name have "NI" in any position.
*/

SELECT *
FROM customer
WHERE first_name LIKE '%NI%';

/*
17- Find all customers whose first name have "r" in the second position .
*/

SELECT *
FROM customer
WHERE first_name LIKE '_r%';


/*
18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
*/

SELECT *
FROM customer
WHERE first_name LIKE 'a%'
AND LENGTH(first_name) >= 5;


/*
19- Find all customers whose first name starts with "a" and ends with "o".
*/

SELECT *
FROM customer
WHERE first_name LIKE 'a%o';

/*
20 - Get the films with pg and pg-13 rating using IN operator.
*/

SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');


/*
21 - Get the films with length between 50 to 100 using between operator.
*/

SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;


/*
22 - Get the top 50 actors using limit operator.
*/

SELECT *
FROM actor
LIMIT 50;

/*
23 - Get the distinct film ids from inventory table
*/

SELECT DISTINCT film_id
FROM inventory;



-- Functions

-- Basic Aggregate Functions:
/*
Question 1:
Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.
*/
use sakila;
select count(distinct rental_id)
from rental;

/*
Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.
*/

select avg(datediff(return_date, rental_date)) avg_rental_duration
from rental;


-- String Functions:

/*
Question 3:
Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function
*/

select upper(first_name) first_name, upper(last_name) last_name
from customer;

/*
Question 4:
Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.
*/

select month(rental_date), rental_id
from rental;


-- GROUP BY:

/*
Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.
*/

select customer_id, count(rental_id) rental_count
from rental
group by customer_id;

/*
Question 6:
Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.
*/

select s.store_id, sum(p.amount) total_revenue
from payment p
join staff s on s.staff_id = p.staff_id
group by s.store_id;

/*
Question 7:

Determine the total number of rentals for each category of movies.

Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
*/

select fc.category_id, count(r.rental_id) as total_rentals
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
group by fc.category_id;


/*
Question 8:
Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.
*/

select l.name, avg(f.rental_rate) as avg_rental_rate
from film f
join language l on f.language_id = l.language_id
group by l.name;


-- Joins

/*
Questions 9 -
Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables.
*/

select f.title, c.first_name, c.last_name
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join customer c on r.customer_id = c.customer_id;


/*
Question 10:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.
*/

select concat(a.first_name,' ', a.last_name) actor_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title = "Gone with the Wind.";


/*
Question 11:
Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
*/


select c.first_name , sum(p.amount)
from customer c
join payment p on c.customer_id = p.customer_id
group by c.first_name;


/*
Question 12:
List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
*/

select f.title, concat(c.first_name,' ', c.last_name) cust_name
from customer c
join address a on c.address_id = a.address_id
join city on a.city_id = city.city_id
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where city.city = 'London';


-- Advanced Joins and GROUP BY:

/*
Question 13:
Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
*/

select f.title, count(r.rental_id) rental_count
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title
order by rental_count desc
limit 5;


/*
Question 14:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
*/

select c.customer_id, c.first_name, c.last_name, COUNT(DISTINCT i.store_id) AS store_count
from customer c
join rental r on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
where i.store_id in (1, 2) 
group by c.customer_id, c.first_name, c.last_name
having count(distinct i.store_id) = 2;


-- Windows Function:

/*
1. Rank the customers based on the total amount they've spent on rentals.
*/

select c.customer_id, c.first_name, c.last_name, sum(p.amount) spending_rank,
rank() over(order by sum(p.amount) desc) ranks
from payment p
join customer c on p.customer_id = c.customer_id
group by c.customer_id, c.first_name, c.last_name;


/*
2. Calculate the cumulative revenue generated by each film over time.
*/

select f.film_id, f.title, 
    date_format(p.payment_date, '%Y-%m-01') payment_month,
    sum(p.amount) as monthly_revenue,
    sum(sum(p.amount)) over (partition by f.film_id order by date_format(p.payment_date, '%Y-%m-01')) cumulative_revenue
from film f
join inventory i ON f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
group by f.film_id, f.title, DATE_FORMAT(p.payment_date, '%Y-%m-01')
order by f.film_id, payment_month;
    
    
/*
3. Determine the average rental duration for each film, considering films with similar lengths.
*/

select 
    f.film_id,
    f.title,
    f.rental_duration,
    avg(avg(f.rental_duration)) over (partition by f.length order by f.length) as average_rental_duration
from 
    film f
group by  f.film_id, f.title, f.rental_duration
order by 
    f.rental_duration;


/*
4. Identify the top 3 films in each category based on their rental counts.
*/

with film_ranks as 
	(select 
		f.film_id, 
		f.title, 
		c.category_id,
		c.name as category_name,
		count(r.rental_id) rental_count,
		dense_rank() over(partition by c.category_id, c.name order by count(r.rental_id) desc) as ranks
	from film f
	join film_category fc on f.film_id = fc.film_id
	join category c on fc.category_id = c.category_id
	join inventory i on f.film_id = i.film_id
	join rental r on i.inventory_id = r.inventory_id
	group by f.film_id, f.title, c.category_id, c.name)
    
select 
	title, category_name, rental_count, ranks
from 
	film_ranks
where 
	ranks <= 3
order by 
	category_name, ranks;


/*
5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
*/

WITH customer_rentals AS (
    SELECT customer_id, COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY customer_id
),
average_rentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM customer_rentals
)
SELECT 
    c.customer_id,
    c.total_rentals,
    a.avg_rentals,
    (c.total_rentals - a.avg_rentals) AS rental_difference
FROM 
    customer_rentals c, 
    average_rentals a;
    

/*
6. Find the monthly revenue trend for the entire rental store over time.
*/


SELECT 
    i.store_id,
    YEAR(p.payment_date) AS year, 
    MONTH(p.payment_date) AS month, 
    SUM(p.amount) AS monthly_revenue
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
GROUP BY 
    i.store_id, YEAR(p.payment_date), MONTH(p.payment_date)
ORDER BY 
    i.store_id, YEAR(p.payment_date), MONTH(p.payment_date);


/*
7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
*/


WITH customer_spending AS (
    SELECT 
        customer_id, 
        SUM(amount) AS total_spending
    FROM 
        payment
    GROUP BY 
        customer_id
),
ranked_customers AS (
    SELECT 
        customer_id,
        total_spending,
        ROW_NUMBER() OVER (ORDER BY total_spending DESC) AS ranks,
        COUNT(*) OVER () AS total_customers
    FROM 
        customer_spending
)
SELECT 
    customer_id, 
    total_spending
FROM 
    ranked_customers
WHERE 
    ranks <= total_customers * 0.20
ORDER BY 
    total_spending DESC;


/*
8. Calculate the running total of rentals per category, ordered by rental count.
*/

WITH category_rentals AS (
    SELECT 
        fc.category_id,
        c.name AS category_name,
        COUNT(r.rental_id) AS rental_count
    FROM 
        rental r
    JOIN 
        inventory i ON r.inventory_id = i.inventory_id
    JOIN 
        film_category fc ON i.film_id = fc.film_id
    JOIN 
        category c ON fc.category_id = c.category_id
    GROUP BY 
        fc.category_id, c.name
)
SELECT 
    cr1.category_id,
    cr1.category_name,
    cr1.rental_count,
    SUM(cr2.rental_count) AS running_total
FROM 
    category_rentals cr1
JOIN 
    category_rentals cr2 ON cr1.rental_count >= cr2.rental_count
GROUP BY 
    cr1.category_id, cr1.category_name, cr1.rental_count
ORDER BY 
    cr1.rental_count DESC;


/*
9. Find the films that have been rented less than the average rental count for their respective categories.
*/

WITH film_rentals AS (
    SELECT 
        fc.category_id,
        i.film_id,
        COUNT(r.rental_id) AS rental_count
    FROM 
        rental r
    JOIN 
        inventory i ON r.inventory_id = i.inventory_id
    JOIN 
        film_category fc ON i.film_id = fc.film_id
    GROUP BY 
        fc.category_id, i.film_id
),
category_avg_rental AS (
    SELECT 
        category_id,
        AVG(rental_count) AS avg_category_rentals
    FROM 
        film_rentals
    GROUP BY 
        category_id
),
film_rental_counts AS (
    SELECT 
        f.film_id,
        f.title,
        fc.category_id,
        COUNT(r.rental_id) AS film_rentals
    FROM 
        rental r
    JOIN 
        inventory i ON r.inventory_id = i.inventory_id
    JOIN 
        film f ON i.film_id = f.film_id
    JOIN 
        film_category fc ON f.film_id = fc.film_id
    GROUP BY 
        f.film_id, f.title, fc.category_id
)
SELECT 
    fr.film_id,
    fr.title,
    fr.film_rentals,
    ca.avg_category_rentals
FROM 
    film_rental_counts fr
JOIN 
    category_avg_rental ca ON fr.category_id = ca.category_id
WHERE 
    fr.film_rentals < ca.avg_category_rentals
ORDER BY 
    fr.category_id, fr.film_rentals;


/*
10. Identify the top 5 months with the highest revenue and display the revenue generated in each month
*/


SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM 
    payment
GROUP BY 
    DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY 
    monthly_revenue DESC
LIMIT 5;


-- CTE

/*
1. CTE Basics:
 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they  have acted in from the actor and film_actor tables.
 */
 
WITH actor_film_counts AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    LEFT JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)

SELECT 
    actor_name,
    film_count
FROM 
    actor_film_counts
ORDER BY 
    film_count DESC;  -- Optional: Order by film count, highest first


/*
2. CTE with Joins:
a. Create a CTE that combines information from the film and language tables to display the film title,  language name, and rental rate.
 */
 
WITH film_language_info AS (
    SELECT 
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)

SELECT 
    film_title,
    language_name,
    rental_rate
FROM 
    film_language_info
ORDER BY 
    film_title; 


/*
3. CTE with Window Functions:
a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
*/

WITH ranked_films AS (
    SELECT 
        f.film_id,
        f.title,
        f.rental_duration,
        RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_rank
    FROM 
        film f
)

SELECT 
    film_id,
    title,
    rental_duration,
    rental_rank
FROM 
    ranked_films
ORDER BY 
    rental_rank; 
    
    
/*
4. CTE and Filtering:
a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the  customer table to retrieve additional customer details.
 */
 
 WITH customer_rentals AS (
    SELECT 
        c.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM 
        customer c
    JOIN 
        rental r ON c.customer_id = r.customer_id
    GROUP BY 
        c.customer_id
    HAVING 
        rental_count > 2  -- Filter for customers with more than 2 rentals
)

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.rental_count
FROM 
    customer c
JOIN 
    customer_rentals cr ON c.customer_id = cr.customer_id
ORDER BY 
    cr.rental_count DESC; 


/*
5. CTE for Date Calculations:
 a. Write a query using a CTE to find the total number of rentals made each month, considering the  rental_date from the rental table.
*/


WITH monthly_rentals AS (
    SELECT 
        DATE_FORMAT(r.rental_date, '%Y-%m') AS rental_month,  -- Format the date to Year-Month
        COUNT(r.rental_id) AS total_rentals
    FROM 
        rental r
    GROUP BY 
        rental_month  -- Group by the formatted rental month
)

SELECT 
    rental_month,
    total_rentals
FROM 
    monthly_rentals
ORDER BY 
    rental_month;  


/*
6. CTE and Self-Join:
a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film  together, using the film_actor table.
*/

WITH actor_pairs AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id 
    WHERE 
        fa1.actor_id < fa2.actor_id  -- To avoid duplicate pairs and self-joins
)

SELECT 
    ap.actor1_id,
    ap.actor2_id,
    f.title AS film_title
FROM 
    actor_pairs ap
JOIN 
    film f ON ap.film_id = f.film_id
ORDER BY 
    f.title; 

