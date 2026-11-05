-- Base de datos del data warehouse de matrícula (MySQL 8)
CREATE DATABASE IF NOT EXISTS matricula CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE matricula;
USE matricula;
CREATE TABLE IF NOT EXISTS dim_tiempo (
  sk_tiempo INT NOT NULL PRIMARY KEY,          -- año*10 + semestre (ej. 20151)
  periodo   VARCHAR(10) NOT NULL,              -- ej. 2015-1
  semestre  TINYINT NOT NULL,
  anio      SMALLINT NOT NULL,
  UNIQUE KEY uq_dim_tiempo_periodo (periodo)
);
USE matricula;
CREATE TABLE IF NOT EXISTS dim_institucion (
  sk_institucion          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  codigo_ies              VARCHAR(20)  NOT NULL,   -- llave de la fuente (F2 / F1)
  nombre_ies              VARCHAR(255),
  ies_padre               VARCHAR(20),
  principal_seccional     VARCHAR(50),
  sector                  VARCHAR(50),
  caracter_academico      VARCHAR(100),
  acreditada_alta_calidad VARCHAR(10),
  departamento_domicilio  VARCHAR(100),
  municipio_domicilio     VARCHAR(100),
  KEY ix_dim_institucion_codigo (codigo_ies)
);
INSERT INTO dim_institucion (sk_institucion, codigo_ies, nombre_ies) VALUES (-1, '-1', 'Desconocido');
USE matricula;
CREATE TABLE IF NOT EXISTS dim_programa (
  sk_programa       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  codigo_snies      VARCHAR(20) NOT NULL,          -- llave de la fuente (F2)
  nombre_programa   VARCHAR(255),
  nivel_academico   VARCHAR(100),
  nivel_formacion   VARCHAR(100),
  metodologia       VARCHAR(100),
  area_conocimiento VARCHAR(150),
  nucleo_basico     VARCHAR(150),
  KEY ix_dim_programa_codigo (codigo_snies)
);
INSERT INTO dim_programa (sk_programa, codigo_snies, nombre_programa) VALUES (-1, '-1', 'Desconocido');
USE matricula;
CREATE TABLE IF NOT EXISTS dim_geografia (
  sk_geografia   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cod_mpio       VARCHAR(5)  NOT NULL,             -- DIVIPOLA, 5 dígitos con cero inicial
  nom_mpio       VARCHAR(100),
  cod_dpto       VARCHAR(2),
  nom_dpto       VARCHAR(100),
  tipo_municipio VARCHAR(50),
  latitud        DECIMAL(9,6),
  longitud       DECIMAL(9,6),
  UNIQUE KEY uq_dim_geografia_mpio (cod_mpio)
);
INSERT INTO dim_geografia (sk_geografia, cod_mpio, nom_mpio, nom_dpto) VALUES (-1, '-1', 'Desconocido', 'Desconocido');
USE matricula;
CREATE TABLE IF NOT EXISTS dim_genero (
  sk_genero          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_genero          INT NOT NULL,
  descripcion_genero VARCHAR(50),
  UNIQUE KEY uq_dim_genero_id (id_genero)
);
INSERT INTO dim_genero (sk_genero, id_genero, descripcion_genero) VALUES (-1, -1, 'Desconocido');
USE matricula;
CREATE TABLE IF NOT EXISTS fact_matricula (
  sk_tiempo          INT NOT NULL,
  sk_institucion     INT NOT NULL,
  sk_programa        INT NOT NULL,
  sk_geografia       INT NOT NULL,
  sk_genero          INT NOT NULL,
  total_matriculados INT NOT NULL,
  PRIMARY KEY (sk_tiempo, sk_institucion, sk_programa, sk_geografia, sk_genero),
  CONSTRAINT fk_fact_tiempo      FOREIGN KEY (sk_tiempo)      REFERENCES dim_tiempo(sk_tiempo),
  CONSTRAINT fk_fact_institucion FOREIGN KEY (sk_institucion) REFERENCES dim_institucion(sk_institucion),
  CONSTRAINT fk_fact_programa    FOREIGN KEY (sk_programa)    REFERENCES dim_programa(sk_programa),
  CONSTRAINT fk_fact_geografia   FOREIGN KEY (sk_geografia)   REFERENCES dim_geografia(sk_geografia),
  CONSTRAINT fk_fact_genero      FOREIGN KEY (sk_genero)      REFERENCES dim_genero(sk_genero)
);
USE matricula;
-- Periodos 2015-1 a 2021-2 (14 filas, sin huecos)
INSERT INTO dim_tiempo (sk_tiempo, periodo, semestre, anio)
SELECT a.anio*10 + s.semestre, CONCAT(a.anio,'-',s.semestre), s.semestre, a.anio
FROM (SELECT 2015 AS anio UNION SELECT 2016 UNION SELECT 2017 UNION SELECT 2018
      UNION SELECT 2019 UNION SELECT 2020 UNION SELECT 2021) a
CROSS JOIN (SELECT 1 AS semestre UNION SELECT 2) s
ORDER BY 1;
