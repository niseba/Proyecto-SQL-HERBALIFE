-- Análisis de clientes activos por país
-- Objetivo: Listar los países que cuentan con más de un cliente activo, 
-- es decir, clientes que han realizado al menos una orden válida.

SELECT 
    c.country AS País,
    COUNT(DISTINCT o.customer_id) AS Número_Clientes_Activos
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.customer_id IS NOT NULL 
  AND c.country IS NOT NULL
GROUP BY c.country
HAVING COUNT(DISTINCT o.customer_id) > 1
ORDER BY Número_Clientes_Activos DESC;
