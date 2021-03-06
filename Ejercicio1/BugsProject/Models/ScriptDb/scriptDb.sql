USE [BugsProject]
GO
ALTER TABLE [dbo].[Bug] DROP CONSTRAINT [FK_Bug_User]
GO
ALTER TABLE [dbo].[Bug] DROP CONSTRAINT [FK_Bug_Project]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/03/2021 22:45:53 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 26/03/2021 22:45:53 ******/
DROP TABLE [dbo].[Project]
GO
/****** Object:  Table [dbo].[Bug]    Script Date: 26/03/2021 22:45:53 ******/
DROP TABLE [dbo].[Bug]
GO
USE [master]
GO
/****** Object:  Database [BugsProject]    Script Date: 26/03/2021 22:45:53 ******/
DROP DATABASE [BugsProject]
GO
/****** Object:  Database [BugsProject]    Script Date: 26/03/2021 22:45:53 ******/
CREATE DATABASE [BugsProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BugsProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BugsProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BugsProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BugsProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BugsProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BugsProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BugsProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BugsProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BugsProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BugsProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BugsProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [BugsProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BugsProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BugsProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BugsProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BugsProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BugsProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BugsProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BugsProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BugsProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BugsProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BugsProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BugsProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BugsProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BugsProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BugsProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BugsProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BugsProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BugsProject] SET RECOVERY FULL 
GO
ALTER DATABASE [BugsProject] SET  MULTI_USER 
GO
ALTER DATABASE [BugsProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BugsProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BugsProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BugsProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BugsProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BugsProject', N'ON'
GO
ALTER DATABASE [BugsProject] SET QUERY_STORE = OFF
GO
USE [BugsProject]
GO
/****** Object:  Table [dbo].[Bug]    Script Date: 26/03/2021 22:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bug](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectId] [int] NULL,
	[userId] [int] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bug] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 26/03/2021 22:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/03/2021 22:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](20) NULL,
	[surName] [nchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bug] ON 

INSERT [dbo].[Bug] ([id], [projectId], [userId], [description]) VALUES (1, 1, 1, N'fix error')
INSERT [dbo].[Bug] ([id], [projectId], [userId], [description]) VALUES (2, 1, 2, N'Fix endpoint')
SET IDENTITY_INSERT [dbo].[Bug] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([id], [name], [description]) VALUES (1, N'GSI                 ', N'Full programer')
INSERT [dbo].[Project] ([id], [name], [description]) VALUES (2, N'DevOps              ', N'Develop advance')
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [surName]) VALUES (1, N'Pedro               ', N'Perez               ')
INSERT [dbo].[User] ([id], [name], [surName]) VALUES (2, N'Angel               ', N'Lopez               ')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_Bug_Project] FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([id])
GO
ALTER TABLE [dbo].[Bug] CHECK CONSTRAINT [FK_Bug_Project]
GO
ALTER TABLE [dbo].[Bug]  WITH CHECK ADD  CONSTRAINT [FK_Bug_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Bug] CHECK CONSTRAINT [FK_Bug_User]
GO
USE [master]
GO
ALTER DATABASE [BugsProject] SET  READ_WRITE 
GO
