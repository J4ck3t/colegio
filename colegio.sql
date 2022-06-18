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
		student_grade VARCHAR(255),
		student_dateofbirth DATE
)
-- Insertamos datos de estudiantes. Todos falsos y random. No se añade ID para que se genere sola.
		INSERT INTO students 
		(student_name, student_surname, student_country, student_gender, student_dni, student_grade, student_dateofbirth) VALUES
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

-- Última tabla de momento en esta primera tabla de prueba. Los edificios donde se imparten las clases.
-- Mi idea es poder relacionarlo todo, aunque necesito investigar más sobre el diseño de las bases en si.
-- Tabla edificios, una vez más, todo inventado.
	CREATE TABLE facilities (
		facility_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		facility_building_name VARCHAR(255),
		facilitiy_location VARCHAR(255)
	)

-- Ahora inserto datos de los edificios. En teoría, si todo va bien, la tabla anterior debería referenciar
-- correctamente a esta en tanto grade_facility --> facility_id.
		INSERT INTO facilities (facility_building_name, facilitiy_location) VALUES
		('Edificio Victoria', 'Ala norte'),
		('Edificio Esfuerzo', 'Ala sur'),
		('Edificio Dedicación', 'Ala este'),
		('Edificio Constancia', 'Ala oeste');

-- Creo la tabla de asignaturas. En esta tabla voy a probar a poner más de 1 FK.
	CREATE TABLE grade (
		grade_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		grade_name VARCHAR(255),
		grade_initials VARCHAR (255),
		grade_description VARCHAR(255),
		grade_tutor INT NOT NULL,
		grade_facility INT NOT NULL,
		FOREIGN KEY (grade_tutor) REFERENCES teachers(teacher_id),
		FOREIGN KEY (grade_facility) REFERENCES facilities(facility_id)
	)

-- Se insertan datos de las asignaturas a tomar. Lo mismo, todo inventado. En este punto, al probar
-- el código por partes, la referencia a la tabla facilities da error porque todavía no se ha creado
-- pero es válida. Aquí en teoría los campos grade_tutor y grade_facility se deberían rellenar solor
-- usando los datos de las tablas que referencian.
		INSERT INTO grade (grade_name, grade_initials, grade_description, grade_tutor, grade_facility) VALUES
		('Administración de sistemas informáticos en red', 'ASIR', 'Ahondar en las tecnologías de red'),
		('Estudios de policía nacional', 'ESPOL', 'Aprender a proteger y servir'),
		('Modelado 3D', 'MODE', 'Aprender a hacer modelos 3D'),
		('Diseño de aplicaciones multiplataforma', 'DAM', 'El uso de herramientas para desarrollar aplicaciones'),
		('Dirección de empresas', 'DIEM', 'Cómo llevar una empresa'),
		('Cuidado social', 'CUSO', 'Ayuda a personas'),
		('Anestesia y cirugía elemental', 'ANES', 'Aprender a ser anestesista');
		