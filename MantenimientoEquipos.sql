
CREATE DATABASE MantenimientoEquipos;
GO

USE MantenimientoEquipos;
GO


CREATE TABLE Tecnicos (
    TecnicoID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Equipos (
    EquipoID INT PRIMARY KEY,
    TipoEquipo VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Reparaciones (
    ReparacionID INT PRIMARY KEY,
    EquipoID INT NOT NULL,
    FechaSolicitud DATE NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

CREATE TABLE DetallesReparacion (
    DetalleID INT PRIMARY KEY,
    ReparacionID INT NOT NULL,
    Descripcion TEXT NOT NULL,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);

CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY,
    ReparacionID INT NOT NULL,
    TecnicoID INT NOT NULL,
    FechaAsignacion DATE NOT NULL,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID),
    FOREIGN KEY (TecnicoID) REFERENCES Tecnicos(TecnicoID)
);
