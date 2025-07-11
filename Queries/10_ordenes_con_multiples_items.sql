-- Identificación de órdenes que incluyen múltiples productos distintos
-- Objetivo: Listar las órdenes que contienen más de un tipo de ítem,
-- lo cual puede reflejar mayor valor del ticket promedio o mayor interés en variedad.

SELECT 
    order_id, 
    COUNT(DISTINCT product_id) AS Núm_Ítems_Diferentes
FROM order_items
GROUP BY order_id 
HAVING COUNT(DISTINCT product_id) > 1;

