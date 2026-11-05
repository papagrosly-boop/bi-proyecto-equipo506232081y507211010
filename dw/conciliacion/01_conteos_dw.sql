-- Conciliación: conteos en el data warehouse (ejecutar después de la carga)
USE matricula;
SELECT 'dim_tiempo' AS tabla, COUNT(*) AS registros FROM dim_tiempo
UNION ALL SELECT 'dim_institucion', COUNT(*) FROM dim_institucion
UNION ALL SELECT 'dim_programa',    COUNT(*) FROM dim_programa
UNION ALL SELECT 'dim_geografia',   COUNT(*) FROM dim_geografia
UNION ALL SELECT 'dim_genero',      COUNT(*) FROM dim_genero
UNION ALL SELECT 'fact_matricula',  COUNT(*) FROM fact_matricula;

-- Filas de hechos que quedaron con la fila "Desconocido" (llave -1)
SELECT 'institucion' AS dimension, COUNT(*) AS filas_desconocido FROM fact_matricula WHERE sk_institucion = -1
UNION ALL SELECT 'programa',   COUNT(*) FROM fact_matricula WHERE sk_programa  = -1
UNION ALL SELECT 'geografia',  COUNT(*) FROM fact_matricula WHERE sk_geografia = -1
UNION ALL SELECT 'genero',     COUNT(*) FROM fact_matricula WHERE sk_genero    = -1;
