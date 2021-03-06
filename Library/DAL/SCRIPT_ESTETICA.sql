GO
CREATE DATABASE TESTE1
GO
USE TESTE1
GO
CREATE TABLE TB_AGENDAMENTO
(ID_AGEN INT IDENTITY PRIMARY KEY,
ID_CLIENTE INT,
CLIENTE_AGEN VARCHAR(50),
DATA_AGEN SMALLDATETIME,
HORA_AGEN DATETIME,
AGEN_SITUACAO CHAR(1) DEFAULT 'A')

/*-------------------------------------------------------------------------------------------------------*/

GO
CREATE PROCEDURE FL_AGENDAMENTO_INS
@ID_CLIENTE INT,
@CLIENTE_AGEN VARCHAR (50),
@DATA_AGEN SMALLDATETIME,
@HORA_AGEN DATETIME,
@ID_OUT INT OUTPUT
AS
INSERT INTO TB_AGENDAMENTO (ID_CLIENTE,CLIENTE_AGEN,DATA_AGEN,HORA_AGEN)
VALUES (@ID_CLIENTE,@CLIENTE_AGEN,@DATA_AGEN,@HORA_AGEN)
SET @ID_OUT = (SELECT SCOPE_IDENTITY())
RETURN @ID_OUT

/*-------------------------------------------------------------------------------------------------------*/


GO
CREATE TABLE CLIENTE
(ID_CLINTE INT IDENTITY PRIMARY KEY,
NM_CLIENTE VARCHAR (50) NOT NULL,
CPF VARCHAR (15),
CELULAR VARCHAR (15),
EMAIL VARCHAR (30),
CEP VARCHAR (9),
ENDERECO VARCHAR (15),
BAIRRO VARCHAR(15),
NUMERO INT,
CIDADE VARCHAR(20),
UF VARCHAR(15),
NASCIMENTO VARCHAR (10),
IDADE INT,
SEXO INT,
ESTCIVIL INT,
PROFISSAO VARCHAR (20),
MOTIVO VARCHAR (100),
--INICIO DAS PERGUNTAS
ESTETICO INT NOT NULL,
QUALESTETICO VARCHAR (20),
ONCOLOGICO INT NOT NULL,
QUALONCOLOGICO VARCHAR (20),
CIRURGICO INT NOT NULL,
QUALCIRURGICO VARCHAR (20),
ACIDO INT NOT NULL,
QUALACIDO VARCHAR (20),
INTESTINO INT NOT NULL,
OBSINTESTINO VARCHAR (20),
LESOES INT NOT NULL,
QUAISLESOES VARCHAR (20),
TRATMEDICO INT NOT NULL,
QUALTRATMEDICO VARCHAR (20),
LIQUIDOS INT NOT NULL,
QUAISLIQUIDOS VARCHAR (20),
VARIZES INT NOT NULL,
GRAUVARIZES VARCHAR (10),
ATIVFISICA INT NOT NULL,
QUALATIVFISICA VARCHAR (20),
ANTICONCEPCIONAL INT NOT NULL,
QUALANTICONCEPCIONAL VARCHAR (20),
ORTOPEDICO INT NOT NULL,
QUALORTOPEDICO VARCHAR (20),
ALIBALANCEADA INT NOT NULL,
QUALALIBALANCEADA VARCHAR (20),
ALERGIA INT NOT NULL,
QUALALERGIA VARCHAR (20),
MARCAPASSO INT NOT NULL,
QUALMARCAPASSO VARCHAR (20),
CUIDADODIARIO INT NOT NULL,
QUALPRODUTO VARCHAR (20),
FILHO INT NOT NULL,
QUANTOSFILHOS VARCHAR (20),
SENTADA INT NOT NULL,
FUMANTE INT NOT NULL,
HIPOTENSAO INT NOT NULL,
HIPERTENSAO INT NOT NULL,
DIABETES INT NOT NULL,
)


/*------------------------------------------------------------------------------------------------------------*/



