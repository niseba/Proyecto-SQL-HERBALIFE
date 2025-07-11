-- Clientes con una sola orden que compraron múltiples productos diferentes
-- Objetivo:
--   Identificar clientes que, a pesar de haber realizado una única orden,
--   compraron más de un producto distinto. Esto puede reflejar confianza inicial
--   en la marca o compras orientadas a combos o kits.

SELECT 
    c.customer_id AS ID_Cliente,
    c.name AS Nombre_Cliente,
    COUNT(DISTINCT oi.product_id) AS Productos_Diferentes,
    COUNT(DISTINCT oi.order_id) AS Órdenes_Diferentes
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.customer_id IS NOT NULL
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT oi.order_id) = 1      -- Solo una orden realizada
   AND COUNT(DISTINCT oi.product_id) > 1    -- Más de un producto distinto en esa orden

