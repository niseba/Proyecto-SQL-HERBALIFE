-- Detección de inconsistencias de inventario
-- Objetivo: 
-- Identificar productos que fueron vendidos a pesar de no tener stock disponible 
-- (stock en cero o nulo), lo cual podría indicar errores de inventario o problemas operativos.

SELECT 
    product_id,
    product_name
FROM products 
WHERE (stock = 0 OR stock IS NULL)
  AND product_id IN (SELECT product_id FROM order_items)
GROUP BY product_id, product_name;
