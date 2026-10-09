--E-commerce şirkətinin analitiki kimi hansı şəhərlərin daha çox satış gəliri gətirdiyini müəyyən etməlisən.
SELECT
    customers.customer_city,
    SUM(order_items.price) AS total_revenue
    FROM customers
    JOIN orders
    ON customers.customer_id=orders.customer_id
    JOIN order_items
    ON orders.order_id=order_items.order_id
    GROUP BY customers.customer_city
    ORDER BY total_revenue DESC
    LIMIT 10;