-- Total de ingresos por categoría de producto
-- Objetivo: 
   Identificar qué categorías de productos generan más ingresos para priorizar esfuerzos de marketing y abastecimiento.

SELECT 
    c.category_name AS Categoria,
    SUM(oi.quantity * oi.price_per_unit) AS Total_Ingresado
FROM categories c
JOIN products p ON p.category_id = c.category_id
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.total_amount IS NOT NULL     -- Excluye órdenes incompletas o inválidas
  AND o.customer_id IS NOT NULL
GROUP BY c.category_name
ORDER BY Total_Ingresado DESC;
