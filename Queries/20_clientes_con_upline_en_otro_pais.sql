-- Clientes cuyo país no coincide con ninguno de sus uplines
-- Objetivo:
--   Identificar los clientes que fueron reclutados por uplines ubicados en países distintos.
--   Esta consulta es útil para detectar redes de distribución internacionales o patrones de expansión geográfica.

SELECT 
    c.customer_id AS ID_Cliente,
    c.name AS Nombre_Cliente,
    c.country AS País_Cliente
FROM customers c
JOIN distributors d ON c.customer_id = d.customer_id
JOIN customers u ON d.upline_id = u.customer_id
GROUP BY c.customer_id, c.name, c.country
HAVING COUNT(DISTINCT u.country) = COUNT(*) 
   AND MAX(u.country) != c.country;

