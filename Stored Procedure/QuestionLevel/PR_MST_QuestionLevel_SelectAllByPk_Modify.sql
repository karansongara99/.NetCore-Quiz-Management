USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevel_SelectByPk]    Script Date: 29-01-2025 19:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_SelectByPk]
    @QuestionLevelID INT
AS
BEGIN
    SELECT [MST_QuestionLevel].[QuestionLevelID], 
		   [MST_QuestionLevel].[QuestionLevel], 
           [MST_QuestionLevel].[UserID], 
		   [MST_QuestionLevel].[Created],
		   [MST_QuestionLevel].[Modified]
    FROM [MST_QuestionLevel]
    WHERE [MST_QuestionLevel].QuestionLevelID = @QuestionLevelID
    ORDER BY [MST_QuestionLevel].QuestionLevel
END