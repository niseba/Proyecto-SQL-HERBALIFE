-- Análisis de rotación de productos
-- Objetivo: 
   Clasificar los productos según su nivel de rotación para evaluar desempeño de ventas e inventario.

SELECT 
    p.product_name AS Producto,
    SUM(oi.quantity) AS Total_Unidades_Vendidas,
    CASE
        WHEN SUM(oi.quantity) >= 5 THEN 'Alta rotación'
        WHEN SUM(oi.quantity) BETWEEN 2 AND 4 THEN 'Media rotación'
        ELSE 'Baja rotación'
    END AS Clasificación_Rotación
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Unidades_Vendidas DESC;
