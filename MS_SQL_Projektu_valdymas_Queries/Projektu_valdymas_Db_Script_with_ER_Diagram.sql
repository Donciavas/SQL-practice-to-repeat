USE [master]
GO
/****** Object:  Database [Projektu_valdymas]    Script Date: 2023-02-10 21:06:08 ******/
CREATE DATABASE [Projektu_valdymas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projektu_valdymas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Projektu_valdymas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projektu_valdymas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Projektu_valdymas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Projektu_valdymas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projektu_valdymas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projektu_valdymas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projektu_valdymas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projektu_valdymas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projektu_valdymas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projektu_valdymas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET RECOVERY FULL 
GO
ALTER DATABASE [Projektu_valdymas] SET  MULTI_USER 
GO
ALTER DATABASE [Projektu_valdymas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projektu_valdymas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projektu_valdymas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projektu_valdymas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projektu_valdymas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projektu_valdymas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projektu_valdymas', N'ON'
GO
ALTER DATABASE [Projektu_valdymas] SET QUERY_STORE = OFF
GO
USE [Projektu_valdymas]
GO
/****** Object:  Table [dbo].[DARBUOTOJAS]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DARBUOTOJAS](
	[ASMENSKODAS] [char](11) NOT NULL,
	[VARDAS] [varchar](255) NULL,
	[PAVARDE] [varchar](255) NULL,
	[DIRBANUO] [date] NULL,
	[GIMIMOMETAI] [date] NULL,
	[PAREIGOS] [varchar](255) NULL,
	[SKYRIUS_PAVADINIMAS] [varchar](255) NULL,
	[PROJEKTAS_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projektai]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projektai](
	[Nr] [int] NOT NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Svarba] [varchar](255) NULL,
	[Pradžia] [date] NULL,
	[Trukmė] [int] NULL,
 CONSTRAINT [Projektai_pkey] PRIMARY KEY CLUSTERED 
(
	[Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROJEKTAS]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJEKTAS](
	[ID] [int] NOT NULL,
	[PAVADINIMAS] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SKYRIUS]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKYRIUS](
	[PAVADINIMAS] [varchar](255) NOT NULL,
	[VADOVAS_ASMENSKODAS] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vykdymas]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vykdymas](
	[Projektas] [int] NOT NULL,
	[Vykdytojas] [int] NOT NULL,
	[Statusas] [varchar](255) NULL,
	[Valandos] [int] NULL,
 CONSTRAINT [Vykdymas_pkey] PRIMARY KEY CLUSTERED 
(
	[Projektas] ASC,
	[Vykdytojas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vykdytojai]    Script Date: 2023-02-10 21:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vykdytojai](
	[Nr] [int] NOT NULL,
	[Pavardė] [varchar](255) NULL,
	[Kvalifikacija] [varchar](255) NULL,
	[Kategorija] [int] NULL,
	[Išsilavinimas] [varchar](255) NULL,
 CONSTRAINT [Vykdytojai_pkey] PRIMARY KEY CLUSTERED 
(
	[Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38101122335', N'Petras', N'Petraitis', CAST(N'2009-10-30' AS Date), CAST(N'1981-01-11' AS Date), N'Testuotojas', N'Testavimo', 1)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38010101234', N'Jonas', N'Jonaitis', CAST(N'2007-05-30' AS Date), CAST(N'1980-10-10' AS Date), N'Programuotojas', N'Java', 2)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38103201435', N'Rimas', N'Plekaitis', CAST(N'2009-10-30' AS Date), CAST(N'1981-03-20' AS Date), N'Programuotojas', N'Java', 3)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'48509141175', N'Zita', N'Lietuvaite', CAST(N'2012-06-15' AS Date), CAST(N'1985-09-14' AS Date), N'Projektu vadove', N'Java', 2)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'48410121275', N'Jurga', N'Jurgaityte', CAST(N'2011-02-12' AS Date), CAST(N'1984-10-12' AS Date), N'Programuotoja', N'C#', 1)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38807201234', N'Giedrius', N'Sabutis', CAST(N'2009-01-21' AS Date), CAST(N'1988-07-20' AS Date), N'Testuotojas', N'Testavimo', 2)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38807291234', N'Regimantas', N'Sabonis', CAST(N'2013-01-21' AS Date), CAST(N'1988-07-29' AS Date), N'Testuotojas', N'Testavimo', 3)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38609191234', N'Saulius', N'Sabonis', CAST(N'2013-01-21' AS Date), CAST(N'1986-09-19' AS Date), N'Testuotojas', N'Testavimo', 3)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38109197598', N'Justas', N'Sabonis', CAST(N'2011-12-17' AS Date), CAST(N'1986-09-19' AS Date), N'Testuotojas', N'Testavimo', 1)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38503142412', N'Jonas', N'Kalnas', CAST(N'2009-05-11' AS Date), CAST(N'1985-03-24' AS Date), N'Programuotojas', N'Java', 1)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'39003142412', N'Stasys', N'Sakalas', CAST(N'2009-05-11' AS Date), CAST(N'1990-03-24' AS Date), N'Programuotojas', N'Java', 3)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'37803142412', N'Povilas', N'Vakalas', CAST(N'2012-11-11' AS Date), CAST(N'1978-03-14' AS Date), N'Programuotojas', N'C#', 2)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38804172782', N'Deivydas', N'Piliukas', CAST(N'2011-12-11' AS Date), CAST(N'1988-04-17' AS Date), N'Projektu vadovas', N'Testavimo', 2)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38904172782', N'Kestas', N'Liutas', CAST(N'2012-12-11' AS Date), CAST(N'1989-04-17' AS Date), N'Projektu vadovas', N'C#', 1)
INSERT [dbo].[DARBUOTOJAS] ([ASMENSKODAS], [VARDAS], [PAVARDE], [DIRBANUO], [GIMIMOMETAI], [PAREIGOS], [SKYRIUS_PAVADINIMAS], [PROJEKTAS_ID]) VALUES (N'38901228523', N'laikinas', N'veikejas', CAST(N'2009-01-22' AS Date), CAST(N'1989-01-22' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Projektai] ([Nr], [Pavadinimas], [Svarba], [Pradžia], [Trukmė]) VALUES (1, N'Studentu apskaita', N'Aukšta', CAST(N'2015-01-01' AS Date), 12)
INSERT [dbo].[Projektai] ([Nr], [Pavadinimas], [Svarba], [Pradžia], [Trukmė]) VALUES (2, N'Buhalterine apskaita', N'Vidutine', CAST(N'2005-03-01' AS Date), 10)
INSERT [dbo].[Projektai] ([Nr], [Pavadinimas], [Svarba], [Pradžia], [Trukmė]) VALUES (3, N'WWW svetaine', N'Ypatinga', CAST(N'2005-06-01' AS Date), 2)
GO
INSERT [dbo].[PROJEKTAS] ([ID], [PAVADINIMAS]) VALUES (1, N'Izola')
INSERT [dbo].[PROJEKTAS] ([ID], [PAVADINIMAS]) VALUES (2, N'Registru Centras')
INSERT [dbo].[PROJEKTAS] ([ID], [PAVADINIMAS]) VALUES (3, N'Kaunas')
GO
INSERT [dbo].[SKYRIUS] ([PAVADINIMAS], [VADOVAS_ASMENSKODAS]) VALUES (N'Java', N'48509141175')
INSERT [dbo].[SKYRIUS] ([PAVADINIMAS], [VADOVAS_ASMENSKODAS]) VALUES (N'Testavimo', N'38804172782')
INSERT [dbo].[SKYRIUS] ([PAVADINIMAS], [VADOVAS_ASMENSKODAS]) VALUES (N'C#', N'38904172782')
GO
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (1, 1, N'Programuotojas', 30)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (1, 2, N'Dokumentuotojas', 100)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (1, 3, N'Testuotojas', 100)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (1, 4, N'Vadovas', 100)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (2, 1, N'Programuotojas', 300)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (2, 2, N'Analitikas', 250)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (2, 34, N'Vadovas', 100)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (3, 1, N'Programuotojas', 250)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (3, 2, N'Vadovas', 400)
INSERT [dbo].[Vykdymas] ([Projektas], [Vykdytojas], [Statusas], [Valandos]) VALUES (3, 3, N'Dizaineris', 150)
GO
INSERT [dbo].[Vykdytojai] ([Nr], [Pavardė], [Kvalifikacija], [Kategorija], [Išsilavinimas]) VALUES (1, N'Jonaitis', N'Informatikas', 2, N'VU')
INSERT [dbo].[Vykdytojai] ([Nr], [Pavardė], [Kvalifikacija], [Kategorija], [Išsilavinimas]) VALUES (2, N'Petraitis', N'Statistikas', 3, N'VU')
INSERT [dbo].[Vykdytojai] ([Nr], [Pavardė], [Kvalifikacija], [Kategorija], [Išsilavinimas]) VALUES (3, N'Gražulyte', N'Inžinierius', 1, N'\N')
INSERT [dbo].[Vykdytojai] ([Nr], [Pavardė], [Kvalifikacija], [Kategorija], [Išsilavinimas]) VALUES (4, N'Onaityte', N'Vadybininkas', 5, N'VDU')
INSERT [dbo].[Vykdytojai] ([Nr], [Pavardė], [Kvalifikacija], [Kategorija], [Išsilavinimas]) VALUES (5, N'Antanaitis', N'Informatikas', 3, N'VU')
GO
ALTER TABLE [dbo].[Vykdymas]  WITH CHECK ADD  CONSTRAINT [FK_Vykdymas_Projektai] FOREIGN KEY([Projektas])
REFERENCES [dbo].[Projektai] ([Nr])
GO
ALTER TABLE [dbo].[Vykdymas] CHECK CONSTRAINT [FK_Vykdymas_Projektai]
GO
ALTER TABLE [dbo].[Vykdymas]  WITH CHECK ADD  CONSTRAINT [FK_Vykdymas_Vykdytojai] FOREIGN KEY([Projektas])
REFERENCES [dbo].[Vykdytojai] ([Nr])
GO
ALTER TABLE [dbo].[Vykdymas] CHECK CONSTRAINT [FK_Vykdymas_Vykdytojai]
GO
USE [master]
GO
ALTER DATABASE [Projektu_valdymas] SET  READ_WRITE 
GO