GO
CREATE PROCEDURE FL_CLIENTE_INS
@NM_CLIENTE VARCHAR (50),@CPF VARCHAR (15),@CELULAR VARCHAR (15),@EMAIL VARCHAR (30),
@CEP VARCHAR (9),@ENDERECO VARCHAR (15),@BAIRRO VARCHAR(15),@NUMERO INT,@CIDADE VARCHAR(20),@UF VARCHAR(15),
@NASCIMENTO VARCHAR (10),@IDADE INT,@SEXO INT,@ESTCIVIL INT,@PROFISSAO VARCHAR (20), @MOTIVO VARCHAR(100),
--INICIO DAS PERGUNTAS
@ESTETICO INT,@QUALESTETICO VARCHAR (20),@ONCOLOGICO INT,@QUALONCOLOGICO VARCHAR (20),
@CIRURGICO INT,@QUALCIRURGICO VARCHAR (20),@ACIDO INT,@QUALACIDO VARCHAR (20),@INTESTINO INT,
@OBSINTESTINO VARCHAR (20),@LESOES INT,@QUAISLESOES VARCHAR (20),@TRATMEDICO INT,@QUALTRATMEDICO VARCHAR (20),
@LIQUIDOS INT,@QUAISLIQUIDOS VARCHAR (20),@VARIZES INT,@GRAUVARIZES VARCHAR (10),@ATIVFISICA INT,
@QUALATIVFISICA VARCHAR (20),@ANTICONCEPCIONAL INT,@QUALANTICONCEPCIONAL VARCHAR (20),@ORTOPEDICO INT,
@QUALORTOPEDICO VARCHAR (20),@ALIBALANCEADA INT,@QUALALIBALANCEADA VARCHAR (20),@ALERGIA INT,@QUALALERGIA VARCHAR (20),
@MARCAPASSO INT,@QUALMARCAPASSO VARCHAR (20),@CUIDADODIARIO INT,@QUALPRODUTO VARCHAR (20),@FILHO VARCHAR(4),@QUANTOSFILHOS VARCHAR (20),
@SENTADA INT,@FUMANTE INT,@HIPOTENSAO INT,@HIPERTENSAO INT,@DIABETES INT,@ID_OUT INT OUTPUT
AS
INSERT INTO CLIENTE
(NM_CLIENTE,CPF,CELULAR,EMAIL,CEP,ENDERECO,BAIRRO,NUMERO,CIDADE,UF,NASCIMENTO,IDADE,SEXO,ESTCIVIL,
PROFISSAO,MOTIVO,ESTETICO,QUALESTETICO,ONCOLOGICO,QUALONCOLOGICO,CIRURGICO,QUALCIRURGICO,ACIDO,QUALACIDO,INTESTINO,
OBSINTESTINO,LESOES,QUAISLESOES,TRATMEDICO,QUALTRATMEDICO,LIQUIDOS,QUAISLIQUIDOS,VARIZES,GRAUVARIZES,ATIVFISICA,
QUALATIVFISICA,ANTICONCEPCIONAL,QUALANTICONCEPCIONAL,ORTOPEDICO,QUALORTOPEDICO,ALIBALANCEADA,QUALALIBALANCEADA,
ALERGIA,QUALALERGIA,MARCAPASSO,QUALMARCAPASSO,CUIDADODIARIO,QUALPRODUTO,FILHO,QUANTOSFILHOS,SENTADA,FUMANTE,
HIPOTENSAO,HIPERTENSAO,DIABETES )
VALUES(@NM_CLIENTE,@CPF,@CELULAR,@EMAIL,@CEP,@ENDERECO,@BAIRRO,@NUMERO,@CIDADE,@UF,@NASCIMENTO,@IDADE,@SEXO,@ESTCIVIL,
@PROFISSAO,@MOTIVO,@ESTETICO,@QUALESTETICO,@ONCOLOGICO,@QUALONCOLOGICO,@CIRURGICO,@QUALCIRURGICO,@ACIDO,@QUALACIDO,@INTESTINO,
@OBSINTESTINO,@LESOES,@QUAISLESOES,@TRATMEDICO,@QUALTRATMEDICO,@LIQUIDOS,@QUAISLIQUIDOS,@VARIZES,@GRAUVARIZES,@ATIVFISICA,
@QUALATIVFISICA,@ANTICONCEPCIONAL,@QUALANTICONCEPCIONAL,@ORTOPEDICO,@QUALORTOPEDICO,@ALIBALANCEADA,@QUALALIBALANCEADA,
@ALERGIA,@QUALALERGIA,@MARCAPASSO,@QUALMARCAPASSO,@CUIDADODIARIO,@QUALPRODUTO,@FILHO,@QUANTOSFILHOS,@SENTADA,@FUMANTE,
@HIPOTENSAO,@HIPERTENSAO,@DIABETES)
SET @ID_OUT = (SELECT SCOPE_IDENTITY())
RETURN @ID_OUT


/*PROCEDURE PARA ATUALIZAR CLIENTE*/

