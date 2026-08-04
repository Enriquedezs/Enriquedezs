# 📊 Análisis y Predicción de Ventas — Portafolio de Ciencia de Datos

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-150458?style=flat-square&logo=pandas&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-11557C?style=flat-square)
![Seaborn](https://img.shields.io/badge/Seaborn-4C72B0?style=flat-square)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikitlearn&logoColor=white)
![statsmodels](https://img.shields.io/badge/statsmodels-8B0000?style=flat-square)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=flat-square&logo=powerbi&logoColor=black)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white)

> Análisis integral del desempeño de ventas y **predicción de la demanda** de un portafolio de productos de consumo, cubriendo todo el flujo de un científico de datos: de la consolidación de datos crudos hasta un modelo predictivo y un dashboard de negocio.

Proyecto final (*capstone*) del **Diplomado de Ciencia de Datos de EBAC**, desarrollado con datos de la empresa aliada **Reckitt** —fabricante de las marcas **Vanish** y **Lysol**— para su categoría de *Fabric Treatment & Sanitizers* (tratamiento de telas y sanitizantes).

---

## 🎯 Planteamiento del problema

Reckitt necesita entender el desempeño de ventas de su portafolio y **anticipar la demanda futura** para tomar mejores decisiones de inventario, producción y promociones. Para lograrlo enfrenta tres retos:

- **Datos dispersos:** la información de ventas está repartida en múltiples fuentes (una tabla de hechos y varias dimensiones) que no están integradas.
- **Enfoque reactivo:** el análisis disponible se limita a describir lo que ya ocurrió, sin capacidad de anticipar lo que viene.
- **Falta de visibilidad por marca y región:** no hay claridad sobre qué productos, marcas y regiones concentran el valor, ni sobre cómo se comportarán las marcas clave, **Vanish** y **Lysol**.

En un mercado de productos de limpieza y sanitización —de alta rotación y sensible a la temporada— anticipar la demanda con precisión se traduce directamente en menos quiebres de stock y menos sobreinventario. Este proyecto responde a una pregunta central: **¿qué está pasando con las ventas, dónde, y qué se espera que ocurra en las próximas semanas?**

## 🧭 Objetivo

Convertir el historial de ventas en insights de negocio y en un pronóstico accionable, llevando a la empresa de un enfoque **reactivo** (analizar lo que ya pasó) a uno **predictivo** (anticipar la demanda).

## 🗂️ Datos

- **Fuente:** datos de ventas proporcionados por la empresa aliada (Reckitt).
- **Periodo:** enero 2022 – julio 2023 (~80 semanas de ventas).
- **Alcance:** 6 regiones de venta · 350 productos · categoría *Fabric Treatment & Sanitizers*.
- **Estructura:** esquema de estrella con 5 tablas.

| Tabla | Registros | Rol |
|-------|-----------|-----|
| `FACT_SALES` | 122,002 | Hechos: ventas semanales por producto y región |
| `DIM_PRODUCT` | 505 | Marca, fabricante, formato y atributos |
| `DIM_CALENDAR` | 156 | Mapeo de la semana a fecha |
| `DIM_SEGMENT` | 53 | Segmento de producto |
| `DIM_CATEGORY` | 5 | Catálogo de categorías |

> **Nota sobre las regiones:** la columna `REGION` incluye 6 áreas y además `TOTAL AUTOS SCANNING MEXICO`, que es el **total nacional** (la suma de las 6 áreas). Para no duplicar cifras, los análisis usan solo las 6 áreas o únicamente el total nacional, pero nunca ambos a la vez.

## 🔧 Metodología

El proyecto sigue un flujo completo de ciencia de datos, dividido en seis etapas:

| # | Etapa | Descripción | Herramientas |
|---|-------|-------------|--------------|
| 1 | [Limpieza y transformación](./1_limpieza) | Consolidación de las 5 fuentes en un dataset limpio | pandas |
| 2 | [Análisis exploratorio (EDA)](./2_eda) | Distribución, tendencias y outliers | Matplotlib, Seaborn |
| 3 | [Segmentación K-Means](./3_kmeans) | Agrupamiento de productos por desempeño | scikit-learn |
| 4 | [Análisis con SQL](./4_sql) | Data warehouse y consultas de negocio | SQLite |
| 5 | [Dashboard](./5_dashboard) | Tablero interactivo de resultados | Power BI |
| 6 | [Predicción de ventas](./6_prediccion) | Pronóstico con series de tiempo | statsmodels (ARIMA) |

📂 Recursos transversales del repositorio:
- [`data/`](./data) — fuentes de datos crudas (esquema de estrella).
- [`sql/`](./sql) — scripts SQL: esquema (`CREATE TABLE`) y consultas de negocio.
- [`capturas/`](./capturas) — visualizaciones y outputs clave del proyecto.

## 📈 Resultados clave

- **Concentración geográfica:** Área 2 y Área 5 lideran las ventas (juntas ~42%), aunque las 6 regiones están relativamente parejas.
- **Dominio de producto:** el segmento *bleach* concentra el 69% del valor y el formato líquido el 68%; **CLORALEX** es la marca líder del mercado y **Vanish** la segunda ($1.08M).
- **Segmentación:** los 350 productos se agruparon en 4 niveles de desempeño; Vanish se concentra en el mercado medio con productos estrella, y presenta 14 SKU marginales como oportunidad de mejora.
- **Predicción:** Vanish resultó estable y predecible (**MAPE ≈ 9.55%**); Lysol está en declive y es menos predecible (**MAPE ≈ 25.86%**).

## ▶️ Cómo reproducir

```bash
# 1. Clonar el repositorio
git clone https://github.com/<tu-usuario>/<tu-repo>.git

# 2. Instalar las dependencias
pip install -r requirements.txt

# 3. Abrir los notebooks de cada etapa con Jupyter
jupyter notebook
```

## 🛠️ Stack tecnológico

`Python` · `pandas` · `Matplotlib` · `Seaborn` · `scikit-learn` · `statsmodels` · `SQL (SQLite)` · `Power BI` · `Jupyter Notebook`

---

<p align="center">
  <strong>Luis Enrique Hernández Segura</strong><br>
  Proyecto Final · Diplomado de Ciencia de Datos · EBAC
</p>
