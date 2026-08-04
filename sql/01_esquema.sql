-- ============================================================
-- Esquema de la base de datos — Proyecto Empresa Aliada
-- Modelo de estrella: 1 tabla de hechos + 4 dimensiones
-- Motor: SQLite
-- ============================================================

CREATE TABLE DIM_CATEGORY (
    ID_CATEGORY INTEGER PRIMARY KEY,
    CATEGORY    TEXT
);

CREATE TABLE DIM_CALENDAR (
    WEEK        TEXT PRIMARY KEY,
    YEAR        INTEGER,
    MONTH       INTEGER,
    WEEK_NUMBER INTEGER,
    DATE        TEXT
);

CREATE TABLE DIM_PRODUCT (
    MANUFACTURER     TEXT,
    BRAND            TEXT,
    ITEM             TEXT,
    ITEM_DESCRIPTION TEXT,
    CATEGORY         INTEGER,
    FORMAT           TEXT,
    ATTR1            TEXT,
    ATTR2            TEXT,
    ATTR3            TEXT
);

CREATE TABLE DIM_SEGMENT (
    CATEGORY INTEGER,
    ATTR1    TEXT,
    ATTR2    TEXT,
    ATTR3    TEXT,
    FORMAT   TEXT,
    SEGMENT  TEXT
);

CREATE TABLE FACT_SALES (
    WEEK                        TEXT,
    ITEM_CODE                   TEXT,
    TOTAL_UNIT_SALES            REAL,
    TOTAL_VALUE_SALES           REAL,
    TOTAL_UNIT_AVG_WEEKLY_SALES REAL,
    REGION                      TEXT
);
