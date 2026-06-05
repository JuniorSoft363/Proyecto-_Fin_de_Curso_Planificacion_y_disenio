----CREATE DATABASE Biblioteca;
------ TABLA USUARIO--
----CREATE TABLE Usuario (
----    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
----    cedula VARCHAR(10) NOT NULL UNIQUE,
----    nombre VARCHAR(100) NOT NULL,
----    apellido VARCHAR(150) NOT NULL,
----    correo VARCHAR(50) NOT NULL UNIQUE,
----    rol VARCHAR(20) NOT NULL,
----    estado VARCHAR(255) NOT NULL,
----    fecha_registro DATETIME2 NOT NULL DEFAULT GETDATE()
----);
INSERT INTO Usuario
(
    cedula,
    nombre,
    apellido,
    correo,
    rol,
    estado
)
VALUES
('1208477550','Maybelin','Pérez','anamayn@gmail.com','Estudiante','Activo'),
('0987654321','Bryam','López','mbrya@gmail.com','Docente','Activo'),
('1122334455','Alison','Mendoza','alisonns@gmail.com','Administrador','Activo');
select* from Usuario;
CREATE INDEX IX_Usuario_Nombre
ON Usuario(nombre);
-- TABLA MATERIAL--
CREATE TABLE Material (
    id_material INT IDENTITY(1,1) PRIMARY KEY,
    codigo_qr VARCHAR(255) NOT NULL UNIQUE,
    titulo VARCHAR(300) NOT NULL,
    autor VARCHAR(200) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    ejemplares_total INT NOT NULL,
    ejemplares_disponibles INT NOT NULL,
    estado VARCHAR(20) NOT NULL
);
INSERT INTO Material
(
    codigo_qr,
    titulo,
    autor,
    categoria,
    ejemplares_total,
    ejemplares_disponibles,
    estado
)
VALUES
('QR001','Cien Años de Soledad','Gabriel García Márquez','Novela',5,5,'Disponible'),
('QR002','El Principito','Antoine de Saint-Exupéry','Infantil',3,3,'Disponible'),
('QR003','La Sombra del Viento','Carlos Ruiz Zafón','Misterio',4,4,'Disponible');
SELECT * FROM Material;
-- TABLA PRESTAMO--
CREATE TABLE Prestamo (
    id_prestamo INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_material INT NOT NULL,
    fecha_hora_inicio DATETIME2 NOT NULL,
    fecha_hora_devolucion DATETIME2 NOT NULL,
    fecha_hora_real_dev DATETIME2 NULL,
    estado VARCHAR(20) NOT NULL,
    minutos_excedidos DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT FK_Prestamo_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),

    CONSTRAINT FK_Prestamo_Material
        FOREIGN KEY (id_material)
        REFERENCES Material(id_material)
INSERT INTO Prestamo
(
    id_usuario,
    id_material,
    fecha_hora_inicio,
    fecha_hora_devolucion,
    estado
)
VALUES
(1, 1, '2024-06-01 10:00:00', '2024-06-15 10:00:00', 'Activo'),
(2, 2, '2024-06-05 14:30:00', '2024-06-20 14:30:00', 'Activo');
SELECT * FROM Prestamo
INSERT INTO Prestamo
(
    id_usuario,
    id_material,
    fecha_hora_inicio,
    fecha_hora_devolucion,
    fecha_hora_real_dev,
    estado,
    minutos_excedidos
)
VALUES
(
    3, 1,'2026-06-01 10:00:00','2026-06-15 10:00:00','2026-06-15 11:30:00','Devuelto',90
);
-- TABLA RESERVA--
CREATE TABLE Reserva (
    id_reserva INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_material INT NOT NULL,
    fecha_hora_reserva DATETIME2 NOT NULL,
    fecha_hora_caducidad DATETIME2 NOT NULL,
    estado VARCHAR(255) NOT NULL,

    CONSTRAINT FK_Reserva_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario),

    CONSTRAINT FK_Reserva_Material
        FOREIGN KEY (id_material)
        REFERENCES Material(id_material)
);
INSERT INTO Reserva
(
    id_usuario,
    id_material,
    fecha_hora_reserva,
    fecha_hora_caducidad,
    estado
)
VALUES
(1, 2, '2024-06-10 09:00:00', '2024-06-12 09:00:00', 'Activa'),
(2, 3, '2024-06-11 15:00:00', '2024-06-13 15:00:00', 'Activa');
SELECT * FROM Reserva;
-- TABLA MULTA--
CREATE TABLE Multa (
    id_multa INT IDENTITY(1,1) PRIMARY KEY,
    id_prestamo INT NOT NULL,
    id_usuario INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    motivo VARCHAR(300) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    fecha_generacion DATETIME2 NOT NULL DEFAULT GETDATE(),
    fecha_pago DATETIME2 NULL,

    CONSTRAINT FK_Multa_Prestamo
        FOREIGN KEY (id_prestamo)
        REFERENCES Prestamo(id_prestamo),

    CONSTRAINT FK_Multa_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)
);
INSERT INTO Multa
(
    id_prestamo,
    id_usuario,
    monto,
    motivo,
    estado
)
VALUES
(3, 3, 15.00, 'Devolución tardía', 'Pendiente');
select * from Multa;
INSERT INTO Multa
(
    id_prestamo,
    id_usuario,
    monto,
    motivo,
    estado,
    fecha_pago
)
VALUES
(
    3,
    3,
    15.00,
    'Devolución tardía',
    'Pagada',
    GETDATE()
);
-- TABLA BITACORA--
CREATE TABLE Bitacora (
    id_registro INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    accion VARCHAR(100) NOT NULL,
    modulo VARCHAR(30) NOT NULL,
    descripcion VARCHAR(MAX) NOT NULL,
    ip_origen VARCHAR(45) NOT NULL,
    fecha_hora DATETIME2 NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Bitacora_Usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)
);
insert into Bitacora
(
    id_usuario,
    accion,
    modulo,
    descripcion,
    ip_origen
)
VALUES
(1, 'Reserva creada', 'Reserva', 'El usuario Maybelin Pérez reservó el material El Principito', '192.168.1.1');
select * from Bitacora;
-- RESTRICCIONES OPCIONALES--
ALTER TABLE Material
ADD CONSTRAINT CK_Material_Ejemplares
CHECK (ejemplares_disponibles <= ejemplares_total);

ALTER TABLE Multa
ADD CONSTRAINT CK_Multa_Monto
CHECK (monto >= 0);
ALTER TABLE Prestamo
ADD CONSTRAINT CK_Prestamo_Minutos
CHECK (minutos_excedidos >= 0);



