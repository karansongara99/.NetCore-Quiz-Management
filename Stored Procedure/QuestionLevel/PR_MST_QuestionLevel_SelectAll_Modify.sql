USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevel_SelectAll]    Script Date: 29-01-2025 19:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_SelectAll]
AS
BEGIN
   SELECT  [MST_QuestionLevel].[QuestionLevelID], 
		   [MST_QuestionLevel].[QuestionLevel], 
           [MST_QuestionLevel].[UserID], 
		   [MST_QuestionLevel].[Created],
		   [MST_QuestionLevel].[Modified]
    FROM [MST_QuestionLevel]
	INNER JOIN [MST_User] ON [MST_User].UserID = [MST_QuestionLevel].UserID
    ORDER BY [MST_QuestionLevel].QuestionLevel
END