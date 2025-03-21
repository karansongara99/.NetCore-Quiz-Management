USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizQuestionsWise_SelectByPk]    Script Date: 29-01-2025 19:50:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuizQuestionsWise_SelectByPk]
    @QuizWiseQuestionsID INT
AS
BEGIN
    SELECT [MST_QuizWiseQuestions].[QuizWiseQuestionsID], 
		   [MST_QuizWiseQuestions].[QuizID], 
           [MST_QuizWiseQuestions].[QuestionID], 
		   [MST_QuizWiseQuestions].[UserID], 
		   [MST_QuizWiseQuestions].[Created],
		   [MST_QuizWiseQuestions].[Modified]
    FROM  [MST_QuizWiseQuestions]
    WHERE [MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
    ORDER BY [MST_QuizWiseQuestions].[QuizWiseQuestionsID];
END