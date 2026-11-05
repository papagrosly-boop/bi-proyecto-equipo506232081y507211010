# Anexo A. Diccionarios de datos

## F1. Instituciones de Educación Superior (CSV)

| Campo | Tipo | Descripción | Ejemplo | Problema de calidad |
|---|---|---|---|---|
| Código Institución | Texto | Código SNIES de la institución | 1.123 | Usa punto de miles ('1.123'); en F2 el mismo código viaja sin punto |
| Nombre Institución | Texto | Nombre oficial de la institución de educación superior | UNIVERSIDAD POPULAR DEL CESAR | Ninguno detectado |
| Número Identificación Tributaria - NIT | Texto | NIT de la institución | 892.300.285-6 | Formato con puntos y guion; no es numérico |
| Principal/Seccional | Texto | Indica si es sede principal o seccional | Seccional | Ninguno detectado |
| Naturaleza Jurídica | Texto | Naturaleza jurídica de la institución | Nacional | Ninguno detectado |
| Sector | Texto | Sector de la institución (oficial o privado) | Oficial | Ninguno detectado |
| Carácter Académico | Texto | Carácter académico (universidad, institución universitaria, etc.) | Universidad | Ninguno detectado |
| Cod Departamento | Texto | Departamento de domicilio (debería ser un código) | Cesar | Contiene el nombre del departamento, no un código |
| Departamento Domicilio | Texto | Nombre del departamento de domicilio | Cesar | Ninguno detectado |
| Cod Municipio | Texto | Código del municipio de domicilio | (vacío) | 361 vacíos |
| Municipio Domicilio | Texto | Nombre del municipio de domicilio | Aguachica | Ninguno detectado |
| Dirección Domicilio | Texto | Dirección de la institución | Cra. 40  v¿a al Mar | 41 con caracteres corruptos ('¿') |
| Teléfono Domicilio | Texto | Teléfono de la institución | 5654900 | 7 con 'SIN DATO'/'NA' |
| Norma de Creación | Texto | Norma legal con la que se creó la institución | Ley 34 Congreso de Colombia. | 27 con caracteres corruptos ('¿') |
| Fecha Norma de Creación | Fecha | Fecha de la norma de creación | 1976-11-19 | 30 fechas imposibles (año <1900 o >2026) |
| ¿Acreditada Alta Calidad? | Texto | SI/NO: acreditación de alta calidad vigente | NO | Ninguno detectado |
| Fecha Acreditación | Fecha | Fecha de la acreditación | 2021-08-25 | 254 con 'SIN DATO'/'NA' |
| Resolución de la acreditación | Texto | Número de la resolución que acredita | 2087 | 249 con 'SIN DATO'/'NA' |
| Vigencia de la acreditación | Texto | Vigencia de la acreditación | 10 | 254 con 'SIN DATO'/'NA' |
| Estado | Texto | Estado de la institución a la fecha de actualización | Activa en la Fecha de Actualizacion | Ninguno detectado |
| Fecha Actualizacion | Fecha | Fecha de actualización del registro | 2022-07-08 | Ninguno detectado |
| Página Web | Texto | Sitio web de la institución | www.unicesar.edu.co | Ninguno detectado |

## F2. Matrícula estadística de educación superior (CSV)

