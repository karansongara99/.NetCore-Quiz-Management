USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Quiz_UpdateByPK]    Script Date: 29-01-2025 19:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Quiz_UpdateByPK]
	@QuizId				INT,
	@QuizName			NVARCHAR(50),
    @TotalQuestions		NVARCHAR(50),
	@QuizDate			DATETIME,
    @UserID				INT,
    @Created			DATETIME,
    @Modified			DATETIME
AS
BEGIN
   UPDATE [MST_Quiz] 
   SET
		[MST_Quiz].QuizName			= @QuizName,
		[MST_Quiz].TotalQuestions	= @TotalQuestions,
		[MST_Quiz].QuizDate			= @QuizDate,
		[MST_Quiz].UserID			= @UserID,
		[MST_Quiz].Created			= @Created,
		[MST_Quiz].Modified			= @Modified
		WHERE [MST_Quiz].QuizID		= @QuizID
END