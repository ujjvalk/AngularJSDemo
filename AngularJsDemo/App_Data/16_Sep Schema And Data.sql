USE [master]
GO
/****** Object:  Database [TestDemo]    Script Date: 16-09-2016 12:33:30 ******/
CREATE DATABASE [TestDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TestDemo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TestDemo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestDemo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDemo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TestDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDemo] SET  MULTI_USER 
GO
ALTER DATABASE [TestDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDemo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TestDemo]
GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 16-09-2016 12:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDesignation](
	[DesignationId] [bigint] IDENTITY(1,1) NOT NULL,
	[DesName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDesignation] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 16-09-2016 12:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[EmpAddress] [nvarchar](max) NULL,
	[EmpGender] [varchar](10) NULL,
	[EmpHobby] [nvarchar](50) NULL,
	[EmpDesignation] [bigint] NULL,
	[IsDelete] [bit] NULL,
	[IsActive] [bit] NULL,
	[DeletedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[EmpEmail] [nvarchar](100) NULL,
	[EmpImage] [nvarchar](200) NULL,
	[Birthdate] [datetime] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHobby]    Script Date: 16-09-2016 12:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHobby](
	[HobbyId] [bigint] IDENTITY(1,1) NOT NULL,
	[HName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblHobby] PRIMARY KEY CLUSTERED 
(
	[HobbyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 16-09-2016 12:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSlider]    Script Date: 16-09-2016 12:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlider](
	[SliderId] [int] IDENTITY(1,1) NOT NULL,
	[SImage] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_tblSlider] PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblDesignation] ON 

INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (1, N'SR')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (2, N'JR')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (3, N'MANAGER')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (4, N'HR')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (5, N'CEO')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (6, N'ACCOUNTANT')
INSERT [dbo].[tblDesignation] ([DesignationId], [DesName]) VALUES (7, N'TEAMLEADER')
SET IDENTITY_INSERT [dbo].[tblDesignation] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (1, N'ujval', N'ahmedabad', N'Male', N'1,5,7', 5, 0, 1, NULL, CAST(0x0000A6640128E5D0 AS DateTime), CAST(0x0000A6640128E70C AS DateTime), N'ujjvalk@gmail.com', N'/Upload/636073105202394698.jpg', CAST(0x0000827700000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (2, N'tqwwqe', N'sdaasd', N'Female', N'1,2,3', 4, 0, 1, NULL, CAST(0x0000A6640133C91E AS DateTime), CAST(0x0000A6640133C91E AS DateTime), N'tqwwqe@tqwwqe.in', N'/Upload/636073105726759964.jpg', CAST(0x00006EC500000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (3, N'ronak', N'Gota', N'Male', N'1,2,3', 6, 0, 1, NULL, CAST(0x0000A66401357305 AS DateTime), CAST(0x0000A66401357305 AS DateTime), N'Ronak@test.co', N'/Upload/636073105012436828.jpg', CAST(0x000084D000000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (4, N'dhruv', N'Gandhinagar', N'Male', N'1,5,6', 3, 0, 1, NULL, CAST(0x0000A66500AAB739 AS DateTime), CAST(0x0000A66500AAB739 AS DateTime), N'Dhruv@gmail.com', N'/Upload/636073104330105039.jpg', CAST(0x00005BAA00000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (5, N'rinkesh', N'ankleshwar', N'Male', N'4,5,6', 7, 0, 1, NULL, CAST(0x0000A66501114190 AS DateTime), CAST(0x0000A665011141C3 AS DateTime), N'Rinkesh@gmail.com', N'/Upload/636073104688192104.jpg', CAST(0x0000A58100000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (6, N'asdas', NULL, N'Male', N'1', 1, 1, 0, CAST(0x0000A6680118D517 AS DateTime), CAST(0x0000A66800B67FC0 AS DateTime), CAST(0x0000A66800B67FC0 AS DateTime), N'asd@asd.in', N'/Upload/636073093184599755.jpg', CAST(0x0000808100000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (8, N'Test', N'asdd11111', N'Male', N'1,7', 1, 0, 1, NULL, CAST(0x0000A66801172ADD AS DateTime), CAST(0x0000A66801172ADD AS DateTime), N'asd@asd.in', N'/Upload/636073105513896307.png', CAST(0x0000808100000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (9, N'sdsasasdas', N'asdsad', N'Male', N'1,2', 3, 1, 0, CAST(0x0000A66B0108BD95 AS DateTime), CAST(0x0000A66B0108B6EF AS DateTime), CAST(0x0000A66B0108B6EF AS DateTime), N'asd@asd.in', N'/Upload/636075650262043102.jpg', CAST(0x0000808100000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (10, N'fsff', N'sasssad', N'Female', N'1,6', 3, 1, 0, CAST(0x0000A68300C68934 AS DateTime), CAST(0x0000A68200EEF20A AS DateTime), CAST(0x0000A68200EEF20E AS DateTime), N'asd@asd.in', N'/Upload/636073105513896307.png', CAST(0x0000808100000000 AS DateTime))
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (11, N'angTest', N'angular Test1', N'Female', N'1,4,6', 4, 0, 1, NULL, CAST(0x0000A68300AF2161 AS DateTime), CAST(0x0000A68300AF2161 AS DateTime), N'asdsd@asd.in', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (12, N'ang test', N'ang test', N'Male', N'1', 3, 0, 1, NULL, CAST(0x0000A68300BAEAFB AS DateTime), CAST(0x0000A68300BAEAFB AS DateTime), N'angtest@test.com', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmpId], [EmpName], [EmpAddress], [EmpGender], [EmpHobby], [EmpDesignation], [IsDelete], [IsActive], [DeletedDate], [CreatedDate], [ModifiedDate], [EmpEmail], [EmpImage], [Birthdate]) VALUES (13, N'Angular JS1', N'Angular JS1', N'Female', N'7', 7, 1, 0, CAST(0x0000A68300C97FC7 AS DateTime), CAST(0x0000A68300C957C7 AS DateTime), CAST(0x0000A68300C957C7 AS DateTime), N'asd1@asd.in', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblHobby] ON 

INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (1, N'Music')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (2, N'Cricket')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (3, N'Football')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (4, N'Reading')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (5, N'Coding')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (6, N'Teaching')
INSERT [dbo].[tblHobby] ([HobbyId], [HName]) VALUES (7, N'Gaming')
SET IDENTITY_INSERT [dbo].[tblHobby] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Name], [Description]) VALUES (4, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblSlider] ON 

INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (18, N'/Upload/Slider/636078082698131422.png', 1, 0)
INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (19, N'/Upload/Slider/636078082887451178.png', 1, 0)
INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (20, N'/Upload/Slider/636078084566314935.png', 1, 0)
INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (21, N'/Upload/Slider/636078084566375017.png', 1, 0)
INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (22, N'/Upload/Slider/636078085024014299.png', 1, 0)
INSERT [dbo].[tblSlider] ([SliderId], [SImage], [IsActive], [IsDelete]) VALUES (23, N'/Upload/Slider/636078085024074330.png', 1, 0)
SET IDENTITY_INSERT [dbo].[tblSlider] OFF
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblEmployee] ADD  CONSTRAINT [DF_tblEmployee_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
USE [master]
GO
ALTER DATABASE [TestDemo] SET  READ_WRITE 
GO
