USE matricula;
-- Periodos 2015-1 a 2021-2 (14 filas, sin huecos)
INSERT INTO dim_tiempo (sk_tiempo, periodo, semestre, anio)
SELECT a.anio*10 + s.semestre, CONCAT(a.anio,'-',s.semestre), s.semestre, a.anio
FROM (SELECT 2015 AS anio UNION SELECT 2016 UNION SELECT 2017 UNION SELECT 2018
      UNION SELECT 2019 UNION SELECT 2020 UNION SELECT 2021) a
CROSS JOIN (SELECT 1 AS semestre UNION SELECT 2) s
ORDER BY 1;
