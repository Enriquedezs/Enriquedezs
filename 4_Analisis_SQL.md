# 4 · Análisis de Datos con SQL

## Contexto

Construcción de un **data warehouse relacional** con las cinco tablas del proyecto y ejecución de consultas de negocio mediante *joins* para obtener insights.

## Datos

Las 5 tablas (`FACT_SALES`, `DIM_PRODUCT`, `DIM_CATEGORY`, `DIM_SEGMENT`, `DIM_CALENDAR`) cargadas en una base de datos **SQLite**.

## Metodología

- Creación de la base e importación de las tablas.
- Consultas con **joins** entre la tabla de hechos y las dimensiones.
- **Criterio clave:** todas las agregaciones de totales filtran las 6 áreas (`WHERE REGION LIKE '%AREA%'`) para no sumar dos veces con el total nacional (`SCANNING MEXICO`).

```sql
SELECT p.BRAND AS Marca,
       ROUND(SUM(f.TOTAL_VALUE_SALES), 2) AS Valor_Total
FROM FACT_SALES  f
JOIN DIM_PRODUCT p ON f.ITEM_CODE = p.ITEM
WHERE f.REGION LIKE '%AREA%'
GROUP BY p.BRAND
ORDER BY Valor_Total DESC
LIMIT 10;
```

## Resultados

| Marca | Valor de ventas |
|-------|-----------------|
| CLORALEX | $2,696,809 |
| VANISH | $1,084,145 |
| CLOROX | $685,876 |
| BLANCATEL | $326,242 |
| OXI CLEAN | $218,485 |

- **Total nacional:** $5,521,430 (195,880 unidades).
- **Por región:** Área 2 ($1.19M) y Área 5 ($1.15M) lideran.
- **Por segmento:** *bleach* domina con $3.79M (~69% del total).

## Conclusiones

Las cifras obtenidas por SQL son consistentes con el dashboard de Power BI y con el resto de los entregables. CLORALEX es la marca líder del mercado y **Vanish la segunda**, con las áreas 2 y 5 como las regiones prioritarias.


---

*Proyecto Final — Empresa Aliada · Diplomado de Ciencia de Datos, EBAC.*  
*Autor: **Luis Enrique Hernández Segura***

