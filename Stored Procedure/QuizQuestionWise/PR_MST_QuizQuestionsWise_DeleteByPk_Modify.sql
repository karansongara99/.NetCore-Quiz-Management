USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizQuestionsWise_DeleteByPk]    Script Date: 29-01-2025 19:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_QuizQuestionsWise_DeleteByPk]
    @QuizWiseQuestionsID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuizWiseQuestions]
    WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END
