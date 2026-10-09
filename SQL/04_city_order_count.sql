--irkət bilmək istəyir ki, bu şəhərlərdə neçə fərqli sifariş verilib.
SELECT
    customers.customer_city,
    COUNT(DISTINCT orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_city
ORDER BY total_orders DESC  
limit 10;