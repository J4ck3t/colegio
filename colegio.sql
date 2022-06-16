DROP DATABASE IF EXISTS miprimerabase
CREATE DATABASE miprimerabase
USE miprimerabase
-- MOVER ESTAS CONSULTAS CUANDO EL PARCHE ESTÉ TERMINADO
SELECT * FROM students
DROP TABLE students
TRUNCATE students

CREATE TABLE students (
    student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255),
    student_surname VARCHAR(255),
    student_country VARCHAR(255),
    student_gender VARCHAR(255),
    student_dni CHAR(9),
    student_course VARCHAR(255),
    student_dateofbirth DATE
)

INSERT INTO students 
(student_name, student_surname, student_country, student_gender, student_dni, student_course, student_dateofbirth) VALUES
	('Brian', 'Guillén', 'Argentina', 'M', '11111111A', 'Administración de sistemas informáticos en red', '1994-01-11'),
	('Tomás', 'Vera', 'España', 'M', '12345678T', 'Estudios de policía nacional', '1994-11-23'),
	('Álvaro', 'Castillo', 'España', 'M', '23456789A', 'Modelado 3D', '1996-05-22'),
	('Joshua', 'López', 'Marruecos', 'M', '34567891J', 'Diseño de aplicaciones multiplataforma', '1995-06-30'),
	('Nina', 'Rizzi', 'Italia', 'F', '45678912N', 'Dirección de empresas', '1997-08-11'),
	('Lorena', 'Vetter', 'Alemania', 'F', '56789123L', 'Cuidado social', '1994-05-05'),
	('Miguel', 'Paloma', 'Español', 'M', '67891234M', 'Administración de sistemas informáticos en red', '1997-06-09'),
	('Kübra', 'Kübra', 'Turquía', 'F', '78912345K', 'Anestesia y cirugía elemental', '1998-07-21'),
	('Carlos', 'Santana', 'España', 'M', '89123456C', 'Estudios de policía nacional', '1994-05-05'),
	('Stella', 'Guillén', 'Argentina', 'F', '91234567S', 'Modelado 3D',  '1985-04-22');