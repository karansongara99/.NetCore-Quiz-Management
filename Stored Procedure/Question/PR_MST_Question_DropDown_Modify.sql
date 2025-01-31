USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionDropDown]    Script Date: 29-01-2025 19:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_QuestionDropDown]
AS
BEGIN 
	
	SELECT 
		QuestionID,
		QuestionText
	From [MST_Question] 
	ORDER BY QuestionText
END