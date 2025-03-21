USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizQuestionsWise_SelectAll]    Script Date: 29-01-2025 19:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuizQuestionsWise_SelectAll]
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
    ORDER BY [MST_QuizWiseQuestions].[QuizWiseQuestionsID];
END