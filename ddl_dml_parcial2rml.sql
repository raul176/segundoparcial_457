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
    urltrailer NVARCHAR(500) NOT NULL,
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



INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno, urltrailer)
VALUES
('The Crown', 'Una serie que narra la vida de la reina Isabel II y los eventos que marcaron su reinado.', 'Peter Morgan', 40, '2016-11-04', 'https://www.youtube.com/watch?v=JWn8K2c4g0A'),
('Breaking Bad', 'Un profesor de química se convierte en fabricante de metanfetaminas para asegurar el futuro financiero de su familia.', 'Vince Gilligan', 62, '2008-01-20', 'https://www.youtube.com/watch?v=HhesaQXLuRY'),
('Game of Thrones', 'Una épica serie de fantasía basada en las novelas de George R.R. Martin, llena de intrigas políticas y batallas por el trono.', 'David Benioff, D.B. Weiss', 73, '2011-04-17', 'https://www.youtube.com/watch?v=s7L2PVdrb_8');

SELECT * FROM Serie;




