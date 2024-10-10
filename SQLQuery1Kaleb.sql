CREATE DATABASE BANCO;
USE BANCO;

CREATE TABLE Clientes (	
	clienteID INT PRIMARY KEY, 
	Nombre VARCHAR(25) NOT NULL, 
	Apellido VARCHAR(25) NOT NULL,
	Email varchar(20) UNIQUE NOT NULL,
	Telefono BIGINT NOT NULL,
	FechaNacimiento DATE NOT NULL,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	EstadoCliente BIT NOT NULL,
)

CREATE TABLE Prestamos (
	PrestamoID INT PRIMARY KEY,
	ClienteID INT FOREIGN KEY REFERENCES Clientes(clienteID),
	MontoPrestamo BIGINT NOT NULL,
	TasaIntereses FLOAT NOT NULL,
	FechaAprobacion DATETIME DEFAULT GETDATE(),
	PlazoMeses INT NOT NULL,
	EstadoPrestamo BIT NOT NULL,
)

CREATE TABLE PagosPrestamos (
	PagoID INT PRIMARY KEY,
	PrestamoID INT FOREIGN KEY REFERENCES Prestamos(PrestamoID),
	MontoPago BIGINT NOT NULL,
	FechaPago DATETIME DEFAULT GETDATE()
)

CREATE TABLE CuentasBancarias(
	NumeroCuenta BIGINT PRIMARY KEY,
	ClienteID INT FOREIGN KEY REFERENCES Clientes(clienteID),
	EstadoCuenta BIT NOT NULL,
	TipoCuenta VARCHAR(20) NOT NULL,
	Saldo BIGINT NOT NULL,
	FechaApertura DATETIME DEFAULT GETDATE()
)

CREATE TABLE Transacciones(
	
	TransaccionID INT PRIMARY KEY, 
	NumeroCuenta BIGINT FOREIGN KEY REFERENCES CuentasBancarias(NumeroCuenta),
	Monto BIGINT NOT NULL,
	TipoTransaccion VARCHAR(20) NOT NULL,
	FechaTransaccion DATETIME DEFAULT GETDATE(),
	Descripcion VARCHAR(50) NOT NULL

)

CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY,
	NombreSucursal VARCHAR(80),
	DireccionSucursal VARCHAR(80),
	CiudadSucursal VARCHAR(40) NOT NULL,
	EstadoSucursal VARCHAR(40) NOT NULL,
	TelefonoSucursal BIGINT NOT NULL
	
	)

CREATE TABLE Empleados (
	
	EmpleadoID INT PRIMARY KEY,
	SucursalID INT FOREIGN KEY REFERENCES Sucursales(SucursalID),
	NombreEmpleado VARCHAR(80) NOT NULL,
	ApellidoEmpleado VARCHAR(80) NOT NULL,
	CargoEmpleado VARCHAR(50) NOT NULL,
	EmailEmplado VARCHAR(60) UNIQUE NOT NULL,
	FechaIgresoEmpleado DATE NOT NULL,
	SalarioEmpleado FLOAT NOT NULL

)

select * from clientes


/* CREATE TABLE Clientes (	
	clienteID INT PRIMARY KEY, 
	Nombre VARCHAR(25) NOT NULL, 
	Apellido VARCHAR(25) NOT NULL,
	Email varchar(20) UNIQUE NOT NULL,
	Telefono BIGINT NOT NULL,
	FechaNacimiento DATE NOT NULL,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	EstadoCliente BIT NOT NULL,
) */

INSERT INTO Clientes (clienteID, Nombre, Apellido, Email, Telefono, FechaNacimiento, EstadoCliente ) 
VALUES (1, 'Ja ', 'Morant', 'jaMorant@gmail.com', 3214597896, '2020/01/01', 1)

INSERT INTO Clientes(clienteID, Nombre, Apellido, Email, Telefono, FechaNacimiento, EstadoCliente) 
VALUES(2, 'Klay', 'Thompshom', 'klayT@gmail.com', 3258963147, '1997/04/16', 1);

INSERT INTO Clientes(clienteID, Nombre, Apellido, Email, Telefono, FechaNacimiento, EstadoCliente) 
VALUES(3, 'LaMelo', 'Ball', 'LaFrance@gmail.com', 3125545790, '1995/07/10', 1);

/*Agregar registros a la tabla sucursal*/

INSERT INTO Sucursales(SucursalID, NombreSucursal, DireccionSucursal, CiudadSucursal, EstadoSucursal, TelefonoSucursal) VALUES
(1233, 'Bancolombia Buenos Aires', 'Cl. 49 #N° 39 - 64', 'Medellin', 'Antioquia', 018000912345),
(1425, 'Bancolombia GUAYAQUIL', 'Cl. 46 #52-22', 'Medellin', 'Antioquia', 44446936),
(9644, 'Bancolombia ', 'Cra. 50 #N°. 50-02','Medellin', 'Antioquia', 018000523456),
(4576, 'Bancolombia San Diego', 'Cl 34 #43 - 66 Local 1194 San Diego', 'Medellin', 'Antioquia', 6013820000),
(7185, 'Bancolombia AVENIDA JUNIN', 'Cra. 49 #49-74', 'Medellin', 'Antioquia', 44446931);

/*Agregar registros a la tabla Empleados*/
INSERT INTO Empleados(EmpleadoID, NombreEmpleado, ApellidoEmpleado, CargoEmpleado, EmailEmplado, FechaIgresoEmpleado, SalarioEmpleado, SucursalID) VALUES
(1234,'Paco','Torron','Gerente','Paco@gmail.com','2006-01-01',6000000,1233),
(1254,'Jaime','Casas','Gerente','JaimeCa@gmail.com','2009-03-01',9000000,4576),
(1784,'Armando','Paredes','Atencion al cliente','ArmandoProfesional@gmail.com','2019-09-01',4000000,1233),
(16974,'Erika','Galindo','Vigilante','Galindo@gmail.com','2019-09-09',6000000,9644),
(12544,'Andres','Doncik','Atencion al cliente','AndresPegriloso@gmail.com','2017-09-23',4000000,7185);

SELECT * FROM Empleados WHERE NombreEmpleado LIKE '%a%';