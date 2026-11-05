USE matricula;
CREATE TABLE IF NOT EXISTS dim_tiempo (
  sk_tiempo INT NOT NULL PRIMARY KEY,          -- año*10 + semestre (ej. 20151)
  periodo   VARCHAR(10) NOT NULL,              -- ej. 2015-1
  semestre  TINYINT NOT NULL,
  anio      SMALLINT NOT NULL,
  UNIQUE KEY uq_dim_tiempo_periodo (periodo)
);
