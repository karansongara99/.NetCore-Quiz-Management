USE [master]
GO
/****** Object:  Database [Quiz_Management]    Script Date: 18-01-2025 08:09:46 ******/
CREATE DATABASE [Quiz_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Quiz_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quiz_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Quiz_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Quiz_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz_Management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Quiz_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Quiz_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quiz_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quiz_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Quiz_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Quiz_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [Quiz_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Quiz_Management]
GO
/****** Object:  Table [dbo].[MST_Question]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[QuestionLevelID] [int] NULL,
	[OptionA] [nvarchar](50) NULL,
	[OptionB] [nvarchar](50) NULL,
	[OptionC] [nvarchar](50) NULL,
	[OptionD] [nvarchar](50) NULL,
	[CorrectOption] [nvarchar](50) NULL,
	[QuestionMarks] [int] NULL,
	[IsActive] [bit] NULL,
	[UserID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_QuestionLevel]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_QuestionLevel](
	[QuestionLevelID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionLevel] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_QuestionLevel] PRIMARY KEY CLUSTERED 
(
	[QuestionLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Quiz]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizName] [nvarchar](100) NULL,
	[TotalQuestions] [nvarchar](100) NULL,
	[QuizDate] [datetime] NULL,
	[UserID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_QuizWiseQuestions]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_QuizWiseQuestions](
	[QuizWiseQuestionsID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NULL,
	[QuestionID] [int] NULL,
	[UserID] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_QuizWiseQuestions] PRIMARY KEY CLUSTERED 
(
	[QuizWiseQuestionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_User]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_Question] ADD  CONSTRAINT [DF_MST_Question_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_QuestionLevel] ADD  CONSTRAINT [DF_MST_QuestionLevel_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions] ADD  CONSTRAINT [DF_MST_QuizWiseQuestions_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_User] ADD  CONSTRAINT [DF_MST_User_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Question]  WITH CHECK ADD  CONSTRAINT [FK_MST_Question_MST_QuestionLevel] FOREIGN KEY([QuestionLevelID])
REFERENCES [dbo].[MST_QuestionLevel] ([QuestionLevelID])
GO
ALTER TABLE [dbo].[MST_Question] CHECK CONSTRAINT [FK_MST_Question_MST_QuestionLevel]
GO
ALTER TABLE [dbo].[MST_QuestionLevel]  WITH CHECK ADD  CONSTRAINT [FK_MST_QuestionLevel_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_QuestionLevel] CHECK CONSTRAINT [FK_MST_QuestionLevel_MST_User]
GO
ALTER TABLE [dbo].[MST_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_MST_Quiz_MST_Quiz] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Quiz] CHECK CONSTRAINT [FK_MST_Quiz_MST_Quiz]
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions]  WITH CHECK ADD  CONSTRAINT [FK_MST_QuizWiseQuestions_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_QuizWiseQuestions] CHECK CONSTRAINT [FK_MST_QuizWiseQuestions_MST_User]
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestion_All_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestion_All_Data]
AS
BEGIN
	SELECT 
		[MST_Question].QuestionId,
		[MST_Question].QuestionText,
		[MST_Question].QuestionLevelID,
		[MST_Question].OptionA,
		[MST_Question].OptionB,
		[MST_Question].OptionC,
		[MST_Question].OptionD,
		[MST_Question].CorrectOption,
		[MST_Question].QuestionMarks,
		[MST_Question].UserID,
		[MST_Question].Created,
		[MST_Question].Modified
	FROM [MST_Question]
	ORDER BY [MST_Question].QuestionText
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestion_Delete_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MSTQuestion_Delete_Data]
	@QuestionID INT
AS
BEGIN
	DELETE FROM [MST_Question]
	WHERE [MST_Question].QuestionId = @QuestionID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestion_Insert_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestion_Insert_Data]
	@QuestionText NVARCHAR(50),
	@QuestionLevelID INT,
	@OptionA NVARCHAR(50),
	@OptionB NVARCHAR(50),
	@OptionC NVARCHAR(50),
	@OptionD NVARCHAR(50),
	@CorrectOption NVARCHAR(50),
	@QuestionMarks INT,
	@IsActive BIT,
	@UserID INT,
	@Created DATETIME,
	@Modified DATETIME
AS
BEGIN
	INSERT INTO [MST_Question](QuestionText,QuestionLevelID,OptionA,OptionB,OptionC,OptionD,CorrectOption,QuestionMarks,UserID,Created,Modified) VALUES
	(@QuestionText,@QuestionLevelID,@OptionA,@OptionB,@OptionC,@OptionD,@CorrectOption,@QuestionMarks,@UserID,@Created,@Modified)
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestion_Search_By_Id]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestion_Search_By_Id]
	@QuestionID INT
AS
BEGIN
	SELECT 
		[MST_Question].QuestionId,
		[MST_Question].QuestionText,
		[MST_Question].QuestionLevelID,
		[MST_Question].OptionA,
		[MST_Question].OptionB,
		[MST_Question].OptionC,
		[MST_Question].OptionD,
		[MST_Question].CorrectOption,
		[MST_Question].QuestionMarks,
		[MST_Question].UserID,
		[MST_Question].Created,
		[MST_Question].Modified
	FROM [MST_Question]
	INNER JOIN [MST_QuestionLevel] ON [MST_Question].QuestionLevelID = [MST_QuestionLevel].QuestionLevelID
	INNER JOIN [MST_User] ON [MST_User].[UserID] = [MST_Question].[UserID]
	WHERE [MST_Question].QuestionId = @QuestionID
	ORDER BY [MST_Question].QuestionID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestion_Update_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestion_Update_Data]
	@QuestionID INT,
	@QuestionText NVARCHAR(50),
	@QuestionLevelID INT,
	@OptionA NVARCHAR(50),
	@OptionB NVARCHAR(50),
	@OptionC NVARCHAR(50),
	@OptionD NVARCHAR(50),
	@CorrectOption NVARCHAR(50),
	@QuestionMarks INT,
	@IsActive BIT,
	@UserID INT,
	@Created DATETIME,
	@Modified DATETIME
AS
BEGIN
	UPDATE [MST_Question] 
	SET
	[MST_Question].[QuestionText] = @QuestionText,
	[MST_Question].[QuestionLevelID] = @QuestionLevelID,
	[MST_Question].[OptionA] = @OptionA,
	[MST_Question].[OptionB] = @OptionB,
	[MST_Question].[OptionC] = @OptionC,
	[MST_Question].[OptionD] = @OptionD,
	[MST_Question].[CorrectOption] = @CorrectOption,
	[MST_Question].[QuestionMarks] = @QuestionMarks,
	[MST_Question].[UserID] = @UserID,
	[MST_Question].[Created] = @Created,
	[MST_Question].[Modified] = @Modified
	WHERE [MST_Question].QuestionID = @QuestionID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestionLevel_All_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestionLevel_All_Data]
AS
BEGIN
    SELECT [MST_QuestionLevel].QuestionLevelID, 
           [MST_QuestionLevel].QuestionLevel, 
           [MST_QuestionLevel].UserID,
		   [MST_QuestionLevel].Created,
		   [MST_QuestionLevel].Modified
    FROM [MST_QuestionLevel]
    ORDER BY [MST_QuestionLevel].QuestionLevel
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestionLevel_Delete_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestionLevel_Delete_Data]
    @QuestionLevelID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuestionLevel]
    WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID;
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestionLevel_Insert_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuestionLevel_Insert_Data]
    @QuestionLevel  NVARCHAR(50),
    @UserID  INT,
    @Created DATETIME,
	@Modified DATETIME
AS
BEGIN
    INSERT INTO [MST_QuestionLevel] (QuestionLevel,UserID,Created,Modified)
	VALUES (@QuestionLevel,@UserID, @Created, @Modified);
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuestionLevel_Search_By_ID]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MSTQuestionLevel_Search_By_ID]
    @QuestionLevelID INT
AS
BEGIN
    SELECT [MST_QuestionLevel].[QuestionLevelID], 
		   [MST_QuestionLevel].[QuestionLevel], 
           [MST_QuestionLevel].[UserID], 
		   [MST_QuestionLevel].[Created],
		   [MST_QuestionLevel].[Modified]
    FROM [MST_QuestionLevel]
    WHERE [MST_QuestionLevel].QuestionLevelID = @QuestionLevelID
    ORDER BY [MST_QuestionLevel].QuestionLevel
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuiz_All_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuiz_All_Data]
AS
BEGIN
	SELECT 
		[MST_Quiz].QuizID,
		[MST_Quiz].QuizName,
		[MST_Quiz].TotalQuestions,
		[MST_Quiz].QuizDate,
		[MST_Quiz].UserID,
		[MST_Quiz].Created,
		[MST_Quiz].Modified
	FROM [MST_Quiz]
	ORDER BY [MST_Quiz].QuizName
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuiz_Delete_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuiz_Delete_Data]
	@QuizID INT
AS
BEGIN
	DELETE FROM [MST_Quiz]
	WHERE [MST_Quiz].QuizID = @QuizId
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuiz_Insert_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MSTQuiz_Insert_Data]
	@QuizName  NVARCHAR(50),
    @TotalQuestions  NVARCHAR(50),
	@QuizDate DATETIME,
    @UserID  INT,
    @Created DATETIME,
    @Modified DATETIME
AS
BEGIN
    INSERT INTO [MST_Quiz] (QuizName,TotalQuestions,QuizDate,UserID,Created,Modified)
	VALUES (@QuizName,@TotalQuestions,@QuizDate, @UserID, @Created, @Modified);
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuiz_Search_By_ID]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuiz_Search_By_ID]
	@QuizID INT
AS
BEGIN
	SELECT [MST_Quiz].QuizID,
	[MST_Quiz].QuizName,
	[MST_Quiz].TotalQuestions,
	[MST_Quiz].QuizDate,
	[MST_Quiz].UserID,
	[MST_Quiz].Created,
	[MST_Quiz].Modified
	FROM [MST_Quiz]
	INNER JOIN [MSTUser] ON [MST_Quiz].QuizID = [MSTUser].UserID
	WHERE [MST_Quiz].QuizID = @QuizID
	ORDER BY [MST_Quiz].QuizID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuiz_Update_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuiz_Update_Data]
	@QuizId	INT,
	@QuizName  NVARCHAR(50),
    @TotalQuestions  NVARCHAR(50),
	@QuizDate DATETIME,
    @UserID  INT,
    @Created DATETIME,
    @Modified DATETIME
AS
BEGIN
   UPDATE [MST_Quiz] SET
		[MST_Quiz].QuizName = @QuizName,
		[MST_Quiz].TotalQuestions = @TotalQuestions,
		[MST_Quiz].QuizDate = @QuizDate,
		[MST_Quiz].UserID = @UserID,
		[MST_Quiz].Created = @Created,
		[MST_Quiz].Modified = @Modified
		WHERE [MST_Quiz].QuizID = @QuizID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuizWiseQuestion_All_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuizWiseQuestion_All_Data]
AS
BEGIN
    SELECT [MST_QuizWiseQuestions].QuizWiseQuestionsID, 
           [MST_QuizWiseQuestions].QuizID, 
           [MST_QuizWiseQuestions].QuestionID, 
		   [MST_QuizWiseQuestions].UserID,
		   [MST_QuizWiseQuestions].Created,
		   [MST_QuizWiseQuestions].Modified
    FROM [MST_QuizWiseQuestions]
    ORDER BY [MST_QuizWiseQuestions].QuizWiseQuestionsID
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuizWiseQuestion_Delete_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuizWiseQuestion_Delete_Data]
    @QuizWiseQuestionsID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuizWiseQuestions]
    WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuizWiseQuestion_Insert_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuizWiseQuestion_Insert_Data]
	@QuizID  INT,
    @QuestionID  INT,
    @UserID  INT,
    @Created DATETIME,
	@Modified DATETIME
AS
BEGIN
    INSERT INTO [MST_QuizWiseQuestions] (QuizID,QuestionID,UserID,Created,Modified)
	VALUES (@QuizID,@QuestionID, @UserID, @Created, @Modified);
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuizWiseQuestion_Search_By_ID]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTQuizWiseQuestion_Search_By_ID]
    @QuizWiseQuestionsID INT
AS
BEGIN
    SELECT [MST_QuizWiseQuestions].[QuizWiseQuestionsID], 
		   [MST_QuizWiseQuestions].[QuizID], 
           [MST_QuizWiseQuestions].[QuestionID], 
		   [MST_QuizWiseQuestions].[UserID], 
		   [MST_QuizWiseQuestions].[Created],
		   [MST_QuizWiseQuestions].[Modified]
    FROM [MST_QuizWiseQuestions]
	INNER JOIN [MST_Quiz] ON [MST_QuizWiseQuestions].QuizID = [MST_QuizWiseQuestions].QuizID
	INNER JOIN [MST_Question] ON [MST_Question].QuestionID = [MST_QuizWiseQuestions].QuestionID
	INNER JOIN [MST_User] ON [MST_User].UserID = [MST_QuizWiseQuestions].UserID
    WHERE [MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
    ORDER BY [MST_QuizWiseQuestions].[QuizWiseQuestionsID];
END
GO
/****** Object:  StoredProcedure [dbo].[MSTQuizWiseQuestion_Upadte_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MSTQuizWiseQuestion_Upadte_Data]
	@QuizWiseQuestionsID INT,
	@QuizID  INT,
    @QuestionID  INT,
    @UserID  INT,
    @Created DATETIME,
	@Modified DATETIME
AS
BEGIN
    UPDATE [MST_QuizWiseQuestions]
    SET  [dbo].[MST_QuizWiseQuestions].[QuizID] = @QuizID, 
         [dbo].[MST_QuizWiseQuestions].[QuestionID] = @QuestionID, 
         [dbo].[MST_QuizWiseQuestions].[UserID] = @UserID, 
		 [dbo].[MST_QuizWiseQuestions].[Created] = @Created
   WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END
GO
/****** Object:  StoredProcedure [dbo].[MSTUser_All_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTUser_All_Data]
AS
BEGIN
    SELECT [MST_User].UserID, 
           [MST_User].UserName, 
           [MST_User].Password, 
		   [MST_User].Email, 
           [MST_User].Mobile, 
           [MST_User].IsActive,
		   [MST_User].IsAdmin,
		   [MST_User].Created,
		   [MST_User].Modified
    FROM [MST_User]
    ORDER BY [MST_User].UserName
END
GO
/****** Object:  StoredProcedure [dbo].[MSTUser_Delete_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTUser_Delete_Data]
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_User]
    WHERE [dbo].[MST_User].[UserID] = @UserID;
END
GO
/****** Object:  StoredProcedure [dbo].[MSTUser_Insert_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTUser_Insert_Data]
	@UserName  NVARCHAR(50),
    @Password  NVARCHAR(50),
    @Email  NVARCHAR(50),
    @Mobile NVARCHAR(50),
    @IsActive BIT,
	@IsAdmin BIT,
    @Created DATETIME,
	@Modified DATETIME
AS
BEGIN
    INSERT INTO [MST_User] (UserName,Password,Email,Mobile,IsActive,IsAdmin,Created,Modified)
	VALUES (@UserName,@Password, @Email, @Mobile, @IsActive,@IsAdmin, @Created, @Modified);
END
GO
/****** Object:  StoredProcedure [dbo].[MSTUser_Search_By_ID]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MSTUser_Search_By_ID]
    @UserID INT
AS
BEGIN
    SELECT [MST_User].[UserID], 
		   [MST_User].UserName, 
           [MST_User].Password, 
		   [MST_User].Email, 
           [MST_User].Mobile, 
           [MST_User].IsActive,
		   [MST_User].IsAdmin,
		   [MST_User].Created,
		   [MST_User].Modified
    FROM [MST_User]
    WHERE [MST_User].[UserID] = @UserID
    ORDER BY [MST_User].[UserID];
END
GO
/****** Object:  StoredProcedure [dbo].[MSTUser_Upadte_Data]    Script Date: 18-01-2025 08:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MSTUser_Upadte_Data]
	@UserID INT,
	@UserName  NVARCHAR(50),
    @Password  NVARCHAR(50),
    @Email  NVARCHAR(50),
    @Mobile NVARCHAR(50),
    @IsActive BIT,
	@IsAdmin BIT,
    @Created DATETIME,
	@Modified DATETIME
AS
BEGIN
    UPDATE [MST_User]
    SET  [dbo].[MST_User].[UserName] = @UserName, 
         [dbo].[MST_User].[Password] = @Password, 
         [dbo].[MST_User].[Email] = @Password, 
         [dbo].[MST_User].[Mobile] = @Email, 
         [dbo].[MST_User].[IsActive] = @IsActive,
		 [dbo].[MST_User].[IsAdmin] = @IsAdmin,
		 [dbo].[MST_User].[Created] = @Created
   WHERE [dbo].[MST_User].[UserID] = @UserID;
END
GO
USE [master]
GO
ALTER DATABASE [Quiz_Management] SET  READ_WRITE 
GO
