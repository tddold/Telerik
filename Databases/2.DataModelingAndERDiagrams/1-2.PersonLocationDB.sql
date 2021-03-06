USE [master]
GO
/****** Object:  Database [PersonLocationDB]    Script Date: 24.8.2014 г. 15:31:19 ******/
CREATE DATABASE [PersonLocationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PersonLocationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonLocationDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PersonLocationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PersonLocationDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PersonLocationDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PersonLocationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PersonLocationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PersonLocationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PersonLocationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PersonLocationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PersonLocationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PersonLocationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PersonLocationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PersonLocationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PersonLocationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PersonLocationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PersonLocationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PersonLocationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PersonLocationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PersonLocationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PersonLocationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PersonLocationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PersonLocationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PersonLocationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PersonLocationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PersonLocationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PersonLocationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PersonLocationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PersonLocationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PersonLocationDB] SET  MULTI_USER 
GO
ALTER DATABASE [PersonLocationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PersonLocationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PersonLocationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PersonLocationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PersonLocationDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PersonLocationDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 24.8.2014 г. 15:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 24.8.2014 г. 15:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 24.8.2014 г. 15:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 24.8.2014 г. 15:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[addres_id] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 24.8.2014 г. 15:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [name], [town_id]) VALUES (1, N'st. Petko Slaveikov', 1)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([id], [name]) VALUES (2, N'Asia')
INSERT [dbo].[Continent] ([id], [name]) VALUES (3, N'Australia')
INSERT [dbo].[Continent] ([id], [name]) VALUES (4, N'South America')
INSERT [dbo].[Continent] ([id], [name]) VALUES (5, N'North America')
INSERT [dbo].[Continent] ([id], [name]) VALUES (6, N'Africa')
INSERT [dbo].[Continent] ([id], [name]) VALUES (7, N'Antarctica')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (4, N'Italy', 1)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (5, N'Brazil', 6)
INSERT [dbo].[Country] ([id], [name], [continent_id]) VALUES (6, N'Japan', 2)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [first_name], [last_name], [addres_id]) VALUES (1, N'Pesho', N'Peshkata', 1)
INSERT [dbo].[Person] ([id], [first_name], [last_name], [addres_id]) VALUES (2, N'Bashtata', N'Na Pesho Peshkata', 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (3, N'Rome', 4)
INSERT [dbo].[Town] ([id], [name], [country_id]) VALUES (4, N'Brazil', 5)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Town] FOREIGN KEY([town_id])
REFERENCES [dbo].[Town] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent] FOREIGN KEY([continent_id])
REFERENCES [dbo].[Continent] ([id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([addres_id])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]
GO
USE [master]
GO
ALTER DATABASE [PersonLocationDB] SET  READ_WRITE 
GO
