
SELECT
    customers.customer_city,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_city
ORDER BY total_orders DESC
LIMIT 10;