GO
CREATE PROCEDURE FL_CLIENTE_UPD
@ID_CLIENTE INT,@NM_CLIENTE VARCHAR (50),@CPF VARCHAR (15),@CELULAR VARCHAR (15),@EMAIL VARCHAR (30),
@CEP VARCHAR (9),@ENDERECO VARCHAR (15),@BAIRRO VARCHAR(15),@NUMERO INT,@CIDADE VARCHAR(20),@UF VARCHAR(15),
@NASCIMENTO VARCHAR (10),@IDADE INT,@SEXO INT,@ESTCIVIL INT,@PROFISSAO VARCHAR (20), @MOTIVO VARCHAR(100),
--INICIO DAS PERGUNTAS
@ESTETICO INT,@QUALESTETICO VARCHAR (20),@ONCOLOGICO INT,@QUALONCOLOGICO VARCHAR (20),
@CIRURGICO INT,@QUALCIRURGICO VARCHAR (20),@ACIDO INT,@QUALACIDO VARCHAR (20),@INTESTINO INT,
@OBSINTESTINO VARCHAR (20),@LESOES INT,@QUAISLESOES VARCHAR (20),@TRATMEDICO INT,@QUALTRATMEDICO VARCHAR (20),
@LIQUIDOS INT,@QUAISLIQUIDOS VARCHAR (20),@VARIZES INT,@GRAUVARIZES VARCHAR (10),@ATIVFISICA INT,
@QUALATIVFISICA VARCHAR (20),@ANTICONCEPCIONAL INT,@QUALANTICONCEPCIONAL VARCHAR (20),@ORTOPEDICO INT,
@QUALORTOPEDICO VARCHAR (20),@ALIBALANCEADA INT,@QUALALIBALANCEADA VARCHAR (20),@ALERGIA INT,@QUALALERGIA VARCHAR (20),
@MARCAPASSO INT,@QUALMARCAPASSO VARCHAR (20),@CUIDADODIARIO INT,@QUALPRODUTO VARCHAR (20),@FILHO VARCHAR(4),@QUANTOSFILHOS VARCHAR (20),
@SENTADA INT,@FUMANTE INT,@HIPOTENSAO INT,@HIPERTENSAO INT,@DIABETES INT
AS
UPDATE CLIENTE
SET
NM_CLIENTE			  =	@NM_CLIENTE	,
CPF					  =	@CPF,
CELULAR				  =	@CELULAR,
EMAIL				  =	@EMAIL,
CEP					  =	@CEP,
ENDERECO			  =	@ENDERECO,
BAIRRO				  =	@BAIRRO,
NUMERO				  =	@NUMERO,
CIDADE				  =	@CIDADE	,
UF					  =	@UF,
NASCIMENTO			  =	@NASCIMENTO,
IDADE				  =	@IDADE,
SEXO				  =	@SEXO,
ESTCIVIL			  =	@ESTCIVIL,
PROFISSAO			  =	@PROFISSAO,
MOTIVO				  =	@MOTIVO,
ESTETICO			  =	@ESTETICO,
QUALESTETICO		  =	@QUALESTETICO,
ONCOLOGICO			  =	@ONCOLOGICO,
QUALONCOLOGICO		  =	@QUALONCOLOGICO,
CIRURGICO			  =	@CIRURGICO,
QUALCIRURGICO		  =	@QUALCIRURGICO,
ACIDO				  =	@ACIDO,
QUALACIDO			  =	@QUALACIDO,
INTESTINO			  =	@INTESTINO,
OBSINTESTINO		  =	@OBSINTESTINO,
LESOES				  =	@LESOES,
QUAISLESOES			  =	@QUAISLESOES,
TRATMEDICO			  =	@TRATMEDICO,
QUALTRATMEDICO		  =	@QUALTRATMEDICO,
LIQUIDOS			  =	@LIQUIDOS,
QUAISLIQUIDOS		  =	@QUAISLIQUIDOS,
VARIZES				  =	@VARIZES,
GRAUVARIZES			  =	@GRAUVARIZES,
ATIVFISICA			  =	@ATIVFISICA		 ,
QUALATIVFISICA		  =	@QUALATIVFISICA	 ,
ANTICONCEPCIONAL	  =	@ANTICONCEPCIONAL ,
QUALANTICONCEPCIONAL  =	@QUALANTICONCEPCIONAL,
ORTOPEDICO			  =	@ORTOPEDICO			   ,
QUALORTOPEDICO		  =	@QUALORTOPEDICO		   ,
ALIBALANCEADA		  =	@ALIBALANCEADA		   ,
QUALALIBALANCEADA	  =	@QUALALIBALANCEADA,
ALERGIA				  =	@ALERGIA,
QUALALERGIA			  =	@QUALALERGIA,
MARCAPASSO			  =	@MARCAPASSO,
QUALMARCAPASSO		  =	@QUALMARCAPASSO,
CUIDADODIARIO		  =	@CUIDADODIARIO,
QUALPRODUTO			  =	@QUALPRODUTO,
FILHO				  =	@FILHO,
QUANTOSFILHOS		  =	@QUANTOSFILHOS,
SENTADA				  =	@SENTADA,
FUMANTE				  =	@FUMANTE,
HIPOTENSAO			  =	@HIPOTENSAO,
HIPERTENSAO			  =	@HIPERTENSAO,
DIABETES              = @DIABETES
WHERE ID_CLINTE = @ID_CLIENTE


