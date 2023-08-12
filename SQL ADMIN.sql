--Se crea Repositorio ADMIN BD

-- alter session set "_ORACLE_SCRIPT" = TRUE;

-- Creación de Tablespaces
CREATE TABLESPACE TS_PROCEDIMIENTOS 
DATAFILE 'C:\AdminDB\Procedimientos01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_DENTISTAS 
DATAFILE 'C:\AdminDB\Dentistas01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_PACIENTES 
DATAFILE 'C:\AdminDB\Pacientes01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_CITAS 
DATAFILE 'C:\AdminDB\Citas01.dbf' SIZE 100M AUTOEXTEND ON;

-- Creación de Tablas
CREATE TABLE Procedimientos (
   idProcedimiento INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   descripcion VARCHAR2(200),
   costo NUMBER(10, 2) NOT NULL
) TABLESPACE TS_PROCEDIMIENTOS;

CREATE TABLE Dentistas (
   idDentista INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   apellido VARCHAR2(50) NOT NULL,
   email VARCHAR2(100) UNIQUE
) TABLESPACE TS_DENTISTAS;

CREATE TABLE Pacientes (
   idPaciente INTEGER PRIMARY KEY,
   nombre VARCHAR2(50) NOT NULL,
   apellido VARCHAR2(50) NOT NULL,
   email VARCHAR2(100) UNIQUE
) TABLESPACE TS_PACIENTES;

CREATE TABLE Citas (
   idCita INTEGER PRIMARY KEY,
   idPaciente INTEGER,
   idDentista INTEGER,
   idProcedimiento INTEGER,
   fechaCita DATE,
   motivo VARCHAR2(200),
   costo NUMBER(10, 2),
   FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
   FOREIGN KEY (idDentista) REFERENCES Dentistas(idDentista),
   FOREIGN KEY (idProcedimiento) REFERENCES Procedimientos(idProcedimiento)
) TABLESPACE TS_CITAS;

-- Creación de Índices
CREATE INDEX IDX_NOMBRE_PROCEDIMIENTO ON Procedimientos(nombre) TABLESPACE TS_PROCEDIMIENTOS;
CREATE INDEX IDX_NOMBRE_DENTISTA ON Dentistas(nombre) TABLESPACE TS_DENTISTAS;
CREATE INDEX IDX_NOMBRE_PACIENTE ON Pacientes(nombre) TABLESPACE TS_PACIENTES;
CREATE INDEX IDX_FECHA_CITA ON Citas(fechaCita) TABLESPACE TS_CITAS;

-- Consultas
SELECT * FROM Procedimientos;
SELECT * FROM Dentistas;
SELECT * FROM Pacientes;
SELECT * FROM Citas;

-- Inserciones en la tabla "Procedimientos"
INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (1, 'Limpieza Dental', 'Remoción de placa y sarro', 80.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (2, 'Extracción de Muela', 'Extracción de muela dañada', 150.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (3, 'Empaste Dental', 'Rellenar cavidades con material restaurador', 120.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (4, 'Ortodoncia', 'Alineación de dientes y mandíbula', 2000.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (5, 'Blanqueamiento Dental', 'Aclarar el color de los dientes', 250.00);

-- Inserciones en la tabla "Dentistas"
INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (1, 'María', 'Gómez', 'maria@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (2, 'Juan', 'Rodríguez', 'juan@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (3, 'Laura', 'Pérez', 'laura@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (4, 'Carlos', 'Martínez', 'carlos@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (5, 'Ana', 'López', 'ana@example.com');

-- Inserciones en la tabla "Pacientes"
INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (1, 'Alejandro', 'Hernández', 'alejandro@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (2, 'Isabel', 'Sánchez', 'isabel@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (3, 'Roberto', 'García', 'roberto@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (4, 'Elena', 'Díaz', 'elena@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (5, 'Javier', 'Martín', 'javier@example.com');

-- Inserciones en la tabla "Citas"
INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (1, 1, 1, 1, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Limpieza de rutina', 80.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (2, 2, 2, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'Empaste dental', 120.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (3, 3, 3, 2, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'Extracción de muela', 150.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (4, 4, 4, 5, TO_DATE('2023-08-22', 'YYYY-MM-DD'), 'Blanqueamiento dental', 250.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (5, 5, 5, 4, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'Consulta de ortodoncia', 2000.00);

