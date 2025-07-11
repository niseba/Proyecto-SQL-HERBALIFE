-- Análisis del comportamiento de compra por cliente
-- Objetivo: Mostrar cuántas órdenes ha realizado cada cliente y el total de ítems comprados,
-- permitiendo entender su nivel de actividad y volumen de consumo.

SELECT 
    c.customer_id, 
    c.name, 
    COUNT(DISTINCT o.order_id) AS Número_De_Órdenes,
    SUM(oi.quantity) AS Ítems_Comprados
FROM customers c 
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.customer_id IS NOT NULL
GROUP BY c.customer_id, c.name
ORDER BY SUM(oi.quantity) DESC;