/*PROCEDURES PARA ATUALIZAR O STATUS DO AGENDAMENTO QUANDO O MESMO FOR REAGENDADO*/
GO
CREATE PROCEDURE USP_TB_AGENDAMENTO_UPD_REAG
@DATA VARCHAR(100),
@HORA VARCHAR(200),
@ID_AGEN INT
AS
UPDATE TB_AGENDAMENTO
SET 
DATA_AGEN = @DATA ,
HORA_AGEN  = @HORA,
AGEN_SITUACAO = 'R'
WHERE ID_AGEN = @ID_AGEN

/*PROCEDURES PARA ATUALIZAR O STATUS DO AGENDAMENTO QUANDO O MESMO FOR CANCELADO*/
GO
CREATE PROCEDURE USP_TB_AGENDAMENTO_UPD_CANC
@DATA VARCHAR(100),
@HORA VARCHAR(200),
@ID_AGEN INT
AS
UPDATE TB_AGENDAMENTO
SET 
DATA_AGEN = @DATA ,
HORA_AGEN  = @HORA,
AGEN_SITUACAO = 'C'
WHERE ID_AGEN = @ID_AGEN

/*PROCEDURES PARA ATUALIZAR O STATUS DO AGENDAMENTO QUANDO O MESMO FOR FINALIZADO*/
GO
CREATE PROCEDURE USP_TB_AGENDAMENTO_UPD_FIN
@ID_AGEN INT
AS
UPDATE TB_AGENDAMENTO
SET 
AGEN_SITUACAO = 'F'
WHERE ID_AGEN = @ID_AGEN




/*TABELA PARA GUARDAR OS PERFIL DOS USU�RIOS*/
GO
CREATE TABLE TB_PERFIL
(
	ID INT IDENTITY(1,1) CONSTRAINT PK_TB_PERFIL PRIMARY KEY,
	DE_PERFIL VARCHAR (30)
)
GO
/*INSERT DOS PERFIL*/
INSERT INTO TB_PERFIL (DE_PERFIL) VALUES ('ADMINISTRADOR')
INSERT INTO TB_PERFIL (DE_PERFIL) VALUES ('GESTOR')
INSERT INTO TB_PERFIL (DE_PERFIL) VALUES ('USU�RIO COMUM')

/*TABELA ONDE SER�O ARMAZENADOS OS USU�RIOS*/
GO
CREATE TABLE TB_USUARIOS(
 USUA_ID INT IDENTITY(1,1) CONSTRAINT PK_TB_USUARIO PRIMARY KEY,
 USUA_DE_LOGIN VARCHAR (50) NOT NULL,
 USUA_DE_SENHA VARCHAR (100) NOT NULL,
 USUA_ID_PERFIL INT CONSTRAINT FK_TB_USUARIOS_TB_PERFIL REFERENCES TB_PERFIL(ID),
 USUA_DT_ULTIMO_ACESSO DATETIME
 )

 /*PROCEDURE PARA SELECIONAR OS USU�RIOS*/

  GO
 CREATE PROCEDURE USP_TB_USUARIOS_SEL
	@LOGIN VARCHAR(50),
	@SENHA VARCHAR(100)
	AS
	SELECT USUA_ID, USUA_DE_LOGIN, USUA_DE_SENHA, USUA_ID_PERFIL, USUA_DT_ULTIMO_ACESSO
	FROM TB_USUARIOS
	WHERE USUA_DE_LOGIN = @LOGIN AND USUA_DE_SENHA = @SENHA	
