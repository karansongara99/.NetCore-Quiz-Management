USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Quiz_Insert]    Script Date: 29-01-2025 19:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Quiz_Insert]
	@QuizName			NVARCHAR(50),
    @TotalQuestions		NVARCHAR(50),
	@QuizDate			DATETIME,
    @UserID				INT,
    @Created			DATETIME,
    @Modified			DATETIME
AS
BEGIN
    INSERT INTO [MST_Quiz] 
	(
		QuizName,
		TotalQuestions,
		QuizDate,
		UserID,
		Created,
		Modified
	)
	VALUES 
	(
		@QuizName,
		@TotalQuestions,
		@QuizDate,
		@UserID, 
		@Created, 
		@Modified
	);
END