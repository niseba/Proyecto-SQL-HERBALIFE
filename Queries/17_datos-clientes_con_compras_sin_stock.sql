-- Clientes que compraron productos sin stock o con stock desconocido
-- Objetivo:
--   Identificar clientes que realizaron compras de productos sin disponibilidad (stock = 0)
--   o sin información registrada (stock IS NULL), garantizando además que su correo e ID estén definidos.
--   Esto es útil para investigar posibles errores de inventario o fallas operativas en el sistema de pedidos.

SELECT 
    c.name AS Nombre_Cliente,
    c.email AS Correo
FROM customers c 
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE c.email IS NOT NULL 
  AND o.customer_id IS NOT NULL
  AND (p.stock IS NULL OR p.stock = 0)
GROUP BY c.name, c.email;
