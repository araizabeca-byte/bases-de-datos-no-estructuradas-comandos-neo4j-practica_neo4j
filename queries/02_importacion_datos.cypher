// IMPORTAR DATOS



// 1. Importar Estudiantes
LOAD CSV WITH HEADERS FROM
'https://github.com/araizabeca-byte/bases-de-datos-no-estructuradas-comandos-neo4j-practica_neo4j/main/data/estudiantes.csv'
AS row


CREATE (:Estudiante {
   id: row.id,
   nombre: row.nombre,
   carrera: row.carrera,
   semestre: toInteger(row.semestre)
});



// 2. Importar Materias
LOAD CSV WITH HEADERS FROM
'https://github.com/araizabeca-byte/bases-de-datos-no-estructuradas-comandos-neo4j-practica_neo4j/main/data/materias.csv'
AS row



CREATE (:Materias {
   id: row.id,
   nombre: row.nombre,
   area: row.area
});



// 3. Importar Profesores
LOAD CSV WITH HEADERS FROM
'https://github.com/araizabeca-byte/bases-de-datos-no-estructuradas-comandos-neo4j-practica_neo4j/main/data/profesores.csv'
AS row



CREATE (:Profesores{
   id: row.id,
   nombre: row.nombre,
   departamento: row.departamento
});

// crear relaciones de amistades(paso 12)
LOAD CSV WITH HEADERS FROM
'https://github.com/araizabeca-byte/bases-de-datos-no-estructuradas-comandos-neo4j-practica_neo4j/main/data/amistades.csv'
AS row
MATCH (e1:Estudiante {id: row.id_estudiante1})
MATCH (e2:Estudiante {id: row.id_estudiante2})
CREATE (e1)-[:AMIGO_DE {desde: row.desde, nivel: row.nivel}]->(e2);

//crear relaciones de imparticiones (paso13)
LOAD CSV WITH HEADERS FROM
'https://github.com/araizabeca-byte/bases-de-datos-no-estructuradas-comandos-neo4j-practica_neo4j/main/data/imparticiones.csv'
AS row
MATCH (p:Profesor {id: row.id_profesor})
MATCH (m:Materia {id: row.id_materia})
CREATE (p)-[:IMPARTE {anio: row.anio, semestre: row.semestre}]->(m);