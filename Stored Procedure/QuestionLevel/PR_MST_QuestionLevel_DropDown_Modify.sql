USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevelDropDown]    Script Date: 29-01-2025 19:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_QuestionLevelDropDown]
AS
BEGIN 
	SELECT 
		QuestionLevelID,
		QuestionLevel
	From [MST_QuestionLevel] 
	ORDER BY QuestionLevel
END