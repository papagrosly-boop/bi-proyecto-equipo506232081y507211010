# \# Procesos ETL - Pentaho Data Integration

# 

# \## 1. Motor y versión

# \* \*\*Herramienta:\*\* Pentaho Data Integration (PDI) Community Edition 9.4 (Kettle)\[cite: 5].

# \* \*\*Motor de Base de Datos destino:\*\* MySQL 8.0.46 (almacén de datos local `matricula`)\[cite: 2, 4].

# 

# \## 2. Parámetros de conexión (sin contraseñas)

# La conexión a la base de datos se maneja mediante variables de entorno configuradas en el archivo `kettle.properties` local de PDI para evitar exponer credenciales en el repositorio:

# \* \*\*Host:\*\* `${DB\_HOST}` (`localhost`)

# \* \*\*Base de datos:\*\* `${DB\_NAME}` (`matricula`)

# \* \*\*Usuario:\*\* `${DB\_USER}` (`etl`)

# \* \*\*Contraseña:\*\* `${DB\_PASS}` \*(Variable aislada por seguridad)\*\[cite: 1, 2]

# \* \*\*Codificación:\*\* `UTF-8`

# \* \*\*Driver JDBC:\*\* MySQL Connector/J 5.1.49

# 

# \## 3. Ubicación esperada de las fuentes

# Los archivos originales de entrada deben ubicarse en la siguiente ruta local del entorno de ejecución:

# \* `C:\\bi\\fuentes\\`\[cite: 5]

# &#x20; \* `MEN\_INSTITUCIONES\_EDUCACIÓN\_SUPERIOR\_20261023.csv` (F1)

# &#x20; \* `MEN\_MATRICULA\_ESTADISTICA\_ES\_20261023.csv` (F2 - \*Excluido del control de versiones por superar los 50 MB, listado en `.gitignore`\*)\[cite: 1, 2]

# &#x20; \* `DIVIPOLA-\_Códigos\_municipios\_20261023.xml` (F3)\[cite: 2]

# 

# \## 4. Orden de ejecución del trabajo (.kjb)

# El proceso de carga se automatiza mediante el trabajo principal ubicado en `etl/trabajos/j\_carga\_dw.kjb`, el cual ejecuta las transformaciones en el siguiente orden estricto para mantener la integridad de las llaves foráneas\[cite: 1, 2]:

# 

# 1\. \*\*`t\_dim\_geografia.ktr`\*\* — Lee el catálogo XML de DIVIPOLA, normaliza coordenadas y carga la dimensión geográfica.

# 2\. \*\*`t\_dim\_institucion.ktr`\*\* — Lee el CSV de instituciones y carga la dimensión de instituciones.

# 3\. \*\*`t\_dim\_programa.ktr`\*\* — Procesa y carga los datos asociados a la dimensión de programas académicos desde el archivo de matrícula.

# 4\. \*\*`t\_dim\_genero.ktr`\*\* — Extrae y mapea los códigos de género para la dimensión correspondiente.

# 5\. \*\*`t\_fact\_matricula.ktr`\*\* — \*\[Al final]\* Lee el archivo masivo de matrícula, elimina duplicados exactos, valida búsquedas contra las dimensiones (asignando la fila "Desconocido" `-1` de ser necesario), agrupa por la granularidad de las cinco llaves y carga la tabla de hechos con truncamiento previo.

