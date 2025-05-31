CREATE DATABASE Parcial2Rml;
GO
USE [master]
GO
CREATE LOGIN [usrparcial2] WITH PASSWORD ='12345678',
	DEFAULT_DATABASE = [Parcial2Rml],
	CHECK_EXPIRATION = OFF,
	CHECK_POLICY = ON
GO
USE [Parcial2Rml]
GO
CREATE USER [usrparcial2] FOR LOGIN [usrparcial2]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrparcial2]
GO


DROP TABLE Serie;

CREATE TABLE Serie (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(250) NOT NULL,
    sinopsis VARCHAR(5000) NOT NULL,
    director VARCHAR(100) NOT NULL,
    episodios INT NOT NULL,
    fechaEstreno DATE NOT NULL DEFAULT GETDATE(),
    estado SMALLINT NOT NULL DEFAULT 1 -- -1:Eliminado, 0: Inactivo, 1: Activo;
);
GO

ALTER PROC paSerieListar @parametro NVARCHAR(100)
AS
    SELECT * FROM Serie
    WHERE estado <> -1 AND titulo LIKE '%' + REPLACE(@parametro, ' ', '%') + '%'
    ORDER BY titulo ASC;
GO

EXEC paSerieListar ' The Crown ';



INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES
('Two and a Half', 'Un hombre soltero cría a su sobrino y a su hermano.', 'Chuck Lorre, Lee Aronsohn', 262, '2003-09-22'),
('The Crown', 'La vida de la Reina Isabel II y los eventos que moldearon su reinado.', 'Peter Morgan', 60, '2016-11-04');


SELECT * FROM Serie;




