-- Órdenes con productos que aplican para descuento
-- Objetivo:
--   Identificar las órdenes que contienen productos con descuento definido,
--   y en las que la cantidad comprada cumple con el mínimo necesario para aplicar dicho descuento.
--   Esta consulta permite evaluar la correcta aplicación de políticas promocionales.

SELECT DISTINCT 
    oi.order_id AS ID_Orden,
    p.product_id AS ID_Producto,
    d.discount_percent AS Porcentaje_Descuento
FROM orders o 
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN discounts d ON d.product_id = oi.product_id
WHERE o.customer_id IS NOT NULL
  AND oi.quantity >= d.min_quantity
ORDER BY oi.order_id;
