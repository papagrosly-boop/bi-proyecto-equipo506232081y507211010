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
