/* Creamos la base de datos votaciones */
DROP DATABASE votaciones;
CREATE DATABASE votaciones;

/* creamos la tabla preguntas */
CREATE TABLE preguntas (
    id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(128),
    votos_si INT DEFAULT 0,
    votos_no INT DEFAULT 0
);

/* creamos la tabla votantes */
CREATE TABLE votantes (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(16),
    clave VARCHAR(64)
);

/* creamos la tabla votante_pregunta, para las votaciones */
CREATE TABLE votante_pregunta (
    dni VARCHAR(10),
    id_pregunta INT,
    PRIMARY KEY (dni, id_pregunta)
);


/* añadimos las claves agenas */

/* un votante puede realizar muchas votaciones */
ALTER TABLE votante_pregunta
ADD FOREIGN KEY (dni) REFERENCES votantes(dni);

/* una pregunta puede ser votada por muchos votantes */
ALTER TABLE votante_pregunta
ADD FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta);


/* añadimos datos a las tablas */ 

/* creamos preguntas */
INSERT INTO preguntas (descripcion)
VALUES
    ("¿Estás a favor de aumentar el presupuesto de la comunidad de este año?"),
    ("¿Estás a favor de mantener el portal cerrado a partir de las 12 de la noche?"),
    ("¿Estás a favor de crear un buzón para depositar la prograganda?");

/* creamos falleros */
INSERT INTO votantes (dni, nombre, clave)
VALUES
    ("12345678A", "Juan", "$2y$10$REIziU5igSqaBD8MqvdJWu9S/q1vT.A2NbyTTisc8we8QffpnXtQC"),
    ("23456789B", "Marta", "$2y$10$REIziU5igSqaBD8MqvdJWu9S/q1vT.A2NbyTTisc8we8QffpnXtQC"),
    ("34567890C", "Pedro", "$2y$10$REIziU5igSqaBD8MqvdJWu9S/q1vT.A2NbyTTisc8we8QffpnXtQC"),
    ("45678901D", "Laura", "$2y$10$REIziU5igSqaBD8MqvdJWu9S/q1vT.A2NbyTTisc8we8QffpnXtQC");
