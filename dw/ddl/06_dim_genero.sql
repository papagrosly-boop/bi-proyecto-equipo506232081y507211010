USE matricula;
CREATE TABLE IF NOT EXISTS dim_genero (
  sk_genero          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_genero          INT NOT NULL,
  descripcion_genero VARCHAR(50),
  UNIQUE KEY uq_dim_genero_id (id_genero)
);
INSERT INTO dim_genero (sk_genero, id_genero, descripcion_genero) VALUES (-1, -1, 'Desconocido');
