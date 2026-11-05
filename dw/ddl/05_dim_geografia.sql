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
