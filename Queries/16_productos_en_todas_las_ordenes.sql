-- Productos vendidos en todas las órdenes válidas (simulación de "productos estrella")
-- Objetivo:
--   Detectar productos que han estado presentes en **todas** las órdenes con cliente registrado,
--   lo cual puede indicar que son altamente demandados o forman parte de un paquete estándar.

SELECT 
    p.product_id AS ID_Producto,
    p.product_name AS Nombre_Producto,
    COUNT(DISTINCT oi.order_id) AS Total_Órdenes
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT oi.order_id) = (
    SELECT COUNT(*) 
    FROM orders 
    WHERE customer_id IS NOT NULL      -- Excluye órdenes sin cliente (errores del sistema)
);
