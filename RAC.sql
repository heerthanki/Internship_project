USE [master]
GO
/****** Object:  Database [RCF]    Script Date: 07-06-2023 17:16:02 ******/
CREATE DATABASE [RCF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RCF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RCF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RCF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RCF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RCF] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RCF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RCF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RCF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RCF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RCF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RCF] SET ARITHABORT OFF 
GO
ALTER DATABASE [RCF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RCF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RCF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RCF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RCF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RCF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RCF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RCF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RCF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RCF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RCF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RCF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RCF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RCF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RCF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RCF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RCF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RCF] SET RECOVERY FULL 
GO
ALTER DATABASE [RCF] SET  MULTI_USER 
GO
ALTER DATABASE [RCF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RCF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RCF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RCF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RCF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RCF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RCF', N'ON'
GO
ALTER DATABASE [RCF] SET QUERY_STORE = ON
GO
ALTER DATABASE [RCF] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RCF]
GO
/****** Object:  Table [dbo].[mst_Questions]    Script Date: 07-06-2023 17:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Questions](
	[QueID] [int] IDENTITY(1,1) NOT NULL,
	[Questions] [nvarchar](max) NULL,
	[QuestionNo] [float] NULL,
	[isActive] [bit] NULL,
	[Createdby] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_mst_Questions] PRIMARY KEY CLUSTERED 
(
	[QueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReferenceCheck]    Script Date: 07-06-2023 17:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReferenceCheck](
	[RefID] [int] IDENTITY(1,1) NOT NULL,
	[Nameofcandidate] [nvarchar](100) NULL,
	[PositionConsidered] [nvarchar](50) NULL,
	[RefName] [nvarchar](50) NULL,
	[RefContactno] [varchar](50) NULL,
	[RefDesigCompany] [nvarchar](100) NULL,
	[RefEmail] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[Status] [varchar](50) NULL,
	[PendingWith] [varchar](50) NULL,
	[CheckedBy] [varchar](50) NULL,
	[CheckedGrade] [varchar](50) NULL,
	[CheckedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ReferenceCheck] PRIMARY KEY CLUSTERED 
(
	[RefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReferenceQuestions]    Script Date: 07-06-2023 17:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReferenceQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RefID] [int] NULL,
	[QueID] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_ReferenceQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_Questions] ON 

INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (1, N'Since how long do you know the candidate and in what capacity did, he/she work with/for you? Please outline the candidate''s position and responsibilities. Please indicate the exact period and nature (e.g., Boss-subordinate or peer) of your association with the candidate.', 1, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (2, N'How was the candidate''s performance on the job? Was it consistently good? Was there any period when performance sagged? Why in your opinion did this happen?', 2, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (3, N'How is the candidate''s behaviour at work?', 3, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (4, N'Please comment on the candidate''s Professional Character, Integrity, Honesty, Code of Conduct, Discipline at workplace, Prevention of Sexual Harassment (POSH) and Criminal Records:', 4, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (5, N'How good is the candidate at managing and leading a team?Can you please list his/her 3 significant strengths?', 5, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (6, N'How does the candidate deal with adversity, failure, and stress?', 6, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (7, N'Can you please list his/her 3 significant strengths?', 7, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (8, N'Given a chance, would you hire this individual for your team or organization? Why or why not?', 8, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (9, N'What is your overall assessment of the candidate on a 1-10 scale (1 being poor and 10 being excellent) on the following dimensions?', 9, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (10, N'Business Building skills
(Opening doors, Rain making and closing deals with new customers)
', 9.1, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (11, N'Operational excellence and Business improvement', 9.2, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (12, N'Project Execution', 9.3, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (13, N'Customer interaction and interface', 9.4, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (14, N'Interpersonal skills/ Social Intelligence', 9.5, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (15, N'Networking skills', 9.6, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (16, N'Communication skills (Verbal one to one)', 9.7, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (17, N'Communication skills (Verbal in a group)- one to many', 9.8, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (18, N'Written communication skills', 9.9, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (19, N'Work ethics. Is he/she a "workaholic" or does he/she have a good sense of balance of life and work?', 10, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (20, N'Do you have any reason to believe the candidate would have signed any documents or done any such act during and in the course of his employment with current employer which any competent authority would have reason to question after the person would leave the company?', 11, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (21, N'In your opinion what are the areas that he/she should improve on?', 12, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[mst_Questions] ([QueID], [Questions], [QuestionNo], [isActive], [Createdby], [CreatedDate]) VALUES (22, N'Is there anything else you would like to add about this candidate? For example, are you aware of any episode of grave ill-health/ major surgery or major illness that the individual would have gone through which is important for us to know?', 13, 1, N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[mst_Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ReferenceCheck] ON 

INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'HEER', N'SZ', N'ABC', N'9898989898', N'NBV', N'abc@gmail.com', 1, N'Approved', N'Heer Thanki', N'HEER', N'A+', CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Nishh', N'bvcxcvbn', N'gt', N'0000000000', N'kjh', N'gt@gmail.com', 1, N'Approved', N'Heer Thanki', N'HEER', N'A+', CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Ashhh', N'qe', N'dsc', N'0000000000', N'kjh', N'gt@gmail.com', 1, N'Declined', N'Heer Thanki', N'HEER', N'B', CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'vii', N'jb', N'mn ', N'1212121212', N'kjhgvcxz', N'mn@yahoo.com', 1, N'Approved', N'Heer Thanki', N'HEER', N'C+', CAST(N'2023-05-21T00:00:00.000' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'visha', N'hr', N'dsp', N'7878787878', N'ch', N'dsp@gmail.com', 1, N'Declined', N'Heer Thanki', N'HEER', N'C', CAST(N'2023-05-22T00:00:00.000' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_ReferenceCheck] ([RefID], [Nameofcandidate], [PositionConsidered], [RefName], [RefContactno], [RefDesigCompany], [RefEmail], [IsActive], [Status], [PendingWith], [CheckedBy], [CheckedGrade], [CheckedDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'milind', N'S.E.', N'heer', N'09898989898', N'ltp', N'abc@gmail.com', 1, N'Approved', N'Heer Thanki', N'ju', N'C+', CAST(N'2023-06-02T12:31:56.213' AS DateTime), N'Heer Thanki', CAST(N'2023-05-17T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_ReferenceCheck] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ReferenceQuestions] ON 

INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (1, 1, 1, N'hjgcfg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (2, 1, 2, N'jjkhbhihjhh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (3, 1, 3, N'kjbn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (4, 1, 4, N'bknmb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (5, 1, 5, N'jk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (6, 1, 6, N'jnb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (7, 1, 7, N'kmnbn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (8, 1, 8, N'm,mn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (9, 1, 9, N',b')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (10, 1, 10, N'jk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (11, 1, 11, N'h')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (12, 1, 12, N'knjb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (13, 1, 13, N'b')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (14, 1, 14, N'nmbk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (15, 1, 15, N'j')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (16, 1, 16, N'knjb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (17, 1, 17, N'jkmn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (18, 1, 18, N'b')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (19, 1, 19, N'k')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (20, 1, 20, N'bjnb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (21, 1, 21, N'jk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (22, 1, 22, N'kbh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (23, 2, 1, N'k;ikujyh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (24, 2, 2, N'iu')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (25, 2, 3, N'hjjmbv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (26, 2, 4, N'chjkj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (27, 2, 5, N'hgcvbnkjhgcfxv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (28, 2, 6, N'jkjbhv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (29, 2, 7, N'jkhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (30, 2, 8, N'vghjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (31, 2, 9, N'jhv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (32, 2, 10, N'kjh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (33, 2, 11, N'vghjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (34, 2, 12, N'jhvjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (35, 2, 13, N'jbhh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (36, 2, 14, N'jkjhbv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (37, 2, 15, N'bjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (38, 2, 16, N'bvcv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (39, 2, 17, N'hjkjhc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (40, 2, 18, N'hj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (41, 2, 19, N'khv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (42, 2, 20, N'hjhbvg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (43, 2, 21, N'chjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (44, 2, 22, N'hvcv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (45, 3, 1, N'gfgd')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (46, 3, 2, N'uhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (47, 3, 3, N'gfj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (48, 3, 4, N'khcvx')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (49, 3, 5, N'hjkhg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (50, 3, 6, N'cfvxvvhjk')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (51, 3, 7, N'hgvc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (52, 3, 8, N'hjkhg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (53, 3, 9, N'vcfghjhg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (54, 3, 10, N'jhgc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (55, 3, 11, N'fghj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (56, 3, 12, N'gv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (57, 3, 13, N'ghjgvc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (58, 3, 14, N'hjb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (59, 3, 15, N'gvc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (60, 3, 16, N'hjgv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (61, 3, 17, N'hjb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (62, 3, 18, N'gvbbhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (63, 3, 19, N'bv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (64, 3, 20, N'hjkh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (65, 3, 21, N'bvhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (66, 3, 22, N'bv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (67, 4, 1, N'uyt')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (68, 4, 2, N'jhb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (69, 4, 3, N'jkhbv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (70, 4, 4, N'bjhb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (71, 4, 5, N'j')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (72, 4, 6, N'mnb ')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (73, 4, 7, N'nnmbnm')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (74, 4, 8, N',mnbm')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (75, 4, 9, N'nbn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (76, 4, 10, N'mn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (77, 4, 11, N'bnmbnm')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (78, 4, 12, N'nb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (79, 4, 13, N'bn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (80, 4, 14, N'nblkjhgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (81, 4, 15, N'nn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (82, 4, 16, N'bn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (83, 4, 17, N'bljkujyhtfgd')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (84, 4, 18, N'jhugytfd')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (85, 4, 19, N'hg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (86, 4, 20, N'gfhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (87, 4, 21, N'hvb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (88, 4, 22, N'nbvcx')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (89, 5, 1, N'hgrre')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (90, 5, 2, N'edqh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (91, 5, 3, N'huhgy')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (92, 5, 4, N'nhjj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (93, 5, 5, N'hgfc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (94, 5, 6, N'cvbn')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (95, 5, 7, N'bv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (96, 5, 8, N'nmnbv')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (97, 5, 9, N'bb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (98, 5, 10, N'nmbvc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (99, 5, 11, N'bvbc')
GO
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (100, 5, 12, N'hjbvbcb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (101, 5, 13, N'bvb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (102, 5, 14, N'bvcvhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (103, 5, 15, N'vghj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (104, 5, 16, N'hc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (105, 5, 17, N'vghjc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (106, 5, 18, N'vghbjbvc')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (107, 5, 19, N'bhj')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (108, 5, 20, N'vhjh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (109, 5, 21, N'cvghjhg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (110, 5, 22, N'hjvcvbh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (111, 6, 1, N'lkjhgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (112, 6, 2, N'uyf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (113, 6, 3, N'thkgh')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (114, 6, 4, N'hkjgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (115, 6, 5, N'v')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (116, 6, 6, N'cxvcxb')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (117, 6, 7, N'kjhg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (118, 6, 8, N'hgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (119, 6, 9, N'uyt')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (120, 6, 10, N'uhgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (121, 6, 11, N'uhgyftr')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (122, 6, 12, N'iu')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (123, 6, 13, N'gfgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (124, 6, 14, N'hjgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (125, 6, 15, N'liujyghtfgdf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (126, 6, 16, N'hgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (127, 6, 17, N'hg')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (128, 6, 18, N'fnjkhgfd')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (129, 6, 19, N'jhgf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (130, 6, 20, N'uyghfgtf')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (131, 6, 21, N'hjuy')
INSERT [dbo].[tbl_ReferenceQuestions] ([ID], [RefID], [QueID], [Remarks]) VALUES (132, 6, 22, N'hu')
SET IDENTITY_INSERT [dbo].[tbl_ReferenceQuestions] OFF
GO
ALTER TABLE [dbo].[tbl_ReferenceQuestions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ReferenceQuestions_tbl_ReferenceQuestions] FOREIGN KEY([ID])
REFERENCES [dbo].[tbl_ReferenceQuestions] ([ID])
GO
ALTER TABLE [dbo].[tbl_ReferenceQuestions] CHECK CONSTRAINT [FK_tbl_ReferenceQuestions_tbl_ReferenceQuestions]
GO
ALTER TABLE [dbo].[tbl_ReferenceQuestions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ReferenceQuestions_tbl_ReferenceQuestions1] FOREIGN KEY([ID])
REFERENCES [dbo].[tbl_ReferenceQuestions] ([ID])
GO
ALTER TABLE [dbo].[tbl_ReferenceQuestions] CHECK CONSTRAINT [FK_tbl_ReferenceQuestions_tbl_ReferenceQuestions1]
GO
USE [master]
GO
ALTER DATABASE [RCF] SET  READ_WRITE 
GO
