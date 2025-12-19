SELECT
    p.product_A,
    p.product_B,
    ROUND(p.pair_count / total.total_orders, 4) AS support,
    ROUND(p.pair_count / a.product_count, 4) AS confidence,
    ROUND(
        (p.pair_count / total.total_orders) /
        ((a.product_count / total.total_orders) * (b.product_count / total.total_orders)),
        4
    ) AS lift
FROM (
    SELECT
        t1.product AS product_A,
        t2.product AS product_B,
        COUNT(*) AS pair_count
    FROM transaction t1
    JOIN transaction t2
        ON t1.Order_ID = t2.Order_ID
        AND t1.product < t2.product
    GROUP BY product_A, product_B
) p
JOIN (
    SELECT product, COUNT(*) AS product_count
    FROM transaction
    GROUP BY product
) a ON p.product_A = a.product
JOIN (
    SELECT product, COUNT(*) AS product_count
    FROM transaction
    GROUP BY product
) b ON p.product_B = b.product
CROSS JOIN (
    SELECT COUNT(DISTINCT Order_ID) AS total_orders
    FROM transaction
) total
ORDER BY lift DESC
LIMIT 10;
