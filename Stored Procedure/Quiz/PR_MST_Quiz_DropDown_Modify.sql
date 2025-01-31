USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuizDropDown]    Script Date: 29-01-2025 19:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_QuizDropDown]
AS
BEGIN 
	
	SELECT 
		QuizID,
		QuizName
	From [MST_Quiz] 
	ORDER BY QuizName
END
