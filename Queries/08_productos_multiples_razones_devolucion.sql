-- Análisis de productos devueltos por más de una razón distinta
-- Objetivo: Detectar productos que presentan diferentes tipos de devoluciones, 
-- lo cual podría indicar problemas recurrentes o múltiples fallos.

SELECT 
    p.product_id, 
    p.product_name, 
    GROUP_CONCAT(re.reason) AS Razones
FROM products p 
JOIN returns re ON re.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT re.reason) > 1;
