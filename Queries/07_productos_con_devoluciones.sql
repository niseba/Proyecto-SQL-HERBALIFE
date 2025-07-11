-- Análisis de productos devueltos al menos una vez
-- Objetivo: Identificar los productos que han sido devueltos, 
-- mostrando la cantidad de veces devueltos y las razones asociadas.

SELECT 
    p.product_id, 
    p.product_name, 
    COUNT(re.product_id) AS Veces_Devuelto, 
    GROUP_CONCAT(re.reason) AS Razón
FROM products p 
JOIN returns re ON re.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(re.product_id) >= 1;
