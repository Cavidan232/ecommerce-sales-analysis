SELECT
    customers.customer_id,
    customers.customer_city,
    orders.order_id,
    orders.order_status,
    orders.order_purchase_timestamp
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE customers.customer_city = 'curitiba'
ORDER BY orders.order_purchase_timestamp DESC;
