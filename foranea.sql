CREATE TABLE productos(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(255),
precio DECIMAL(6,2),
PRIMARY KEY(id)
);

CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
telefono INT,
PRIMARY KEY(id),
productos_id INT,
FOREIGN KEY (productos_id) REFERENCES productos(id)
);

SHOW TABLES;

SELECT * FROM clientes;
SELECT * FROM productos;

DESCRIBE productos;

INSERT INTO productos(nombre, precio)
VALUES('pc', 1200.25),
('mac', 1823.68);

INSERT INTO clientes(nombre, telefono, productos_id)
VALUES('Yerba', 4785695, 2),
('Rosa', 4152639, 1);

-- mostrar nombre de cliente y nombre producto comprado
SELECT clientes.nombre, productos.nombre
FROM clientes LEFT JOIN productos ON productos_id = productos.id
GROUP BY productos.nombre;

SELECT * FROM clientes
WHERE nombre ='Yerba';