GO

 /*PROCEDURE PARA INSERIR OS USU�RIOS*/
CREATE PROCEDURE USP_TB_USUARIOS_INS
	@DE_LOGIN VARCHAR(50),
	@DE_SENHA VARCHAR(100),
	@ID_PERFIL INT,
	@ID_OUT INT OUTPUT
AS 
INSERT INTO TB_USUARIOS
	(USUA_DE_LOGIN,
	USUA_DE_SENHA,
	USUA_ID_PERFIL,
	USUA_DT_ULTIMO_ACESSO) 
VALUES 
	(@DE_LOGIN,
	@DE_SENHA,
	@ID_PERFIL,
	GETDATE())
SET @ID_OUT = (SELECT SCOPE_IDENTITY())
RETURN @ID_OUT

 /*PROCEDURE PARA OBTER OS USU�RIOS*/
GO
CREATE PROCEDURE USP_TB_USUARIOS_OBTER_TODOS
AS
SELECT USUA_ID, USUA_DE_LOGIN, USUA_DE_SENHA, USUA_DT_ULTIMO_ACESSO, USUA_ID_PERFIL, B.DE_PERFIL 
FROM TB_USUARIOS A
INNER JOIN TB_PERFIL B ON A.USUA_ID_PERFIL = B.ID

 /*PROCEDURE PARA DAR UPDATE NOS USU�RIOS*/
GO
CREATE PROCEDURE USP_TB_USUARIO_UPD
@DE_LOGIN VARCHAR(50),
@DE_SENHA VARCHAR(100),
@ID_PERFIL INT,
@ID INT
AS
UPDATE TB_USUARIOS SET 
USUA_DE_LOGIN = @DE_LOGIN,
USUA_DE_SENHA = @DE_SENHA,
USUA_ID_PERFIL = @ID_PERFIL
WHERE USUA_ID = @ID

 /*PROCEDURE PARA DELETAR OS USU�RIOS*/
GO
CREATE PROCEDURE USP_TB_USUARIOS_DEL
@ID INT
AS
DELETE FROM TB_USUARIOS
WHERE USUA_ID = @ID
/*INSERIRNDO UM USU�RIO PADR�O*/
GO
INSERT INTO TB_USUARIOS VALUES ('ADM', '2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C', 1, GETDATE())


/*-------------------------------------------------------------------------------------------------------*/

GO
CREATE TABLE TB_MEDIDA
(IDMED INT PRIMARY KEY IDENTITY,
IDAGEMDAMENTO INT CONSTRAINT FK_TB_AGEMDAMENTO_ REFERENCES DBO.TB_AGENDAMENTO(ID_AGEN),
CINTURA VARCHAR(4),
CULOTE VARCHAR(4),
QUADRIL VARCHAR(4),
COXADIR VARCHAR(4),
COXAESQ VARCHAR(4),
PANTESQ VARCHAR(4),
PANTDIR VARCHAR(4))

/*-------------------------------------------------------------------------------------------------------*/
GO
CREATE PROCEDURE FL_MEDIDA_INS
@CINTURA VARCHAR(4),
@CULOTE VARCHAR(4),
@QUADRIL VARCHAR(4),
@COXADIR VARCHAR(4),
@COXAESQ VARCHAR(4),
@PANTESQ VARCHAR(4),
@PANTDIR VARCHAR(4),
@ID_OUT INT OUTPUT
AS
INSERT INTO DBO.TB_MEDIDA(CINTURA,CULOTE,QUADRIL,COXADIR,COXAESQ,PANTESQ,PANTDIR)
VALUES
(@CINTURA,@CULOTE ,@QUADRIL,@COXADIR,@COXAESQ,@PANTESQ,@PANTDIR)
SET @ID_OUT = (SELECT SCOPE_IDENTITY())
RETURN @ID_OUT


/*-------------------------------------------------------------------------------------------------------*/
--GO
--CREATE TABLE TB_PLANO
--(ID_PLANO INT IDENTITY PRIMARY KEY,
--DSC_PLANO VARCHAR(30))

/*-------------------------------------------------------------------------------------------------------*/
--GO
--CREATE PROCEDURE FL_PLANO_INS
--@DSC_PLANO VARCHAR(30),
--@ID_OUT INT OUTPUT
--AS
--INSERT INTO DBO.TB_PLANO
--(DSC_PLANO)
--VALUES(@DSC_PLANO)
--SET @ID_OUT = (SELECT SCOPE_IDENTITY())
--RETURN @ID_OUT