-- Top 3 países por ingresos generados
-- Objetivo:
--   Identificar los 3 países que han generado mayores ingresos por compras,
--   lo cual permite priorizar estrategias comerciales, logísticas o de expansión
--   hacia mercados de alto rendimiento económico.

SELECT 
    c.country AS País,
    SUM(o.total_amount) AS Total_Generado
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE c.country IS NOT NULL              -- Excluye registros sin país
  AND o.customer_id IS NOT NULL         -- Asegura que la orden tiene cliente válido
  AND o.total_amount IS NOT NULL        -- Evita órdenes incompletas o nulas
GROUP BY c.country
ORDER BY Total_Generado DESC
LIMIT 3;

