USE [master]
GO
/****** Object:  Database [HocThem]    Script Date: 11/8/2023 2:03:33 PM ******/
CREATE DATABASE [HocThem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HocThem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HocThem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HocThem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HocThem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HocThem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HocThem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HocThem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HocThem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HocThem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HocThem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HocThem] SET ARITHABORT OFF 
GO
ALTER DATABASE [HocThem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HocThem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HocThem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HocThem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HocThem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HocThem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HocThem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HocThem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HocThem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HocThem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HocThem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HocThem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HocThem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HocThem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HocThem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HocThem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HocThem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HocThem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HocThem] SET  MULTI_USER 
GO
ALTER DATABASE [HocThem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HocThem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HocThem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HocThem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HocThem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HocThem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HocThem] SET QUERY_STORE = ON
GO
ALTER DATABASE [HocThem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HocThem]
GO
/****** Object:  Table [dbo].[Acc]    Script Date: 11/8/2023 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Acc](
	[Username] [varchar](10) NULL,
	[Password] [varchar](30) NULL,
	[Role] [int] NULL,
	[AccID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Acc] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 11/8/2023 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[IDclass] [nchar](10) NOT NULL,
	[Nameclass] [nchar](10) NULL,
	[Subject] [nchar](10) NULL,
	[TimeStart] [varchar](15) NULL,
	[TimeEnd] [varchar](15) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[IDclass] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manage]    Script Date: 11/8/2023 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manage](
	[idclass] [nchar](10) NOT NULL,
	[idacc] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idclass] ASC,
	[idacc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mess]    Script Date: 11/8/2023 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mess](
	[idmes] [int] IDENTITY(1,1) NOT NULL,
	[idre] [nchar](10) NULL,
	[Noidung] [nvarchar](max) NULL,
	[idse] [nchar](10) NULL,
 CONSTRAINT [PK_Mess] PRIMARY KEY CLUSTERED 
(
	[idmes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/8/2023 2:03:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Firstname] [nvarchar](max) NULL,
	[Lastname] [nvarchar](max) NULL,
	[Fullname] [nvarchar](max) NULL,
	[Accid] [nchar](10) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [varchar](10) NULL,
	[Birthdate] [date] NULL,
	[Idstudent] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Idstudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'0', N'1', 1, N'0         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'1111', N'1111', 1, N'1111      ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'122', N'122', 0, N'122       ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'1222', N'12222', 0, N'1222      ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user14', N'user14', 0, N'14        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user16', N'user16', 0, N'16        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user17', N'user17', 0, N'17        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user18', N'user18', 0, N'18        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user19', N'user19', 0, N'19        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'2', N'2', 0, N'2         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user20', N'user20', 0, N'20        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'200', N'200', 0, N'200       ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'201', N'2001', 0, N'201       ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user21', N'user21', 0, N'21        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user22', N'user22', 0, N'22        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user23', N'user23', 0, N'23        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user24', N'user24', 0, N'24        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user25', N'user25', 0, N'25        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user26', N'user26', 0, N'26        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user27', N'user27', 0, N'27        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user28', N'user28', 0, N'28        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user29', N'user29', 0, N'29        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'4', N'4', 0, N'3         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'user30', N'user30', 0, N'30        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'123123', N'123123', 0, N'321321    ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'3', N'3', 0, N'4         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'5', N'5', 0, N'5         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'6', N'6', 0, N'6         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'7', N'7', 0, N'7         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'70', N'70', 0, N'70        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'71', N'71', 0, N'71        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'72', N'72', 0, N'72        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'8', N'8', 0, N'8         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'9', N'9', 0, N'9         ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'97', N'97', 0, N'97        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'99', N'99', 0, N'99        ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'admin', N'admin', 1, N'admin     ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'admin1', N'1', 1, N'admin1    ')
INSERT [dbo].[Acc] ([Username], [Password], [Role], [AccID]) VALUES (N'admin2', N'admin', 0, N'admin2    ')
GO
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'admin     ', N'admin     ', N'admin     ', NULL, NULL)
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE01      ', N'SE1701    ', N'PRJ301    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE02      ', N'SE1702    ', N'DBI202    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE03      ', N'SE1703    ', N'PRO201    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE04      ', N'SE1751    ', N'DBI202    ', N'20:00:00', N'22:00:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE05      ', N'SE1748    ', N'PRF192    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE06      ', N'SE1747    ', N'JPD121    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE07      ', N'SE1749    ', N'PRO201    ', N'20:00:00', N'22:00:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE10      ', N'SE10      ', N'PRJ301    ', N'20:00:00', N'22:00:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE100     ', N'SE17100   ', N'PRJ301    ', N'19:30:00', N'22:00:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE11      ', N'SE1711    ', N'PRF192    ', N'17:30:00', N'19:30:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE55      ', N'SE5555    ', N'CEA201    ', N'1:00', N'3:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE97      ', N'SE1797    ', N'CEA201    ', N'10:00', N'12:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE98      ', N'SE1798    ', N'PRJ301    ', N'9:00', N'12:00')
INSERT [dbo].[Class] ([IDclass], [Nameclass], [Subject], [TimeStart], [TimeEnd]) VALUES (N'SE99      ', N'SE1799    ', N'CEA201    ', N'7:30', N'9:00')
GO
INSERT [dbo].[Manage] ([idclass], [idacc]) VALUES (N'SE55      ', N'99        ')
GO
SET IDENTITY_INSERT [dbo].[Mess] ON 

INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (411, N'122       ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (412, N'1222      ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (413, N'14        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (414, N'16        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (415, N'17        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (416, N'18        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (417, N'19        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (418, N'2         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (419, N'20        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (420, N'200       ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (421, N'201       ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (422, N'21        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (423, N'22        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (424, N'23        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (425, N'24        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (426, N'25        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (427, N'26        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (428, N'27        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (429, N'28        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (430, N'29        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (431, N'3         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (432, N'30        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (433, N'321321    ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (434, N'4         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (435, N'5         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (436, N'6         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (437, N'7         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (438, N'70        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (439, N'71        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (440, N'72        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (441, N'8         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (442, N'9         ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (443, N'97        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (444, N'99        ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (445, N'admin2    ', N'99', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (446, N'admin     ', N'99', N'99        ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (447, N'99        ', N'99', N'71        ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (448, N'122       ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (449, N'1222      ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (450, N'14        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (451, N'16        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (452, N'17        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (453, N'18        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (454, N'19        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (455, N'2         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (456, N'20        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (457, N'200       ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (458, N'201       ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (459, N'21        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (460, N'22        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (461, N'23        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (462, N'24        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (463, N'25        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (464, N'26        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (465, N'27        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (466, N'28        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (467, N'29        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (468, N'3         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (469, N'30        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (470, N'321321    ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (471, N'4         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (472, N'5         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (473, N'6         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (474, N'7         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (475, N'70        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (476, N'71        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (477, N'72        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (478, N'8         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (479, N'9         ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (480, N'97        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (481, N'99        ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (482, N'admin2    ', N'gg', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (483, N'122       ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (484, N'1222      ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (485, N'14        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (486, N'16        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (487, N'17        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (488, N'18        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (489, N'19        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (490, N'2         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (491, N'20        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (492, N'200       ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (493, N'201       ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (494, N'21        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (495, N'22        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (496, N'23        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (497, N'24        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (498, N'25        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (499, N'26        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (500, N'27        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (501, N'28        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (502, N'29        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (503, N'3         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (504, N'30        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (505, N'321321    ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (506, N'4         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (507, N'5         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (508, N'6         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (509, N'7         ', N'Hom nay duoc nghi', N'admin     ')
GO
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (510, N'70        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (511, N'71        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (512, N'72        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (513, N'8         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (514, N'9         ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (515, N'97        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (516, N'99        ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (517, N'admin2    ', N'Hom nay duoc nghi', N'admin     ')
INSERT [dbo].[Mess] ([idmes], [idre], [Noidung], [idse]) VALUES (518, N'99        ', N'Chao cau', N'71        ')
SET IDENTITY_INSERT [dbo].[Mess] OFF
GO
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'1111      ', NULL, NULL, NULL, NULL, NULL, N'1111      ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'122       ', NULL, NULL, NULL, NULL, NULL, N'122       ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'1222      ', NULL, NULL, NULL, NULL, NULL, N'1222      ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'N', N'Nguy?n Van14', N'N Nguy?n Van', N'14        ', N'4509876543', N'n@gmail.com', N'Address14', N'Female', CAST(N'2003-02-14' AS Date), N'14        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'P', N'Nguy?n Van16', N'P Nguy?n Van', N'16        ', N'0987654321', N'p@gmail.com', N'Address16', N'Female', CAST(N'2005-04-16' AS Date), N'16        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Q', N'Nguy?n Van17', N'Q Nguy?n Van', N'17        ', N'9876543210', N'q@gmail.com', N'Address17', N'Male', CAST(N'2006-05-17' AS Date), N'17        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'R', N'Nguy?n Van18', N'R Nguy?n Van', N'18        ', N'8765432109', N'r@gmail.com', N'Address18', N'Female', CAST(N'2007-06-18' AS Date), N'18        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'S', N'Nguy?n Van19', N'S Nguy?n Van', N'19        ', N'7654321098', N's@gmail.com', N'Address19', N'Male', CAST(N'2008-07-19' AS Date), N'19        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'B', N'Nguy?n Van2', N'B Nguy?n Van', N'2         ', N'2345678901', N'b@gmail.com', N'Address2', N'Female', CAST(N'1991-02-02' AS Date), N'2         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'T', N'Nguy?n Van20', N'T Nguy?n Van', N'20        ', N'6543210987', N't@gmail.com', N'Address20', N'Female', CAST(N'2009-08-20' AS Date), N'20        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'200       ', NULL, NULL, NULL, NULL, NULL, N'200       ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'201       ', NULL, NULL, NULL, NULL, NULL, N'201       ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'U', N'Nguy?n Van21', N'U Nguy?n Van', N'21        ', N'5432109876', N'u@gmail.com', N'Address21', N'Male', CAST(N'2010-09-21' AS Date), N'21        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'V', N'Nguy?n Van22', N'V Nguy?n Van', N'22        ', N'4321098765', N'v@gmail.com', N'Address22', N'Female', CAST(N'2011-10-22' AS Date), N'22        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'W', N'Nguy?n Van23', N'W Nguy?n Van', N'23        ', N'3210987654', N'w@gmail.com', N'Address23', N'Male', CAST(N'2012-11-23' AS Date), N'23        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'X', N'Nguy?n Van24', N'X Nguy?n Van', N'24        ', N'2109876543', N'x@gmail.com', N'Address24', N'Female', CAST(N'2013-12-24' AS Date), N'24        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Y', N'Nguy?n Van25', N'Y Nguy?n Van', N'25        ', N'1098765432', N'y@gmail.com', N'Address25', N'Male', CAST(N'2014-01-25' AS Date), N'25        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Z', N'Nguy?n Van26', N'Z Nguy?n Van', N'26        ', N'9876543210', N'z@gmail.com', N'Address26', N'Female', CAST(N'2014-01-25' AS Date), N'26        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'BA', N'Nguy?n Van276', N'BA Nguy?n Van', N'27        ', N'9876543210', N'z@gmail.com', N'Address26', N'Female', CAST(N'2014-01-25' AS Date), N'27        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'AB', N'Nguy?n Van28', N'AB Nguy?n Van', N'28        ', N'9876543210', N'z@gmail.com', N'Address26', N'Female', CAST(N'2014-01-25' AS Date), N'28        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'AC', N'Nguy?n Van29', N'AC Nguy?n Van', N'29        ', N'9876543210', N'z@gmail.com', N'Address26', N'Female', CAST(N'2014-01-25' AS Date), N'29        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'C', N'Nguy?n Van3', N'C Nguy?n Van', N'3         ', N'3456789012', N'c@gmail.com', N'Address3', N'Male', CAST(N'1992-03-03' AS Date), N'3         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'ACcD', N'Nguy?n Van30', N'ZAS Nguy?n Van', N'30        ', N'9876543210', N'z@gmail.com', N'Address26', N'Female', CAST(N'2014-01-25' AS Date), N'30        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Vũ', N'Thủy', N'Quân', N'321321    ', N'0962330302', N't.minh4869@gmail.com', N'HaiPhong', N'male', CAST(N'1999-01-01' AS Date), N'321321    ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'D', N'Nguy?n Van4', N'D Nguy?n Van', N'4         ', N'4567890123', N'd@gmail.com', N'Address4', N'Female', CAST(N'1993-04-04' AS Date), N'4         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'E', N'Nguy?n Van5', N'E Nguy?n Van', N'5         ', N'5678901234', N'e@gmail.com', N'Address5', N'Male', CAST(N'1994-05-05' AS Date), N'5         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'F', N'Nguy?n Van6', N'F Nguy?n Van', N'6         ', N'6789012345', N'f@gmail.com', N'Address6', N'Female', CAST(N'1995-06-06' AS Date), N'6         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'G', N'Nguy?n Van7', N'G Nguy?n Van', N'7         ', N'7890123456', N'g@gmail.com', N'Address7', N'Male', CAST(N'1996-07-07' AS Date), N'7         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Nguyen', N'Thủy', N'Van A', N'70        ', N'123456789', N'taaaa@gmail.com', N'Ha Noi', N'male', CAST(N'2003-11-11' AS Date), N'70        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'71        ', NULL, NULL, NULL, NULL, NULL, N'71        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'72        ', NULL, NULL, NULL, NULL, NULL, N'72        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'H', N'Nguy?n Van8', N'H Nguy?n Van', N'8         ', N'8901234567', N'h@gmail.com', N'Address8', N'Female', CAST(N'1997-08-08' AS Date), N'8         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'I', N'Nguy?n Van9', N'I Nguy?n Van', N'9         ', N'9012345678', N'i@gmail.com', N'Address9', N'Male', CAST(N'1998-09-09' AS Date), N'9         ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Cường', N'Nguyễn Mạnh', N'Nguyễn Mạnh Cường', N'97        ', N'+84796322645', N'cuongnmhe172187@fpt.edu.vn', N'HaiPhong', N'male', CAST(N'2003-11-11' AS Date), N'97        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (N'Cường', N'Thủy', N'Nguyễn Mạnh Cường', N'99        ', N'+84796322645', N'cuongnmhe172187@fpt.edu.vn', N'HaiPhong', N'male', CAST(N'2003-11-11' AS Date), N'99        ')
INSERT [dbo].[Student] ([Firstname], [Lastname], [Fullname], [Accid], [Phone], [Email], [Address], [Gender], [Birthdate], [Idstudent]) VALUES (NULL, NULL, NULL, N'admin2    ', NULL, NULL, NULL, NULL, NULL, N'admin2    ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uc_username]    Script Date: 11/8/2023 2:03:33 PM ******/
ALTER TABLE [dbo].[Acc] ADD  CONSTRAINT [uc_username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Manage]  WITH CHECK ADD FOREIGN KEY([idacc])
REFERENCES [dbo].[Acc] ([AccID])
GO
ALTER TABLE [dbo].[Manage]  WITH CHECK ADD FOREIGN KEY([idclass])
REFERENCES [dbo].[Class] ([IDclass])
GO
ALTER TABLE [dbo].[Mess]  WITH CHECK ADD  CONSTRAINT [FK_Mess_Acc] FOREIGN KEY([idse])
REFERENCES [dbo].[Acc] ([AccID])
GO
ALTER TABLE [dbo].[Mess] CHECK CONSTRAINT [FK_Mess_Acc]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student] FOREIGN KEY([Idstudent])
REFERENCES [dbo].[Acc] ([AccID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Student]
GO
ALTER TABLE [dbo].[Acc]  WITH CHECK ADD  CONSTRAINT [chk_role] CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Acc] CHECK CONSTRAINT [chk_role]
GO
USE [master]
GO
ALTER DATABASE [HocThem] SET  READ_WRITE 
GO
