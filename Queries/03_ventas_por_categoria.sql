-- Análisis de ventas por categoría de producto
-- Objetivo: 
-- Calcular el total de ítems vendidos por categoría y clasificarlos como 
-- 'Alta', 'Media' o 'Baja' venta para apoyar decisiones de marketing e inventario.

SELECT 
    ca.category_id,
    ca.category_name AS Categoría,
    SUM(oi.quantity) AS Total_Ítems_Vendidos,
    CASE
        WHEN SUM(oi.quantity) >= 5 THEN 'Alta'
        WHEN SUM(oi.quantity) BETWEEN 2 AND 4 THEN 'Media'
        ELSE 'Baja'
    END AS Clasificación_Venta
FROM categories ca
JOIN products p ON p.category_id = ca.category_id
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY ca.category_id, ca.category_name
ORDER BY Total_Ítems_Vendidos DESC;
