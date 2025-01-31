USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevel_DeleteByPk]    Script Date: 29-01-2025 19:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_DeleteByPk]
    @QuestionLevelID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuestionLevel]
    WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID;
END