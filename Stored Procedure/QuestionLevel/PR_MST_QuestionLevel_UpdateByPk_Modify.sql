USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevel_UpdateByPk]    Script Date: 29-01-2025 19:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_UpdateByPk]
	@QuestionLevelID	INT,
	@QuestionLevel		NVARCHAR(50),
    @UserID				INT,
    @Created			DATETIME,
	@Modified			DATETIME
AS
BEGIN
    UPDATE [MST_QuestionLevel]
    SET   
		 [dbo].[MST_QuestionLevel].[QuestionLevel]		= @QuestionLevel, 
         [dbo].[MST_QuestionLevel].[UserID]				= @UserID, 
		 [dbo].[MST_QuestionLevel].[Created]			= @Created,
		 [dbo].[MST_QuestionLevel].[Modified]			= @Modified
   WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID]	= @QuestionLevelID
END