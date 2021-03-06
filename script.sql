USE [master]
GO
/****** Object:  Database [HMS]    Script Date: 03-07-2020 00:01:40 ******/
CREATE DATABASE [HMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [HMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HMS] SET  MULTI_USER 
GO
ALTER DATABASE [HMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HMS] SET QUERY_STORE = OFF
GO
USE [HMS]
GO
/****** Object:  Table [dbo].[DiagnosticDtl]    Script Date: 03-07-2020 00:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnosticDtl](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Diagnostic_Pid] [int] NULL,
	[Patient_Pid] [numeric](9, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiagnosticMast]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiagnosticMast](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Charge] [numeric](6, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineDtl]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineDtl](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Medicine_Pid] [int] NULL,
	[Patient_Pid] [numeric](9, 0) NULL,
	[Quantity] [numeric](5, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineMast]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineMast](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Quantity_Available] [numeric](5, 0) NULL,
	[Rate] [numeric](6, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMast]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMast](
	[Pid] [numeric](9, 0) IDENTITY(100000000,1) NOT NULL,
	[SSNID] [numeric](9, 0) NULL,
	[Name] [varchar](30) NULL,
	[Age] [numeric](3, 0) NULL,
	[Date_Of_Admission] [datetime] NULL,
	[Type_Of_Bed] [varchar](10) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](30) NULL,
	[Status] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup_Mast]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup_Mast](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[UserGroup_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMast]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMast](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[UG_Pid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStore]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStore](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiagnosticDtl] ON 

INSERT [dbo].[DiagnosticDtl] ([Pid], [Diagnostic_Pid], [Patient_Pid]) VALUES (1, 1, CAST(100000000 AS Numeric(9, 0)))
INSERT [dbo].[DiagnosticDtl] ([Pid], [Diagnostic_Pid], [Patient_Pid]) VALUES (2, 3, CAST(100000000 AS Numeric(9, 0)))
SET IDENTITY_INSERT [dbo].[DiagnosticDtl] OFF
SET IDENTITY_INSERT [dbo].[DiagnosticMast] ON 

INSERT [dbo].[DiagnosticMast] ([Pid], [Name], [Charge]) VALUES (1, N'COVID-19 Test', CAST(2400 AS Numeric(6, 0)))
INSERT [dbo].[DiagnosticMast] ([Pid], [Name], [Charge]) VALUES (2, N'CBC', CAST(500 AS Numeric(6, 0)))
INSERT [dbo].[DiagnosticMast] ([Pid], [Name], [Charge]) VALUES (3, N'X-Ray', CAST(1000 AS Numeric(6, 0)))
SET IDENTITY_INSERT [dbo].[DiagnosticMast] OFF
SET IDENTITY_INSERT [dbo].[MedicineDtl] ON 

INSERT [dbo].[MedicineDtl] ([Pid], [Medicine_Pid], [Patient_Pid], [Quantity]) VALUES (1, 1, CAST(100000000 AS Numeric(9, 0)), CAST(24 AS Numeric(5, 0)))
INSERT [dbo].[MedicineDtl] ([Pid], [Medicine_Pid], [Patient_Pid], [Quantity]) VALUES (2, 3, CAST(100000000 AS Numeric(9, 0)), CAST(13 AS Numeric(5, 0)))
INSERT [dbo].[MedicineDtl] ([Pid], [Medicine_Pid], [Patient_Pid], [Quantity]) VALUES (3, 3, CAST(100000000 AS Numeric(9, 0)), CAST(2 AS Numeric(5, 0)))
SET IDENTITY_INSERT [dbo].[MedicineDtl] OFF
SET IDENTITY_INSERT [dbo].[MedicineMast] ON 

INSERT [dbo].[MedicineMast] ([Pid], [Name], [Quantity_Available], [Rate]) VALUES (1, N'Paracetamol', CAST(100 AS Numeric(5, 0)), CAST(20 AS Numeric(6, 0)))
INSERT [dbo].[MedicineMast] ([Pid], [Name], [Quantity_Available], [Rate]) VALUES (2, N'Zincovit', CAST(50 AS Numeric(5, 0)), CAST(100 AS Numeric(6, 0)))
INSERT [dbo].[MedicineMast] ([Pid], [Name], [Quantity_Available], [Rate]) VALUES (3, N'Dolo 650', CAST(75 AS Numeric(5, 0)), CAST(60 AS Numeric(6, 0)))
SET IDENTITY_INSERT [dbo].[MedicineMast] OFF
SET IDENTITY_INSERT [dbo].[PatientMast] ON 

INSERT [dbo].[PatientMast] ([Pid], [SSNID], [Name], [Age], [Date_Of_Admission], [Type_Of_Bed], [Address], [City], [State], [Status]) VALUES (CAST(100000000 AS Numeric(9, 0)), CAST(145235689 AS Numeric(9, 0)), N'Kevin Mathew', CAST(22 AS Numeric(3, 0)), CAST(N'2020-06-28T00:00:00.000' AS DateTime), N'Single', N'Meera Bagh, Paschim Vihar', N'New Delhi', N'Delhi', N'A')
SET IDENTITY_INSERT [dbo].[PatientMast] OFF
SET IDENTITY_INSERT [dbo].[UserGroup_Mast] ON 

INSERT [dbo].[UserGroup_Mast] ([Pid], [UserGroup_Name]) VALUES (1, N'Admission Desk Executive')
INSERT [dbo].[UserGroup_Mast] ([Pid], [UserGroup_Name]) VALUES (2, N'Pharmacist')
INSERT [dbo].[UserGroup_Mast] ([Pid], [UserGroup_Name]) VALUES (3, N'Diagnostic Services Executive')
SET IDENTITY_INSERT [dbo].[UserGroup_Mast] OFF
SET IDENTITY_INSERT [dbo].[UserMast] ON 

INSERT [dbo].[UserMast] ([Pid], [Login], [Password], [UG_Pid]) VALUES (1, N'kevin_ade', N'1234', 1)
INSERT [dbo].[UserMast] ([Pid], [Login], [Password], [UG_Pid]) VALUES (2, N'kevin_ph', N'1234', 2)
INSERT [dbo].[UserMast] ([Pid], [Login], [Password], [UG_Pid]) VALUES (3, N'kevin_dse', N'1234', 3)
SET IDENTITY_INSERT [dbo].[UserMast] OFF
SET IDENTITY_INSERT [dbo].[UserStore] ON 

INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (1, N'kevin_ade', NULL, CAST(N'2020-06-28T01:00:35.827' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (2, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:02:00.480' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (3, N'kevin_ade', NULL, CAST(N'2020-06-28T01:02:17.397' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (4, N'kevin_ade', NULL, CAST(N'2020-06-28T01:04:01.803' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (5, N'kevin_ade', NULL, CAST(N'2020-06-28T01:05:04.357' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (6, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:06:21.733' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (7, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:07:37.080' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (8, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:08:26.530' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (9, N'kevin_ph', N'1234', CAST(N'2020-06-28T01:08:43.787' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (10, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:11:29.173' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (11, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:12:57.853' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (12, N'kevin_ph', N'1234', CAST(N'2020-06-28T01:13:12.703' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (13, N'kevin_dse', N'1234', CAST(N'2020-06-28T01:13:27.810' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (14, N'kevin_dse', N'55484', CAST(N'2020-06-28T01:13:35.807' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (15, N'kevin_dse', N'3265848', CAST(N'2020-06-28T01:13:51.673' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (16, N'kevin_dse', N'258', CAST(N'2020-06-28T01:14:35.593' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (17, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:14:41.880' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (18, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:14:58.220' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (19, N'kevin_ph', N'1234', CAST(N'2020-06-28T01:15:16.600' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (20, N'kevin_dse', N'1234', CAST(N'2020-06-28T01:15:29.150' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (21, N'kevin_dse', N'842626', CAST(N'2020-06-28T01:15:37.387' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (22, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:35:53.610' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (23, N'kevin_ade', N'1234', CAST(N'2020-06-28T01:37:44.177' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (24, N'kevin_ade', N'147852', CAST(N'2020-06-28T01:37:55.780' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (25, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:26:18.313' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (26, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:30:24.330' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (27, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:31:15.207' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (28, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:32:16.003' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (29, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:32:20.690' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (30, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:32:27.617' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (31, N'kevin_ade', N'123', CAST(N'2020-06-28T02:37:13.503' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (32, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:37:19.780' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (33, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:40:39.920' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (34, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:55:24.507' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (35, N'kevin_ph', N'1234', CAST(N'2020-06-28T02:55:34.270' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (36, N'kevin_dse', N'1234', CAST(N'2020-06-28T02:55:47.783' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (37, N'kevin_ade', N'1234', CAST(N'2020-06-28T02:55:58.767' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (38, N'kevin_ade', N'1234', CAST(N'2020-06-28T03:09:10.533' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (39, N'kevin_ph', N'1234', CAST(N'2020-06-28T03:09:25.273' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (40, N'kevin_dse', N'1234', CAST(N'2020-06-28T03:09:33.877' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (41, N'kevin_ade', N'12345', CAST(N'2020-06-28T03:09:44.237' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (42, N'kevin_ade', N'1234', CAST(N'2020-06-28T21:16:02.703' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (43, N'kevin_ade', N'1234', CAST(N'2020-06-28T21:19:51.447' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (44, N'kevin_ade', N'1234', CAST(N'2020-06-28T22:26:02.280' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (45, N'kevin_ade', N'1234', CAST(N'2020-06-28T22:26:32.130' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (46, N'kevin_ade', N'1234', CAST(N'2020-06-28T23:38:06.240' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (47, N'kevin_ph', N'1234', CAST(N'2020-06-28T23:38:48.780' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (48, N'kevin_dse', N'1234', CAST(N'2020-06-28T23:39:01.190' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (49, N'kevin_ade', N'1234', CAST(N'2020-06-29T00:01:21.337' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (50, N'kevin_ph', N'1234', CAST(N'2020-06-29T01:00:10.693' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (51, N'kevin_ade', N'1234', CAST(N'2020-06-29T01:27:11.877' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (52, N'kevin_ade', N'1234', CAST(N'2020-06-29T02:21:19.990' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (53, N'kevin_ade', N'1234', CAST(N'2020-06-29T02:48:10.037' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (54, N'kevin_ade', N'1234', CAST(N'2020-06-29T02:56:20.667' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (55, N'kevin_ade', N'1234', CAST(N'2020-06-29T02:57:14.347' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (56, N'kevin_ade', N'1234', CAST(N'2020-06-29T02:58:43.887' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (57, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:01:11.250' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (58, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:03:42.190' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (59, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:04:18.700' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (60, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:20:57.747' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (61, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:27:14.063' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (62, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:30:26.480' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (63, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:31:26.030' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (64, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:35:39.680' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (65, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:37:31.030' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (66, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:40:00.557' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (67, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:41:50.703' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (68, N'kevin_ade', N'1234', CAST(N'2020-06-29T03:44:44.980' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (69, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:02:47.820' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (70, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:06:39.663' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (71, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:08:21.620' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (72, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:10:27.087' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (73, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:11:09.730' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (74, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:14:42.677' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (75, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:15:44.270' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (76, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:18:09.037' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (77, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:21:22.820' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (78, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:23:47.790' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (79, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:27:41.977' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (80, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:34:10.893' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (81, N'kevin_ade', N'1234', CAST(N'2020-06-29T10:37:13.223' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (82, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:03:59.313' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (83, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:34:16.837' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (84, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:36:03.387' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (85, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:38:30.110' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (86, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:39:27.137' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (87, N'kevin_ade', N'1234', CAST(N'2020-06-29T11:40:37.200' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (88, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:00:38.660' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (89, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:04:05.797' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (90, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:06:11.507' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (91, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:06:54.580' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (92, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:07:34.533' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (93, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:09:02.740' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (94, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:11:35.597' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (95, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:14:11.503' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (96, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:22:09.977' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (97, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:34:52.553' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (98, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:36:13.543' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (99, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:37:25.847' AS DateTime))
GO
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (100, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:38:15.053' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (101, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:41:48.777' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (102, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:44:12.393' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (103, N'kevin_ade', N'1234', CAST(N'2020-06-29T14:44:56.103' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (104, N'kevin_ade', N'1234', CAST(N'2020-06-29T16:51:28.980' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (105, N'kevin_ade', N'1234', CAST(N'2020-06-29T17:37:42.330' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (106, N'kevin_ade', N'1234', CAST(N'2020-06-29T19:15:10.067' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (107, N'kevin_ade', N'1234', CAST(N'2020-06-29T19:42:24.173' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (108, N'kevin_ade', N'1234', CAST(N'2020-06-29T19:44:44.867' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (109, N'kevin_ade', N'1234', CAST(N'2020-06-29T19:49:41.140' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (110, N'kevin_ade', N'1234', CAST(N'2020-06-29T19:51:00.640' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (111, N'kevin_ade', N'1234', CAST(N'2020-06-29T23:22:55.950' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (112, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:00:59.407' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (113, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:26:38.747' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (114, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:27:48.800' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (115, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:41:30.090' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (116, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:46:00.150' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (117, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:47:15.113' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (118, N'kevin_ade', N'1234', CAST(N'2020-06-30T00:48:08.023' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (119, N'kevin_ade', N'1234', CAST(N'2020-06-30T01:37:50.370' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (120, N'kevin_ade', N'1234', CAST(N'2020-06-30T01:40:07.640' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (121, N'kevin_ade', N'1234', CAST(N'2020-06-30T02:03:36.253' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (122, N'kevin_ade', N'1234', CAST(N'2020-06-30T11:35:54.627' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (123, N'kevin_ade', N'1234', CAST(N'2020-06-30T11:49:16.970' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (124, N'kevin_ade', N'1234', CAST(N'2020-06-30T12:26:24.940' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (125, N'kevin_ade', N'1234', CAST(N'2020-06-30T13:32:50.203' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (126, N'kevin_ph', N'1234', CAST(N'2020-06-30T13:33:32.730' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (127, N'kevin_ade', N'1234', CAST(N'2020-06-30T13:56:51.637' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (128, N'kevin_ade', N'1234', CAST(N'2020-06-30T13:58:03.090' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (129, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:26:44.503' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (130, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:32:18.410' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (131, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:44:44.103' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (132, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:46:03.777' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (133, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:49:47.663' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (134, N'kevin_ade', N'1234', CAST(N'2020-06-30T14:53:59.570' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (135, N'kevin_ade', N'1234', CAST(N'2020-06-30T16:45:14.560' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (136, N'kevin_ade', N'1234', CAST(N'2020-06-30T17:16:53.307' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (137, N'kevin_ade', N'1234', CAST(N'2020-06-30T21:02:15.117' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (138, N'kevin_ade', N'1234', CAST(N'2020-06-30T21:46:53.803' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (139, N'kevin_ade', N'1234', CAST(N'2020-06-30T21:51:29.100' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (140, N'kevin_ade', N'1234', CAST(N'2020-06-30T21:54:14.340' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (141, N'kevin_ade', N'1234', CAST(N'2020-06-30T21:56:15.513' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (142, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:01:18.083' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (143, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:03:00.467' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (144, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:03:32.343' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (145, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:22:18.347' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (146, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:23:29.473' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (147, N'kevin_ade', N'1234', CAST(N'2020-06-30T22:44:05.370' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (148, N'kevin_ph', N'1234', CAST(N'2020-06-30T22:45:47.580' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (149, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:39:20.767' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (150, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:50:09.783' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (151, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:53:01.240' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (152, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:54:22.207' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (153, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:55:40.920' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (154, N'kevin_ph', N'1234', CAST(N'2020-06-30T23:56:34.620' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (155, N'kevin_ph', N'1234', CAST(N'2020-07-01T00:23:29.730' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (156, N'kevin_ph', N'1234', CAST(N'2020-07-01T00:25:28.207' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (157, N'kevin_ph', N'1234', CAST(N'2020-07-01T01:36:57.223' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (158, N'kevin_ph', N'1234', CAST(N'2020-07-01T01:40:30.937' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (159, N'kevin_ade', N'1234', CAST(N'2020-07-01T01:43:28.080' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (160, N'kevin_ph', N'1234', CAST(N'2020-07-01T01:43:36.743' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (161, N'kevin_ph', N'1234', CAST(N'2020-07-01T01:48:28.627' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (162, N'kevin_ph', N'1234', CAST(N'2020-07-01T02:03:48.560' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (163, N'kevin_ph', N'1234', CAST(N'2020-07-01T02:12:23.993' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (164, N'kevin_ph', N'1234', CAST(N'2020-07-01T03:14:50.913' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (165, N'kevin_ph', N'1234', CAST(N'2020-07-01T03:18:13.140' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (166, N'kevin_ade', N'1234', CAST(N'2020-07-01T03:36:46.080' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (167, N'kevin_ph', N'1234', CAST(N'2020-07-01T03:37:26.093' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (168, N'kevin_ph', N'1234', CAST(N'2020-07-01T03:44:22.810' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (169, N'kevin_ade', N'1234', CAST(N'2020-07-01T18:01:39.657' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (170, N'kevin_ph', N'1234', CAST(N'2020-07-01T18:02:01.120' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (171, N'kevin_ph', N'1234', CAST(N'2020-07-01T18:42:32.810' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (172, N'kevin_ph', N'1234', CAST(N'2020-07-01T22:48:29.010' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (173, N'kevin_ph', N'1234', CAST(N'2020-07-02T00:27:24.177' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (174, N'kevin_dse', N'1234', CAST(N'2020-07-02T02:51:36.447' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (175, N'kevin_dse', N'1234', CAST(N'2020-07-02T14:05:58.673' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (176, N'kevin_ade', N'1234', CAST(N'2020-07-02T16:14:46.083' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (177, N'kevin_dse', N'1234', CAST(N'2020-07-02T16:34:54.967' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (178, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:01:29.703' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (179, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:05:02.417' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (180, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:37:57.453' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (181, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:39:38.220' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (182, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:54:08.857' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (183, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:57:21.237' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (184, N'kevin_dse', N'1234', CAST(N'2020-07-02T17:59:57.403' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (185, N'kevin_ade', N'1234', CAST(N'2020-07-02T18:02:08.130' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (186, N'kevin_ade', N'1234', CAST(N'2020-07-02T18:29:06.363' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (187, N'kevin_ade', N'1234', CAST(N'2020-07-02T19:46:10.330' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (188, N'kevin_ade', N'', CAST(N'2020-07-02T20:45:01.037' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (189, N'kevin_ade', N'1234', CAST(N'2020-07-02T20:45:11.657' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (190, N'kevin_ade', N'1234', CAST(N'2020-07-02T21:09:58.917' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (191, N'kevin_ph', N'1234', CAST(N'2020-07-02T21:14:22.680' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (192, N'kevin_dse', N'1234', CAST(N'2020-07-02T21:14:58.350' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (193, N'kevin_ph', N'1234', CAST(N'2020-07-02T21:15:07.603' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (194, N'kevin_dse', N'1234', CAST(N'2020-07-02T21:15:14.437' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (195, N'kevin_ph', N'1234', CAST(N'2020-07-02T21:15:36.137' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (196, N'kevin_dse', N'1234', CAST(N'2020-07-02T21:16:35.177' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (197, N'kevin_ade', N'1234', CAST(N'2020-07-02T21:16:43.877' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (198, N'kevin_ade', N'1234', CAST(N'2020-07-02T21:20:44.840' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (199, N'kevin_ade', N'1234', CAST(N'2020-07-02T22:41:06.610' AS DateTime))
GO
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (200, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:13:42.567' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (201, N'kevin_ph', N'1234', CAST(N'2020-07-02T23:14:40.750' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (202, N'kevin_dse', N'1234', CAST(N'2020-07-02T23:16:19.030' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (203, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:18:29.733' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (204, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:26:55.500' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (205, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:28:33.613' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (206, N'kevin_ph', N'1234', CAST(N'2020-07-02T23:29:49.117' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (207, N'kevin_dse', N'1234', CAST(N'2020-07-02T23:30:37.803' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (208, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:31:16.927' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (209, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:40:14.130' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (210, N'kevin_ph', N'1234', CAST(N'2020-07-02T23:41:03.700' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (211, N'kevin_dse', N'1234', CAST(N'2020-07-02T23:41:39.013' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (212, N'kevin_dse', N'1234', CAST(N'2020-07-02T23:47:14.763' AS DateTime))
INSERT [dbo].[UserStore] ([Pid], [Login], [Password], [Timestamp]) VALUES (213, N'kevin_ade', N'1234', CAST(N'2020-07-02T23:52:07.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserStore] OFF
/****** Object:  StoredProcedure [dbo].[DiagnosisMastProc]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiagnosisMastProc]
@action varchar(20) ='',
@Pid numeric =0,
@Diagnosis_Pid int=0
AS
BEGIN
  IF @action='SEARCHDIAG'
  BEGIN
  	Select
    	d.Name,
        d.Charge
    from DiagnosticDtl dd
    inner join DiagnosticMast d on d.Pid = dd.Diagnostic_Pid
    inner join PatientMast p on p.Pid = dd.Patient_Pid
    WHERE dd.Patient_Pid = @Pid
  END
  
  ELSE IF @action='BIND'
  BEGIN
  	select
      d.Pid,
      d.Name,
      d.Charge
    from DiagnosticMast d
    where d.Pid NOT IN (
      Select
      dd.Diagnostic_Pid
      from DiagnosticDtl dd
      where Patient_Pid = @Pid )
  END
  
  ELSE IF @action='ADD'
  BEGIN
  	INSERT INTO DiagnosticDtl
    (
    	Diagnostic_Pid,
        Patient_Pid
    )
    SELECT
    	@Diagnosis_Pid,
        @Pid
  END
  
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPatientProc]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPatientProc]
@ssnid numeric =0,
@Name varchar(30) ='',
@Age numeric =0,
@Date_Of_Add datetime = NULL,
@Bed_Type varchar(10) = '',
@Address varchar(50) ='',
@City varchar(30) ='',
@State varchar(30) ='',
@Status varchar(1)=''
AS
BEGIN
  
  	Insert into PatientMast
    (
    	SSNID,
        Name,
        Age,
        Date_Of_Admission,
        Type_Of_Bed,
        Address,
        City,
        State,
        Status
    )
    SELECT
    	@ssnid ,
        @Name ,
        @Age,
        @Date_Of_Add,
        @Bed_Type,
        @Address ,
        @City ,
        @State,
        'A'
        
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[LoginProc]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginProc]
--@action varchar(10) ='',
@Login varchar(30)='',
@Password varchar(30)=''
AS
BEGIN

	IF NOT EXISTS(SELECT Pid from UserMast u where u.Login = @Login AND u.Password = @Password)
            select 'Either Username or Password is invalid..!!' [result]
            
    ELSE 
    	 select 
                'success' [result], u.Pid, u.Login, u.Password, u.UG_Pid
            from UserMast u
            where  u.Login = @Login 
                  
        
          INSERT INTO UserStore
          (
              Login,
              Password,
              Timestamp
          )
          VALUES
          (
              @Login,
              @Password,
              GETDATE()
          )
  	
END
GO
/****** Object:  StoredProcedure [dbo].[MedicineMastProc]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MedicineMastProc]
@action varchar(20) ='',
@Pid numeric =0,
@Medicine_Pid int=0,
@Quantity numeric =0
AS
BEGIN
	IF @action='SEARCHMEDS'
  	BEGIN
      SELECT
          m.Name [Medicine_Name],
          SUM(md.Quantity)[Quantity],
          m.Rate,
          Convert(numeric(11,2),SUM(md.Quantity * m.Rate))[Amount]
          from MedicineDtl md
          inner join MedicineMast m on m.Pid = md.Medicine_Pid
          WHERE md.Patient_Pid = @Pid
          GROUP BY md.Medicine_Pid, md.Patient_Pid , m.Name, m.Rate
    END
    
    ELSE IF @action='VIEW'
    BEGIN
    	Select
          	m.Name,
            m.Quantity_Available,
            m.Rate
          from MedicineMast m
    END
    
    ELSE IF @action='ADDITEM'
    BEGIN
    	INSERT INTO MedicineDtl
        (
        	Medicine_Pid,
            Patient_Pid,
            Quantity
        )
        SELECT
        	@Medicine_Pid,
            @Pid,
            @Quantity
    END
    
END
GO
/****** Object:  StoredProcedure [dbo].[PatientMastProc]    Script Date: 03-07-2020 00:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PatientMastProc]
@action varchar(10) ='',
@Pid numeric =0,
@ssnid numeric =0,
@Name varchar(30) ='',
@Age numeric =0,
@Date_Of_Add datetime = NULL,
@Bed_Type varchar(10) = '',
@Address varchar(50) ='',
@City varchar(30) ='',
@State varchar(30) ='',
@Status varchar(1)=''

AS
BEGIN
  IF @action='ADD'
  BEGIN
  	Insert into PatientMast
    (
    	SSNID,
        Name,
        Age,
        Date_Of_Admission,
        Type_Of_Bed,
        Address,
        City,
        State,
        Status
    )
    SELECT
    	@ssnid ,
        @Name ,
        @Age,
        @Date_Of_Add,
        @Bed_Type,
        @Address ,
        @City ,
        @State,
        @Status
   
   END
       
   ELSE IF @action='UPDATE'
   BEGIN
   		Update PatientMast SET
        	SSNID				=	@ssnid,
            Name				=	@Name,
            Age					=	@Age,
            Date_Of_Admission	=	CONVERT(DATETIME, @Date_Of_Add, 112), 
            Type_Of_Bed			=	@Bed_Type,
            Address				=	@Address,
            City				=	@City,
            State				=	@State
            --Status				=	@Status
         FROM PatientMast p
         WHERE p.Pid = @Pid   
            
   END
   
   ELSE IF @action='SEARCH'
   BEGIN
   		Select
        	FORMAT(Pid,'')[Pid],
        	FORMAT(SSNID,'')[SSNID],
            Name,
            Age,
            FORMAT(Date_Of_Admission,'dd/MM/yyyy') [Date_Of_Admission],
            Type_Of_Bed,
            Address,
            City,
            State,
            Status
        From PatientMast 
        WHERE Pid = @Pid   
   END
   
   ELSE IF @action='VIEW'
   BEGIN
   		Select
        	FORMAT(Pid,'')[Pid],
        	FORMAT(SSNID,'')[SSNID],
            Name,
            Age,
            FORMAT(Date_Of_Admission,'dd/MM/yyyy') [Date_Of_Admission],
            Type_Of_Bed,
            Address,
            City,
            State,
            Status
        From PatientMast 
   END
  
  ELSE IF @action='DELETE'
  BEGIN
  	DELETE from PatientMast
    WHERE Pid = @Pid
  END
  
  ELSE IF @action='LASTPID'
  BEGIN
  	SELECT
        FORMAT(MAX(Pid),'')[Pid]
    FROM PatientMast
  END
  
  ELSE IF @action='GENBILL'
  BEGIN
  	UPDATE PatientMast SET
    	Status	=	'D'
    FROM PatientMast p
    WHERE p.Pid = @Pid     
  END
       
  
END
GO
USE [master]
GO
ALTER DATABASE [HMS] SET  READ_WRITE 
GO
