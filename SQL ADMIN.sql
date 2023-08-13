--Se crea Repositorio ADMIN BD

-- alter session set "_ORACLE_SCRIPT" = TRUE;

-- CreaciÃ³n de Tablespaces
CREATE TABLESPACE TS_PROCEDIMIENTOS 
DATAFILE 'C:\AdminDB\Procedimientos01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_DENTISTAS 
DATAFILE 'C:\AdminDB\Dentistas01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_PACIENTES 
DATAFILE 'C:\AdminDB\Pacientes01.dbf' SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE TS_CITAS 
DATAFILE 'C:\AdminDB\Citas01.dbf' SIZE 100M AUTOEXTEND ON;

-- CreaciÃ³n de Tablas
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

-- CreaciÃ³n de Ã?ndices
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
VALUES (1, 'Limpieza Dental', 'RemociÃ³n de placa y sarro', 80.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (2, 'ExtracciÃ³n de Muela', 'ExtracciÃ³n de muela daÃ±ada', 150.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (3, 'Empaste Dental', 'Rellenar cavidades con material restaurador', 120.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (4, 'Ortodoncia', 'AlineaciÃ³n de dientes y mandÃ­bula', 2000.00);

INSERT INTO Procedimientos (idProcedimiento, nombre, descripcion, costo)
VALUES (5, 'Blanqueamiento Dental', 'Aclarar el color de los dientes', 250.00);

-- Inserciones en la tabla "Dentistas"
INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (1, 'MarÃ­a', 'GÃ³mez', 'maria@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (2, 'Juan', 'RodrÃ­guez', 'juan@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (3, 'Laura', 'PÃ©rez', 'laura@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (4, 'Carlos', 'MartÃ­nez', 'carlos@example.com');

INSERT INTO Dentistas (idDentista, nombre, apellido, email)
VALUES (5, 'Ana', 'LÃ³pez', 'ana@example.com');

-- Inserciones en la tabla "Pacientes"
INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (1, 'Alejandro', 'HernÃ¡ndez', 'alejandro@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (2, 'Isabel', 'SÃ¡nchez', 'isabel@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (3, 'Roberto', 'GarcÃ­a', 'roberto@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (4, 'Elena', 'DÃ­az', 'elena@example.com');

INSERT INTO Pacientes (idPaciente, nombre, apellido, email)
VALUES (5, 'Javier', 'MartÃ­n', 'javier@example.com');

-- Inserciones en la tabla "Citas"
INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (1, 1, 1, 1, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Limpieza de rutina', 80.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (2, 2, 2, 3, TO_DATE('2023-08-18', 'YYYY-MM-DD'), 'Empaste dental', 120.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (3, 3, 3, 2, TO_DATE('2023-08-20', 'YYYY-MM-DD'), 'ExtracciÃ³n de muela', 150.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (4, 4, 4, 5, TO_DATE('2023-08-22', 'YYYY-MM-DD'), 'Blanqueamiento dental', 250.00);

INSERT INTO Citas (idCita, idPaciente, idDentista, idProcedimiento, fechaCita, motivo, costo)
VALUES (5, 5, 5, 4, TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'Consulta de ortodoncia', 2000.00);


-- Recuperar todos los procedimientos
SELECT * FROM Procedimientos;

-- Recuperar todos los dentistas
SELECT * FROM Dentistas;

-- Recuperar todos los pacientes
SELECT * FROM Pacientes;

-- Recuperar todas las citas
SELECT * FROM Citas;

-- Recuperar citas para un paciente específico
SELECT * FROM Citas WHERE idPaciente = <id_paciente>;

-- Recuperar citas para un dentista específico
SELECT * FROM Citas WHERE idDentista = <id_dentista>;

-- Recuperar citas para un procedimiento específico
SELECT * FROM Citas WHERE idProcedimiento = <id_procedimiento>;

-- Recuperar citas dentro de un rango de fechas
SELECT * FROM Citas WHERE fechaCita BETWEEN TO_DATE('<fecha_inicio>', 'YYYY-MM-DD') AND TO_DATE('<fecha_fin>', 'YYYY-MM-DD');

-- Recuperar el costo total de procedimientos para un paciente específico
SELECT idPaciente, SUM(costo) AS costo_total
FROM Citas
WHERE idPaciente = <id_paciente>
GROUP BY idPaciente;

-- Recuperar el procedimiento más costoso
SELECT MAX(costo) AS max_costo
FROM Procedimientos;

-- Crear el usuario administrador
CREATE USER admin IDENTIFIED BY admin_password;
GRANT CONNECT, RESOURCE, DBA TO admin;

-- Crear el usuario doctor
CREATE USER doctor IDENTIFIED BY doctor_password;
GRANT CONNECT, RESOURCE TO doctor;

-- Crear el usuario cliente
CREATE USER cliente IDENTIFIED BY cliente_password;
GRANT CONNECT TO cliente;

/*El usuario admin tiene roles CONNECT, RESOURCE y DBA, lo que le da acceso completo a la base de datos y privilegios de administración.
El usuario doctor tiene roles CONNECT y RESOURCE, lo que le proporciona un acceso general a la base de datos y la capacidad de trabajar con recursos.
El usuario cliente solo tiene el rol CONNECT, lo que le permite conectarse a la base de datos.*/

-- RESPALDOS FECHA 12/08/2023;
-- RESPALDOS EN FRIO(CMD)
C:\Users\kenne>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;
SQL> SHUTDOWN IMMEDIATE
SQL> EXIT
C:\Users\kenne>CD \
C:\>CD martes223
C:\>CD martes223>DIR   
C:\martes223>COPY *.DBF C:\BACKUP
C:\martes223>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;   
SQL> STARTUP
SQL> EXIT
-- RESPALDOS CON EXPDP E IMPDP
-- En el CMD
C:\Users\kenne>SQL PLUS /NOLOG
SQL> CONNECT /AS SYSDBA;
SQL>CREATE DIRECTORY BACKUPPROYECTO AS  ‘C:\RESPALDO’;
SQL>GRANT WRITE ON DIRECTORY BACKUPPROYECTO TO SYSTEM;
SQL>EXIT
--En SqlDeveloper con el siguiente comando damos permisos para poder hacer una exportacion o importacion completa:
GRANT EXP_FULL_DATABASE TO SYSTEM;
GRANT IMP_FULL_DATABASE TO SYSTEM;
CREATE TABLE COPIA AS SELECT * FROM Procedimientos;
--Exportamos la tabla  con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ó tambien podemos exportamos la base con el siguiente comando:
C:\> EXPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
--Borramos la tabla en SqlDeveloper con el siguiente comando:
drop table Procedimientos;
--Importamos la tabla  con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=COPIAS.DMP tables=SYSTEM.Procedimientos
--Ó importamos la base con el siguiente comando:
C:\> IMPDP SYSTEM/root directory=BACKUPPROYECTO dumpfile=SYSTEM.DMP SCHEMAS=SYSTEM
-- RESPALDOS EN CALIENTE
