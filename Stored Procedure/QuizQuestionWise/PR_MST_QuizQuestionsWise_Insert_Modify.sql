USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizQuestionsWise_Insert]    Script Date: 29-01-2025 19:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuizQuestionsWise_Insert]
	@QuizID			INT,
    @QuestionID		INT,
    @UserID			INT,
    @Created		DATETIME,
	@Modified		DATETIME
AS
BEGIN
    INSERT INTO [MST_QuizWiseQuestions] 
	(
		QuizID,
		QuestionID,
		UserID,
		Created,
		Modified
	)
	VALUES 
	(
		@QuizID,
		@QuestionID, 
		@UserID,
		@Created,
		@Modified
	);
END