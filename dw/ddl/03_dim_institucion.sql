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
