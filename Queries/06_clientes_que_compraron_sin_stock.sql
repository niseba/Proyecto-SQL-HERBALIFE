-- Detección de clientes asociados a ventas con problemas de stock
-- Objetivo: Listar los nombres y correos de clientes que realizaron compras
-- de productos sin stock disponible (stock en cero o NULL), asegurando
-- que los datos del cliente (email y customer_id) estén presentes y válidos.

SELECT 
    c.name,
    c.email
FROM customers c 
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE c.email IS NOT NULL 
  AND o.customer_id IS NOT NULL
  AND (p.stock IS NULL OR p.stock = 0)
GROUP BY c.name, c.email;
