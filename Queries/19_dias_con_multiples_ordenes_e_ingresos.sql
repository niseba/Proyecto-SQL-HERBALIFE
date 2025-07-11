-- Días con más de una orden e ingreso total
-- Objetivo:
--   Identificar los días en los que se realizaron múltiples órdenes, junto con el total de ingresos generados.
--   Esto permite detectar patrones de alta demanda por fechas, útil para análisis temporal y planificación de recursos.

SELECT 
    o.order_date AS Fecha,
    COUNT(*) AS Número_De_Órdenes,
    SUM(o.total_amount) AS Ingreso_Total
FROM orders o 
WHERE o.total_amount IS NOT NULL
GROUP BY o.order_date
HAVING COUNT(*) > 1
ORDER BY o.order_date;
