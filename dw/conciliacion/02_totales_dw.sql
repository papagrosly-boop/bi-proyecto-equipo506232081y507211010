-- Conciliación: total de la métrica en el data warehouse
USE matricula;
SELECT SUM(total_matriculados) AS total_dw FROM fact_matricula;

-- Desglose por año y semestre (para comparar con la fuente tras la limpieza)
SELECT t.anio, t.semestre, SUM(f.total_matriculados) AS total_matriculados
FROM fact_matricula f JOIN dim_tiempo t ON t.sk_tiempo = f.sk_tiempo
GROUP BY t.anio, t.semestre ORDER BY t.anio, t.semestre;
