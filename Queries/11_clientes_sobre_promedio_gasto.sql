-- Identificar clientes cuyo gasto total supera el promedio general de todas las órdenes
-- Objetivo:
-- Este análisis es útil para segmentar clientes de alto valor y enfocar estrategias de retención o recompensas.

SELECT 
    c.customer_id, 
    c.name, 
    c.country, 
    SUM(o.total_amount) AS Total_gastado, 
    (
        SELECT AVG(total_amount)
        FROM orders
        WHERE total_amount IS NOT NULL
    ) AS Promedio_general
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE c.country IS NOT NULL 
  AND c.customer_id IS NOT NULL
GROUP BY c.customer_id, c.name, c.country
HAVING SUM(o.total_amount) > (
    SELECT AVG(total_amount)
    FROM orders
    WHERE total_amount IS NOT NULL
)
ORDER BY Total_gastado DESC;