| Campo | Tipo | Descripción | Ejemplo | Problema de calidad |
|---|---|---|---|---|
| Código de la Institución | Texto | Código SNIES de la institución (sede) que reporta | 2833 | Sin punto de miles (en F1 lleva punto) |
| IES PADRE | Texto | Código de la institución principal de la que depende | 2833 | Ninguno detectado |
| Institución de Educación Superior (IES) | Texto | Nombre de la institución | CORPORACION UNIVERSITARIA REMINGTON | 2569 con caracteres corruptos ('¿'); 374 escrituras distintas para 338 códigos |
| Principal oSeccional | Texto | Sede principal o seccional | PRINCIPAL | Mayúsculas inconsistentes: 4 valores para 2 categorías |
| Id_Sector | Entero (código) | Código del sector de la institución | 2 | Ninguno detectado |
| Id_Caracter | Entero (código) | Código del carácter académico | 3 | Ninguno detectado |
| Código del departamento(IES) | Texto | Código del departamento de domicilio de la institución | 5 | Códigos sin cero inicial (en F3 llevan cero) |
| Departamento de domicilio de la IES | Texto | Departamento de domicilio de la institución | ANTIOQUIA | 74 escrituras distintas para 28 códigos |
| Código del Municipio(IES) | Texto | Código del municipio de domicilio de la institución | 5001 | Códigos sin cero inicial (en F3 llevan cero) |
| Municipio dedomicilio de la IES | Texto | Municipio de domicilio de la institución | MEDELLIN | 185 escrituras distintas para 75 códigos |
| Código SNIES delprograma | Texto | Código SNIES del programa académico | 13061 | Ninguno detectado |
| Programa Académico | Texto | Nombre del programa académico | CONTADURIA PUBLICA | 3555 con caracteres corruptos ('¿') |
| Id_Nivel | Entero (código) | Código del nivel académico del programa | 1 | Ninguno detectado |
| Id_Nivel_Formacion | Entero (código) | Código del nivel de formación | 6 | Ninguno detectado |
| Id_Metodologia | Entero (código) | Código de la metodología del programa | 2 | Ninguno detectado |
| Id_Area | Texto (código) | Código del área de conocimiento | 6 | 192 filas con el texto 'Sin clasificar' en una columna de códigos |
| Id_Nucleo | Entero (código) | Código del núcleo básico del conocimiento | 612 | Ninguno detectado |
| Núcleo Básico del Conocimiento (NBC) | Texto | Nombre del núcleo básico del conocimiento | CONTADURIA PUBLICA | Ninguno detectado |
| Código del Departamento(Programa) | Texto | Código del departamento donde se ofrece el programa | 23 | 24313 códigos con cero inicial y el resto sin él |
| Departamento de oferta del programa | Texto | Departamento donde se ofrece el programa | CORDOBA | 88 escrituras distintas para 35 códigos |
| Código del Municipio(Programa) | Texto | Código del municipio donde se ofrece el programa | 23670 | 24313 códigos con cero inicial y el resto sin él |
| Municipio de oferta del programa | Texto | Municipio donde se ofrece el programa | SAN ANDRES DE SOTAVENTO | 1439 escrituras distintas para 902 códigos |
| Id Género | Entero (código) | Código del género de los matriculados | 2 | Ninguno detectado |
| Año | Entero | Año de la matrícula | 2015 | Ninguno detectado |
| Semestre | Entero | Semestre de la matrícula (1 o 2) | 1 | Ninguno detectado |
| Total Matriculados | Entero | Número de estudiantes matriculados en la combinación de la fila | 2 | Ninguno detectado |

## F3. DIVIPOLA – Códigos municipios (XML)

| Campo | Tipo | Descripción | Ejemplo | Problema de calidad |
|---|---|---|---|---|
| cod_dpto | Texto | Código DANE del departamento (2 dígitos) | 05 | Ninguno detectado |
| dpto | Texto | Nombre del departamento | ANTIOQUIA | Ninguno detectado |
| cod_mpio | Texto | Código DANE del municipio (5 dígitos) | 05001 | Ninguno detectado |
| nom_mpio | Texto | Nombre del municipio | MEDELLÍN | Nombres repetidos en distintos departamentos (ej. ALBANIA); cruzar por código |
| tipo_municipio | Texto | Municipio, Isla o Área no municipalizada | Municipio | Incluye 18 'Área no municipalizada' y 1 'Isla' que no son municipios |
| longitud | Texto | Longitud en grados, con coma decimal | -75,581775 | Coma decimal y guardado como texto |
| latitud | Texto | Latitud en grados, con coma decimal | 6,246631 | Coma decimal y guardado como texto |
