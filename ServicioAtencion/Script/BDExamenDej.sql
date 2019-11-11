USE [master]
GO
/****** Object:  Database [et_dej4501]    Script Date: 11-11-2019 17:33:44 ******/
CREATE DATABASE [et_dej4501]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'et_dej4501', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\et_dej4501.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'et_dej4501_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\et_dej4501_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [et_dej4501] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [et_dej4501].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [et_dej4501] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [et_dej4501] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [et_dej4501] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [et_dej4501] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [et_dej4501] SET ARITHABORT OFF 
GO
ALTER DATABASE [et_dej4501] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [et_dej4501] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [et_dej4501] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [et_dej4501] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [et_dej4501] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [et_dej4501] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [et_dej4501] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [et_dej4501] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [et_dej4501] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [et_dej4501] SET  ENABLE_BROKER 
GO
ALTER DATABASE [et_dej4501] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [et_dej4501] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [et_dej4501] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [et_dej4501] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [et_dej4501] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [et_dej4501] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [et_dej4501] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [et_dej4501] SET RECOVERY FULL 
GO
ALTER DATABASE [et_dej4501] SET  MULTI_USER 
GO
ALTER DATABASE [et_dej4501] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [et_dej4501] SET DB_CHAINING OFF 
GO
ALTER DATABASE [et_dej4501] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [et_dej4501] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [et_dej4501] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'et_dej4501', N'ON'
GO
ALTER DATABASE [et_dej4501] SET QUERY_STORE = OFF
GO
USE [et_dej4501]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [et_dej4501]
GO
/****** Object:  Table [dbo].[atencion]    Script Date: 11-11-2019 17:33:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atencion](
	[nro_atencion] [int] IDENTITY(1,1) NOT NULL,
	[rut] [nvarchar](50) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[nro_modulo] [int] NOT NULL,
	[es_cliente] [smallint] NOT NULL,
	[tiempo_espera] [int] NOT NULL,
	[comentario] [varchar](250) NULL,
	[fecha_creacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK__atencion__E92B234CFDDBC14E] PRIMARY KEY CLUSTERED 
(
	[nro_atencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 11-11-2019 17:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[rut] [nvarchar](50) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK__cliente__C2B74E7716CE7A5B] PRIMARY KEY CLUSTERED 
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 11-11-2019 17:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[nro_modulo] [int] NOT NULL,
	[carga_actual] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 11-11-2019 17:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](45) NOT NULL,
	[solicitar_comentario] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [fk_atencion_cliente_idx]    Script Date: 11-11-2019 17:33:45 ******/
CREATE NONCLUSTERED INDEX [fk_atencion_cliente_idx] ON [dbo].[atencion]
(
	[rut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_atencion_modulo1_idx]    Script Date: 11-11-2019 17:33:45 ******/
CREATE NONCLUSTERED INDEX [fk_atencion_modulo1_idx] ON [dbo].[atencion]
(
	[nro_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_atencion_servicio1_idx]    Script Date: 11-11-2019 17:33:45 ******/
CREATE NONCLUSTERED INDEX [fk_atencion_servicio1_idx] ON [dbo].[atencion]
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[atencion] ADD  CONSTRAINT [DF__atencion__fecha___3D5E1FD2]  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[atencion]  WITH CHECK ADD  CONSTRAINT [fk_atencion_cliente] FOREIGN KEY([rut])
REFERENCES [dbo].[cliente] ([rut])
GO
ALTER TABLE [dbo].[atencion] CHECK CONSTRAINT [fk_atencion_cliente]
GO
ALTER TABLE [dbo].[atencion]  WITH CHECK ADD  CONSTRAINT [fk_atencion_modulo1] FOREIGN KEY([nro_modulo])
REFERENCES [dbo].[modulo] ([nro_modulo])
GO
ALTER TABLE [dbo].[atencion] CHECK CONSTRAINT [fk_atencion_modulo1]
GO
ALTER TABLE [dbo].[atencion]  WITH CHECK ADD  CONSTRAINT [fk_atencion_servicio1] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicio] ([id_servicio])
GO
ALTER TABLE [dbo].[atencion] CHECK CONSTRAINT [fk_atencion_servicio1]
GO
/****** Object:  Trigger [dbo].[tr_updCargaModulo]    Script Date: 11-11-2019 17:33:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_updCargaModulo] ON [dbo].[atencion]
	AFTER INSERT, DELETE
AS 
BEGIN
   SET NOCOUNT ON;
   IF EXISTS (SELECT * FROM inserted)
   UPDATE modulo SET carga_actual=carga_actual+1 WHERE nro_modulo=(SELECT nro_modulo FROM inserted);
   ELSE
   UPDATE modulo SET carga_actual=carga_actual-1 WHERE nro_modulo=(SELECT nro_modulo FROM deleted);
END
GO
ALTER TABLE [dbo].[atencion] ENABLE TRIGGER [tr_updCargaModulo]
GO
USE [master]
GO
ALTER DATABASE [et_dej4501] SET  READ_WRITE 
GO
