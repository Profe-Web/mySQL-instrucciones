-- es aqui donde escribis los comandos
# esto tambien es un comentario
/* y este es para
varias lineas */

USE films;

-- CREAR --
CREATE TABLE spanish(
id INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(50) NOT NULL,
estreno INT,
PRIMARY KEY (id)
);

INSERT INTO spanish(titulo, estreno)
VALUES ('Jamon jamon', NULL),
('Volver', 2006),
('Los amantes del círculo polar', 1998),
('Al otro lado de la cama', 2010),
('El verdugo', 1956);

-- LEER --
SELECT * FROM spanish; -- ctrl+ ENTER = ejecutar linea

SELECT * FROM spanish
WHERE estreno BETWEEN 2000 AND 2010 ;


-- MODIFICAR --
UPDATE spanish
SET estreno = 2000
WHERE id = 2;

-- BORRAR --
-- DROP TABLE spanish;

DELETE FROM spanish
WHERE id>=10;

-- ORDENAR --
SELECT * FROM spanish
ORDER BY titulo ASC; -- orden ascendente (por defecto)

SELECT * FROM spanish
ORDER BY estreno DESC; -- orden descendiente
