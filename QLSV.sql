USE [master]
GO
CREATE DATABASE [QLSV]
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLSV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyID] [int] NOT NULL,
	[FacultyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[FacultyID] [int] NOT NULL,
	[MajorID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Major_1] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC,
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nchar](10) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[AverageScore] [float] NOT NULL,
	[FacultyID] [int] NULL,
	[MajorID] [int] NULL,
	[Avatar] [nvarchar](255) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (1, N'Công Nghệ Thông Tin')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (2, N'Quản Trị Kinh Doanh')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (3, N'Ngôn Ngữ Anh')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (4, N'Công Nghệ Ô Tô')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (5, N'Kế Toán')
INSERT [dbo].[Faculty] ([FacultyID], [FacultyName]) VALUES (6, N'Luật')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (1, 1, N'Công Nghệ Phần Mềm')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (1, 2, N'Hệ Thống Thông Tin')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (1, 3, N'An Toàn Thông Tin')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (1, 4, N'Trí Tuệ Nhân Tạo')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (2, 1, N'Tiếng Anh Thương Mại')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (2, 2, N'Tiếng Anh Truyền Thông')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (2, 3, N'Tiếng Anh Giao Tiếp')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (3, 1, N'Kinh Doanh Quốc Tế')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (3, 2, N'Quản Trị Nhân Sự')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (4, 1, N'Thiết Kế & Sản Xuất')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (4, 2, N'Lắp ráp & Sửa chữa')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (5, 1, N'Kế Toán Doanh Nghiệp')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (5, 2, N'Kế Toán Công')
INSERT [dbo].[Major] ([FacultyID], [MajorID], [Name]) VALUES (6, 1, N'Luật Nhà Nước')
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'1711082201', N'Trần Quyết Tâm', 7, 5, NULL, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'1811082201', N'Dương Quốc Chiến', 7.5, 1, 1, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'1911052277', N'Nguyễn Thị C', 5, 3, 1, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2011082201', N'Nguyễn Quang Huy', 7.8, 5, 2, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2111108222', N'Phan Huy Lưu', 6.8, 4, 1, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2168123862', N'Nguyễn Thị Tư', 8.3, 6, 1, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2168729837', N'Trần Thị Mỹ Dung', 2.5, 4, NULL, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2168761233', N'Nguyễn Thị Vân Anh', 9, 2, NULL, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2178736432', N'Trần Nhựt Tân', 10, 1, 1, NULL)
INSERT [dbo].[Student] ([StudentID], [FullName], [AverageScore], [FacultyID], [MajorID], [Avatar]) VALUES (N'2267364768', N'Lưu Quốc Minh', 4.5, 2, 3, NULL)
ALTER TABLE [dbo].[Major]  WITH CHECK ADD  CONSTRAINT [FK_Major_Faculty] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculty] ([FacultyID])
GO
ALTER TABLE [dbo].[Major] CHECK CONSTRAINT [FK_Major_Faculty]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Faculty] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculty] ([FacultyID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Faculty]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Major] FOREIGN KEY([FacultyID], [MajorID])
REFERENCES [dbo].[Major] ([FacultyID], [MajorID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Major]
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO