-- Pasos iniciales, borrar base si existe para que no haya problemas y luego crearla
-- Luego le damos USE para colocarnos en ella, y empezamos a introducir datos
DROP DATABASE IF EXISTS miprimerabase
CREATE DATABASE miprimerabase
USE miprimerabase

-- Tabla estudiantes, simple con datos falsos. DNI se limita a 9 y gender a 1 letra (M/F)
-- La ID se genera automáticamente, ya no hay que insertarla manualmente en el INSERT INTO.
	CREATE TABLE students (
		student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		student_name VARCHAR(255),
		student_surname VARCHAR(255),
		student_country VARCHAR(255),
		student_gender VARCHAR(1),
		student_dni CHAR(9),
		student_course VARCHAR(255),
		student_dateofbirth DATE
)
-- Insertamos datos de estudiantes. Todos falsos y random. No se añade ID para que se genere sola.
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

-- Creo la tabla de los profesores. Esta tabla quiero intentar linkearla a otras usando llaves.
-- Lo mismo que la anterior y las siguientes, ID autoincremental.
	CREATE TABLE  teachers (
		teacher_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		teacher_name VARCHAR(255),
		teacher_surname VARCHAR(255),
		teacher_country VARCHAR(255),
		teacher_gender VARCHAR(1),
		teacher_dni CHAR(9),
		teacher_dateofbirth DATE
	)
-- Se insertan datos de profesores, falsos también.
		INSERT INTO teachers (teacher_name, teacher_surname, teacher_country, teacher_gender, teacher_dni, teacher_dateofbirth) VALUES
		('Vin', 'Diesel', 'España', 'M', '62487562V', '1940-02-02'),
		('Jason', 'Statham', 'Reino Unido', 'M', '32568475J', '1965-05-05'),
		('Calia', 'Menethil', 'Lordaeron', 'F', '46978135C', '1984-06-06'),
		('Scarlett', 'Johansson', 'Finlandia', 'F', '51426352S', '1975-04-04'),
		('Eva', 'Green', 'Inglaterra', 'F', '73914685E', '1955-08-08'),
		('Elizabeth', 'DeWitt', 'Columbia', 'F', '36251474E', '1998-09-29'),
		('Chuck', 'Norris', 'Estados Unidos', 'M', '74143696C', '1950-07-07'),
		('Jackie', 'Chan', 'China', 'M', '45658525J', '1945-02-02'),
		('Artiom', 'Metrinsky', 'Rusia', 'M', '74359615A', '1988-08-08');