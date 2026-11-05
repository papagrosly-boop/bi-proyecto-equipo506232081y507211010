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
