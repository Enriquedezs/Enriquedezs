# Datos

Fuentes de datos **crudas** del proyecto, organizadas en un esquema de estrella.

| Archivo | Descripción |
|---------|-------------|
| `FACT_SALES.csv` | Tabla de hechos: ventas semanales por producto y región (122,002 registros) |
| `DIM_PRODUCT.xlsx` | Dimensión de producto: marca, fabricante, formato y atributos |
| `DIM_CALENDAR.xlsx` | Dimensión de calendario: mapeo de la semana a fecha |
| `DIM_SEGMENT.xlsx` | Dimensión de segmento |
| `DIM_CATEGORY.csv` | Dimensión de categoría |

> El dataset **consolidado** (`entregable_1_consolidado.csv`) no se versiona por su tamaño: se genera automáticamente al ejecutar el notebook de la etapa 1 (*Limpieza y Transformación*), que une estas cinco fuentes.
