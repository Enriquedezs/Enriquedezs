-- ============================================================
-- Consultas de negocio — Proyecto Empresa Aliada
-- ============================================================
-- NOTA IMPORTANTE sobre las regiones:
-- La columna REGION incluye 6 áreas y además 'TOTAL AUTOS SCANNING MEXICO',
-- que es el TOTAL NACIONAL (la suma de las 6 áreas). Para no duplicar cifras,
-- todas las agregaciones de totales filtran solo las 6 áreas:
--     WHERE REGION LIKE '%AREA%'
-- ============================================================

-- 1) Verificación de carga: conteo de filas por tabla
SELECT 'DIM_CATEGORY' AS Tabla, COUNT(*) AS Filas FROM DIM_CATEGORY
UNION ALL SELECT 'DIM_CALENDAR', COUNT(*) FROM DIM_CALENDAR
UNION ALL SELECT 'DIM_PRODUCT',  COUNT(*) FROM DIM_PRODUCT
UNION ALL SELECT 'DIM_SEGMENT',  COUNT(*) FROM DIM_SEGMENT
UNION ALL SELECT 'FACT_SALES',   COUNT(*) FROM FACT_SALES;


-- 2) Ventas por categoría (join hechos + producto + categoría)
SELECT c.CATEGORY AS Categoria,
       ROUND(SUM(f.TOTAL_VALUE_SALES), 2) AS Valor_Total,
       ROUND(SUM(f.TOTAL_UNIT_SALES), 2)  AS Unidades_Total
FROM FACT_SALES  f
JOIN DIM_PRODUCT  p ON f.ITEM_CODE = p.ITEM
JOIN DIM_CATEGORY c ON p.CATEGORY  = c.ID_CATEGORY
WHERE f.REGION LIKE '%AREA%'
GROUP BY c.CATEGORY
ORDER BY Valor_Total DESC;


-- 3) Ventas por región (solo las 6 áreas)
SELECT REGION,
       ROUND(SUM(TOTAL_VALUE_SALES), 2) AS Valor_Total,
       ROUND(SUM(TOTAL_UNIT_SALES), 2)  AS Unidades_Total
FROM FACT_SALES
WHERE REGION LIKE '%AREA%'
GROUP BY REGION
ORDER BY Valor_Total DESC;


-- 4) Ventas por periodo (año y mes)
SELECT cal.YEAR AS Anio, cal.MONTH AS Mes,
       ROUND(SUM(f.TOTAL_VALUE_SALES), 2) AS Valor_Total
FROM FACT_SALES   f
JOIN DIM_CALENDAR cal ON f.WEEK = cal.WEEK
WHERE f.REGION LIKE '%AREA%'
GROUP BY cal.YEAR, cal.MONTH
ORDER BY cal.YEAR, cal.MONTH;


-- 5) Top 10 marcas por valor de ventas
SELECT p.BRAND AS Marca,
       ROUND(SUM(f.TOTAL_VALUE_SALES), 2) AS Valor_Total
FROM FACT_SALES  f
JOIN DIM_PRODUCT p ON f.ITEM_CODE = p.ITEM
WHERE f.REGION LIKE '%AREA%'
GROUP BY p.BRAND
ORDER BY Valor_Total DESC
LIMIT 10;


-- 6) Ventas por segmento (join hechos + producto + segmento)
SELECT s.SEGMENT AS Segmento,
       ROUND(SUM(f.TOTAL_VALUE_SALES), 2) AS Valor_Total
FROM FACT_SALES  f
JOIN DIM_PRODUCT p ON f.ITEM_CODE = p.ITEM
JOIN DIM_SEGMENT s
     ON  p.CATEGORY = s.CATEGORY AND p.ATTR1 = s.ATTR1
     AND p.ATTR2    = s.ATTR2    AND p.ATTR3 = s.ATTR3
     AND p.FORMAT   = s.FORMAT
WHERE f.REGION LIKE '%AREA%'
GROUP BY s.SEGMENT
ORDER BY Valor_Total DESC;
