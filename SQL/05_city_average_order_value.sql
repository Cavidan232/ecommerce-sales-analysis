-- E-commerce şirkətinin analitiki kimi hansı şəhərlərdə ortalama sifariş dəyəri daha yüksək olduğunu müəyyən etməlisən.
SELECT
    customers.customer_city,
    1.0 * SUM(order_items.price) / COUNT(DISTINCT orders.order_id) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
GROUP BY customers.customer_city 
ORDER BY average_order_value DESC
LIMIT 10;