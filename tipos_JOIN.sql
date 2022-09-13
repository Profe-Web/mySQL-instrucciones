USE test;

SELECT * FROM estudiante;
SELECT * FROM cursos;
SELECT * FROM becas;

DESCRIBE estudiante;
DESCRIBE cursos;
DESCRIBE becas;

CREATE TABLE estudiante(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
apellido VARCHAR(50),
email VARCHAR(100),
telefono VARCHAR(20),
PRIMARY KEY(id)
);

CREATE TABLE cursos(
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(50),
anios int,
PRIMARY KEY(id)
);

CREATE TABLE becas(
id INT NOT NULL AUTO_INCREMENT,
becado char(3),
estudiante_id INT,
cursos_id INT,
PRIMARY KEY(id),
FOREIGN KEY (estudiante_id) REFERENCES estudiante(id),
FOREIGN KEY (cursos_id) REFERENCES cursos(id)
);

INSERT INTO `test`.`estudiante` (`nombre`, `apellido`, `email`, `telefono`) VALUES ('Esmeralda', 'Smith', 'esmitha@mail.com', '1542485');
INSERT INTO `test`.`estudiante` (`nombre`, `email`, `telefono`) VALUES ('Juan', 'jnadie@mail.com', NULL);
INSERT INTO `test`.`estudiante` (`nombre`, `apellido`, `telefono`) VALUES ('Carla', 'Garcia', '458954');
INSERT INTO `test`.`estudiante` (`apellido`, `email`) VALUES ('Cohete', 'teteco@hotmail.com');

INSERT INTO `test`.`cursos` (`titulo`) VALUES ('mates');
INSERT INTO `test`.`cursos` (`titulo`, `anios`) VALUES ('arte', '4');
INSERT INTO `test`.`cursos` (`titulo`, `anios`) VALUES ('psicologia', '5');
INSERT INTO `test`.`cursos` (`anios`) VALUES ('2');
INSERT INTO `test`.`cursos` (`titulo`, `anios`) VALUES ('programacion', '6');

INSERT INTO `test`.`becas` (`becado`, `estudiante_id`, `cursos_id`) VALUES ('\'S\'', '1', '3');
INSERT INTO `test`.`becas` (`becado`, `estudiante_id`, `cursos_id`) VALUES ('\'N\'', '3', '1');
INSERT INTO `test`.`becas` (`becado`, `estudiante_id`) VALUES ('\'S\'', '3');
INSERT INTO `test`.`becas` (`becado`, `estudiante_id`, `cursos_id`) VALUES ('\'N\'', '2', '2');
INSERT INTO `test`.`becas` (`cursos_id`) VALUES ('4');

-- SELECT estudiante.*, cursos.*, becas.*

SELECT estudiante.nombre n, cursos.titulo t, becas.becado AS b
FROM becas
LEFT JOIN estudiante ON estudiante_id = estudiante.id
LEFT JOIN cursos ON cursos_id = cursos.id
ORDER BY n;

SELECT estudiante.nombre, cursos.titulo, becas.becado
FROM becas 
INNER JOIN estudiante ON estudiante_id = estudiante.id 
INNER JOIN cursos ON cursos_id = cursos.id
ORDER BY estudiante.nombre;

SELECT estudiante.nombre, cursos.titulo, becas.becado
FROM becas
RIGHT JOIN estudiante ON estudiante_id = estudiante.id
RIGHT JOIN cursos ON cursos_id = cursos.id
ORDER BY estudiante.nombre;
