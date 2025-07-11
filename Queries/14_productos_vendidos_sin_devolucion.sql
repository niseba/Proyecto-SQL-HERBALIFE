-- Productos vendidos al menos una vez y nunca devueltos
-- Objetivo:
--   Identificar productos que han tenido ventas pero no han sido devueltos,
--   lo cual puede reflejar alta satisfacción del cliente, buen desempeño del producto
--   o procesos logísticos eficientes.

SELECT 
    p.product_id AS ID_Producto,
    p.product_name AS Nombre_Producto,
    SUM(oi.quantity) AS Veces_Vendido
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
WHERE p.product_id NOT IN (SELECT product_id FROM returns)  -- Excluye productos con devoluciones
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) >= 1;  -- Asegura que el producto haya sido vendido al menos una vez

