-- Mostrar una TABLA
SELECT * FROM tabla;
-- → Ejemplo ←
SELECT * FROM ama_carnavales_anuales;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Mostrar una COLUMNA
SELECT columna1, columna2 FROM tabla;
-- → Ejemplo ←
SELECT ano, fecha_ini FROM ama_carnavales_anuales;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Mostrar una FILA especifica
SELECT * FROM nombre_de_tabla 
WHERE condicion;
-- → Ejemplo ←
SELECT * FROM ama_eventos
WHERE ano = 5;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Mostrar varias FILAS
SELECT columna1, columna2, columna3 FROM nombre_de_tabla 
WHERE condicion;
-- → Ejemplo ←
SELECT * FROM ama_roles
WHERE nombre = 'c';

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Eliminar FILA
DELETE FROM tabla
WHERE condicion;

-- → Ejemplo ←
DELETE FROM ama_hist_grupos
WHERE id_escuela = 5;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Eliminar una COLUMNA
ALTER TABLE tabla
DROP COLUMN columna;

-- → Ejemplo ←
ALTER TABLE ama_clientes
DROP COLUMN apellido1;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- Editar una COLUMNA
ALTER TABLE tabla
ALTER COLUMN nombre TYPE variable
-- → Ejemplo ←
ALTER TABLE ama_empresas
ALTER COLUMN nombre TYPE varchar(21);

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------