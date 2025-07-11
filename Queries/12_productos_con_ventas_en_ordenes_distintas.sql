-- Productos vendidos en más de una orden (sin contar duplicados por ítems)
-- Objetivo: 
--   Identificar productos que han sido incluidos en más de una orden distinta, 
--   sin contar múltiples ítems de una misma orden como ventas duplicadas. 
--   Esto ayuda a detectar productos con demanda consistente en diferentes compras.

SELECT 
    p.product_id AS ID_Producto,
    p.product_name AS Nombre_Producto,
    COUNT(DISTINCT oi.order_id) AS Veces_Vendido_En_Órdenes_Distintas
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT oi.order_id) > 1
ORDER BY Veces_Vendido_En_Órdenes_Distintas DESC;

