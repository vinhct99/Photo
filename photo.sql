USE [master]
GO
/****** Object:  Database [Photographer_Lab]    Script Date: 11/11/2022 22:32:25 ******/
CREATE DATABASE [Photographer_Lab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Photographer_Lab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photographer_Lab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Photographer_Lab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photographer_Lab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Photographer_Lab] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Photographer_Lab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Photographer_Lab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Photographer_Lab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Photographer_Lab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Photographer_Lab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Photographer_Lab] SET ARITHABORT OFF 
GO
ALTER DATABASE [Photographer_Lab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Photographer_Lab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Photographer_Lab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Photographer_Lab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Photographer_Lab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Photographer_Lab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Photographer_Lab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Photographer_Lab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Photographer_Lab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Photographer_Lab] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Photographer_Lab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Photographer_Lab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Photographer_Lab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Photographer_Lab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Photographer_Lab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Photographer_Lab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Photographer_Lab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Photographer_Lab] SET RECOVERY FULL 
GO
ALTER DATABASE [Photographer_Lab] SET  MULTI_USER 
GO
ALTER DATABASE [Photographer_Lab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Photographer_Lab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Photographer_Lab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Photographer_Lab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Photographer_Lab] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Photographer_Lab] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Photographer_Lab', N'ON'
GO
ALTER DATABASE [Photographer_Lab] SET QUERY_STORE = OFF
GO
USE [Photographer_Lab]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 11/11/2022 22:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[telephone] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[face_url] [nvarchar](max) NULL,
	[twitter_url] [nvarchar](max) NULL,
	[google_url] [nvarchar](max) NULL,
	[about] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[map_url] [nvarchar](max) NULL,
	[image_main] [nvarchar](max) NULL,
	[icon_face] [nvarchar](max) NULL,
	[icon_twitter] [nvarchar](max) NULL,
	[icon_google] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[galery]    Script Date: 11/11/2022 22:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galery](
	[ID] [int] NOT NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 11/11/2022 22:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] NOT NULL,
	[galery_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viewnumber]    Script Date: 11/11/2022 22:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viewnumber](
	[id] [int] NOT NULL,
	[totalViews] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[contact] ([telephone], [email], [face_url], [twitter_url], [google_url], [about], [address], [city], [country], [map_url], [image_main], [icon_face], [icon_twitter], [icon_google]) VALUES (N'0813682867', N'vinhcao@gmail.com', N'https://www.facebook.com/', N'https://twitter.com/?lang=vi', N'https://www.google.com/', N'About me
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim', N'Thach Hoa, Thach That', N'Ha Noi', N'Viet Nam', N'https://maps.google.com/maps?width=100%&amp;height=600&amp;hl=en&amp;q=9%20Ng%C3%B5%20116%20Ph%E1%BB%91%20Mi%E1%BA%BFu%20%C4%90%E1%BA%A7m%2C%20T%E1%BB%AB%20Li%C3%AAm%2C%20H%C3%A0%20N%E1%BB%99i+()&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=B&amp;output=embed', N'homeImage.jpg', N'face.png', N'twitter.png', N'google.png')
GO
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (1, N'View Gallery 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Galery 1')
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (2, N'View Gallery 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation2', N'Galery 2')
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (3, N'View Gallery 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation3', N'Galery 3')
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (4, N'View Gallery 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation4', N'Galery 4')
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (5, N'View Gallery 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation5', N'Galery 5')
INSERT [dbo].[galery] ([ID], [title], [description], [name]) VALUES (6, N'View Gallery 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation6', N'Galery 6')
GO
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (1, 1, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (2, 1, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (3, 1, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (4, 1, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (5, 1, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (6, 1, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (7, 1, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (8, 1, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (9, 1, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (10, 1, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (11, 2, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (12, 2, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (13, 2, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (14, 2, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (15, 2, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (16, 2, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (17, 2, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (18, 2, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (19, 2, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (20, 2, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (21, 3, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (22, 3, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (23, 3, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (24, 3, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (25, 3, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (26, 3, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (27, 3, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (28, 3, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (29, 3, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (30, 3, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (31, 4, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (32, 4, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (33, 4, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (34, 4, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (35, 4, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (36, 4, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (37, 4, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (38, 4, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (39, 4, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (40, 4, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (41, 5, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (42, 5, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (43, 5, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (44, 5, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (45, 5, N'img5.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (46, 5, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (47, 5, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (48, 5, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (49, 5, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (50, 5, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (51, 6, N'img8.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (52, 6, N'img7.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (53, 6, N'img6.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (54, 6, N'img5jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (55, 6, N'img4.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (56, 6, N'img3.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (57, 6, N'img2.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (58, 6, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (59, 6, N'img1.jpg')
INSERT [dbo].[images] ([id], [galery_id], [image_url]) VALUES (60, 6, N'img1.jpg')
GO
INSERT [dbo].[viewnumber] ([id], [totalViews]) VALUES (1, 137)
GO
USE [master]
GO
ALTER DATABASE [Photographer_Lab] SET  READ_WRITE 
GO
