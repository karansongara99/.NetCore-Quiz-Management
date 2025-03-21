USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizQuestionsWise_UpdateByPk]    Script Date: 29-01-2025 19:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuizQuestionsWise_UpdateByPk]
	@QuizWiseQuestionsID	INT,
	@QuizID					INT,
    @QuestionID				INT,
    @UserID					INT,
    @Created				DATETIME,
	@Modified				DATETIME
AS
BEGIN
    UPDATE [MST_QuizWiseQuestions]
    SET  [dbo].[MST_QuizWiseQuestions].[QuizID]					= @QuizID, 
         [dbo].[MST_QuizWiseQuestions].[QuestionID]				= @QuestionID, 
         [dbo].[MST_QuizWiseQuestions].[UserID]					= @UserID, 
		 [dbo].[MST_QuizWiseQuestions].[Created]				= @Created
   WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID]	= @QuizWiseQuestionsID;
END